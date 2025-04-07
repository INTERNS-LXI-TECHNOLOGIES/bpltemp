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
import com.lxisofttech.invoice.service.dto.CurrencyTypeDTO;
import com.lxisofttech.invoice.service.mapper.CurrencyTypeMapper;
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
    private CurrencyTypeMapper currencyTypeMapper;

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
    public static CurrencyType createEntity(EntityManager em) {
        CurrencyType currencyType = new CurrencyType().name(DEFAULT_NAME);
        return currencyType;
    }

    /**
     * Create an updated entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static CurrencyType createUpdatedEntity(EntityManager em) {
        CurrencyType updatedCurrencyType = new CurrencyType().name(UPDATED_NAME);
        return updatedCurrencyType;
    }

    @BeforeEach
    public void initTest() {
        currencyType = createEntity(em);
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
        CurrencyTypeDTO currencyTypeDTO = currencyTypeMapper.toDto(currencyType);
        var returnedCurrencyTypeDTO = om.readValue(
            restCurrencyTypeMockMvc
                .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(om.writeValueAsBytes(currencyTypeDTO)))
                .andExpect(status().isCreated())
                .andReturn()
                .getResponse()
                .getContentAsString(),
            CurrencyTypeDTO.class
        );

        // Validate the CurrencyType in the database
        assertIncrementedRepositoryCount(databaseSizeBeforeCreate);
        var returnedCurrencyType = currencyTypeMapper.toEntity(returnedCurrencyTypeDTO);
        assertCurrencyTypeUpdatableFieldsEquals(returnedCurrencyType, getPersistedCurrencyType(returnedCurrencyType));

        insertedCurrencyType = returnedCurrencyType;
    }

    @Test
    @Transactional
    void createCurrencyTypeWithExistingId() throws Exception {
        // Create the CurrencyType with an existing ID
        currencyType.setId(1L);
        CurrencyTypeDTO currencyTypeDTO = currencyTypeMapper.toDto(currencyType);

        long databaseSizeBeforeCreate = getRepositoryCount();

        // An entity with an existing ID cannot be created, so this API call must fail
        restCurrencyTypeMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(om.writeValueAsBytes(currencyTypeDTO)))
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
    void getCurrencyTypesByIdFiltering() throws Exception {
        // Initialize the database
        insertedCurrencyType = currencyTypeRepository.saveAndFlush(currencyType);

        Long id = currencyType.getId();

        defaultCurrencyTypeFiltering("id.equals=" + id, "id.notEquals=" + id);

        defaultCurrencyTypeFiltering("id.greaterThanOrEqual=" + id, "id.greaterThan=" + id);

        defaultCurrencyTypeFiltering("id.lessThanOrEqual=" + id, "id.lessThan=" + id);
    }

    @Test
    @Transactional
    void getAllCurrencyTypesByNameIsEqualToSomething() throws Exception {
        // Initialize the database
        insertedCurrencyType = currencyTypeRepository.saveAndFlush(currencyType);

        // Get all the currencyTypeList where name equals to
        defaultCurrencyTypeFiltering("name.equals=" + DEFAULT_NAME, "name.equals=" + UPDATED_NAME);
    }

    @Test
    @Transactional
    void getAllCurrencyTypesByNameIsInShouldWork() throws Exception {
        // Initialize the database
        insertedCurrencyType = currencyTypeRepository.saveAndFlush(currencyType);

        // Get all the currencyTypeList where name in
        defaultCurrencyTypeFiltering("name.in=" + DEFAULT_NAME + "," + UPDATED_NAME, "name.in=" + UPDATED_NAME);
    }

    @Test
    @Transactional
    void getAllCurrencyTypesByNameIsNullOrNotNull() throws Exception {
        // Initialize the database
        insertedCurrencyType = currencyTypeRepository.saveAndFlush(currencyType);

        // Get all the currencyTypeList where name is not null
        defaultCurrencyTypeFiltering("name.specified=true", "name.specified=false");
    }

    @Test
    @Transactional
    void getAllCurrencyTypesByNameContainsSomething() throws Exception {
        // Initialize the database
        insertedCurrencyType = currencyTypeRepository.saveAndFlush(currencyType);

        // Get all the currencyTypeList where name contains
        defaultCurrencyTypeFiltering("name.contains=" + DEFAULT_NAME, "name.contains=" + UPDATED_NAME);
    }

    @Test
    @Transactional
    void getAllCurrencyTypesByNameNotContainsSomething() throws Exception {
        // Initialize the database
        insertedCurrencyType = currencyTypeRepository.saveAndFlush(currencyType);

        // Get all the currencyTypeList where name does not contain
        defaultCurrencyTypeFiltering("name.doesNotContain=" + UPDATED_NAME, "name.doesNotContain=" + DEFAULT_NAME);
    }

    private void defaultCurrencyTypeFiltering(String shouldBeFound, String shouldNotBeFound) throws Exception {
        defaultCurrencyTypeShouldBeFound(shouldBeFound);
        defaultCurrencyTypeShouldNotBeFound(shouldNotBeFound);
    }

    /**
     * Executes the search, and checks that the default entity is returned.
     */
    private void defaultCurrencyTypeShouldBeFound(String filter) throws Exception {
        restCurrencyTypeMockMvc
            .perform(get(ENTITY_API_URL + "?sort=id,desc&" + filter))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].id").value(hasItem(currencyType.getId().intValue())))
            .andExpect(jsonPath("$.[*].name").value(hasItem(DEFAULT_NAME)));

        // Check, that the count call also returns 1
        restCurrencyTypeMockMvc
            .perform(get(ENTITY_API_URL + "/count?sort=id,desc&" + filter))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(content().string("1"));
    }

    /**
     * Executes the search, and checks that the default entity is not returned.
     */
    private void defaultCurrencyTypeShouldNotBeFound(String filter) throws Exception {
        restCurrencyTypeMockMvc
            .perform(get(ENTITY_API_URL + "?sort=id,desc&" + filter))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$").isArray())
            .andExpect(jsonPath("$").isEmpty());

        // Check, that the count call also returns 0
        restCurrencyTypeMockMvc
            .perform(get(ENTITY_API_URL + "/count?sort=id,desc&" + filter))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(content().string("0"));
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
        CurrencyTypeDTO currencyTypeDTO = currencyTypeMapper.toDto(updatedCurrencyType);

        restCurrencyTypeMockMvc
            .perform(
                put(ENTITY_API_URL_ID, currencyTypeDTO.getId())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(om.writeValueAsBytes(currencyTypeDTO))
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

        // Create the CurrencyType
        CurrencyTypeDTO currencyTypeDTO = currencyTypeMapper.toDto(currencyType);

        // If the entity doesn't have an ID, it will throw BadRequestAlertException
        restCurrencyTypeMockMvc
            .perform(
                put(ENTITY_API_URL_ID, currencyTypeDTO.getId())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(om.writeValueAsBytes(currencyTypeDTO))
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

        // Create the CurrencyType
        CurrencyTypeDTO currencyTypeDTO = currencyTypeMapper.toDto(currencyType);

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restCurrencyTypeMockMvc
            .perform(
                put(ENTITY_API_URL_ID, longCount.incrementAndGet())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(om.writeValueAsBytes(currencyTypeDTO))
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

        // Create the CurrencyType
        CurrencyTypeDTO currencyTypeDTO = currencyTypeMapper.toDto(currencyType);

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restCurrencyTypeMockMvc
            .perform(put(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(om.writeValueAsBytes(currencyTypeDTO)))
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

        // Create the CurrencyType
        CurrencyTypeDTO currencyTypeDTO = currencyTypeMapper.toDto(currencyType);

        // If the entity doesn't have an ID, it will throw BadRequestAlertException
        restCurrencyTypeMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, currencyTypeDTO.getId())
                    .contentType("application/merge-patch+json")
                    .content(om.writeValueAsBytes(currencyTypeDTO))
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

        // Create the CurrencyType
        CurrencyTypeDTO currencyTypeDTO = currencyTypeMapper.toDto(currencyType);

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restCurrencyTypeMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, longCount.incrementAndGet())
                    .contentType("application/merge-patch+json")
                    .content(om.writeValueAsBytes(currencyTypeDTO))
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

        // Create the CurrencyType
        CurrencyTypeDTO currencyTypeDTO = currencyTypeMapper.toDto(currencyType);

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restCurrencyTypeMockMvc
            .perform(patch(ENTITY_API_URL).contentType("application/merge-patch+json").content(om.writeValueAsBytes(currencyTypeDTO)))
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
