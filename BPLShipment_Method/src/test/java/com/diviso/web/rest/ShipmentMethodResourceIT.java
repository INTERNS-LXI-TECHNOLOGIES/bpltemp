package com.diviso.web.rest;

import static com.diviso.domain.ShipmentMethodAsserts.*;
import static com.diviso.web.rest.TestUtil.createUpdateProxyForBean;
import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.hasItem;
import static org.hamcrest.Matchers.is;
import static org.mockito.Mockito.*;

import com.diviso.IntegrationTest;
import com.diviso.domain.ShipmentMethod;
import com.diviso.repository.EntityManager;
import com.diviso.repository.ShipmentMethodRepository;
import com.diviso.service.ShipmentMethodService;
import com.diviso.service.dto.ShipmentMethodDTO;
import com.diviso.service.mapper.ShipmentMethodMapper;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.Random;
import java.util.concurrent.atomic.AtomicLong;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.reactive.AutoConfigureWebTestClient;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.reactive.server.WebTestClient;
import reactor.core.publisher.Flux;

/**
 * Integration tests for the {@link ShipmentMethodResource} REST controller.
 */
@IntegrationTest
@ExtendWith(MockitoExtension.class)
@AutoConfigureWebTestClient(timeout = IntegrationTest.DEFAULT_ENTITY_TIMEOUT)
@WithMockUser
class ShipmentMethodResourceIT {

    private static final String DEFAULT_NAME = "AAAAAAAAAA";
    private static final String UPDATED_NAME = "BBBBBBBBBB";

    private static final String DEFAULT_DESCRIPTION = "AAAAAAAAAA";
    private static final String UPDATED_DESCRIPTION = "BBBBBBBBBB";

    private static final String ENTITY_API_URL = "/api/shipment-methods";
    private static final String ENTITY_API_URL_ID = ENTITY_API_URL + "/{id}";

    private static Random random = new Random();
    private static AtomicLong longCount = new AtomicLong(random.nextInt() + (2 * Integer.MAX_VALUE));

    @Autowired
    private ObjectMapper om;

    @Autowired
    private ShipmentMethodRepository shipmentMethodRepository;

    @Mock
    private ShipmentMethodRepository shipmentMethodRepositoryMock;

    @Autowired
    private ShipmentMethodMapper shipmentMethodMapper;

    @Mock
    private ShipmentMethodService shipmentMethodServiceMock;

    @Autowired
    private EntityManager em;

    @Autowired
    private WebTestClient webTestClient;

    private ShipmentMethod shipmentMethod;

    private ShipmentMethod insertedShipmentMethod;

