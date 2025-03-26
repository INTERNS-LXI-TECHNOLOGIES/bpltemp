package com.diviso.web.rest;

import static com.diviso.domain.FacilityTypeAsserts.*;
import static com.diviso.web.rest.TestUtil.createUpdateProxyForBean;
import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.hasItem;
import static org.hamcrest.Matchers.is;

import com.diviso.IntegrationTest;
import com.diviso.domain.FacilityType;
import com.diviso.repository.EntityManager;
import com.diviso.repository.FacilityTypeRepository;
import com.diviso.service.dto.FacilityTypeDTO;
import com.diviso.service.mapper.FacilityTypeMapper;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.time.Duration;
import java.util.List;
import java.util.Random;
import java.util.concurrent.atomic.AtomicLong;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.reactive.AutoConfigureWebTestClient;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.reactive.server.WebTestClient;

/**
 * Integration tests for the {@link FacilityTypeResource} REST controller.
 */
@IntegrationTest
@AutoConfigureWebTestClient(timeout = IntegrationTest.DEFAULT_ENTITY_TIMEOUT)
@WithMockUser
class FacilityTypeResourceIT {

    private static final String DEFAULT_NAME = "AAAAAAAAAA";
    private static final String UPDATED_NAME = "BBBBBBBBBB";

    private static final String ENTITY_API_URL = "/api/facility-types";
    private static final String ENTITY_API_URL_ID = ENTITY_API_URL + "/{id}";

    private static Random random = new Random();
    private static AtomicLong longCount = new AtomicLong(random.nextInt() + (2 * Integer.MAX_VALUE));

    @Autowired
    private ObjectMapper om;

    @Autowired
    private FacilityTypeRepository facilityTypeRepository;

    @Autowired
    private FacilityTypeMapper facilityTypeMapper;

    @Autowired
    private EntityManager em;

    @Autowired
    private WebTestClient webTestClient;

    private FacilityType facilityType;

    private FacilityType insertedFacilityType;

