package com.lxisofttech.invoice.web.rest;

import static com.lxisofttech.invoice.domain.WayBillAsserts.*;
import static com.lxisofttech.invoice.web.rest.TestUtil.createUpdateProxyForBean;
import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.hasItem;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.lxisofttech.invoice.IntegrationTest;
import com.lxisofttech.invoice.domain.WayBill;
import com.lxisofttech.invoice.repository.WayBillRepository;
import jakarta.persistence.EntityManager;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
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
 * Integration tests for the {@link WayBillResource} REST controller.
 */
@IntegrationTest
@AutoConfigureMockMvc
@WithMockUser
class WayBillResourceIT {

    private static final Integer DEFAULT_BOX_LIMIT = 1;
    private static final Integer UPDATED_BOX_LIMIT = 2;

    private static final String DEFAULT_SHIPMENT_TYPE = "AAAAAAAAAA";
    private static final String UPDATED_SHIPMENT_TYPE = "BBBBBBBBBB";

    private static final String DEFAULT_OPFAC = "AAAAAAAAAA";
    private static final String UPDATED_OPFAC = "BBBBBBBBBB";

    private static final String DEFAULT_DELIVERY_AGENT = "AAAAAAAAAA";
    private static final String UPDATED_DELIVERY_AGENT = "BBBBBBBBBB";

    private static final Instant DEFAULT_ESTIMATED_READY_DATE = Instant.ofEpochMilli(0L);
    private static final Instant UPDATED_ESTIMATED_READY_DATE = Instant.now().truncatedTo(ChronoUnit.MILLIS);

    private static final String DEFAULT_CURRENCY_UOM = "AAAAAAAAAA";
    private static final String UPDATED_CURRENCY_UOM = "BBBBBBBBBB";

    private static final Instant DEFAULT_ESTIMATED_SHIP_DATE = Instant.ofEpochMilli(0L);
    private static final Instant UPDATED_ESTIMATED_SHIP_DATE = Instant.now().truncatedTo(ChronoUnit.MILLIS);

    private static final String DEFAULT_STATUS = "AAAAAAAAAA";
    private static final String UPDATED_STATUS = "BBBBBBBBBB";

    private static final String DEFAULT_REFERENCE_NUMBER = "AAAAAAAAAA";
    private static final String UPDATED_REFERENCE_NUMBER = "BBBBBBBBBB";

    private static final String ENTITY_API_URL = "/api/way-bills";
    private static final String ENTITY_API_URL_ID = ENTITY_API_URL + "/{id}";

    private static Random random = new Random();
    private static AtomicLong longCount = new AtomicLong(random.nextInt() + (2 * Integer.MAX_VALUE));

    @Autowired
    private ObjectMapper om;

    @Autowired
    private WayBillRepository wayBillRepository;

    @Autowired
    private EntityManager em;

    @Autowired
    private MockMvc restWayBillMockMvc;

    private WayBill wayBill;

    private WayBill insertedWayBill;

