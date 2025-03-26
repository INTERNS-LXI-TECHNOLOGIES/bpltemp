package com.bpl.web.rest;

import static com.bpl.domain.AgentTypeAsserts.*;
import static com.bpl.web.rest.TestUtil.createUpdateProxyForBean;
import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.hasItem;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import com.bpl.IntegrationTest;
import com.bpl.domain.AgentType;
import com.bpl.repository.AgentTypeRepository;
import com.bpl.service.dto.AgentTypeDTO;
import com.bpl.service.mapper.AgentTypeMapper;
import com.fasterxml.jackson.databind.ObjectMapper;
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
 * Integration tests for the {@link AgentTypeResource} REST controller.
 */
@IntegrationTest
@AutoConfigureMockMvc
@WithMockUser
class AgentTypeResourceIT {

    private static final String DEFAULT_NAME = "AAAAAAAAAA";
    private static final String UPDATED_NAME = "BBBBBBBBBB";

    private static final String DEFAULT_DESCRIPTION = "AAAAAAAAAA";
    private static final String UPDATED_DESCRIPTION = "BBBBBBBBBB";

    private static final String ENTITY_API_URL = "/api/agent-types";
    private static final String ENTITY_API_URL_ID = ENTITY_API_URL + "/{id}";

    private static Random random = new Random();
    private static AtomicLong longCount = new AtomicLong(random.nextInt() + (2 * Integer.MAX_VALUE));

    @Autowired
    private ObjectMapper om;

    @Autowired
    private AgentTypeRepository agentTypeRepository;

    @Autowired
    private AgentTypeMapper agentTypeMapper;

    @Autowired
    private EntityManager em;

    @Autowired
    private MockMvc restAgentTypeMockMvc;

    private AgentType agentType;

    private AgentType insertedAgentType;