    /**
     * Create an entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static FacilityType createEntity() {
        return new FacilityType().name(DEFAULT_NAME);
    }

    /**
     * Create an updated entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static FacilityType createUpdatedEntity() {
        return new FacilityType().name(UPDATED_NAME);
    }

    public static void deleteEntities(EntityManager em) {
        try {
            em.deleteAll(FacilityType.class).block();
        } catch (Exception e) {
            // It can fail, if other entities are still referring this - it will be removed later.
        }
    }

    @BeforeEach
    public void initTest() {
        facilityType = createEntity();
    }

    @AfterEach
    public void cleanup() {
        if (insertedFacilityType != null) {
            facilityTypeRepository.delete(insertedFacilityType).block();
            insertedFacilityType = null;
        }
        deleteEntities(em);
    }

    @Test
    void createFacilityType() throws Exception {
        long databaseSizeBeforeCreate = getRepositoryCount();
        // Create the FacilityType
        FacilityTypeDTO facilityTypeDTO = facilityTypeMapper.toDto(facilityType);
        var returnedFacilityTypeDTO = webTestClient
            .post()
            .uri(ENTITY_API_URL)
            .contentType(MediaType.APPLICATION_JSON)
            .bodyValue(om.writeValueAsBytes(facilityTypeDTO))
            .exchange()
            .expectStatus()
            .isCreated()
            .expectBody(FacilityTypeDTO.class)
            .returnResult()
            .getResponseBody();

        // Validate the FacilityType in the database
        assertIncrementedRepositoryCount(databaseSizeBeforeCreate);
        var returnedFacilityType = facilityTypeMapper.toEntity(returnedFacilityTypeDTO);
        assertFacilityTypeUpdatableFieldsEquals(returnedFacilityType, getPersistedFacilityType(returnedFacilityType));

        insertedFacilityType = returnedFacilityType;
    }

    @Test
    void createFacilityTypeWithExistingId() throws Exception {
        // Create the FacilityType with an existing ID
        facilityType.setId(1L);
        FacilityTypeDTO facilityTypeDTO = facilityTypeMapper.toDto(facilityType);

        long databaseSizeBeforeCreate = getRepositoryCount();

        // An entity with an existing ID cannot be created, so this API call must fail
        webTestClient
            .post()
            .uri(ENTITY_API_URL)
            .contentType(MediaType.APPLICATION_JSON)
            .bodyValue(om.writeValueAsBytes(facilityTypeDTO))
            .exchange()
            .expectStatus()
            .isBadRequest();

        // Validate the FacilityType in the database
        assertSameRepositoryCount(databaseSizeBeforeCreate);
    }

    @Test
    void checkNameIsRequired() throws Exception {
        long databaseSizeBeforeTest = getRepositoryCount();
        // set the field null
        facilityType.setName(null);

        // Create the FacilityType, which fails.
        FacilityTypeDTO facilityTypeDTO = facilityTypeMapper.toDto(facilityType);

        webTestClient
            .post()
            .uri(ENTITY_API_URL)
            .contentType(MediaType.APPLICATION_JSON)
            .bodyValue(om.writeValueAsBytes(facilityTypeDTO))
            .exchange()
            .expectStatus()
            .isBadRequest();

        assertSameRepositoryCount(databaseSizeBeforeTest);
    }

    @Test
    void getAllFacilityTypesAsStream() {
        // Initialize the database
        facilityTypeRepository.save(facilityType).block();

        List<FacilityType> facilityTypeList = webTestClient
            .get()
            .uri(ENTITY_API_URL)
            .accept(MediaType.APPLICATION_NDJSON)
            .exchange()
            .expectStatus()
            .isOk()
            .expectHeader()
            .contentTypeCompatibleWith(MediaType.APPLICATION_NDJSON)
            .returnResult(FacilityTypeDTO.class)
            .getResponseBody()
            .map(facilityTypeMapper::toEntity)
            .filter(facilityType::equals)
            .collectList()
            .block(Duration.ofSeconds(5));

        assertThat(facilityTypeList).isNotNull();
        assertThat(facilityTypeList).hasSize(1);
        FacilityType testFacilityType = facilityTypeList.get(0);

        // Test fails because reactive api returns an empty object instead of null
        // assertFacilityTypeAllPropertiesEquals(facilityType, testFacilityType);
        assertFacilityTypeUpdatableFieldsEquals(facilityType, testFacilityType);
    }

    @Test
    void getAllFacilityTypes() {
        // Initialize the database
        insertedFacilityType = facilityTypeRepository.save(facilityType).block();

        // Get all the facilityTypeList
        webTestClient
            .get()
            .uri(ENTITY_API_URL + "?sort=id,desc")
            .accept(MediaType.APPLICATION_JSON)
            .exchange()
            .expectStatus()
            .isOk()
            .expectHeader()
            .contentType(MediaType.APPLICATION_JSON)
            .expectBody()
            .jsonPath("$.[*].id")
            .value(hasItem(facilityType.getId().intValue()))
            .jsonPath("$.[*].name")
            .value(hasItem(DEFAULT_NAME));
    }

    @Test
    void getFacilityType() {
        // Initialize the database
        insertedFacilityType = facilityTypeRepository.save(facilityType).block();

        // Get the facilityType
        webTestClient
            .get()
            .uri(ENTITY_API_URL_ID, facilityType.getId())
            .accept(MediaType.APPLICATION_JSON)
            .exchange()
            .expectStatus()
            .isOk()
            .expectHeader()
            .contentType(MediaType.APPLICATION_JSON)
            .expectBody()
            .jsonPath("$.id")
            .value(is(facilityType.getId().intValue()))
            .jsonPath("$.name")
            .value(is(DEFAULT_NAME));
    }

    @Test
    void getNonExistingFacilityType() {
        // Get the facilityType
        webTestClient
            .get()
            .uri(ENTITY_API_URL_ID, Long.MAX_VALUE)
            .accept(MediaType.APPLICATION_PROBLEM_JSON)
            .exchange()
            .expectStatus()
            .isNotFound();
    }

    @Test
    void putExistingFacilityType() throws Exception {
        // Initialize the database
        insertedFacilityType = facilityTypeRepository.save(facilityType).block();

        long databaseSizeBeforeUpdate = getRepositoryCount();

        // Update the facilityType
        FacilityType updatedFacilityType = facilityTypeRepository.findById(facilityType.getId()).block();
        updatedFacilityType.name(UPDATED_NAME);
        FacilityTypeDTO facilityTypeDTO = facilityTypeMapper.toDto(updatedFacilityType);

        webTestClient
            .put()
            .uri(ENTITY_API_URL_ID, facilityTypeDTO.getId())
            .contentType(MediaType.APPLICATION_JSON)
            .bodyValue(om.writeValueAsBytes(facilityTypeDTO))
            .exchange()
            .expectStatus()
            .isOk();

        // Validate the FacilityType in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
        assertPersistedFacilityTypeToMatchAllProperties(updatedFacilityType);
    }

    @Test
    void putNonExistingFacilityType() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        facilityType.setId(longCount.incrementAndGet());

        // Create the FacilityType
        FacilityTypeDTO facilityTypeDTO = facilityTypeMapper.toDto(facilityType);

        // If the entity doesn't have an ID, it will throw BadRequestAlertException
        webTestClient
            .put()
            .uri(ENTITY_API_URL_ID, facilityTypeDTO.getId())
            .contentType(MediaType.APPLICATION_JSON)
            .bodyValue(om.writeValueAsBytes(facilityTypeDTO))
            .exchange()
            .expectStatus()
            .isBadRequest();

        // Validate the FacilityType in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    void putWithIdMismatchFacilityType() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        facilityType.setId(longCount.incrementAndGet());

        // Create the FacilityType
        FacilityTypeDTO facilityTypeDTO = facilityTypeMapper.toDto(facilityType);

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        webTestClient
            .put()
            .uri(ENTITY_API_URL_ID, longCount.incrementAndGet())
            .contentType(MediaType.APPLICATION_JSON)
            .bodyValue(om.writeValueAsBytes(facilityTypeDTO))
            .exchange()
            .expectStatus()
            .isBadRequest();

        // Validate the FacilityType in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    void putWithMissingIdPathParamFacilityType() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        facilityType.setId(longCount.incrementAndGet());

        // Create the FacilityType
        FacilityTypeDTO facilityTypeDTO = facilityTypeMapper.toDto(facilityType);

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        webTestClient
            .put()
            .uri(ENTITY_API_URL)
            .contentType(MediaType.APPLICATION_JSON)
            .bodyValue(om.writeValueAsBytes(facilityTypeDTO))
            .exchange()
            .expectStatus()
            .isEqualTo(405);

        // Validate the FacilityType in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    void partialUpdateFacilityTypeWithPatch() throws Exception {
        // Initialize the database
        insertedFacilityType = facilityTypeRepository.save(facilityType).block();

        long databaseSizeBeforeUpdate = getRepositoryCount();

        // Update the facilityType using partial update
        FacilityType partialUpdatedFacilityType = new FacilityType();
        partialUpdatedFacilityType.setId(facilityType.getId());

        webTestClient
            .patch()
            .uri(ENTITY_API_URL_ID, partialUpdatedFacilityType.getId())
            .contentType(MediaType.valueOf("application/merge-patch+json"))
            .bodyValue(om.writeValueAsBytes(partialUpdatedFacilityType))
            .exchange()
            .expectStatus()
            .isOk();

        // Validate the FacilityType in the database

        assertSameRepositoryCount(databaseSizeBeforeUpdate);
        assertFacilityTypeUpdatableFieldsEquals(
            createUpdateProxyForBean(partialUpdatedFacilityType, facilityType),
            getPersistedFacilityType(facilityType)
        );
    }

    @Test
    void fullUpdateFacilityTypeWithPatch() throws Exception {
        // Initialize the database
        insertedFacilityType = facilityTypeRepository.save(facilityType).block();

        long databaseSizeBeforeUpdate = getRepositoryCount();

        // Update the facilityType using partial update
        FacilityType partialUpdatedFacilityType = new FacilityType();
        partialUpdatedFacilityType.setId(facilityType.getId());

        partialUpdatedFacilityType.name(UPDATED_NAME);

        webTestClient
            .patch()
            .uri(ENTITY_API_URL_ID, partialUpdatedFacilityType.getId())
            .contentType(MediaType.valueOf("application/merge-patch+json"))
            .bodyValue(om.writeValueAsBytes(partialUpdatedFacilityType))
            .exchange()
            .expectStatus()
            .isOk();

        // Validate the FacilityType in the database

        assertSameRepositoryCount(databaseSizeBeforeUpdate);
        assertFacilityTypeUpdatableFieldsEquals(partialUpdatedFacilityType, getPersistedFacilityType(partialUpdatedFacilityType));
    }

    @Test
    void patchNonExistingFacilityType() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        facilityType.setId(longCount.incrementAndGet());

        // Create the FacilityType
        FacilityTypeDTO facilityTypeDTO = facilityTypeMapper.toDto(facilityType);

        // If the entity doesn't have an ID, it will throw BadRequestAlertException
        webTestClient
            .patch()
            .uri(ENTITY_API_URL_ID, facilityTypeDTO.getId())
            .contentType(MediaType.valueOf("application/merge-patch+json"))
            .bodyValue(om.writeValueAsBytes(facilityTypeDTO))
            .exchange()
            .expectStatus()
            .isBadRequest();

        // Validate the FacilityType in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    void patchWithIdMismatchFacilityType() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        facilityType.setId(longCount.incrementAndGet());

        // Create the FacilityType
        FacilityTypeDTO facilityTypeDTO = facilityTypeMapper.toDto(facilityType);

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        webTestClient
            .patch()
            .uri(ENTITY_API_URL_ID, longCount.incrementAndGet())
            .contentType(MediaType.valueOf("application/merge-patch+json"))
            .bodyValue(om.writeValueAsBytes(facilityTypeDTO))
            .exchange()
            .expectStatus()
            .isBadRequest();

        // Validate the FacilityType in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    void patchWithMissingIdPathParamFacilityType() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        facilityType.setId(longCount.incrementAndGet());

        // Create the FacilityType
        FacilityTypeDTO facilityTypeDTO = facilityTypeMapper.toDto(facilityType);

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        webTestClient
            .patch()
            .uri(ENTITY_API_URL)
            .contentType(MediaType.valueOf("application/merge-patch+json"))
            .bodyValue(om.writeValueAsBytes(facilityTypeDTO))
            .exchange()
            .expectStatus()
            .isEqualTo(405);

        // Validate the FacilityType in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    void deleteFacilityType() {
        // Initialize the database
        insertedFacilityType = facilityTypeRepository.save(facilityType).block();

        long databaseSizeBeforeDelete = getRepositoryCount();

        // Delete the facilityType
        webTestClient
            .delete()
            .uri(ENTITY_API_URL_ID, facilityType.getId())
            .accept(MediaType.APPLICATION_JSON)
            .exchange()
            .expectStatus()
            .isNoContent();

        // Validate the database contains one less item
        assertDecrementedRepositoryCount(databaseSizeBeforeDelete);
    }

    protected long getRepositoryCount() {
        return facilityTypeRepository.count().block();
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

    protected FacilityType getPersistedFacilityType(FacilityType facilityType) {
        return facilityTypeRepository.findById(facilityType.getId()).block();
    }

    protected void assertPersistedFacilityTypeToMatchAllProperties(FacilityType expectedFacilityType) {
        // Test fails because reactive api returns an empty object instead of null
        // assertFacilityTypeAllPropertiesEquals(expectedFacilityType, getPersistedFacilityType(expectedFacilityType));
        assertFacilityTypeUpdatableFieldsEquals(expectedFacilityType, getPersistedFacilityType(expectedFacilityType));
    }

    protected void assertPersistedFacilityTypeToMatchUpdatableProperties(FacilityType expectedFacilityType) {
        // Test fails because reactive api returns an empty object instead of null
        // assertFacilityTypeAllUpdatablePropertiesEquals(expectedFacilityType, getPersistedFacilityType(expectedFacilityType));
        assertFacilityTypeUpdatableFieldsEquals(expectedFacilityType, getPersistedFacilityType(expectedFacilityType));
    }
}
