package com.lxisofttech.invoice.web.rest;

import static com.lxisofttech.invoice.domain.CurrencyTypeAsserts.*;
import static com.lxisofttech.invoice.web.rest.TestUtil.createUpdateProxyForBean;
import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.hasItem;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.lxisofttech.invoice.IntegrationTest;
import com.lxisofttech.invoice.domain.CurrencyType;
import com.lxisofttech.invoice.repository.CurrencyTypeRepository;
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
 * Integration tests for the {@link CurrencyTypeResource} REST controller.
 */
@IntegrationTest
@AutoConfigureMockMvc
@WithMockUser
class CurrencyTypeResourceIT {

    private static final String DEFAULT_NAME = "AAAAAAAAAA";
    private static final String UPDATED_NAME = "BBBBBBBBBB";

    private static final String ENTITY_API_URL = "/api/currency-types";
    private static final String ENTITY_API_URL_ID = ENTITY_API_URL + "/{id}";

    private static Random random = new Random();
    private static AtomicLong longCount = new AtomicLong(random.nextInt() + (2 * Integer.MAX_VALUE));

    @Autowired
    private ObjectMapper om;

    @Autowired
    private CurrencyTypeRepository currencyTypeRepository;

    @Autowired
    private EntityManager em;

    @Autowired
    private MockMvc restCurrencyTypeMockMvc;

    private CurrencyType currencyType;

    private CurrencyType insertedCurrencyType;

