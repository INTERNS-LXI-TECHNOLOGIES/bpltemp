package com.lxisoft.organizationbackend.web.rest;

import static com.lxisoft.organizationbackend.domain.ParentorganizationAsserts.*;
import static com.lxisoft.organizationbackend.web.rest.TestUtil.createUpdateProxyForBean;
import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.hasItem;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.lxisoft.organizationbackend.IntegrationTest;
import com.lxisoft.organizationbackend.domain.Parentorganization;
import com.lxisoft.organizationbackend.repository.ParentorganizationRepository;
import jakarta.persistence.EntityManager;
import java.util.Random;
import java.util.concurrent.atomic.AtomicLong;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

/**
 * Integration tests for the {@link ParentorganizationResource} REST controller.
 */
@IntegrationTest
@AutoConfigureMockMvc
@WithMockUser
class ParentorganizationResourceIT {

    private static final String DEFAULT_NAME = "AAAAAAAAAA";
    private static final String UPDATED_NAME = "BBBBBBBBBB";

    private static final String DEFAULT_DESCRIPTION = "AAAAAAAAAA";
    private static final String UPDATED_DESCRIPTION = "BBBBBBBBBB";

    private static final String ENTITY_API_URL = "/api/parentorganizations";
    private static final String ENTITY_API_URL_ID = ENTITY_API_URL + "/{id}";

    private static Random random = new Random();
    private static AtomicLong longCount = new AtomicLong(random.nextInt() + (2 * Integer.MAX_VALUE));

    @Autowired
    private ObjectMapper om;

    @Autowired
    private ParentorganizationRepository parentorganizationRepository;

    @Autowired
    private EntityManager em;

    @Autowired
    private MockMvc restParentorganizationMockMvc;

    private Parentorganization parentorganization;

    private Parentorganization insertedParentorganization;

