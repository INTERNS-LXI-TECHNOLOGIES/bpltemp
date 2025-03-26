package com.bpl.web.rest;

import static com.bpl.domain.OrganisationAsserts.*;
import static com.bpl.web.rest.TestUtil.createUpdateProxyForBean;
import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.hasItem;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import com.bpl.IntegrationTest;
import com.bpl.domain.AgentType;
import com.bpl.domain.Organisation;
import com.bpl.repository.OrganisationRepository;
import com.bpl.service.dto.OrganisationDTO;
import com.bpl.service.mapper.OrganisationMapper;
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
 * Integration tests for the {@link OrganisationResource} REST controller.
 */
@IntegrationTest
@AutoConfigureMockMvc
@WithMockUser
class OrganisationResourceIT {

    private static final String DEFAULT_NAME = "AAAAAAAAAA";
    private static final String UPDATED_NAME = "BBBBBBBBBB";

    private static final String ENTITY_API_URL = "/api/organisations";
    private static final String ENTITY_API_URL_ID = ENTITY_API_URL + "/{id}";

    private static Random random = new Random();
    private static AtomicLong longCount = new AtomicLong(random.nextInt() + (2 * Integer.MAX_VALUE));

    @Autowired
    private ObjectMapper om;

    @Autowired
    private OrganisationRepository organisationRepository;

    @Autowired
    private OrganisationMapper organisationMapper;

    @Autowired
    private EntityManager em;

    @Autowired
    private MockMvc restOrganisationMockMvc;

    private Organisation organisation;

    private Organisation insertedOrganisation;