    /**
     * Create an entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static ShipmentMethod createEntity() {
        return new ShipmentMethod().name(DEFAULT_NAME).description(DEFAULT_DESCRIPTION);
    }

    /**
     * Create an updated entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static ShipmentMethod createUpdatedEntity() {
        return new ShipmentMethod().name(UPDATED_NAME).description(UPDATED_DESCRIPTION);
    }

    public static void deleteEntities(EntityManager em) {
        try {
            em.deleteAll(ShipmentMethod.class).block();
        } catch (Exception e) {
            // It can fail, if other entities are still referring this - it will be removed later.
        }
    }

    @BeforeEach
    public void initTest() {
        shipmentMethod = createEntity();
    }

    @AfterEach
    public void cleanup() {
        if (insertedShipmentMethod != null) {
            shipmentMethodRepository.delete(insertedShipmentMethod).block();
            insertedShipmentMethod = null;
        }
        deleteEntities(em);
    }

    @Test
    void createShipmentMethod() throws Exception {
        long databaseSizeBeforeCreate = getRepositoryCount();
        // Create the ShipmentMethod
        ShipmentMethodDTO shipmentMethodDTO = shipmentMethodMapper.toDto(shipmentMethod);
        var returnedShipmentMethodDTO = webTestClient
            .post()
            .uri(ENTITY_API_URL)
            .contentType(MediaType.APPLICATION_JSON)
            .bodyValue(om.writeValueAsBytes(shipmentMethodDTO))
            .exchange()
            .expectStatus()
            .isCreated()
            .expectBody(ShipmentMethodDTO.class)
            .returnResult()
            .getResponseBody();

        // Validate the ShipmentMethod in the database
        assertIncrementedRepositoryCount(databaseSizeBeforeCreate);
        var returnedShipmentMethod = shipmentMethodMapper.toEntity(returnedShipmentMethodDTO);
        assertShipmentMethodUpdatableFieldsEquals(returnedShipmentMethod, getPersistedShipmentMethod(returnedShipmentMethod));

        insertedShipmentMethod = returnedShipmentMethod;
    }

    @Test
    void createShipmentMethodWithExistingId() throws Exception {
        // Create the ShipmentMethod with an existing ID
        shipmentMethod.setId(1L);
        ShipmentMethodDTO shipmentMethodDTO = shipmentMethodMapper.toDto(shipmentMethod);

        long databaseSizeBeforeCreate = getRepositoryCount();

        // An entity with an existing ID cannot be created, so this API call must fail
        webTestClient
            .post()
            .uri(ENTITY_API_URL)
            .contentType(MediaType.APPLICATION_JSON)
            .bodyValue(om.writeValueAsBytes(shipmentMethodDTO))
            .exchange()
            .expectStatus()
            .isBadRequest();

        // Validate the ShipmentMethod in the database
        assertSameRepositoryCount(databaseSizeBeforeCreate);
    }

    @Test
    void checkNameIsRequired() throws Exception {
        long databaseSizeBeforeTest = getRepositoryCount();
        // set the field null
        shipmentMethod.setName(null);

        // Create the ShipmentMethod, which fails.
        ShipmentMethodDTO shipmentMethodDTO = shipmentMethodMapper.toDto(shipmentMethod);

        webTestClient
            .post()
            .uri(ENTITY_API_URL)
            .contentType(MediaType.APPLICATION_JSON)
            .bodyValue(om.writeValueAsBytes(shipmentMethodDTO))
            .exchange()
            .expectStatus()
            .isBadRequest();

        assertSameRepositoryCount(databaseSizeBeforeTest);
    }

    @Test
    void getAllShipmentMethods() {
        // Initialize the database
        insertedShipmentMethod = shipmentMethodRepository.save(shipmentMethod).block();

        // Get all the shipmentMethodList
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
            .value(hasItem(shipmentMethod.getId().intValue()))
            .jsonPath("$.[*].name")
            .value(hasItem(DEFAULT_NAME))
            .jsonPath("$.[*].description")
            .value(hasItem(DEFAULT_DESCRIPTION));
    }

    @SuppressWarnings({ "unchecked" })
    void getAllShipmentMethodsWithEagerRelationshipsIsEnabled() {
        when(shipmentMethodServiceMock.findAllWithEagerRelationships(any())).thenReturn(Flux.empty());

        webTestClient.get().uri(ENTITY_API_URL + "?eagerload=true").exchange().expectStatus().isOk();

        verify(shipmentMethodServiceMock, times(1)).findAllWithEagerRelationships(any());
    }

    @SuppressWarnings({ "unchecked" })
    void getAllShipmentMethodsWithEagerRelationshipsIsNotEnabled() {
        when(shipmentMethodServiceMock.findAllWithEagerRelationships(any())).thenReturn(Flux.empty());

        webTestClient.get().uri(ENTITY_API_URL + "?eagerload=false").exchange().expectStatus().isOk();
        verify(shipmentMethodRepositoryMock, times(1)).findAllWithEagerRelationships(any());
    }

    @Test
    void getShipmentMethod() {
        // Initialize the database
        insertedShipmentMethod = shipmentMethodRepository.save(shipmentMethod).block();

        // Get the shipmentMethod
        webTestClient
            .get()
            .uri(ENTITY_API_URL_ID, shipmentMethod.getId())
            .accept(MediaType.APPLICATION_JSON)
            .exchange()
            .expectStatus()
            .isOk()
            .expectHeader()
            .contentType(MediaType.APPLICATION_JSON)
            .expectBody()
            .jsonPath("$.id")
            .value(is(shipmentMethod.getId().intValue()))
            .jsonPath("$.name")
            .value(is(DEFAULT_NAME))
            .jsonPath("$.description")
            .value(is(DEFAULT_DESCRIPTION));
    }

    @Test
    void getNonExistingShipmentMethod() {
        // Get the shipmentMethod
        webTestClient
            .get()
            .uri(ENTITY_API_URL_ID, Long.MAX_VALUE)
            .accept(MediaType.APPLICATION_PROBLEM_JSON)
            .exchange()
            .expectStatus()
            .isNotFound();
    }

    @Test
    void putExistingShipmentMethod() throws Exception {
        // Initialize the database
        insertedShipmentMethod = shipmentMethodRepository.save(shipmentMethod).block();

        long databaseSizeBeforeUpdate = getRepositoryCount();

        // Update the shipmentMethod
        ShipmentMethod updatedShipmentMethod = shipmentMethodRepository.findById(shipmentMethod.getId()).block();
        updatedShipmentMethod.name(UPDATED_NAME).description(UPDATED_DESCRIPTION);
        ShipmentMethodDTO shipmentMethodDTO = shipmentMethodMapper.toDto(updatedShipmentMethod);

        webTestClient
            .put()
            .uri(ENTITY_API_URL_ID, shipmentMethodDTO.getId())
            .contentType(MediaType.APPLICATION_JSON)
            .bodyValue(om.writeValueAsBytes(shipmentMethodDTO))
            .exchange()
            .expectStatus()
            .isOk();

        // Validate the ShipmentMethod in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
        assertPersistedShipmentMethodToMatchAllProperties(updatedShipmentMethod);
    }

    @Test
    void putNonExistingShipmentMethod() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        shipmentMethod.setId(longCount.incrementAndGet());

        // Create the ShipmentMethod
        ShipmentMethodDTO shipmentMethodDTO = shipmentMethodMapper.toDto(shipmentMethod);

        // If the entity doesn't have an ID, it will throw BadRequestAlertException
        webTestClient
            .put()
            .uri(ENTITY_API_URL_ID, shipmentMethodDTO.getId())
            .contentType(MediaType.APPLICATION_JSON)
            .bodyValue(om.writeValueAsBytes(shipmentMethodDTO))
            .exchange()
            .expectStatus()
            .isBadRequest();

        // Validate the ShipmentMethod in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    void putWithIdMismatchShipmentMethod() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        shipmentMethod.setId(longCount.incrementAndGet());

        // Create the ShipmentMethod
        ShipmentMethodDTO shipmentMethodDTO = shipmentMethodMapper.toDto(shipmentMethod);

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        webTestClient
            .put()
            .uri(ENTITY_API_URL_ID, longCount.incrementAndGet())
            .contentType(MediaType.APPLICATION_JSON)
            .bodyValue(om.writeValueAsBytes(shipmentMethodDTO))
            .exchange()
            .expectStatus()
            .isBadRequest();

        // Validate the ShipmentMethod in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    void putWithMissingIdPathParamShipmentMethod() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        shipmentMethod.setId(longCount.incrementAndGet());

        // Create the ShipmentMethod
        ShipmentMethodDTO shipmentMethodDTO = shipmentMethodMapper.toDto(shipmentMethod);

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        webTestClient
            .put()
            .uri(ENTITY_API_URL)
            .contentType(MediaType.APPLICATION_JSON)
            .bodyValue(om.writeValueAsBytes(shipmentMethodDTO))
            .exchange()
            .expectStatus()
            .isEqualTo(405);

        // Validate the ShipmentMethod in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    void partialUpdateShipmentMethodWithPatch() throws Exception {
        // Initialize the database
        insertedShipmentMethod = shipmentMethodRepository.save(shipmentMethod).block();

        long databaseSizeBeforeUpdate = getRepositoryCount();

        // Update the shipmentMethod using partial update
        ShipmentMethod partialUpdatedShipmentMethod = new ShipmentMethod();
        partialUpdatedShipmentMethod.setId(shipmentMethod.getId());

        webTestClient
            .patch()
            .uri(ENTITY_API_URL_ID, partialUpdatedShipmentMethod.getId())
            .contentType(MediaType.valueOf("application/merge-patch+json"))
            .bodyValue(om.writeValueAsBytes(partialUpdatedShipmentMethod))
            .exchange()
            .expectStatus()
            .isOk();

        // Validate the ShipmentMethod in the database

        assertSameRepositoryCount(databaseSizeBeforeUpdate);
        assertShipmentMethodUpdatableFieldsEquals(
            createUpdateProxyForBean(partialUpdatedShipmentMethod, shipmentMethod),
            getPersistedShipmentMethod(shipmentMethod)
        );
    }

    @Test
    void fullUpdateShipmentMethodWithPatch() throws Exception {
        // Initialize the database
        insertedShipmentMethod = shipmentMethodRepository.save(shipmentMethod).block();

        long databaseSizeBeforeUpdate = getRepositoryCount();

        // Update the shipmentMethod using partial update
        ShipmentMethod partialUpdatedShipmentMethod = new ShipmentMethod();
        partialUpdatedShipmentMethod.setId(shipmentMethod.getId());

        partialUpdatedShipmentMethod.name(UPDATED_NAME).description(UPDATED_DESCRIPTION);

        webTestClient
            .patch()
            .uri(ENTITY_API_URL_ID, partialUpdatedShipmentMethod.getId())
            .contentType(MediaType.valueOf("application/merge-patch+json"))
            .bodyValue(om.writeValueAsBytes(partialUpdatedShipmentMethod))
            .exchange()
            .expectStatus()
            .isOk();

        // Validate the ShipmentMethod in the database

        assertSameRepositoryCount(databaseSizeBeforeUpdate);
        assertShipmentMethodUpdatableFieldsEquals(partialUpdatedShipmentMethod, getPersistedShipmentMethod(partialUpdatedShipmentMethod));
    }

    @Test
    void patchNonExistingShipmentMethod() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        shipmentMethod.setId(longCount.incrementAndGet());

        // Create the ShipmentMethod
        ShipmentMethodDTO shipmentMethodDTO = shipmentMethodMapper.toDto(shipmentMethod);

        // If the entity doesn't have an ID, it will throw BadRequestAlertException
        webTestClient
            .patch()
            .uri(ENTITY_API_URL_ID, shipmentMethodDTO.getId())
            .contentType(MediaType.valueOf("application/merge-patch+json"))
            .bodyValue(om.writeValueAsBytes(shipmentMethodDTO))
            .exchange()
            .expectStatus()
            .isBadRequest();

        // Validate the ShipmentMethod in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    void patchWithIdMismatchShipmentMethod() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        shipmentMethod.setId(longCount.incrementAndGet());

        // Create the ShipmentMethod
        ShipmentMethodDTO shipmentMethodDTO = shipmentMethodMapper.toDto(shipmentMethod);

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        webTestClient
            .patch()
            .uri(ENTITY_API_URL_ID, longCount.incrementAndGet())
            .contentType(MediaType.valueOf("application/merge-patch+json"))
            .bodyValue(om.writeValueAsBytes(shipmentMethodDTO))
            .exchange()
            .expectStatus()
            .isBadRequest();

        // Validate the ShipmentMethod in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    void patchWithMissingIdPathParamShipmentMethod() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        shipmentMethod.setId(longCount.incrementAndGet());

        // Create the ShipmentMethod
        ShipmentMethodDTO shipmentMethodDTO = shipmentMethodMapper.toDto(shipmentMethod);

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        webTestClient
            .patch()
            .uri(ENTITY_API_URL)
            .contentType(MediaType.valueOf("application/merge-patch+json"))
            .bodyValue(om.writeValueAsBytes(shipmentMethodDTO))
            .exchange()
            .expectStatus()
            .isEqualTo(405);

        // Validate the ShipmentMethod in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    void deleteShipmentMethod() {
        // Initialize the database
        insertedShipmentMethod = shipmentMethodRepository.save(shipmentMethod).block();

        long databaseSizeBeforeDelete = getRepositoryCount();

        // Delete the shipmentMethod
        webTestClient
            .delete()
            .uri(ENTITY_API_URL_ID, shipmentMethod.getId())
            .accept(MediaType.APPLICATION_JSON)
            .exchange()
            .expectStatus()
            .isNoContent();

        // Validate the database contains one less item
        assertDecrementedRepositoryCount(databaseSizeBeforeDelete);
    }

    protected long getRepositoryCount() {
        return shipmentMethodRepository.count().block();
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

    protected ShipmentMethod getPersistedShipmentMethod(ShipmentMethod shipmentMethod) {
        return shipmentMethodRepository.findById(shipmentMethod.getId()).block();
    }

    protected void assertPersistedShipmentMethodToMatchAllProperties(ShipmentMethod expectedShipmentMethod) {
        // Test fails because reactive api returns an empty object instead of null
        // assertShipmentMethodAllPropertiesEquals(expectedShipmentMethod, getPersistedShipmentMethod(expectedShipmentMethod));
        assertShipmentMethodUpdatableFieldsEquals(expectedShipmentMethod, getPersistedShipmentMethod(expectedShipmentMethod));
    }

    protected void assertPersistedShipmentMethodToMatchUpdatableProperties(ShipmentMethod expectedShipmentMethod) {
        // Test fails because reactive api returns an empty object instead of null
        // assertShipmentMethodAllUpdatablePropertiesEquals(expectedShipmentMethod, getPersistedShipmentMethod(expectedShipmentMethod));
        assertShipmentMethodUpdatableFieldsEquals(expectedShipmentMethod, getPersistedShipmentMethod(expectedShipmentMethod));
    }
}
