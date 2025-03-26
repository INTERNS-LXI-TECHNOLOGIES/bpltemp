package com.bpl.web.rest;

import com.bpl.repository.ShipmentMethodRepository;
import com.bpl.service.ShipmentMethodService;
import com.bpl.service.dto.ShipmentMethodDTO;
import com.bpl.web.rest.errors.BadRequestAlertException;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;
import tech.jhipster.web.util.HeaderUtil;
import tech.jhipster.web.util.PaginationUtil;
import tech.jhipster.web.util.ResponseUtil;

/**
 * REST controller for managing {@link com.bpl.domain.ShipmentMethod}.
 */
@RestController
@RequestMapping("/api/shipment-methods")
public class ShipmentMethodResource {

    private static final Logger LOG = LoggerFactory.getLogger(ShipmentMethodResource.class);

    private static final String ENTITY_NAME = "shipmentMethod";

    @Value("${jhipster.clientApp.name}")
    private String applicationName;

    private final ShipmentMethodService shipmentMethodService;

    private final ShipmentMethodRepository shipmentMethodRepository;

    public ShipmentMethodResource(ShipmentMethodService shipmentMethodService, ShipmentMethodRepository shipmentMethodRepository) {
        this.shipmentMethodService = shipmentMethodService;
        this.shipmentMethodRepository = shipmentMethodRepository;
    }

    /**
     * {@code POST  /shipment-methods} : Create a new shipmentMethod.
     *
     * @param shipmentMethodDTO the shipmentMethodDTO to create.
     * @return the {@link ResponseEntity} with status {@code 201 (Created)} and with body the new shipmentMethodDTO, or with status {@code 400 (Bad Request)} if the shipmentMethod has already an ID.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PostMapping("")
    public ResponseEntity<ShipmentMethodDTO> createShipmentMethod(@Valid @RequestBody ShipmentMethodDTO shipmentMethodDTO)
        throws URISyntaxException {
        LOG.debug("REST request to save ShipmentMethod : {}", shipmentMethodDTO);
        if (shipmentMethodDTO.getId() != null) {
            throw new BadRequestAlertException("A new shipmentMethod cannot already have an ID", ENTITY_NAME, "idexists");
        }
        shipmentMethodDTO = shipmentMethodService.save(shipmentMethodDTO);
        return ResponseEntity.created(new URI("/api/shipment-methods/" + shipmentMethodDTO.getId()))
            .headers(HeaderUtil.createEntityCreationAlert(applicationName, true, ENTITY_NAME, shipmentMethodDTO.getId().toString()))
            .body(shipmentMethodDTO);
    }

    /**
     * {@code PUT  /shipment-methods/:id} : Updates an existing shipmentMethod.
     *
     * @param id the id of the shipmentMethodDTO to save.
     * @param shipmentMethodDTO the shipmentMethodDTO to update.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the updated shipmentMethodDTO,
     * or with status {@code 400 (Bad Request)} if the shipmentMethodDTO is not valid,
     * or with status {@code 500 (Internal Server Error)} if the shipmentMethodDTO couldn't be updated.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PutMapping("/{id}")
    public ResponseEntity<ShipmentMethodDTO> updateShipmentMethod(
        @PathVariable(value = "id", required = false) final Long id,
        @Valid @RequestBody ShipmentMethodDTO shipmentMethodDTO
    ) throws URISyntaxException {
        LOG.debug("REST request to update ShipmentMethod : {}, {}", id, shipmentMethodDTO);
        if (shipmentMethodDTO.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, shipmentMethodDTO.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!shipmentMethodRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        shipmentMethodDTO = shipmentMethodService.update(shipmentMethodDTO);
        return ResponseEntity.ok()
            .headers(HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, shipmentMethodDTO.getId().toString()))
            .body(shipmentMethodDTO);
    }

    /**
     * {@code PATCH  /shipment-methods/:id} : Partial updates given fields of an existing shipmentMethod, field will ignore if it is null
     *
     * @param id the id of the shipmentMethodDTO to save.
     * @param shipmentMethodDTO the shipmentMethodDTO to update.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the updated shipmentMethodDTO,
     * or with status {@code 400 (Bad Request)} if the shipmentMethodDTO is not valid,
     * or with status {@code 404 (Not Found)} if the shipmentMethodDTO is not found,
     * or with status {@code 500 (Internal Server Error)} if the shipmentMethodDTO couldn't be updated.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PatchMapping(value = "/{id}", consumes = { "application/json", "application/merge-patch+json" })
    public ResponseEntity<ShipmentMethodDTO> partialUpdateShipmentMethod(
        @PathVariable(value = "id", required = false) final Long id,
        @NotNull @RequestBody ShipmentMethodDTO shipmentMethodDTO
    ) throws URISyntaxException {
        LOG.debug("REST request to partial update ShipmentMethod partially : {}, {}", id, shipmentMethodDTO);
        if (shipmentMethodDTO.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, shipmentMethodDTO.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!shipmentMethodRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        Optional<ShipmentMethodDTO> result = shipmentMethodService.partialUpdate(shipmentMethodDTO);

        return ResponseUtil.wrapOrNotFound(
            result,
            HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, shipmentMethodDTO.getId().toString())
        );
    }

    /**
     * {@code GET  /shipment-methods} : get all the shipmentMethods.
     *
     * @param pageable the pagination information.
     * @param eagerload flag to eager load entities from relationships (This is applicable for many-to-many).
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and the list of shipmentMethods in body.
     */
    @GetMapping("")
    public ResponseEntity<List<ShipmentMethodDTO>> getAllShipmentMethods(
        @org.springdoc.core.annotations.ParameterObject Pageable pageable,
        @RequestParam(name = "eagerload", required = false, defaultValue = "true") boolean eagerload
    ) {
        LOG.debug("REST request to get a page of ShipmentMethods");
        Page<ShipmentMethodDTO> page;
        if (eagerload) {
            page = shipmentMethodService.findAllWithEagerRelationships(pageable);
        } else {
            page = shipmentMethodService.findAll(pageable);
        }
        HttpHeaders headers = PaginationUtil.generatePaginationHttpHeaders(ServletUriComponentsBuilder.fromCurrentRequest(), page);
        return ResponseEntity.ok().headers(headers).body(page.getContent());
    }

    /**
     * {@code GET  /shipment-methods/:id} : get the "id" shipmentMethod.
     *
     * @param id the id of the shipmentMethodDTO to retrieve.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the shipmentMethodDTO, or with status {@code 404 (Not Found)}.
     */
    @GetMapping("/{id}")
    public ResponseEntity<ShipmentMethodDTO> getShipmentMethod(@PathVariable("id") Long id) {
        LOG.debug("REST request to get ShipmentMethod : {}", id);
        Optional<ShipmentMethodDTO> shipmentMethodDTO = shipmentMethodService.findOne(id);
        return ResponseUtil.wrapOrNotFound(shipmentMethodDTO);
    }

    /**
     * {@code DELETE  /shipment-methods/:id} : delete the "id" shipmentMethod.
     *
     * @param id the id of the shipmentMethodDTO to delete.
     * @return the {@link ResponseEntity} with status {@code 204 (NO_CONTENT)}.
     */
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteShipmentMethod(@PathVariable("id") Long id) {
        LOG.debug("REST request to delete ShipmentMethod : {}", id);
        shipmentMethodService.delete(id);
        return ResponseEntity.noContent()
            .headers(HeaderUtil.createEntityDeletionAlert(applicationName, true, ENTITY_NAME, id.toString()))
            .build();
    }
}