    /**
     * Create an entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static AgentType createEntity() {
        return new AgentType().name(DEFAULT_NAME).description(DEFAULT_DESCRIPTION);
    }

    /**
     * Create an updated entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static AgentType createUpdatedEntity() {
        return new AgentType().name(UPDATED_NAME).description(UPDATED_DESCRIPTION);
    }

    @BeforeEach
    public void initTest() {
        agentType = createEntity();
    }

    @AfterEach
    public void cleanup() {
        if (insertedAgentType != null) {
            agentTypeRepository.delete(insertedAgentType);
            insertedAgentType = null;
        }
    }

    @Test
    @Transactional
    void createAgentType() throws Exception {
        long databaseSizeBeforeCreate = getRepositoryCount();
        // Create the AgentType
        AgentTypeDTO agentTypeDTO = agentTypeMapper.toDto(agentType);
        var returnedAgentTypeDTO = om.readValue(
            restAgentTypeMockMvc
                .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(om.writeValueAsBytes(agentTypeDTO)))
                .andExpect(status().isCreated())
                .andReturn()
                .getResponse()
                .getContentAsString(),
            AgentTypeDTO.class
        );

        // Validate the AgentType in the database
        assertIncrementedRepositoryCount(databaseSizeBeforeCreate);
        var returnedAgentType = agentTypeMapper.toEntity(returnedAgentTypeDTO);
        assertAgentTypeUpdatableFieldsEquals(returnedAgentType, getPersistedAgentType(returnedAgentType));

        insertedAgentType = returnedAgentType;
    }

    @Test
    @Transactional
    void createAgentTypeWithExistingId() throws Exception {
        // Create the AgentType with an existing ID
        agentType.setId(1L);
        AgentTypeDTO agentTypeDTO = agentTypeMapper.toDto(agentType);

        long databaseSizeBeforeCreate = getRepositoryCount();

        // An entity with an existing ID cannot be created, so this API call must fail
        restAgentTypeMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(om.writeValueAsBytes(agentTypeDTO)))
            .andExpect(status().isBadRequest());

        // Validate the AgentType in the database
        assertSameRepositoryCount(databaseSizeBeforeCreate);
    }

    @Test
    @Transactional
    void checkNameIsRequired() throws Exception {
        long databaseSizeBeforeTest = getRepositoryCount();
        // set the field null
        agentType.setName(null);

        // Create the AgentType, which fails.
        AgentTypeDTO agentTypeDTO = agentTypeMapper.toDto(agentType);

        restAgentTypeMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(om.writeValueAsBytes(agentTypeDTO)))
            .andExpect(status().isBadRequest());

        assertSameRepositoryCount(databaseSizeBeforeTest);
    }

    @Test
    @Transactional
    void getAllAgentTypes() throws Exception {
        // Initialize the database
        insertedAgentType = agentTypeRepository.saveAndFlush(agentType);

        // Get all the agentTypeList
        restAgentTypeMockMvc
            .perform(get(ENTITY_API_URL + "?sort=id,desc"))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].id").value(hasItem(agentType.getId().intValue())))
            .andExpect(jsonPath("$.[*].name").value(hasItem(DEFAULT_NAME)))
            .andExpect(jsonPath("$.[*].description").value(hasItem(DEFAULT_DESCRIPTION)));
    }

    @Test
    @Transactional
    void getAgentType() throws Exception {
        // Initialize the database
        insertedAgentType = agentTypeRepository.saveAndFlush(agentType);

        // Get the agentType
        restAgentTypeMockMvc
            .perform(get(ENTITY_API_URL_ID, agentType.getId()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.id").value(agentType.getId().intValue()))
            .andExpect(jsonPath("$.name").value(DEFAULT_NAME))
            .andExpect(jsonPath("$.description").value(DEFAULT_DESCRIPTION));
    }

    @Test
    @Transactional
    void getAgentTypesByIdFiltering() throws Exception {
        // Initialize the database
        insertedAgentType = agentTypeRepository.saveAndFlush(agentType);

        Long id = agentType.getId();

        defaultAgentTypeFiltering("id.equals=" + id, "id.notEquals=" + id);

        defaultAgentTypeFiltering("id.greaterThanOrEqual=" + id, "id.greaterThan=" + id);

        defaultAgentTypeFiltering("id.lessThanOrEqual=" + id, "id.lessThan=" + id);
    }

    @Test
    @Transactional
    void getAllAgentTypesByNameIsEqualToSomething() throws Exception {
        // Initialize the database
        insertedAgentType = agentTypeRepository.saveAndFlush(agentType);

        // Get all the agentTypeList where name equals to
        defaultAgentTypeFiltering("name.equals=" + DEFAULT_NAME, "name.equals=" + UPDATED_NAME);
    }

    @Test
    @Transactional
    void getAllAgentTypesByNameIsInShouldWork() throws Exception {
        // Initialize the database
        insertedAgentType = agentTypeRepository.saveAndFlush(agentType);

        // Get all the agentTypeList where name in
        defaultAgentTypeFiltering("name.in=" + DEFAULT_NAME + "," + UPDATED_NAME, "name.in=" + UPDATED_NAME);
    }

    @Test
    @Transactional
    void getAllAgentTypesByNameIsNullOrNotNull() throws Exception {
        // Initialize the database
        insertedAgentType = agentTypeRepository.saveAndFlush(agentType);

        // Get all the agentTypeList where name is not null
        defaultAgentTypeFiltering("name.specified=true", "name.specified=false");
    }

    @Test
    @Transactional
    void getAllAgentTypesByNameContainsSomething() throws Exception {
        // Initialize the database
        insertedAgentType = agentTypeRepository.saveAndFlush(agentType);

        // Get all the agentTypeList where name contains
        defaultAgentTypeFiltering("name.contains=" + DEFAULT_NAME, "name.contains=" + UPDATED_NAME);
    }

    @Test
    @Transactional
    void getAllAgentTypesByNameNotContainsSomething() throws Exception {
        // Initialize the database
        insertedAgentType = agentTypeRepository.saveAndFlush(agentType);

        // Get all the agentTypeList where name does not contain
        defaultAgentTypeFiltering("name.doesNotContain=" + UPDATED_NAME, "name.doesNotContain=" + DEFAULT_NAME);
    }

    @Test
    @Transactional
    void getAllAgentTypesByDescriptionIsEqualToSomething() throws Exception {
        // Initialize the database
        insertedAgentType = agentTypeRepository.saveAndFlush(agentType);

        // Get all the agentTypeList where description equals to
        defaultAgentTypeFiltering("description.equals=" + DEFAULT_DESCRIPTION, "description.equals=" + UPDATED_DESCRIPTION);
    }

    @Test
    @Transactional
    void getAllAgentTypesByDescriptionIsInShouldWork() throws Exception {
        // Initialize the database
        insertedAgentType = agentTypeRepository.saveAndFlush(agentType);

        // Get all the agentTypeList where description in
        defaultAgentTypeFiltering(
            "description.in=" + DEFAULT_DESCRIPTION + "," + UPDATED_DESCRIPTION,
            "description.in=" + UPDATED_DESCRIPTION
        );
    }

    @Test
    @Transactional
    void getAllAgentTypesByDescriptionIsNullOrNotNull() throws Exception {
        // Initialize the database
        insertedAgentType = agentTypeRepository.saveAndFlush(agentType);

        // Get all the agentTypeList where description is not null
        defaultAgentTypeFiltering("description.specified=true", "description.specified=false");
    }

    @Test
    @Transactional
    void getAllAgentTypesByDescriptionContainsSomething() throws Exception {
        // Initialize the database
        insertedAgentType = agentTypeRepository.saveAndFlush(agentType);

        // Get all the agentTypeList where description contains
        defaultAgentTypeFiltering("description.contains=" + DEFAULT_DESCRIPTION, "description.contains=" + UPDATED_DESCRIPTION);
    }

    @Test
    @Transactional
    void getAllAgentTypesByDescriptionNotContainsSomething() throws Exception {
        // Initialize the database
        insertedAgentType = agentTypeRepository.saveAndFlush(agentType);

        // Get all the agentTypeList where description does not contain
        defaultAgentTypeFiltering("description.doesNotContain=" + UPDATED_DESCRIPTION, "description.doesNotContain=" + DEFAULT_DESCRIPTION);
    }

    private void defaultAgentTypeFiltering(String shouldBeFound, String shouldNotBeFound) throws Exception {
        defaultAgentTypeShouldBeFound(shouldBeFound);
        defaultAgentTypeShouldNotBeFound(shouldNotBeFound);
    }

    /**
     * Executes the search, and checks that the default entity is returned.
     */
    private void defaultAgentTypeShouldBeFound(String filter) throws Exception {
        restAgentTypeMockMvc
            .perform(get(ENTITY_API_URL + "?sort=id,desc&" + filter))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].id").value(hasItem(agentType.getId().intValue())))
            .andExpect(jsonPath("$.[*].name").value(hasItem(DEFAULT_NAME)))
            .andExpect(jsonPath("$.[*].description").value(hasItem(DEFAULT_DESCRIPTION)));