    /**
     * Create an entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static CurrencyType createEntity() {
        return new CurrencyType().name(DEFAULT_NAME);
    }

    /**
     * Create an updated entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static CurrencyType createUpdatedEntity() {
        return new CurrencyType().name(UPDATED_NAME);
    }

    @BeforeEach
    public void initTest() {
        currencyType = createEntity();
    }

    @AfterEach
    public void cleanup() {
        if (insertedCurrencyType != null) {
            currencyTypeRepository.delete(insertedCurrencyType);
            insertedCurrencyType = null;
        }
    }

    @Test
    @Transactional
    void createCurrencyType() throws Exception {
        long databaseSizeBeforeCreate = getRepositoryCount();
        // Create the CurrencyType
        var returnedCurrencyType = om.readValue(
            restCurrencyTypeMockMvc
                .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(om.writeValueAsBytes(currencyType)))
                .andExpect(status().isCreated())
                .andReturn()
                .getResponse()
                .getContentAsString(),
            CurrencyType.class
        );

        // Validate the CurrencyType in the database
        assertIncrementedRepositoryCount(databaseSizeBeforeCreate);
        assertCurrencyTypeUpdatableFieldsEquals(returnedCurrencyType, getPersistedCurrencyType(returnedCurrencyType));

        insertedCurrencyType = returnedCurrencyType;
    }

    @Test
    @Transactional
    void createCurrencyTypeWithExistingId() throws Exception {
        // Create the CurrencyType with an existing ID
        currencyType.setId(1L);

        long databaseSizeBeforeCreate = getRepositoryCount();

        // An entity with an existing ID cannot be created, so this API call must fail
        restCurrencyTypeMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(om.writeValueAsBytes(currencyType)))
            .andExpect(status().isBadRequest());

        // Validate the CurrencyType in the database
        assertSameRepositoryCount(databaseSizeBeforeCreate);
    }

    @Test
    @Transactional
    void getAllCurrencyTypes() throws Exception {
        // Initialize the database
        insertedCurrencyType = currencyTypeRepository.saveAndFlush(currencyType);

        // Get all the currencyTypeList
        restCurrencyTypeMockMvc
            .perform(get(ENTITY_API_URL + "?sort=id,desc"))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].id").value(hasItem(currencyType.getId().intValue())))
            .andExpect(jsonPath("$.[*].name").value(hasItem(DEFAULT_NAME)));
    }

    @Test
    @Transactional
    void getCurrencyType() throws Exception {
        // Initialize the database
        insertedCurrencyType = currencyTypeRepository.saveAndFlush(currencyType);

        // Get the currencyType
        restCurrencyTypeMockMvc
            .perform(get(ENTITY_API_URL_ID, currencyType.getId()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.id").value(currencyType.getId().intValue()))
            .andExpect(jsonPath("$.name").value(DEFAULT_NAME));
    }

    @Test
    @Transactional
    void getNonExistingCurrencyType() throws Exception {
        // Get the currencyType
        restCurrencyTypeMockMvc.perform(get(ENTITY_API_URL_ID, Long.MAX_VALUE)).andExpect(status().isNotFound());
    }

    @Test
    @Transactional
    void putExistingCurrencyType() throws Exception {
        // Initialize the database
        insertedCurrencyType = currencyTypeRepository.saveAndFlush(currencyType);

        long databaseSizeBeforeUpdate = getRepositoryCount();

        // Update the currencyType
        CurrencyType updatedCurrencyType = currencyTypeRepository.findById(currencyType.getId()).orElseThrow();
        // Disconnect from session so that the updates on updatedCurrencyType are not directly saved in db
        em.detach(updatedCurrencyType);
        updatedCurrencyType.name(UPDATED_NAME);

        restCurrencyTypeMockMvc
            .perform(
                put(ENTITY_API_URL_ID, updatedCurrencyType.getId())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(om.writeValueAsBytes(updatedCurrencyType))
            )
            .andExpect(status().isOk());

        // Validate the CurrencyType in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
        assertPersistedCurrencyTypeToMatchAllProperties(updatedCurrencyType);
    }

    @Test
    @Transactional
    void putNonExistingCurrencyType() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        currencyType.setId(longCount.incrementAndGet());

        // If the entity doesn't have an ID, it will throw BadRequestAlertException
        restCurrencyTypeMockMvc
            .perform(
                put(ENTITY_API_URL_ID, currencyType.getId())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(om.writeValueAsBytes(currencyType))
            )
            .andExpect(status().isBadRequest());

        // Validate the CurrencyType in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void putWithIdMismatchCurrencyType() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        currencyType.setId(longCount.incrementAndGet());

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restCurrencyTypeMockMvc
            .perform(
                put(ENTITY_API_URL_ID, longCount.incrementAndGet())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(om.writeValueAsBytes(currencyType))
            )
            .andExpect(status().isBadRequest());

        // Validate the CurrencyType in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void putWithMissingIdPathParamCurrencyType() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        currencyType.setId(longCount.incrementAndGet());

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restCurrencyTypeMockMvc
            .perform(put(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(om.writeValueAsBytes(currencyType)))
            .andExpect(status().isMethodNotAllowed());

        // Validate the CurrencyType in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void partialUpdateCurrencyTypeWithPatch() throws Exception {
        // Initialize the database
        insertedCurrencyType = currencyTypeRepository.saveAndFlush(currencyType);

        long databaseSizeBeforeUpdate = getRepositoryCount();

        // Update the currencyType using partial update
        CurrencyType partialUpdatedCurrencyType = new CurrencyType();
        partialUpdatedCurrencyType.setId(currencyType.getId());

        partialUpdatedCurrencyType.name(UPDATED_NAME);

        restCurrencyTypeMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, partialUpdatedCurrencyType.getId())
                    .contentType("application/merge-patch+json")
                    .content(om.writeValueAsBytes(partialUpdatedCurrencyType))
            )
            .andExpect(status().isOk());

        // Validate the CurrencyType in the database

        assertSameRepositoryCount(databaseSizeBeforeUpdate);
        assertCurrencyTypeUpdatableFieldsEquals(
            createUpdateProxyForBean(partialUpdatedCurrencyType, currencyType),
            getPersistedCurrencyType(currencyType)
        );
    }

    @Test
    @Transactional
    void fullUpdateCurrencyTypeWithPatch() throws Exception {
        // Initialize the database
        insertedCurrencyType = currencyTypeRepository.saveAndFlush(currencyType);

        long databaseSizeBeforeUpdate = getRepositoryCount();

        // Update the currencyType using partial update
        CurrencyType partialUpdatedCurrencyType = new CurrencyType();
        partialUpdatedCurrencyType.setId(currencyType.getId());

        partialUpdatedCurrencyType.name(UPDATED_NAME);

        restCurrencyTypeMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, partialUpdatedCurrencyType.getId())
                    .contentType("application/merge-patch+json")
                    .content(om.writeValueAsBytes(partialUpdatedCurrencyType))
            )
            .andExpect(status().isOk());

        // Validate the CurrencyType in the database

        assertSameRepositoryCount(databaseSizeBeforeUpdate);
        assertCurrencyTypeUpdatableFieldsEquals(partialUpdatedCurrencyType, getPersistedCurrencyType(partialUpdatedCurrencyType));
    }

    @Test
    @Transactional
    void patchNonExistingCurrencyType() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        currencyType.setId(longCount.incrementAndGet());

        // If the entity doesn't have an ID, it will throw BadRequestAlertException
        restCurrencyTypeMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, currencyType.getId())
                    .contentType("application/merge-patch+json")
                    .content(om.writeValueAsBytes(currencyType))
            )
            .andExpect(status().isBadRequest());

        // Validate the CurrencyType in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void patchWithIdMismatchCurrencyType() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        currencyType.setId(longCount.incrementAndGet());

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restCurrencyTypeMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, longCount.incrementAndGet())
                    .contentType("application/merge-patch+json")
                    .content(om.writeValueAsBytes(currencyType))
            )
            .andExpect(status().isBadRequest());

        // Validate the CurrencyType in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void patchWithMissingIdPathParamCurrencyType() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        currencyType.setId(longCount.incrementAndGet());

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restCurrencyTypeMockMvc
            .perform(patch(ENTITY_API_URL).contentType("application/merge-patch+json").content(om.writeValueAsBytes(currencyType)))
            .andExpect(status().isMethodNotAllowed());

        // Validate the CurrencyType in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void deleteCurrencyType() throws Exception {
        // Initialize the database
        insertedCurrencyType = currencyTypeRepository.saveAndFlush(currencyType);

        long databaseSizeBeforeDelete = getRepositoryCount();

        // Delete the currencyType
        restCurrencyTypeMockMvc
            .perform(delete(ENTITY_API_URL_ID, currencyType.getId()).accept(MediaType.APPLICATION_JSON))
            .andExpect(status().isNoContent());

        // Validate the database contains one less item
        assertDecrementedRepositoryCount(databaseSizeBeforeDelete);
    }

    protected long getRepositoryCount() {
        return currencyTypeRepository.count();
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

    protected CurrencyType getPersistedCurrencyType(CurrencyType currencyType) {
        return currencyTypeRepository.findById(currencyType.getId()).orElseThrow();
    }

    protected void assertPersistedCurrencyTypeToMatchAllProperties(CurrencyType expectedCurrencyType) {
        assertCurrencyTypeAllPropertiesEquals(expectedCurrencyType, getPersistedCurrencyType(expectedCurrencyType));
    }

    protected void assertPersistedCurrencyTypeToMatchUpdatableProperties(CurrencyType expectedCurrencyType) {
        assertCurrencyTypeAllUpdatablePropertiesEquals(expectedCurrencyType, getPersistedCurrencyType(expectedCurrencyType));
    }
}
