package com.mycompany.organizationbackend.web.rest;

import static com.mycompany.organizationbackend.domain.ParentOrganizationAsserts.*;
import static com.mycompany.organizationbackend.web.rest.TestUtil.createUpdateProxyForBean;
import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.hasItem;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mycompany.organizationbackend.IntegrationTest;
import com.mycompany.organizationbackend.domain.ParentOrganization;
import com.mycompany.organizationbackend.repository.ParentOrganizationRepository;
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
 * Integration tests for the {@link ParentOrganizationResource} REST controller.
 */
@IntegrationTest
@AutoConfigureMockMvc
@WithMockUser
class ParentOrganizationResourceIT {

    private static final String DEFAULT_NAME = "AAAAAAAAAA";
    private static final String UPDATED_NAME = "BBBBBBBBBB";

    private static final String ENTITY_API_URL = "/api/parent-organizations";
    private static final String ENTITY_API_URL_ID = ENTITY_API_URL + "/{id}";

    private static Random random = new Random();
    private static AtomicLong longCount = new AtomicLong(random.nextInt() + (2 * Integer.MAX_VALUE));

    @Autowired
    private ObjectMapper om;

    @Autowired
    private ParentOrganizationRepository parentOrganizationRepository;

    @Autowired
    private EntityManager em;

    @Autowired
    private MockMvc restParentOrganizationMockMvc;

    private ParentOrganization parentOrganization;

    private ParentOrganization insertedParentOrganization;