    /**
     * Create an entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static Organisation createEntity() {
        return new Organisation().name(DEFAULT_NAME);
    }

    /**
     * Create an updated entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static Organisation createUpdatedEntity() {
        return new Organisation().name(UPDATED_NAME);
    }

    @BeforeEach
    public void initTest() {
        organisation = createEntity();
    }

    @AfterEach
    public void cleanup() {
        if (insertedOrganisation != null) {
            organisationRepository.delete(insertedOrganisation);
            insertedOrganisation = null;
        }
    }

    @Test
    @Transactional
    void createOrganisation() throws Exception {
        long databaseSizeBeforeCreate = getRepositoryCount();
        // Create the Organisation
        OrganisationDTO organisationDTO = organisationMapper.toDto(organisation);
        var returnedOrganisationDTO = om.readValue(
            restOrganisationMockMvc
                .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(om.writeValueAsBytes(organisationDTO)))
                .andExpect(status().isCreated())
                .andReturn()
                .getResponse()
                .getContentAsString(),
            OrganisationDTO.class
        );

        // Validate the Organisation in the database
        assertIncrementedRepositoryCount(databaseSizeBeforeCreate);
        var returnedOrganisation = organisationMapper.toEntity(returnedOrganisationDTO);
        assertOrganisationUpdatableFieldsEquals(returnedOrganisation, getPersistedOrganisation(returnedOrganisation));

        insertedOrganisation = returnedOrganisation;
    }

    @Test
    @Transactional
    void createOrganisationWithExistingId() throws Exception {
        // Create the Organisation with an existing ID
        organisation.setId(1L);
        OrganisationDTO organisationDTO = organisationMapper.toDto(organisation);

        long databaseSizeBeforeCreate = getRepositoryCount();

        // An entity with an existing ID cannot be created, so this API call must fail
        restOrganisationMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(om.writeValueAsBytes(organisationDTO)))
            .andExpect(status().isBadRequest());

        // Validate the Organisation in the database
        assertSameRepositoryCount(databaseSizeBeforeCreate);
    }

    @Test
    @Transactional
    void checkNameIsRequired() throws Exception {
        long databaseSizeBeforeTest = getRepositoryCount();
        // set the field null
        organisation.setName(null);

        // Create the Organisation, which fails.
        OrganisationDTO organisationDTO = organisationMapper.toDto(organisation);

        restOrganisationMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(om.writeValueAsBytes(organisationDTO)))
            .andExpect(status().isBadRequest());

        assertSameRepositoryCount(databaseSizeBeforeTest);
    }

    @Test
    @Transactional
    void getAllOrganisations() throws Exception {
        // Initialize the database
        insertedOrganisation = organisationRepository.saveAndFlush(organisation);

        // Get all the organisationList
        restOrganisationMockMvc
            .perform(get(ENTITY_API_URL + "?sort=id,desc"))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].id").value(hasItem(organisation.getId().intValue())))
            .andExpect(jsonPath("$.[*].name").value(hasItem(DEFAULT_NAME)));
    }

    @Test
    @Transactional
    void getOrganisation() throws Exception {
        // Initialize the database
        insertedOrganisation = organisationRepository.saveAndFlush(organisation);

        // Get the organisation
        restOrganisationMockMvc
            .perform(get(ENTITY_API_URL_ID, organisation.getId()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.id").value(organisation.getId().intValue()))
            .andExpect(jsonPath("$.name").value(DEFAULT_NAME));
    }

    @Test
    @Transactional
    void getOrganisationsByIdFiltering() throws Exception {
        // Initialize the database
        insertedOrganisation = organisationRepository.saveAndFlush(organisation);

        Long id = organisation.getId();

        defaultOrganisationFiltering("id.equals=" + id, "id.notEquals=" + id);

        defaultOrganisationFiltering("id.greaterThanOrEqual=" + id, "id.greaterThan=" + id);

        defaultOrganisationFiltering("id.lessThanOrEqual=" + id, "id.lessThan=" + id);
    }

    @Test
    @Transactional
    void getAllOrganisationsByNameIsEqualToSomething() throws Exception {
        // Initialize the database
        insertedOrganisation = organisationRepository.saveAndFlush(organisation);

        // Get all the organisationList where name equals to
        defaultOrganisationFiltering("name.equals=" + DEFAULT_NAME, "name.equals=" + UPDATED_NAME);
    }

    @Test
    @Transactional
    void getAllOrganisationsByNameIsInShouldWork() throws Exception {
        // Initialize the database
        insertedOrganisation = organisationRepository.saveAndFlush(organisation);

        // Get all the organisationList where name in
        defaultOrganisationFiltering("name.in=" + DEFAULT_NAME + "," + UPDATED_NAME, "name.in=" + UPDATED_NAME);
    }

    @Test
    @Transactional
    void getAllOrganisationsByNameIsNullOrNotNull() throws Exception {
        // Initialize the database
        insertedOrganisation = organisationRepository.saveAndFlush(organisation);

        // Get all the organisationList where name is not null
        defaultOrganisationFiltering("name.specified=true", "name.specified=false");
    }

    @Test
    @Transactional
    void getAllOrganisationsByNameContainsSomething() throws Exception {
        // Initialize the database
        insertedOrganisation = organisationRepository.saveAndFlush(organisation);

        // Get all the organisationList where name contains
        defaultOrganisationFiltering("name.contains=" + DEFAULT_NAME, "name.contains=" + UPDATED_NAME);
    }

    @Test
    @Transactional
    void getAllOrganisationsByNameNotContainsSomething() throws Exception {
        // Initialize the database
        insertedOrganisation = organisationRepository.saveAndFlush(organisation);

        // Get all the organisationList where name does not contain
        defaultOrganisationFiltering("name.doesNotContain=" + UPDATED_NAME, "name.doesNotContain=" + DEFAULT_NAME);
    }

    @Test
    @Transactional
    void getAllOrganisationsByAgentTypeIsEqualToSomething() throws Exception {
        AgentType agentType;
        if (TestUtil.findAll(em, AgentType.class).isEmpty()) {
            organisationRepository.saveAndFlush(organisation);
            agentType = AgentTypeResourceIT.createEntity();
        } else {
            agentType = TestUtil.findAll(em, AgentType.class).get(0);
        }
        em.persist(agentType);
        em.flush();
        organisation.setAgentType(agentType);
        organisationRepository.saveAndFlush(organisation);
        Long agentTypeId = agentType.getId();
        // Get all the organisationList where agentType equals to agentTypeId
        defaultOrganisationShouldBeFound("agentTypeId.equals=" + agentTypeId);

        // Get all the organisationList where agentType equals to (agentTypeId + 1)
        defaultOrganisationShouldNotBeFound("agentTypeId.equals=" + (agentTypeId + 1));
    }

    private void defaultOrganisationFiltering(String shouldBeFound, String shouldNotBeFound) throws Exception {
        defaultOrganisationShouldBeFound(shouldBeFound);
        defaultOrganisationShouldNotBeFound(shouldNotBeFound);
    }

    /**
     * Executes the search, and checks that the default entity is returned.
     */
    private void defaultOrganisationShouldBeFound(String filter) throws Exception {
        restOrganisationMockMvc
            .perform(get(ENTITY_API_URL + "?sort=id,desc&" + filter))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].id").value(hasItem(organisation.getId().intValue())))
            .andExpect(jsonPath("$.[*].name").value(hasItem(DEFAULT_NAME)));