    /**
     * Create an entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static WayBill createEntity() {
        return new WayBill()
            .boxLimit(DEFAULT_BOX_LIMIT)
            .shipmentType(DEFAULT_SHIPMENT_TYPE)
            .opfac(DEFAULT_OPFAC)
            .deliveryAgent(DEFAULT_DELIVERY_AGENT)
            .estimatedReadyDate(DEFAULT_ESTIMATED_READY_DATE)
            .currencyUom(DEFAULT_CURRENCY_UOM)
            .estimatedShipDate(DEFAULT_ESTIMATED_SHIP_DATE)
            .status(DEFAULT_STATUS)
            .referenceNumber(DEFAULT_REFERENCE_NUMBER);
    }

    /**
     * Create an updated entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static WayBill createUpdatedEntity() {
        return new WayBill()
            .boxLimit(UPDATED_BOX_LIMIT)
            .shipmentType(UPDATED_SHIPMENT_TYPE)
            .opfac(UPDATED_OPFAC)
            .deliveryAgent(UPDATED_DELIVERY_AGENT)
            .estimatedReadyDate(UPDATED_ESTIMATED_READY_DATE)
            .currencyUom(UPDATED_CURRENCY_UOM)
            .estimatedShipDate(UPDATED_ESTIMATED_SHIP_DATE)
            .status(UPDATED_STATUS)
            .referenceNumber(UPDATED_REFERENCE_NUMBER);
    }

    @BeforeEach
    public void initTest() {
        wayBill = createEntity();
    }

    @AfterEach
    public void cleanup() {
        if (insertedWayBill != null) {
            wayBillRepository.delete(insertedWayBill);
            insertedWayBill = null;
        }
    }

    @Test
    @Transactional
    void createWayBill() throws Exception {
        long databaseSizeBeforeCreate = getRepositoryCount();
        // Create the WayBill
        var returnedWayBill = om.readValue(
            restWayBillMockMvc
                .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(om.writeValueAsBytes(wayBill)))
                .andExpect(status().isCreated())
                .andReturn()
                .getResponse()
                .getContentAsString(),
            WayBill.class
        );

        // Validate the WayBill in the database
        assertIncrementedRepositoryCount(databaseSizeBeforeCreate);
        assertWayBillUpdatableFieldsEquals(returnedWayBill, getPersistedWayBill(returnedWayBill));

        insertedWayBill = returnedWayBill;
    }

    @Test
    @Transactional
    void createWayBillWithExistingId() throws Exception {
        // Create the WayBill with an existing ID
        wayBill.setId(1L);

        long databaseSizeBeforeCreate = getRepositoryCount();

        // An entity with an existing ID cannot be created, so this API call must fail
        restWayBillMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(om.writeValueAsBytes(wayBill)))
            .andExpect(status().isBadRequest());

        // Validate the WayBill in the database
        assertSameRepositoryCount(databaseSizeBeforeCreate);
    }

    @Test
    @Transactional
    void getAllWayBills() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList
        restWayBillMockMvc
            .perform(get(ENTITY_API_URL + "?sort=id,desc"))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].id").value(hasItem(wayBill.getId().intValue())))
            .andExpect(jsonPath("$.[*].boxLimit").value(hasItem(DEFAULT_BOX_LIMIT)))
            .andExpect(jsonPath("$.[*].shipmentType").value(hasItem(DEFAULT_SHIPMENT_TYPE)))
            .andExpect(jsonPath("$.[*].opfac").value(hasItem(DEFAULT_OPFAC)))
            .andExpect(jsonPath("$.[*].deliveryAgent").value(hasItem(DEFAULT_DELIVERY_AGENT)))
            .andExpect(jsonPath("$.[*].estimatedReadyDate").value(hasItem(DEFAULT_ESTIMATED_READY_DATE.toString())))
            .andExpect(jsonPath("$.[*].currencyUom").value(hasItem(DEFAULT_CURRENCY_UOM)))
            .andExpect(jsonPath("$.[*].estimatedShipDate").value(hasItem(DEFAULT_ESTIMATED_SHIP_DATE.toString())))
            .andExpect(jsonPath("$.[*].status").value(hasItem(DEFAULT_STATUS)))
            .andExpect(jsonPath("$.[*].referenceNumber").value(hasItem(DEFAULT_REFERENCE_NUMBER)));
    }

    @Test
    @Transactional
    void getWayBill() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get the wayBill
        restWayBillMockMvc
            .perform(get(ENTITY_API_URL_ID, wayBill.getId()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.id").value(wayBill.getId().intValue()))
            .andExpect(jsonPath("$.boxLimit").value(DEFAULT_BOX_LIMIT))
            .andExpect(jsonPath("$.shipmentType").value(DEFAULT_SHIPMENT_TYPE))
            .andExpect(jsonPath("$.opfac").value(DEFAULT_OPFAC))
            .andExpect(jsonPath("$.deliveryAgent").value(DEFAULT_DELIVERY_AGENT))
            .andExpect(jsonPath("$.estimatedReadyDate").value(DEFAULT_ESTIMATED_READY_DATE.toString()))
            .andExpect(jsonPath("$.currencyUom").value(DEFAULT_CURRENCY_UOM))
            .andExpect(jsonPath("$.estimatedShipDate").value(DEFAULT_ESTIMATED_SHIP_DATE.toString()))
            .andExpect(jsonPath("$.status").value(DEFAULT_STATUS))
            .andExpect(jsonPath("$.referenceNumber").value(DEFAULT_REFERENCE_NUMBER));
    }

    @Test
    @Transactional
    void getNonExistingWayBill() throws Exception {
        // Get the wayBill
        restWayBillMockMvc.perform(get(ENTITY_API_URL_ID, Long.MAX_VALUE)).andExpect(status().isNotFound());
    }

    @Test
    @Transactional
    void putExistingWayBill() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        long databaseSizeBeforeUpdate = getRepositoryCount();

        // Update the wayBill
        WayBill updatedWayBill = wayBillRepository.findById(wayBill.getId()).orElseThrow();
        // Disconnect from session so that the updates on updatedWayBill are not directly saved in db
        em.detach(updatedWayBill);
        updatedWayBill
            .boxLimit(UPDATED_BOX_LIMIT)
            .shipmentType(UPDATED_SHIPMENT_TYPE)
            .opfac(UPDATED_OPFAC)
            .deliveryAgent(UPDATED_DELIVERY_AGENT)
            .estimatedReadyDate(UPDATED_ESTIMATED_READY_DATE)
            .currencyUom(UPDATED_CURRENCY_UOM)
            .estimatedShipDate(UPDATED_ESTIMATED_SHIP_DATE)
            .status(UPDATED_STATUS)
            .referenceNumber(UPDATED_REFERENCE_NUMBER);

        restWayBillMockMvc
            .perform(
                put(ENTITY_API_URL_ID, updatedWayBill.getId())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(om.writeValueAsBytes(updatedWayBill))
            )
            .andExpect(status().isOk());

        // Validate the WayBill in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
        assertPersistedWayBillToMatchAllProperties(updatedWayBill);
    }

    @Test
    @Transactional
    void putNonExistingWayBill() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        wayBill.setId(longCount.incrementAndGet());

        // If the entity doesn't have an ID, it will throw BadRequestAlertException
        restWayBillMockMvc
            .perform(put(ENTITY_API_URL_ID, wayBill.getId()).contentType(MediaType.APPLICATION_JSON).content(om.writeValueAsBytes(wayBill)))
            .andExpect(status().isBadRequest());

        // Validate the WayBill in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void putWithIdMismatchWayBill() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        wayBill.setId(longCount.incrementAndGet());

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restWayBillMockMvc
            .perform(
                put(ENTITY_API_URL_ID, longCount.incrementAndGet())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(om.writeValueAsBytes(wayBill))
            )
            .andExpect(status().isBadRequest());

        // Validate the WayBill in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void putWithMissingIdPathParamWayBill() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        wayBill.setId(longCount.incrementAndGet());

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restWayBillMockMvc
            .perform(put(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(om.writeValueAsBytes(wayBill)))
            .andExpect(status().isMethodNotAllowed());

        // Validate the WayBill in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void partialUpdateWayBillWithPatch() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        long databaseSizeBeforeUpdate = getRepositoryCount();

        // Update the wayBill using partial update
        WayBill partialUpdatedWayBill = new WayBill();
        partialUpdatedWayBill.setId(wayBill.getId());

        partialUpdatedWayBill.opfac(UPDATED_OPFAC).status(UPDATED_STATUS);

        restWayBillMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, partialUpdatedWayBill.getId())
                    .contentType("application/merge-patch+json")
                    .content(om.writeValueAsBytes(partialUpdatedWayBill))
            )
            .andExpect(status().isOk());

        // Validate the WayBill in the database

        assertSameRepositoryCount(databaseSizeBeforeUpdate);
        assertWayBillUpdatableFieldsEquals(createUpdateProxyForBean(partialUpdatedWayBill, wayBill), getPersistedWayBill(wayBill));
    }

    @Test
    @Transactional
    void fullUpdateWayBillWithPatch() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        long databaseSizeBeforeUpdate = getRepositoryCount();

        // Update the wayBill using partial update
        WayBill partialUpdatedWayBill = new WayBill();
        partialUpdatedWayBill.setId(wayBill.getId());

        partialUpdatedWayBill
            .boxLimit(UPDATED_BOX_LIMIT)
            .shipmentType(UPDATED_SHIPMENT_TYPE)
            .opfac(UPDATED_OPFAC)
            .deliveryAgent(UPDATED_DELIVERY_AGENT)
            .estimatedReadyDate(UPDATED_ESTIMATED_READY_DATE)
            .currencyUom(UPDATED_CURRENCY_UOM)
            .estimatedShipDate(UPDATED_ESTIMATED_SHIP_DATE)
            .status(UPDATED_STATUS)
            .referenceNumber(UPDATED_REFERENCE_NUMBER);

        restWayBillMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, partialUpdatedWayBill.getId())
                    .contentType("application/merge-patch+json")
                    .content(om.writeValueAsBytes(partialUpdatedWayBill))
            )
            .andExpect(status().isOk());

        // Validate the WayBill in the database

        assertSameRepositoryCount(databaseSizeBeforeUpdate);
        assertWayBillUpdatableFieldsEquals(partialUpdatedWayBill, getPersistedWayBill(partialUpdatedWayBill));
    }

    @Test
    @Transactional
    void patchNonExistingWayBill() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        wayBill.setId(longCount.incrementAndGet());

        // If the entity doesn't have an ID, it will throw BadRequestAlertException
        restWayBillMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, wayBill.getId()).contentType("application/merge-patch+json").content(om.writeValueAsBytes(wayBill))
            )
            .andExpect(status().isBadRequest());

        // Validate the WayBill in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void patchWithIdMismatchWayBill() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        wayBill.setId(longCount.incrementAndGet());

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restWayBillMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, longCount.incrementAndGet())
                    .contentType("application/merge-patch+json")
                    .content(om.writeValueAsBytes(wayBill))
            )
            .andExpect(status().isBadRequest());

        // Validate the WayBill in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void patchWithMissingIdPathParamWayBill() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        wayBill.setId(longCount.incrementAndGet());

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restWayBillMockMvc
            .perform(patch(ENTITY_API_URL).contentType("application/merge-patch+json").content(om.writeValueAsBytes(wayBill)))
            .andExpect(status().isMethodNotAllowed());

        // Validate the WayBill in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void deleteWayBill() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        long databaseSizeBeforeDelete = getRepositoryCount();

        // Delete the wayBill
        restWayBillMockMvc
            .perform(delete(ENTITY_API_URL_ID, wayBill.getId()).accept(MediaType.APPLICATION_JSON))
            .andExpect(status().isNoContent());

        // Validate the database contains one less item
        assertDecrementedRepositoryCount(databaseSizeBeforeDelete);
    }

    protected long getRepositoryCount() {
        return wayBillRepository.count();
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

    protected WayBill getPersistedWayBill(WayBill wayBill) {
        return wayBillRepository.findById(wayBill.getId()).orElseThrow();
    }

    protected void assertPersistedWayBillToMatchAllProperties(WayBill expectedWayBill) {
        assertWayBillAllPropertiesEquals(expectedWayBill, getPersistedWayBill(expectedWayBill));
    }

    protected void assertPersistedWayBillToMatchUpdatableProperties(WayBill expectedWayBill) {
        assertWayBillAllUpdatablePropertiesEquals(expectedWayBill, getPersistedWayBill(expectedWayBill));
    }
}