        // Check, that the count call also returns 1
        restAgentTypeMockMvc
            .perform(get(ENTITY_API_URL + "/count?sort=id,desc&" + filter))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(content().string("1"));
    }

    /**
     * Executes the search, and checks that the default entity is not returned.
     */
    private void defaultAgentTypeShouldNotBeFound(String filter) throws Exception {
        restAgentTypeMockMvc
            .perform(get(ENTITY_API_URL + "?sort=id,desc&" + filter))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$").isArray())
            .andExpect(jsonPath("$").isEmpty());

        // Check, that the count call also returns 0
        restAgentTypeMockMvc
            .perform(get(ENTITY_API_URL + "/count?sort=id,desc&" + filter))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(content().string("0"));
    }

    @Test
    @Transactional
    void getNonExistingAgentType() throws Exception {
        // Get the agentType
        restAgentTypeMockMvc.perform(get(ENTITY_API_URL_ID, Long.MAX_VALUE)).andExpect(status().isNotFound());
    }

    @Test
    @Transactional
    void putExistingAgentType() throws Exception {
        // Initialize the database
        insertedAgentType = agentTypeRepository.saveAndFlush(agentType);

        long databaseSizeBeforeUpdate = getRepositoryCount();

        // Update the agentType
        AgentType updatedAgentType = agentTypeRepository.findById(agentType.getId()).orElseThrow();
        // Disconnect from session so that the updates on updatedAgentType are not directly saved in db
        em.detach(updatedAgentType);
        updatedAgentType.name(UPDATED_NAME).description(UPDATED_DESCRIPTION);
        AgentTypeDTO agentTypeDTO = agentTypeMapper.toDto(updatedAgentType);

        restAgentTypeMockMvc
            .perform(
                put(ENTITY_API_URL_ID, agentTypeDTO.getId())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(om.writeValueAsBytes(agentTypeDTO))
            )
            .andExpect(status().isOk());

        // Validate the AgentType in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
        assertPersistedAgentTypeToMatchAllProperties(updatedAgentType);
    }

    @Test
    @Transactional
    void putNonExistingAgentType() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        agentType.setId(longCount.incrementAndGet());

        // Create the AgentType
        AgentTypeDTO agentTypeDTO = agentTypeMapper.toDto(agentType);

        // If the entity doesn't have an ID, it will throw BadRequestAlertException
        restAgentTypeMockMvc
            .perform(
                put(ENTITY_API_URL_ID, agentTypeDTO.getId())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(om.writeValueAsBytes(agentTypeDTO))
            )
            .andExpect(status().isBadRequest());

        // Validate the AgentType in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void putWithIdMismatchAgentType() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        agentType.setId(longCount.incrementAndGet());

        // Create the AgentType
        AgentTypeDTO agentTypeDTO = agentTypeMapper.toDto(agentType);

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restAgentTypeMockMvc
            .perform(
                put(ENTITY_API_URL_ID, longCount.incrementAndGet())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(om.writeValueAsBytes(agentTypeDTO))
            )
            .andExpect(status().isBadRequest());

        // Validate the AgentType in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void putWithMissingIdPathParamAgentType() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        agentType.setId(longCount.incrementAndGet());

        // Create the AgentType
        AgentTypeDTO agentTypeDTO = agentTypeMapper.toDto(agentType);

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restAgentTypeMockMvc
            .perform(put(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(om.writeValueAsBytes(agentTypeDTO)))
            .andExpect(status().isMethodNotAllowed());

        // Validate the AgentType in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void partialUpdateAgentTypeWithPatch() throws Exception {
        // Initialize the database
        insertedAgentType = agentTypeRepository.saveAndFlush(agentType);

        long databaseSizeBeforeUpdate = getRepositoryCount();

        // Update the agentType using partial update
        AgentType partialUpdatedAgentType = new AgentType();
        partialUpdatedAgentType.setId(agentType.getId());

        partialUpdatedAgentType.name(UPDATED_NAME).description(UPDATED_DESCRIPTION);

        restAgentTypeMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, partialUpdatedAgentType.getId())
                    .contentType("application/merge-patch+json")
                    .content(om.writeValueAsBytes(partialUpdatedAgentType))
            )
            .andExpect(status().isOk());

        // Validate the AgentType in the database

        assertSameRepositoryCount(databaseSizeBeforeUpdate);
        assertAgentTypeUpdatableFieldsEquals(
            createUpdateProxyForBean(partialUpdatedAgentType, agentType),
            getPersistedAgentType(agentType)
        );
    }

    @Test
    @Transactional
    void fullUpdateAgentTypeWithPatch() throws Exception {
        // Initialize the database
        insertedAgentType = agentTypeRepository.saveAndFlush(agentType);

        long databaseSizeBeforeUpdate = getRepositoryCount();

        // Update the agentType using partial update
        AgentType partialUpdatedAgentType = new AgentType();
        partialUpdatedAgentType.setId(agentType.getId());

        partialUpdatedAgentType.name(UPDATED_NAME).description(UPDATED_DESCRIPTION);

        restAgentTypeMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, partialUpdatedAgentType.getId())
                    .contentType("application/merge-patch+json")
                    .content(om.writeValueAsBytes(partialUpdatedAgentType))
            )
            .andExpect(status().isOk());

        // Validate the AgentType in the database

        assertSameRepositoryCount(databaseSizeBeforeUpdate);
        assertAgentTypeUpdatableFieldsEquals(partialUpdatedAgentType, getPersistedAgentType(partialUpdatedAgentType));
    }

    @Test
    @Transactional
    void patchNonExistingAgentType() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        agentType.setId(longCount.incrementAndGet());

        // Create the AgentType
        AgentTypeDTO agentTypeDTO = agentTypeMapper.toDto(agentType);

        // If the entity doesn't have an ID, it will throw BadRequestAlertException
        restAgentTypeMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, agentTypeDTO.getId())
                    .contentType("application/merge-patch+json")
                    .content(om.writeValueAsBytes(agentTypeDTO))
            )
            .andExpect(status().isBadRequest());

        // Validate the AgentType in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void patchWithIdMismatchAgentType() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        agentType.setId(longCount.incrementAndGet());

        // Create the AgentType
        AgentTypeDTO agentTypeDTO = agentTypeMapper.toDto(agentType);

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restAgentTypeMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, longCount.incrementAndGet())
                    .contentType("application/merge-patch+json")
                    .content(om.writeValueAsBytes(agentTypeDTO))
            )
            .andExpect(status().isBadRequest());

        // Validate the AgentType in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void patchWithMissingIdPathParamAgentType() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        agentType.setId(longCount.incrementAndGet());

        // Create the AgentType
        AgentTypeDTO agentTypeDTO = agentTypeMapper.toDto(agentType);

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restAgentTypeMockMvc
            .perform(patch(ENTITY_API_URL).contentType("application/merge-patch+json").content(om.writeValueAsBytes(agentTypeDTO)))
            .andExpect(status().isMethodNotAllowed());

        // Validate the AgentType in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void deleteAgentType() throws Exception {
        // Initialize the database
        insertedAgentType = agentTypeRepository.saveAndFlush(agentType);

        long databaseSizeBeforeDelete = getRepositoryCount();

        // Delete the agentType
        restAgentTypeMockMvc
            .perform(delete(ENTITY_API_URL_ID, agentType.getId()).accept(MediaType.APPLICATION_JSON))
            .andExpect(status().isNoContent());

        // Validate the database contains one less item
        assertDecrementedRepositoryCount(databaseSizeBeforeDelete);
    }

    protected long getRepositoryCount() {
        return agentTypeRepository.count();
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

    protected AgentType getPersistedAgentType(AgentType agentType) {
        return agentTypeRepository.findById(agentType.getId()).orElseThrow();
    }

    protected void assertPersistedAgentTypeToMatchAllProperties(AgentType expectedAgentType) {
        assertAgentTypeAllPropertiesEquals(expectedAgentType, getPersistedAgentType(expectedAgentType));
    }

    protected void assertPersistedAgentTypeToMatchUpdatableProperties(AgentType expectedAgentType) {
        assertAgentTypeAllUpdatablePropertiesEquals(expectedAgentType, getPersistedAgentType(expectedAgentType));
    }
}
