package com.lxisofttech.invoice.web.rest;

import static com.lxisofttech.invoice.domain.WayBillAsserts.*;
import static com.lxisofttech.invoice.web.rest.TestUtil.createUpdateProxyForBean;
import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.hasItem;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.lxisofttech.invoice.IntegrationTest;
import com.lxisofttech.invoice.domain.CurrencyType;
import com.lxisofttech.invoice.domain.WayBill;
import com.lxisofttech.invoice.repository.WayBillRepository;
import com.lxisofttech.invoice.service.dto.WayBillDTO;
import com.lxisofttech.invoice.service.mapper.WayBillMapper;
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
    private static final Integer SMALLER_BOX_LIMIT = 1 - 1;

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
    private WayBillMapper wayBillMapper;

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
        WayBillDTO wayBillDTO = wayBillMapper.toDto(wayBill);
        var returnedWayBillDTO = om.readValue(
            restWayBillMockMvc
                .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(om.writeValueAsBytes(wayBillDTO)))
                .andExpect(status().isCreated())
                .andReturn()
                .getResponse()
                .getContentAsString(),
            WayBillDTO.class
        );

        // Validate the WayBill in the database
        assertIncrementedRepositoryCount(databaseSizeBeforeCreate);
        var returnedWayBill = wayBillMapper.toEntity(returnedWayBillDTO);
        assertWayBillUpdatableFieldsEquals(returnedWayBill, getPersistedWayBill(returnedWayBill));

        insertedWayBill = returnedWayBill;
    }

    @Test
    @Transactional
    void createWayBillWithExistingId() throws Exception {
        // Create the WayBill with an existing ID
        wayBill.setId(1L);
        WayBillDTO wayBillDTO = wayBillMapper.toDto(wayBill);

        long databaseSizeBeforeCreate = getRepositoryCount();

        // An entity with an existing ID cannot be created, so this API call must fail
        restWayBillMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(om.writeValueAsBytes(wayBillDTO)))
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
    void getWayBillsByIdFiltering() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        Long id = wayBill.getId();

        defaultWayBillFiltering("id.equals=" + id, "id.notEquals=" + id);

        defaultWayBillFiltering("id.greaterThanOrEqual=" + id, "id.greaterThan=" + id);

        defaultWayBillFiltering("id.lessThanOrEqual=" + id, "id.lessThan=" + id);
    }

    @Test
    @Transactional
    void getAllWayBillsByBoxLimitIsEqualToSomething() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where boxLimit equals to
        defaultWayBillFiltering("boxLimit.equals=" + DEFAULT_BOX_LIMIT, "boxLimit.equals=" + UPDATED_BOX_LIMIT);
    }

    @Test
    @Transactional
    void getAllWayBillsByBoxLimitIsInShouldWork() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where boxLimit in
        defaultWayBillFiltering("boxLimit.in=" + DEFAULT_BOX_LIMIT + "," + UPDATED_BOX_LIMIT, "boxLimit.in=" + UPDATED_BOX_LIMIT);
    }

    @Test
    @Transactional
    void getAllWayBillsByBoxLimitIsNullOrNotNull() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where boxLimit is not null
        defaultWayBillFiltering("boxLimit.specified=true", "boxLimit.specified=false");
    }

    @Test
    @Transactional
    void getAllWayBillsByBoxLimitIsGreaterThanOrEqualToSomething() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where boxLimit is greater than or equal to
        defaultWayBillFiltering("boxLimit.greaterThanOrEqual=" + DEFAULT_BOX_LIMIT, "boxLimit.greaterThanOrEqual=" + UPDATED_BOX_LIMIT);
    }

    @Test
    @Transactional
    void getAllWayBillsByBoxLimitIsLessThanOrEqualToSomething() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where boxLimit is less than or equal to
        defaultWayBillFiltering("boxLimit.lessThanOrEqual=" + DEFAULT_BOX_LIMIT, "boxLimit.lessThanOrEqual=" + SMALLER_BOX_LIMIT);
    }

    @Test
    @Transactional
    void getAllWayBillsByBoxLimitIsLessThanSomething() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where boxLimit is less than
        defaultWayBillFiltering("boxLimit.lessThan=" + UPDATED_BOX_LIMIT, "boxLimit.lessThan=" + DEFAULT_BOX_LIMIT);
    }

    @Test
    @Transactional
    void getAllWayBillsByBoxLimitIsGreaterThanSomething() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where boxLimit is greater than
        defaultWayBillFiltering("boxLimit.greaterThan=" + SMALLER_BOX_LIMIT, "boxLimit.greaterThan=" + DEFAULT_BOX_LIMIT);
    }

    @Test
    @Transactional
    void getAllWayBillsByShipmentTypeIsEqualToSomething() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where shipmentType equals to
        defaultWayBillFiltering("shipmentType.equals=" + DEFAULT_SHIPMENT_TYPE, "shipmentType.equals=" + UPDATED_SHIPMENT_TYPE);
    }

    @Test
    @Transactional
    void getAllWayBillsByShipmentTypeIsInShouldWork() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where shipmentType in
        defaultWayBillFiltering(
            "shipmentType.in=" + DEFAULT_SHIPMENT_TYPE + "," + UPDATED_SHIPMENT_TYPE,
            "shipmentType.in=" + UPDATED_SHIPMENT_TYPE
        );
    }

    @Test
    @Transactional
    void getAllWayBillsByShipmentTypeIsNullOrNotNull() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where shipmentType is not null
        defaultWayBillFiltering("shipmentType.specified=true", "shipmentType.specified=false");
    }

    @Test
    @Transactional
    void getAllWayBillsByShipmentTypeContainsSomething() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where shipmentType contains
        defaultWayBillFiltering("shipmentType.contains=" + DEFAULT_SHIPMENT_TYPE, "shipmentType.contains=" + UPDATED_SHIPMENT_TYPE);
    }

    @Test
    @Transactional
    void getAllWayBillsByShipmentTypeNotContainsSomething() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where shipmentType does not contain
        defaultWayBillFiltering(
            "shipmentType.doesNotContain=" + UPDATED_SHIPMENT_TYPE,
            "shipmentType.doesNotContain=" + DEFAULT_SHIPMENT_TYPE
        );
    }

    @Test
    @Transactional
    void getAllWayBillsByOpfacIsEqualToSomething() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where opfac equals to
        defaultWayBillFiltering("opfac.equals=" + DEFAULT_OPFAC, "opfac.equals=" + UPDATED_OPFAC);
    }

    @Test
    @Transactional
    void getAllWayBillsByOpfacIsInShouldWork() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where opfac in
        defaultWayBillFiltering("opfac.in=" + DEFAULT_OPFAC + "," + UPDATED_OPFAC, "opfac.in=" + UPDATED_OPFAC);
    }

    @Test
    @Transactional
    void getAllWayBillsByOpfacIsNullOrNotNull() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where opfac is not null
        defaultWayBillFiltering("opfac.specified=true", "opfac.specified=false");
    }

    @Test
    @Transactional
    void getAllWayBillsByOpfacContainsSomething() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where opfac contains
        defaultWayBillFiltering("opfac.contains=" + DEFAULT_OPFAC, "opfac.contains=" + UPDATED_OPFAC);
    }

    @Test
    @Transactional
    void getAllWayBillsByOpfacNotContainsSomething() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where opfac does not contain
        defaultWayBillFiltering("opfac.doesNotContain=" + UPDATED_OPFAC, "opfac.doesNotContain=" + DEFAULT_OPFAC);
    }

    @Test
    @Transactional
    void getAllWayBillsByDeliveryAgentIsEqualToSomething() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where deliveryAgent equals to
        defaultWayBillFiltering("deliveryAgent.equals=" + DEFAULT_DELIVERY_AGENT, "deliveryAgent.equals=" + UPDATED_DELIVERY_AGENT);
    }

    @Test
    @Transactional
    void getAllWayBillsByDeliveryAgentIsInShouldWork() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where deliveryAgent in
        defaultWayBillFiltering(
            "deliveryAgent.in=" + DEFAULT_DELIVERY_AGENT + "," + UPDATED_DELIVERY_AGENT,
            "deliveryAgent.in=" + UPDATED_DELIVERY_AGENT
        );
    }

    @Test
    @Transactional
    void getAllWayBillsByDeliveryAgentIsNullOrNotNull() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where deliveryAgent is not null
        defaultWayBillFiltering("deliveryAgent.specified=true", "deliveryAgent.specified=false");
    }

    @Test
    @Transactional
    void getAllWayBillsByDeliveryAgentContainsSomething() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where deliveryAgent contains
        defaultWayBillFiltering("deliveryAgent.contains=" + DEFAULT_DELIVERY_AGENT, "deliveryAgent.contains=" + UPDATED_DELIVERY_AGENT);
    }

    @Test
    @Transactional
    void getAllWayBillsByDeliveryAgentNotContainsSomething() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where deliveryAgent does not contain
        defaultWayBillFiltering(
            "deliveryAgent.doesNotContain=" + UPDATED_DELIVERY_AGENT,
            "deliveryAgent.doesNotContain=" + DEFAULT_DELIVERY_AGENT
        );
    }

    @Test
    @Transactional
    void getAllWayBillsByEstimatedReadyDateIsEqualToSomething() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where estimatedReadyDate equals to
        defaultWayBillFiltering(
            "estimatedReadyDate.equals=" + DEFAULT_ESTIMATED_READY_DATE,
            "estimatedReadyDate.equals=" + UPDATED_ESTIMATED_READY_DATE
        );
    }

    @Test
    @Transactional
    void getAllWayBillsByEstimatedReadyDateIsInShouldWork() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where estimatedReadyDate in
        defaultWayBillFiltering(
            "estimatedReadyDate.in=" + DEFAULT_ESTIMATED_READY_DATE + "," + UPDATED_ESTIMATED_READY_DATE,
            "estimatedReadyDate.in=" + UPDATED_ESTIMATED_READY_DATE
        );
    }

    @Test
    @Transactional
    void getAllWayBillsByEstimatedReadyDateIsNullOrNotNull() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where estimatedReadyDate is not null
        defaultWayBillFiltering("estimatedReadyDate.specified=true", "estimatedReadyDate.specified=false");
    }

    @Test
    @Transactional
    void getAllWayBillsByCurrencyUomIsEqualToSomething() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where currencyUom equals to
        defaultWayBillFiltering("currencyUom.equals=" + DEFAULT_CURRENCY_UOM, "currencyUom.equals=" + UPDATED_CURRENCY_UOM);
    }

    @Test
    @Transactional
    void getAllWayBillsByCurrencyUomIsInShouldWork() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where currencyUom in
        defaultWayBillFiltering(
            "currencyUom.in=" + DEFAULT_CURRENCY_UOM + "," + UPDATED_CURRENCY_UOM,
            "currencyUom.in=" + UPDATED_CURRENCY_UOM
        );
    }

    @Test
    @Transactional
    void getAllWayBillsByCurrencyUomIsNullOrNotNull() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where currencyUom is not null
        defaultWayBillFiltering("currencyUom.specified=true", "currencyUom.specified=false");
    }

    @Test
    @Transactional
    void getAllWayBillsByCurrencyUomContainsSomething() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where currencyUom contains
        defaultWayBillFiltering("currencyUom.contains=" + DEFAULT_CURRENCY_UOM, "currencyUom.contains=" + UPDATED_CURRENCY_UOM);
    }

    @Test
    @Transactional
    void getAllWayBillsByCurrencyUomNotContainsSomething() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where currencyUom does not contain
        defaultWayBillFiltering("currencyUom.doesNotContain=" + UPDATED_CURRENCY_UOM, "currencyUom.doesNotContain=" + DEFAULT_CURRENCY_UOM);
    }

    @Test
    @Transactional
    void getAllWayBillsByEstimatedShipDateIsEqualToSomething() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where estimatedShipDate equals to
        defaultWayBillFiltering(
            "estimatedShipDate.equals=" + DEFAULT_ESTIMATED_SHIP_DATE,
            "estimatedShipDate.equals=" + UPDATED_ESTIMATED_SHIP_DATE
        );
    }

    @Test
    @Transactional
    void getAllWayBillsByEstimatedShipDateIsInShouldWork() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where estimatedShipDate in
        defaultWayBillFiltering(
            "estimatedShipDate.in=" + DEFAULT_ESTIMATED_SHIP_DATE + "," + UPDATED_ESTIMATED_SHIP_DATE,
            "estimatedShipDate.in=" + UPDATED_ESTIMATED_SHIP_DATE
        );
    }

    @Test
    @Transactional
    void getAllWayBillsByEstimatedShipDateIsNullOrNotNull() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where estimatedShipDate is not null
        defaultWayBillFiltering("estimatedShipDate.specified=true", "estimatedShipDate.specified=false");
    }

    @Test
    @Transactional
    void getAllWayBillsByStatusIsEqualToSomething() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where status equals to
        defaultWayBillFiltering("status.equals=" + DEFAULT_STATUS, "status.equals=" + UPDATED_STATUS);
    }

    @Test
    @Transactional
    void getAllWayBillsByStatusIsInShouldWork() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where status in
        defaultWayBillFiltering("status.in=" + DEFAULT_STATUS + "," + UPDATED_STATUS, "status.in=" + UPDATED_STATUS);
    }

    @Test
    @Transactional
    void getAllWayBillsByStatusIsNullOrNotNull() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where status is not null
        defaultWayBillFiltering("status.specified=true", "status.specified=false");
    }

    @Test
    @Transactional
    void getAllWayBillsByStatusContainsSomething() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where status contains
        defaultWayBillFiltering("status.contains=" + DEFAULT_STATUS, "status.contains=" + UPDATED_STATUS);
    }

    @Test
    @Transactional
    void getAllWayBillsByStatusNotContainsSomething() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where status does not contain
        defaultWayBillFiltering("status.doesNotContain=" + UPDATED_STATUS, "status.doesNotContain=" + DEFAULT_STATUS);
    }

    @Test
    @Transactional
    void getAllWayBillsByReferenceNumberIsEqualToSomething() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where referenceNumber equals to
        defaultWayBillFiltering("referenceNumber.equals=" + DEFAULT_REFERENCE_NUMBER, "referenceNumber.equals=" + UPDATED_REFERENCE_NUMBER);
    }

    @Test
    @Transactional
    void getAllWayBillsByReferenceNumberIsInShouldWork() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where referenceNumber in
        defaultWayBillFiltering(
            "referenceNumber.in=" + DEFAULT_REFERENCE_NUMBER + "," + UPDATED_REFERENCE_NUMBER,
            "referenceNumber.in=" + UPDATED_REFERENCE_NUMBER
        );
    }

    @Test
    @Transactional
    void getAllWayBillsByReferenceNumberIsNullOrNotNull() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where referenceNumber is not null
        defaultWayBillFiltering("referenceNumber.specified=true", "referenceNumber.specified=false");
    }

    @Test
    @Transactional
    void getAllWayBillsByReferenceNumberContainsSomething() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where referenceNumber contains
        defaultWayBillFiltering(
            "referenceNumber.contains=" + DEFAULT_REFERENCE_NUMBER,
            "referenceNumber.contains=" + UPDATED_REFERENCE_NUMBER
        );
    }

    @Test
    @Transactional
    void getAllWayBillsByReferenceNumberNotContainsSomething() throws Exception {
        // Initialize the database
        insertedWayBill = wayBillRepository.saveAndFlush(wayBill);

        // Get all the wayBillList where referenceNumber does not contain
        defaultWayBillFiltering(
            "referenceNumber.doesNotContain=" + UPDATED_REFERENCE_NUMBER,
            "referenceNumber.doesNotContain=" + DEFAULT_REFERENCE_NUMBER
        );
    }

    @Test
    @Transactional
    void getAllWayBillsByCurrencyTypeIsEqualToSomething() throws Exception {
        CurrencyType currencyType;
        if (TestUtil.findAll(em, CurrencyType.class).isEmpty()) {
            wayBillRepository.saveAndFlush(wayBill);
            currencyType = CurrencyTypeResourceIT.createEntity(em);
        } else {
            currencyType = TestUtil.findAll(em, CurrencyType.class).get(0);
        }
        em.persist(currencyType);
        em.flush();
        wayBill.setCurrencyType(currencyType);
        wayBillRepository.saveAndFlush(wayBill);
        Long currencyTypeId = currencyType.getId();
        // Get all the wayBillList where currencyType equals to currencyTypeId
        defaultWayBillShouldBeFound("currencyTypeId.equals=" + currencyTypeId);

        // Get all the wayBillList where currencyType equals to (currencyTypeId + 1)
        defaultWayBillShouldNotBeFound("currencyTypeId.equals=" + (currencyTypeId + 1));
    }

    private void defaultWayBillFiltering(String shouldBeFound, String shouldNotBeFound) throws Exception {
        defaultWayBillShouldBeFound(shouldBeFound);
        defaultWayBillShouldNotBeFound(shouldNotBeFound);
    }

    /**
     * Executes the search, and checks that the default entity is returned.
     */
    private void defaultWayBillShouldBeFound(String filter) throws Exception {
        restWayBillMockMvc
            .perform(get(ENTITY_API_URL + "?sort=id,desc&" + filter))
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

        // Check, that the count call also returns 1
        restWayBillMockMvc
            .perform(get(ENTITY_API_URL + "/count?sort=id,desc&" + filter))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(content().string("1"));
    }

    /**
     * Executes the search, and checks that the default entity is not returned.
     */
    private void defaultWayBillShouldNotBeFound(String filter) throws Exception {
        restWayBillMockMvc
            .perform(get(ENTITY_API_URL + "?sort=id,desc&" + filter))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$").isArray())
            .andExpect(jsonPath("$").isEmpty());

        // Check, that the count call also returns 0
        restWayBillMockMvc
            .perform(get(ENTITY_API_URL + "/count?sort=id,desc&" + filter))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(content().string("0"));
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
        WayBillDTO wayBillDTO = wayBillMapper.toDto(updatedWayBill);

        restWayBillMockMvc
            .perform(
                put(ENTITY_API_URL_ID, wayBillDTO.getId()).contentType(MediaType.APPLICATION_JSON).content(om.writeValueAsBytes(wayBillDTO))
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

        // Create the WayBill
        WayBillDTO wayBillDTO = wayBillMapper.toDto(wayBill);

        // If the entity doesn't have an ID, it will throw BadRequestAlertException
        restWayBillMockMvc
            .perform(
                put(ENTITY_API_URL_ID, wayBillDTO.getId()).contentType(MediaType.APPLICATION_JSON).content(om.writeValueAsBytes(wayBillDTO))
            )
            .andExpect(status().isBadRequest());

        // Validate the WayBill in the database
        assertSameRepositoryCount(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void putWithIdMismatchWayBill() throws Exception {
        long databaseSizeBeforeUpdate = getRepositoryCount();
        wayBill.setId(longCount.incrementAndGet());

        // Create the WayBill
        WayBillDTO wayBillDTO = wayBillMapper.toDto(wayBill);

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restWayBillMockMvc
            .perform(
                put(ENTITY_API_URL_ID, longCount.incrementAndGet())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(om.writeValueAsBytes(wayBillDTO))
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

        // Create the WayBill
        WayBillDTO wayBillDTO = wayBillMapper.toDto(wayBill);

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restWayBillMockMvc
            .perform(put(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(om.writeValueAsBytes(wayBillDTO)))
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

        // Create the WayBill
        WayBillDTO wayBillDTO = wayBillMapper.toDto(wayBill);

        // If the entity doesn't have an ID, it will throw BadRequestAlertException
        restWayBillMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, wayBillDTO.getId())
                    .contentType("application/merge-patch+json")
                    .content(om.writeValueAsBytes(wayBillDTO))
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

        // Create the WayBill
        WayBillDTO wayBillDTO = wayBillMapper.toDto(wayBill);

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restWayBillMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, longCount.incrementAndGet())
                    .contentType("application/merge-patch+json")
                    .content(om.writeValueAsBytes(wayBillDTO))
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

        // Create the WayBill
        WayBillDTO wayBillDTO = wayBillMapper.toDto(wayBill);

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restWayBillMockMvc
            .perform(patch(ENTITY_API_URL).contentType("application/merge-patch+json").content(om.writeValueAsBytes(wayBillDTO)))
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
