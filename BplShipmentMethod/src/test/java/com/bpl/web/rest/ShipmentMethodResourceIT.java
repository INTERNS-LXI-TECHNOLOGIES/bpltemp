package com.bpl.web.rest;

import static com.bpl.domain.ShipmentMethodAsserts.*;
import static com.bpl.web.rest.TestUtil.createUpdateProxyForBean;
import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.hasItem;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import com.bpl.IntegrationTest;
import com.bpl.domain.ShipmentMethod;
import com.bpl.repository.ShipmentMethodRepository;
import com.bpl.service.ShipmentMethodService;
import com.bpl.service.dto.ShipmentMethodDTO;
import com.bpl.service.mapper.ShipmentMethodMapper;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.persistence.EntityManager;
import java.util.ArrayList;
import java.util.Random;
import java.util.concurrent.atomic.AtomicLong;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

/**
 * Integration tests for the {@link ShipmentMethodResource} REST controller.
 */
@IntegrationTest
@ExtendWith(MockitoExtension.class)
@AutoConfigureMockMvc
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
    private MockMvc restShipmentMethodMockMvc;

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

    @BeforeEach
    public void initTest() {
        shipmentMethod = createEntity();
    }

    @AfterEach
    public void cleanup() {
        if (insertedShipmentMethod != null) {
            shipmentMethodRepository.delete(insertedShipmentMethod);
            insertedShipmentMethod = null;
        }
    }

    @Test
    @Transactional
    void createShipmentMethod() throws Exception {
        long databaseSizeBeforeCreate = getRepositoryCount();
        // Create the ShipmentMethod
        ShipmentMethodDTO shipmentMethodDTO = shipmentMethodMapper.toDto(shipmentMethod);
        var returnedShipmentMethodDTO = om.readValue(
            restShipmentMethodMockMvc
                .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(om.writeValueAsBytes(shipmentMethodDTO)))
                .andExpect(status().isCreated())
                .andReturn()
                .getResponse()
                .getContentAsString(),
            ShipmentMethodDTO.class
        );

        // Validate the ShipmentMethod in the database
        assertIncrementedRepositoryCount(databaseSizeBeforeCreate);
        var returnedShipmentMethod = shipmentMethodMapper.toEntity(returnedShipmentMethodDTO);
        assertShipmentMethodUpdatableFieldsEquals(returnedShipmentMethod, getPersistedShipmentMethod(returnedShipmentMethod));

        insertedShipmentMethod = returnedShipmentMethod;
    }

    @Test
    @Transactional
    void createShipmentMethodWithExistingId() throws Exception {
        // Create the ShipmentMethod with an existing ID
        shipmentMethod.setId(1L);
        ShipmentMethodDTO shipmentMethodDTO = shipmentMethodMapper.toDto(shipmentMethod);

        long databaseSizeBeforeCreate = getRepositoryCount();

        // An entity with an existing ID cannot be created, so this API call must fail
        restShipmentMethodMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(om.writeValueAsBytes(shipmentMethodDTO)))
            .andExpect(status().isBadRequest());

        // Validate the ShipmentMethod in the database
        assertSameRepositoryCount(databaseSizeBeforeCreate);
    }

    @Test
    @Transactional
    void checkNameIsRequired() throws Exception {
        long databaseSizeBeforeTest = getRepositoryCount();
        // set the field null
        shipmentMethod.setName(null);

        // Create the ShipmentMethod, which fails.
        ShipmentMethodDTO shipmentMethodDTO = shipmentMethodMapper.toDto(shipmentMethod);

        restShipmentMethodMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(om.writeValueAsBytes(shipmentMethodDTO)))
            .andExpect(status().isBadRequest());

        assertSameRepositoryCount(databaseSizeBeforeTest);
    }

    @Test
    @Transactional
    void getAllShipmentMethods() throws Exception {
        // Initialize the database
        insertedShipmentMethod = shipmentMethodRepository.saveAndFlush(shipmentMethod);

        // Get all the shipmentMethodList
        restShipmentMethodMockMvc
            .perform(get(ENTITY_API_URL + "?sort=id,desc"))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].id").value(hasItem(shipmentMethod.getId().intValue())))
            .andExpect(jsonPath("$.[*].name").value(hasItem(DEFAULT_NAME)))
            .andExpect(jsonPath("$.[*].description").value(hasItem(DEFAULT_DESCRIPTION)));
    }

    @SuppressWarnings({ "unchecked" })
    void getAllShipmentMethodsWithEagerRelationshipsIsEnabled() throws Exception {
        when(shipmentMethodServiceMock.findAllWithEagerRelationships(any())).thenReturn(new PageImpl(new ArrayList<>()));

        restShipmentMethodMockMvc.perform(get(ENTITY_API_URL + "?eagerload=true")).andExpect(status().isOk());

        verify(shipmentMethodServiceMock, times(1)).findAllWithEagerRelationships(any());
    }

    @SuppressWarnings({ "unchecked" })
    void getAllShipmentMethodsWithEagerRelationshipsIsNotEnabled() throws Exception {
        when(shipmentMethodServiceMock.findAllWithEagerRelationships(any())).thenReturn(new PageImpl(new ArrayList<>()));

        restShipmentMethodMockMvc.perform(get(ENTITY_API_URL + "?eagerload=false")).andExpect(status().isOk());
        verify(shipmentMethodRepositoryMock, times(1)).findAll(any(Pageable.class));
    }

    @Test
    @Transactional
    void getShipmentMethod() throws Exception {
        // Initialize the database
        insertedShipmentMethod = shipmentMethodRepository.saveAndFlush(shipmentMethod);

        // Get the shipmentMethod
        restShipmentMethodMockMvc
            .perform(get(ENTITY_API_URL_ID, shipmentMethod.getId()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.id").value(shipmentMethod.getId().intValue()))
            .andExpect(jsonPath("$.name").value(DEFAULT_NAME))
            .andExpect(jsonPath("$.description").value(DEFAULT_DESCRIPTION));
    }

    @Test
    @Transactional
    void getNonExistingShipmentMethod() throws Exception {
        // Get the shipmentMethod
        restShipmentMethodMockMvc.perform(get(ENTITY_API_URL_ID, Long.MAX_VALUE)).andExpect(status().isNotFound());
    }

    @Test
    @Transactional
    void putExistingShipmentMethod() throws Exception {
        // Initialize the database
        insertedShipmentMethod = shipmentMethodRepository.saveAndFlush(shipmentMethod);

        long databaseSizeBeforeUpdate = getRepositoryCount();

        // Update the shipmentMethod
        ShipmentMethod updatedShipmentMethod = shipmentMethodRepository.findById(shipmentMethod.getId()).orElseThrow();
        // Disconnect from session so that the updates on updatedShipmentMethod are not directly saved in db
        em.detach(updatedShipmentMethod);
        updatedShipmentMethod.name(UPDATED_NAME).description(UPDATED_DESCRIPTION);
        ShipmentMethodDTO shipmentMethodDTO = shipmentMethodMapper.toDto(updatedShipmentMethod);

        restShipmentMethodMockMvc
            .perform(
                put(ENTITY_API_URL_ID, shipmentMethodDTO.getId())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(om.writeValueAsBytes(shipmentMethodDTO))
            )
            .andExpect(status().isOk());

        // Validate the ShipmentMethod in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
        assertPersistedShipmentMethodToMatchAllProperties(updatedShipmentMethod);
    }

    @Test
    @Transactional
    void putNonExistingShipmentMethod() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        shipmentMethod.setId(longCount.incrementAndGet());

        // Create the ShipmentMethod
        ShipmentMethodDTO shipmentMethodDTO = shipmentMethodMapper.toDto(shipmentMethod);

        // If the entity doesn't have an ID, it will throw BadRequestAlertException
        restShipmentMethodMockMvc
            .perform(
                put(ENTITY_API_URL_ID, shipmentMethodDTO.getId())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(om.writeValueAsBytes(shipmentMethodDTO))
            )
            .andExpect(status().isBadRequest());

        // Validate the ShipmentMethod in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void putWithIdMismatchShipmentMethod() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        shipmentMethod.setId(longCount.incrementAndGet());

        // Create the ShipmentMethod
        ShipmentMethodDTO shipmentMethodDTO = shipmentMethodMapper.toDto(shipmentMethod);

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restShipmentMethodMockMvc
            .perform(
                put(ENTITY_API_URL_ID, longCount.incrementAndGet())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(om.writeValueAsBytes(shipmentMethodDTO))
            )
            .andExpect(status().isBadRequest());

        // Validate the ShipmentMethod in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void putWithMissingIdPathParamShipmentMethod() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        shipmentMethod.setId(longCount.incrementAndGet());

        // Create the ShipmentMethod
        ShipmentMethodDTO shipmentMethodDTO = shipmentMethodMapper.toDto(shipmentMethod);

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restShipmentMethodMockMvc
            .perform(put(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(om.writeValueAsBytes(shipmentMethodDTO)))
            .andExpect(status().isMethodNotAllowed());

        // Validate the ShipmentMethod in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void partialUpdateShipmentMethodWithPatch() throws Exception {
        // Initialize the database
        insertedShipmentMethod = shipmentMethodRepository.saveAndFlush(shipmentMethod);

        long databaseSizeBeforeUpdate = getRepositoryCount();

        // Update the shipmentMethod using partial update
        ShipmentMethod partialUpdatedShipmentMethod = new ShipmentMethod();
        partialUpdatedShipmentMethod.setId(shipmentMethod.getId());

        partialUpdatedShipmentMethod.description(UPDATED_DESCRIPTION);

        restShipmentMethodMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, partialUpdatedShipmentMethod.getId())
                    .contentType("application/merge-patch+json")
                    .content(om.writeValueAsBytes(partialUpdatedShipmentMethod))
            )
            .andExpect(status().isOk());

        // Validate the ShipmentMethod in the database

        assertSameRepositoryCount(databaseSizeBeforeUpdate);
        assertShipmentMethodUpdatableFieldsEquals(
            createUpdateProxyForBean(partialUpdatedShipmentMethod, shipmentMethod),
            getPersistedShipmentMethod(shipmentMethod)
        );
    }

    @Test
    @Transactional
    void fullUpdateShipmentMethodWithPatch() throws Exception {
        // Initialize the database
        insertedShipmentMethod = shipmentMethodRepository.saveAndFlush(shipmentMethod);

        long databaseSizeBeforeUpdate = getRepositoryCount();

        // Update the shipmentMethod using partial update
        ShipmentMethod partialUpdatedShipmentMethod = new ShipmentMethod();
        partialUpdatedShipmentMethod.setId(shipmentMethod.getId());

        partialUpdatedShipmentMethod.name(UPDATED_NAME).description(UPDATED_DESCRIPTION);

        restShipmentMethodMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, partialUpdatedShipmentMethod.getId())
                    .contentType("application/merge-patch+json")
                    .content(om.writeValueAsBytes(partialUpdatedShipmentMethod))
            )
            .andExpect(status().isOk());

        // Validate the ShipmentMethod in the database

        assertSameRepositoryCount(databaseSizeBeforeUpdate);
        assertShipmentMethodUpdatableFieldsEquals(partialUpdatedShipmentMethod, getPersistedShipmentMethod(partialUpdatedShipmentMethod));
    }

    @Test
    @Transactional
    void patchNonExistingShipmentMethod() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        shipmentMethod.setId(longCount.incrementAndGet());

        // Create the ShipmentMethod
        ShipmentMethodDTO shipmentMethodDTO = shipmentMethodMapper.toDto(shipmentMethod);

        // If the entity doesn't have an ID, it will throw BadRequestAlertException
        restShipmentMethodMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, shipmentMethodDTO.getId())
                    .contentType("application/merge-patch+json")
                    .content(om.writeValueAsBytes(shipmentMethodDTO))
            )
            .andExpect(status().isBadRequest());

        // Validate the ShipmentMethod in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void patchWithIdMismatchShipmentMethod() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        shipmentMethod.setId(longCount.incrementAndGet());

        // Create the ShipmentMethod
        ShipmentMethodDTO shipmentMethodDTO = shipmentMethodMapper.toDto(shipmentMethod);

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restShipmentMethodMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, longCount.incrementAndGet())
                    .contentType("application/merge-patch+json")
                    .content(om.writeValueAsBytes(shipmentMethodDTO))
            )
            .andExpect(status().isBadRequest());

        // Validate the ShipmentMethod in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void patchWithMissingIdPathParamShipmentMethod() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        shipmentMethod.setId(longCount.incrementAndGet());

        // Create the ShipmentMethod
        ShipmentMethodDTO shipmentMethodDTO = shipmentMethodMapper.toDto(shipmentMethod);

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restShipmentMethodMockMvc
            .perform(patch(ENTITY_API_URL).contentType("application/merge-patch+json").content(om.writeValueAsBytes(shipmentMethodDTO)))
            .andExpect(status().isMethodNotAllowed());

        // Validate the ShipmentMethod in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void deleteShipmentMethod() throws Exception {
        // Initialize the database
        insertedShipmentMethod = shipmentMethodRepository.saveAndFlush(shipmentMethod);

        long databaseSizeBeforeDelete = getRepositoryCount();

        // Delete the shipmentMethod
        restShipmentMethodMockMvc
            .perform(delete(ENTITY_API_URL_ID, shipmentMethod.getId()).accept(MediaType.APPLICATION_JSON))
            .andExpect(status().isNoContent());

        // Validate the database contains one less item
        assertDecrementedRepositoryCount(databaseSizeBeforeDelete);
    }

    protected long getRepositoryCount() {
        return shipmentMethodRepository.count();
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
        return shipmentMethodRepository.findById(shipmentMethod.getId()).orElseThrow();
    }

    protected void assertPersistedShipmentMethodToMatchAllProperties(ShipmentMethod expectedShipmentMethod) {
        assertShipmentMethodAllPropertiesEquals(expectedShipmentMethod, getPersistedShipmentMethod(expectedShipmentMethod));
    }

    protected void assertPersistedShipmentMethodToMatchUpdatableProperties(ShipmentMethod expectedShipmentMethod) {
        assertShipmentMethodAllUpdatablePropertiesEquals(expectedShipmentMethod, getPersistedShipmentMethod(expectedShipmentMethod));
    }
}