    /**
     * Create an entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static ParentOrganization createEntity() {
        return new ParentOrganization().name(DEFAULT_NAME);
    }

    /**
     * Create an updated entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static ParentOrganization createUpdatedEntity() {
        return new ParentOrganization().name(UPDATED_NAME);
    }

    @BeforeEach
    public void initTest() {
        parentOrganization = createEntity();
    }

    @AfterEach
    public void cleanup() {
        if (insertedParentOrganization != null) {
            parentOrganizationRepository.delete(insertedParentOrganization);
            insertedParentOrganization = null;
        }
    }

    @Test
    @Transactional
    void createParentOrganization() throws Exception {
        long databaseSizeBeforeCreate = getRepositoryCount();
        // Create the ParentOrganization
        var returnedParentOrganization = om.readValue(
            restParentOrganizationMockMvc
                .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(om.writeValueAsBytes(parentOrganization)))
                .andExpect(status().isCreated())
                .andReturn()
                .getResponse()
                .getContentAsString(),
            ParentOrganization.class
        );

        // Validate the ParentOrganization in the database
        assertIncrementedRepositoryCount(databaseSizeBeforeCreate);
        assertParentOrganizationUpdatableFieldsEquals(
            returnedParentOrganization,
            getPersistedParentOrganization(returnedParentOrganization)
        );

        insertedParentOrganization = returnedParentOrganization;
    }

    @Test
    @Transactional
    void createParentOrganizationWithExistingId() throws Exception {
        // Create the ParentOrganization with an existing ID
        parentOrganization.setId(1L);

        long databaseSizeBeforeCreate = getRepositoryCount();

        // An entity with an existing ID cannot be created, so this API call must fail
        restParentOrganizationMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(om.writeValueAsBytes(parentOrganization)))
            .andExpect(status().isBadRequest());

        // Validate the ParentOrganization in the database
        assertSameRepositoryCount(databaseSizeBeforeCreate);
    }

    @Test
    @Transactional
    void checkNameIsRequired() throws Exception {
        long databaseSizeBeforeTest = getRepositoryCount();
        // set the field null
        parentOrganization.setName(null);

        // Create the ParentOrganization, which fails.

        restParentOrganizationMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(om.writeValueAsBytes(parentOrganization)))
            .andExpect(status().isBadRequest());

        assertSameRepositoryCount(databaseSizeBeforeTest);
    }

    @Test
    @Transactional
    void getAllParentOrganizations() throws Exception {
        // Initialize the database
        insertedParentOrganization = parentOrganizationRepository.saveAndFlush(parentOrganization);

        // Get all the parentOrganizationList
        restParentOrganizationMockMvc
            .perform(get(ENTITY_API_URL + "?sort=id,desc"))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].id").value(hasItem(parentOrganization.getId().intValue())))
            .andExpect(jsonPath("$.[*].name").value(hasItem(DEFAULT_NAME)));
    }

    @Test
    @Transactional
    void getParentOrganization() throws Exception {
        // Initialize the database
        insertedParentOrganization = parentOrganizationRepository.saveAndFlush(parentOrganization);

        // Get the parentOrganization
        restParentOrganizationMockMvc
            .perform(get(ENTITY_API_URL_ID, parentOrganization.getId()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.id").value(parentOrganization.getId().intValue()))
            .andExpect(jsonPath("$.name").value(DEFAULT_NAME));
    }

    @Test
    @Transactional
    void getNonExistingParentOrganization() throws Exception {
        // Get the parentOrganization
        restParentOrganizationMockMvc.perform(get(ENTITY_API_URL_ID, Long.MAX_VALUE)).andExpect(status().isNotFound());
    }

    @Test
    @Transactional
    void putExistingParentOrganization() throws Exception {
        // Initialize the database
        insertedParentOrganization = parentOrganizationRepository.saveAndFlush(parentOrganization);

        long databaseSizeBeforeUpdate = getRepositoryCount();

        // Update the parentOrganization
        ParentOrganization updatedParentOrganization = parentOrganizationRepository.findById(parentOrganization.getId()).orElseThrow();
        // Disconnect from session so that the updates on updatedParentOrganization are not directly saved in db
        em.detach(updatedParentOrganization);
        updatedParentOrganization.name(UPDATED_NAME);

        restParentOrganizationMockMvc
            .perform(
                put(ENTITY_API_URL_ID, updatedParentOrganization.getId())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(om.writeValueAsBytes(updatedParentOrganization))
            )
            .andExpect(status().isOk());

        // Validate the ParentOrganization in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
        assertPersistedParentOrganizationToMatchAllProperties(updatedParentOrganization);
    }

    @Test
    @Transactional
    void putNonExistingParentOrganization() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        parentOrganization.setId(longCount.incrementAndGet());

        // If the entity doesn't have an ID, it will throw BadRequestAlertException
        restParentOrganizationMockMvc
            .perform(
                put(ENTITY_API_URL_ID, parentOrganization.getId())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(om.writeValueAsBytes(parentOrganization))
            )
            .andExpect(status().isBadRequest());

        // Validate the ParentOrganization in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void putWithIdMismatchParentOrganization() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        parentOrganization.setId(longCount.incrementAndGet());

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restParentOrganizationMockMvc
            .perform(
                put(ENTITY_API_URL_ID, longCount.incrementAndGet())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(om.writeValueAsBytes(parentOrganization))
            )
            .andExpect(status().isBadRequest());

        // Validate the ParentOrganization in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void putWithMissingIdPathParamParentOrganization() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        parentOrganization.setId(longCount.incrementAndGet());

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restParentOrganizationMockMvc
            .perform(put(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(om.writeValueAsBytes(parentOrganization)))
            .andExpect(status().isMethodNotAllowed());

        // Validate the ParentOrganization in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void partialUpdateParentOrganizationWithPatch() throws Exception {
        // Initialize the database
        insertedParentOrganization = parentOrganizationRepository.saveAndFlush(parentOrganization);

        long databaseSizeBeforeUpdate = getRepositoryCount();

        // Update the parentOrganization using partial update
        ParentOrganization partialUpdatedParentOrganization = new ParentOrganization();
        partialUpdatedParentOrganization.setId(parentOrganization.getId());

        restParentOrganizationMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, partialUpdatedParentOrganization.getId())
                    .contentType("application/merge-patch+json")
                    .content(om.writeValueAsBytes(partialUpdatedParentOrganization))
            )
            .andExpect(status().isOk());

        // Validate the ParentOrganization in the database

        assertSameRepositoryCount(databaseSizeBeforeUpdate);
        assertParentOrganizationUpdatableFieldsEquals(
            createUpdateProxyForBean(partialUpdatedParentOrganization, parentOrganization),
            getPersistedParentOrganization(parentOrganization)
        );
    }

    @Test
    @Transactional
    void fullUpdateParentOrganizationWithPatch() throws Exception {
        // Initialize the database
        insertedParentOrganization = parentOrganizationRepository.saveAndFlush(parentOrganization);

        long databaseSizeBeforeUpdate = getRepositoryCount();

        // Update the parentOrganization using partial update
        ParentOrganization partialUpdatedParentOrganization = new ParentOrganization();
        partialUpdatedParentOrganization.setId(parentOrganization.getId());

        partialUpdatedParentOrganization.name(UPDATED_NAME);

        restParentOrganizationMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, partialUpdatedParentOrganization.getId())
                    .contentType("application/merge-patch+json")
                    .content(om.writeValueAsBytes(partialUpdatedParentOrganization))
            )
            .andExpect(status().isOk());

        // Validate the ParentOrganization in the database

        assertSameRepositoryCount(databaseSizeBeforeUpdate);
        assertParentOrganizationUpdatableFieldsEquals(
            partialUpdatedParentOrganization,
            getPersistedParentOrganization(partialUpdatedParentOrganization)
        );
    }

    @Test
    @Transactional
    void patchNonExistingParentOrganization() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        parentOrganization.setId(longCount.incrementAndGet());

        // If the entity doesn't have an ID, it will throw BadRequestAlertException
        restParentOrganizationMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, parentOrganization.getId())
                    .contentType("application/merge-patch+json")
                    .content(om.writeValueAsBytes(parentOrganization))
            )
            .andExpect(status().isBadRequest());

        // Validate the ParentOrganization in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void patchWithIdMismatchParentOrganization() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        parentOrganization.setId(longCount.incrementAndGet());

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restParentOrganizationMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, longCount.incrementAndGet())
                    .contentType("application/merge-patch+json")
                    .content(om.writeValueAsBytes(parentOrganization))
            )
            .andExpect(status().isBadRequest());

        // Validate the ParentOrganization in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void patchWithMissingIdPathParamParentOrganization() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        parentOrganization.setId(longCount.incrementAndGet());

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restParentOrganizationMockMvc
            .perform(patch(ENTITY_API_URL).contentType("application/merge-patch+json").content(om.writeValueAsBytes(parentOrganization)))
            .andExpect(status().isMethodNotAllowed());

        // Validate the ParentOrganization in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void deleteParentOrganization() throws Exception {
        // Initialize the database
        insertedParentOrganization = parentOrganizationRepository.saveAndFlush(parentOrganization);

        long databaseSizeBeforeDelete = getRepositoryCount();

        // Delete the parentOrganization
        restParentOrganizationMockMvc
            .perform(delete(ENTITY_API_URL_ID, parentOrganization.getId()).accept(MediaType.APPLICATION_JSON))
            .andExpect(status().isNoContent());

        // Validate the database contains one less item
        assertDecrementedRepositoryCount(databaseSizeBeforeDelete);
    }

    protected long getRepositoryCount() {
        return parentOrganizationRepository.count();
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

    protected ParentOrganization getPersistedParentOrganization(ParentOrganization parentOrganization) {
        return parentOrganizationRepository.findById(parentOrganization.getId()).orElseThrow();
    }

    protected void assertPersistedParentOrganizationToMatchAllProperties(ParentOrganization expectedParentOrganization) {
        assertParentOrganizationAllPropertiesEquals(expectedParentOrganization, getPersistedParentOrganization(expectedParentOrganization));
    }

    protected void assertPersistedParentOrganizationToMatchUpdatableProperties(ParentOrganization expectedParentOrganization) {
        assertParentOrganizationAllUpdatablePropertiesEquals(
            expectedParentOrganization,
            getPersistedParentOrganization(expectedParentOrganization)
        );
    }
}