        // Check, that the count call also returns 1
        restOrganisationMockMvc
            .perform(get(ENTITY_API_URL + "/count?sort=id,desc&" + filter))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(content().string("1"));
    }

    /**
     * Executes the search, and checks that the default entity is not returned.
     */
    private void defaultOrganisationShouldNotBeFound(String filter) throws Exception {
        restOrganisationMockMvc
            .perform(get(ENTITY_API_URL + "?sort=id,desc&" + filter))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$").isArray())
            .andExpect(jsonPath("$").isEmpty());

        // Check, that the count call also returns 0
        restOrganisationMockMvc
            .perform(get(ENTITY_API_URL + "/count?sort=id,desc&" + filter))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(content().string("0"));
    }

    @Test
    @Transactional
    void getNonExistingOrganisation() throws Exception {
        // Get the organisation
        restOrganisationMockMvc.perform(get(ENTITY_API_URL_ID, Long.MAX_VALUE)).andExpect(status().isNotFound());
    }

    @Test
    @Transactional
    void putExistingOrganisation() throws Exception {
        // Initialize the database
        insertedOrganisation = organisationRepository.saveAndFlush(organisation);

        long databaseSizeBeforeUpdate = getRepositoryCount();

        // Update the organisation
        Organisation updatedOrganisation = organisationRepository.findById(organisation.getId()).orElseThrow();
        // Disconnect from session so that the updates on updatedOrganisation are not directly saved in db
        em.detach(updatedOrganisation);
        updatedOrganisation.name(UPDATED_NAME);
        OrganisationDTO organisationDTO = organisationMapper.toDto(updatedOrganisation);

        restOrganisationMockMvc
            .perform(
                put(ENTITY_API_URL_ID, organisationDTO.getId())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(om.writeValueAsBytes(organisationDTO))
            )
            .andExpect(status().isOk());

        // Validate the Organisation in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
        assertPersistedOrganisationToMatchAllProperties(updatedOrganisation);
    }

    @Test
    @Transactional
    void putNonExistingOrganisation() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        organisation.setId(longCount.incrementAndGet());

        // Create the Organisation
        OrganisationDTO organisationDTO = organisationMapper.toDto(organisation);

        // If the entity doesn't have an ID, it will throw BadRequestAlertException
        restOrganisationMockMvc
            .perform(
                put(ENTITY_API_URL_ID, organisationDTO.getId())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(om.writeValueAsBytes(organisationDTO))
            )
            .andExpect(status().isBadRequest());

        // Validate the Organisation in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void putWithIdMismatchOrganisation() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        organisation.setId(longCount.incrementAndGet());

        // Create the Organisation
        OrganisationDTO organisationDTO = organisationMapper.toDto(organisation);

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restOrganisationMockMvc
            .perform(
                put(ENTITY_API_URL_ID, longCount.incrementAndGet())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(om.writeValueAsBytes(organisationDTO))
            )
            .andExpect(status().isBadRequest());

        // Validate the Organisation in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void putWithMissingIdPathParamOrganisation() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        organisation.setId(longCount.incrementAndGet());

        // Create the Organisation
        OrganisationDTO organisationDTO = organisationMapper.toDto(organisation);

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restOrganisationMockMvc
            .perform(put(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(om.writeValueAsBytes(organisationDTO)))
            .andExpect(status().isMethodNotAllowed());

        // Validate the Organisation in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void partialUpdateOrganisationWithPatch() throws Exception {
        // Initialize the database
        insertedOrganisation = organisationRepository.saveAndFlush(organisation);

        long databaseSizeBeforeUpdate = getRepositoryCount();

        // Update the organisation using partial update
        Organisation partialUpdatedOrganisation = new Organisation();
        partialUpdatedOrganisation.setId(organisation.getId());

        restOrganisationMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, partialUpdatedOrganisation.getId())
                    .contentType("application/merge-patch+json")
                    .content(om.writeValueAsBytes(partialUpdatedOrganisation))
            )
            .andExpect(status().isOk());

        // Validate the Organisation in the database

        assertSameRepositoryCount(databaseSizeBeforeUpdate);
        assertOrganisationUpdatableFieldsEquals(
            createUpdateProxyForBean(partialUpdatedOrganisation, organisation),
            getPersistedOrganisation(organisation)
        );
    }

    @Test
    @Transactional
    void fullUpdateOrganisationWithPatch() throws Exception {
        // Initialize the database
        insertedOrganisation = organisationRepository.saveAndFlush(organisation);

        long databaseSizeBeforeUpdate = getRepositoryCount();

        // Update the organisation using partial update
        Organisation partialUpdatedOrganisation = new Organisation();
        partialUpdatedOrganisation.setId(organisation.getId());

        partialUpdatedOrganisation.name(UPDATED_NAME);

        restOrganisationMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, partialUpdatedOrganisation.getId())
                    .contentType("application/merge-patch+json")
                    .content(om.writeValueAsBytes(partialUpdatedOrganisation))
            )
            .andExpect(status().isOk());

        // Validate the Organisation in the database

        assertSameRepositoryCount(databaseSizeBeforeUpdate);
        assertOrganisationUpdatableFieldsEquals(partialUpdatedOrganisation, getPersistedOrganisation(partialUpdatedOrganisation));
    }

    @Test
    @Transactional
    void patchNonExistingOrganisation() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        organisation.setId(longCount.incrementAndGet());

        // Create the Organisation
        OrganisationDTO organisationDTO = organisationMapper.toDto(organisation);

        // If the entity doesn't have an ID, it will throw BadRequestAlertException
        restOrganisationMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, organisationDTO.getId())
                    .contentType("application/merge-patch+json")
                    .content(om.writeValueAsBytes(organisationDTO))
            )
            .andExpect(status().isBadRequest());

        // Validate the Organisation in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void patchWithIdMismatchOrganisation() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        organisation.setId(longCount.incrementAndGet());

        // Create the Organisation
        OrganisationDTO organisationDTO = organisationMapper.toDto(organisation);

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restOrganisationMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, longCount.incrementAndGet())
                    .contentType("application/merge-patch+json")
                    .content(om.writeValueAsBytes(organisationDTO))
            )
            .andExpect(status().isBadRequest());

        // Validate the Organisation in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void patchWithMissingIdPathParamOrganisation() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        organisation.setId(longCount.incrementAndGet());

        // Create the Organisation
        OrganisationDTO organisationDTO = organisationMapper.toDto(organisation);

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restOrganisationMockMvc
            .perform(patch(ENTITY_API_URL).contentType("application/merge-patch+json").content(om.writeValueAsBytes(organisationDTO)))
            .andExpect(status().isMethodNotAllowed());

        // Validate the Organisation in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void deleteOrganisation() throws Exception {
        // Initialize the database
        insertedOrganisation = organisationRepository.saveAndFlush(organisation);

        long databaseSizeBeforeDelete = getRepositoryCount();

        // Delete the organisation
        restOrganisationMockMvc
            .perform(delete(ENTITY_API_URL_ID, organisation.getId()).accept(MediaType.APPLICATION_JSON))
            .andExpect(status().isNoContent());

        // Validate the database contains one less item
        assertDecrementedRepositoryCount(databaseSizeBeforeDelete);
    }

    protected long getRepositoryCount() {
        return organisationRepository.count();
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

    protected Organisation getPersistedOrganisation(Organisation organisation) {
        return organisationRepository.findById(organisation.getId()).orElseThrow();
    }

    protected void assertPersistedOrganisationToMatchAllProperties(Organisation expectedOrganisation) {
        assertOrganisationAllPropertiesEquals(expectedOrganisation, getPersistedOrganisation(expectedOrganisation));
    }

    protected void assertPersistedOrganisationToMatchUpdatableProperties(Organisation expectedOrganisation) {
        assertOrganisationAllUpdatablePropertiesEquals(expectedOrganisation, getPersistedOrganisation(expectedOrganisation));
    }
}