    /**
     * Create an entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static Parentorganization createEntity() {
        return new Parentorganization().name(DEFAULT_NAME).description(DEFAULT_DESCRIPTION);
    }

    /**
     * Create an updated entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static Parentorganization createUpdatedEntity() {
        return new Parentorganization().name(UPDATED_NAME).description(UPDATED_DESCRIPTION);
    }

    @BeforeEach
    public void initTest() {
        parentorganization = createEntity();
    }

    @AfterEach
    public void cleanup() {
        if (insertedParentorganization != null) {
            parentorganizationRepository.delete(insertedParentorganization);
            insertedParentorganization = null;
        }
    }

    @Test
    @Transactional
    void createParentorganization() throws Exception {
        long databaseSizeBeforeCreate = getRepositoryCount();
        // Create the Parentorganization
        var returnedParentorganization = om.readValue(
            restParentorganizationMockMvc
                .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(om.writeValueAsBytes(parentorganization)))
                .andExpect(status().isCreated())
                .andReturn()
                .getResponse()
                .getContentAsString(),
            Parentorganization.class
        );

        // Validate the Parentorganization in the database
        assertIncrementedRepositoryCount(databaseSizeBeforeCreate);
        assertParentorganizationUpdatableFieldsEquals(
            returnedParentorganization,
            getPersistedParentorganization(returnedParentorganization)
        );

        insertedParentorganization = returnedParentorganization;
    }

    @Test
    @Transactional
    void createParentorganizationWithExistingId() throws Exception {
        // Create the Parentorganization with an existing ID
        parentorganization.setId(1L);

        long databaseSizeBeforeCreate = getRepositoryCount();

        // An entity with an existing ID cannot be created, so this API call must fail
        restParentorganizationMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(om.writeValueAsBytes(parentorganization)))
            .andExpect(status().isBadRequest());

        // Validate the Parentorganization in the database
        assertSameRepositoryCount(databaseSizeBeforeCreate);
    }

    @Test
    @Transactional
    void getAllParentorganizations() throws Exception {
        // Initialize the database
        insertedParentorganization = parentorganizationRepository.saveAndFlush(parentorganization);

        // Get all the parentorganizationList
        restParentorganizationMockMvc
            .perform(get(ENTITY_API_URL + "?sort=id,desc"))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].id").value(hasItem(parentorganization.getId().intValue())))
            .andExpect(jsonPath("$.[*].name").value(hasItem(DEFAULT_NAME)))
            .andExpect(jsonPath("$.[*].description").value(hasItem(DEFAULT_DESCRIPTION)));
    }

    @Test
    @Transactional
    void getParentorganization() throws Exception {
        // Initialize the database
        insertedParentorganization = parentorganizationRepository.saveAndFlush(parentorganization);

        // Get the parentorganization
        restParentorganizationMockMvc
            .perform(get(ENTITY_API_URL_ID, parentorganization.getId()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.id").value(parentorganization.getId().intValue()))
            .andExpect(jsonPath("$.name").value(DEFAULT_NAME))
            .andExpect(jsonPath("$.description").value(DEFAULT_DESCRIPTION));
    }

    @Test
    @Transactional
    void getNonExistingParentorganization() throws Exception {
        // Get the parentorganization
        restParentorganizationMockMvc.perform(get(ENTITY_API_URL_ID, Long.MAX_VALUE)).andExpect(status().isNotFound());
    }

    @Test
    @Transactional
    void putExistingParentorganization() throws Exception {
        // Initialize the database
        insertedParentorganization = parentorganizationRepository.saveAndFlush(parentorganization);

        long databaseSizeBeforeUpdate = getRepositoryCount();

        // Update the parentorganization
        Parentorganization updatedParentorganization = parentorganizationRepository.findById(parentorganization.getId()).orElseThrow();
        // Disconnect from session so that the updates on updatedParentorganization are not directly saved in db
        em.detach(updatedParentorganization);
        updatedParentorganization.name(UPDATED_NAME).description(UPDATED_DESCRIPTION);

        restParentorganizationMockMvc
            .perform(
                put(ENTITY_API_URL_ID, updatedParentorganization.getId())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(om.writeValueAsBytes(updatedParentorganization))
            )
            .andExpect(status().isOk());

        // Validate the Parentorganization in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
        assertPersistedParentorganizationToMatchAllProperties(updatedParentorganization);
    }

    @Test
    @Transactional
    void putNonExistingParentorganization() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        parentorganization.setId(longCount.incrementAndGet());

        // If the entity doesn't have an ID, it will throw BadRequestAlertException
        restParentorganizationMockMvc
            .perform(
                put(ENTITY_API_URL_ID, parentorganization.getId())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(om.writeValueAsBytes(parentorganization))
            )
            .andExpect(status().isBadRequest());

        // Validate the Parentorganization in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void putWithIdMismatchParentorganization() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        parentorganization.setId(longCount.incrementAndGet());

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restParentorganizationMockMvc
            .perform(
                put(ENTITY_API_URL_ID, longCount.incrementAndGet())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(om.writeValueAsBytes(parentorganization))
            )
            .andExpect(status().isBadRequest());

        // Validate the Parentorganization in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void putWithMissingIdPathParamParentorganization() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        parentorganization.setId(longCount.incrementAndGet());

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restParentorganizationMockMvc
            .perform(put(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(om.writeValueAsBytes(parentorganization)))
            .andExpect(status().isMethodNotAllowed());

        // Validate the Parentorganization in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void partialUpdateParentorganizationWithPatch() throws Exception {
        // Initialize the database
        insertedParentorganization = parentorganizationRepository.saveAndFlush(parentorganization);

        long databaseSizeBeforeUpdate = getRepositoryCount();

        // Update the parentorganization using partial update
        Parentorganization partialUpdatedParentorganization = new Parentorganization();
        partialUpdatedParentorganization.setId(parentorganization.getId());

        restParentorganizationMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, partialUpdatedParentorganization.getId())
                    .contentType("application/merge-patch+json")
                    .content(om.writeValueAsBytes(partialUpdatedParentorganization))
            )
            .andExpect(status().isOk());

        // Validate the Parentorganization in the database

        assertSameRepositoryCount(databaseSizeBeforeUpdate);
        assertParentorganizationUpdatableFieldsEquals(
            createUpdateProxyForBean(partialUpdatedParentorganization, parentorganization),
            getPersistedParentorganization(parentorganization)
        );
    }

    @Test
    @Transactional
    void fullUpdateParentorganizationWithPatch() throws Exception {
        // Initialize the database
        insertedParentorganization = parentorganizationRepository.saveAndFlush(parentorganization);

        long databaseSizeBeforeUpdate = getRepositoryCount();

        // Update the parentorganization using partial update
        Parentorganization partialUpdatedParentorganization = new Parentorganization();
        partialUpdatedParentorganization.setId(parentorganization.getId());

        partialUpdatedParentorganization.name(UPDATED_NAME).description(UPDATED_DESCRIPTION);

        restParentorganizationMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, partialUpdatedParentorganization.getId())
                    .contentType("application/merge-patch+json")
                    .content(om.writeValueAsBytes(partialUpdatedParentorganization))
            )
            .andExpect(status().isOk());

        // Validate the Parentorganization in the database

        assertSameRepositoryCount(databaseSizeBeforeUpdate);
        assertParentorganizationUpdatableFieldsEquals(
            partialUpdatedParentorganization,
            getPersistedParentorganization(partialUpdatedParentorganization)
        );
    }

    @Test
    @Transactional
    void patchNonExistingParentorganization() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        parentorganization.setId(longCount.incrementAndGet());

        // If the entity doesn't have an ID, it will throw BadRequestAlertException
        restParentorganizationMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, parentorganization.getId())
                    .contentType("application/merge-patch+json")
                    .content(om.writeValueAsBytes(parentorganization))
            )
            .andExpect(status().isBadRequest());

        // Validate the Parentorganization in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void patchWithIdMismatchParentorganization() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        parentorganization.setId(longCount.incrementAndGet());

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restParentorganizationMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, longCount.incrementAndGet())
                    .contentType("application/merge-patch+json")
                    .content(om.writeValueAsBytes(parentorganization))
            )
            .andExpect(status().isBadRequest());

        // Validate the Parentorganization in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void patchWithMissingIdPathParamParentorganization() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        parentorganization.setId(longCount.incrementAndGet());

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restParentorganizationMockMvc
            .perform(patch(ENTITY_API_URL).contentType("application/merge-patch+json").content(om.writeValueAsBytes(parentorganization)))
            .andExpect(status().isMethodNotAllowed());

        // Validate the Parentorganization in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void deleteParentorganization() throws Exception {
        // Initialize the database
        insertedParentorganization = parentorganizationRepository.saveAndFlush(parentorganization);

        long databaseSizeBeforeDelete = getRepositoryCount();

        // Delete the parentorganization
        restParentorganizationMockMvc
            .perform(delete(ENTITY_API_URL_ID, parentorganization.getId()).accept(MediaType.APPLICATION_JSON))
            .andExpect(status().isNoContent());

        // Validate the database contains one less item
        assertDecrementedRepositoryCount(databaseSizeBeforeDelete);
    }

    protected long getRepositoryCount() {
        return parentorganizationRepository.count();
    }

    protected void assertIncrementedRepositoryCount(long countBefore) {
        assertThat(countBefore + 1).isEqualTo(getRepositoryCount());
    }

    protected void assertDecrementedRepositoryCount(long countBefore) {
        assertThat(countBefore - 1).isEqualTo(getRepositoryCount());
    }

    protected void assertSameRepositoryCount(long countBefore) {
        assertThat(countBefore).isEqualTo(getRepositoryCount());
    }

    protected Parentorganization getPersistedParentorganization(Parentorganization parentorganization) {
        return parentorganizationRepository.findById(parentorganization.getId()).orElseThrow();
    }

    protected void assertPersistedParentorganizationToMatchAllProperties(Parentorganization expectedParentorganization) {
        assertParentorganizationAllPropertiesEquals(expectedParentorganization, getPersistedParentorganization(expectedParentorganization));
    }

    protected void assertPersistedParentorganizationToMatchUpdatableProperties(Parentorganization expectedParentorganization) {
        assertParentorganizationAllUpdatablePropertiesEquals(
            expectedParentorganization,
            getPersistedParentorganization(expectedParentorganization)
        );
    }
}
