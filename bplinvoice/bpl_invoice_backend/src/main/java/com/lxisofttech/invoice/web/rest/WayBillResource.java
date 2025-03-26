package com.lxisofttech.invoice.web.rest;

import com.lxisofttech.invoice.domain.WayBill;
import com.lxisofttech.invoice.repository.WayBillRepository;
import com.lxisofttech.invoice.web.rest.errors.BadRequestAlertException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import tech.jhipster.web.util.HeaderUtil;
import tech.jhipster.web.util.ResponseUtil;

/**
 * REST controller for managing {@link com.lxisofttech.invoice.domain.WayBill}.
 */
@RestController
@RequestMapping("/api/way-bills")
@Transactional
public class WayBillResource {

    private static final Logger LOG = LoggerFactory.getLogger(WayBillResource.class);

    private static final String ENTITY_NAME = "wayBill";

    @Value("${jhipster.clientApp.name}")
    private String applicationName;

    private final WayBillRepository wayBillRepository;

    public WayBillResource(WayBillRepository wayBillRepository) {
        this.wayBillRepository = wayBillRepository;
    }

    /**
     * {@code POST  /way-bills} : Create a new wayBill.
     *
     * @param wayBill the wayBill to create.
     * @return the {@link ResponseEntity} with status {@code 201 (Created)} and with body the new wayBill, or with status {@code 400 (Bad Request)} if the wayBill has already an ID.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PostMapping("")
    public ResponseEntity<WayBill> createWayBill(@RequestBody WayBill wayBill) throws URISyntaxException {
        LOG.debug("REST request to save WayBill : {}", wayBill);
        if (wayBill.getId() != null) {
            throw new BadRequestAlertException("A new wayBill cannot already have an ID", ENTITY_NAME, "idexists");
        }
        wayBill = wayBillRepository.save(wayBill);
        return ResponseEntity.created(new URI("/api/way-bills/" + wayBill.getId()))
            .headers(HeaderUtil.createEntityCreationAlert(applicationName, true, ENTITY_NAME, wayBill.getId().toString()))
            .body(wayBill);
    }

    /**
     * {@code PUT  /way-bills/:id} : Updates an existing wayBill.
     *
     * @param id the id of the wayBill to save.
     * @param wayBill the wayBill to update.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the updated wayBill,
     * or with status {@code 400 (Bad Request)} if the wayBill is not valid,
     * or with status {@code 500 (Internal Server Error)} if the wayBill couldn't be updated.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PutMapping("/{id}")
    public ResponseEntity<WayBill> updateWayBill(@PathVariable(value = "id", required = false) final Long id, @RequestBody WayBill wayBill)
        throws URISyntaxException {
        LOG.debug("REST request to update WayBill : {}, {}", id, wayBill);
        if (wayBill.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, wayBill.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!wayBillRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        wayBill = wayBillRepository.save(wayBill);
        return ResponseEntity.ok()
            .headers(HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, wayBill.getId().toString()))
            .body(wayBill);
    }

    /**
     * {@code PATCH  /way-bills/:id} : Partial updates given fields of an existing wayBill, field will ignore if it is null
     *
     * @param id the id of the wayBill to save.
     * @param wayBill the wayBill to update.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the updated wayBill,
     * or with status {@code 400 (Bad Request)} if the wayBill is not valid,
     * or with status {@code 404 (Not Found)} if the wayBill is not found,
     * or with status {@code 500 (Internal Server Error)} if the wayBill couldn't be updated.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PatchMapping(value = "/{id}", consumes = { "application/json", "application/merge-patch+json" })
    public ResponseEntity<WayBill> partialUpdateWayBill(
        @PathVariable(value = "id", required = false) final Long id,
        @RequestBody WayBill wayBill
    ) throws URISyntaxException {
        LOG.debug("REST request to partial update WayBill partially : {}, {}", id, wayBill);
        if (wayBill.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, wayBill.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!wayBillRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        Optional<WayBill> result = wayBillRepository
            .findById(wayBill.getId())
            .map(existingWayBill -> {
                if (wayBill.getBoxLimit() != null) {
                    existingWayBill.setBoxLimit(wayBill.getBoxLimit());
                }
                if (wayBill.getShipmentType() != null) {
                    existingWayBill.setShipmentType(wayBill.getShipmentType());
                }
                if (wayBill.getOpfac() != null) {
                    existingWayBill.setOpfac(wayBill.getOpfac());
                }
                if (wayBill.getDeliveryAgent() != null) {
                    existingWayBill.setDeliveryAgent(wayBill.getDeliveryAgent());
                }
                if (wayBill.getEstimatedReadyDate() != null) {
                    existingWayBill.setEstimatedReadyDate(wayBill.getEstimatedReadyDate());
                }
                if (wayBill.getCurrencyUom() != null) {
                    existingWayBill.setCurrencyUom(wayBill.getCurrencyUom());
                }
                if (wayBill.getEstimatedShipDate() != null) {
                    existingWayBill.setEstimatedShipDate(wayBill.getEstimatedShipDate());
                }
                if (wayBill.getStatus() != null) {
                    existingWayBill.setStatus(wayBill.getStatus());
                }
                if (wayBill.getReferenceNumber() != null) {
                    existingWayBill.setReferenceNumber(wayBill.getReferenceNumber());
                }

                return existingWayBill;
            })
            .map(wayBillRepository::save);

        return ResponseUtil.wrapOrNotFound(
            result,
            HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, wayBill.getId().toString())
        );
    }

    /**
     * {@code GET  /way-bills} : get all the wayBills.
     *
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and the list of wayBills in body.
     */
    @GetMapping("")
    public List<WayBill> getAllWayBills() {
        LOG.debug("REST request to get all WayBills");
        return wayBillRepository.findAll();
    }

    /**
     * {@code GET  /way-bills/:id} : get the "id" wayBill.
     *
     * @param id the id of the wayBill to retrieve.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the wayBill, or with status {@code 404 (Not Found)}.
     */
    @GetMapping("/{id}")
    public ResponseEntity<WayBill> getWayBill(@PathVariable("id") Long id) {
        LOG.debug("REST request to get WayBill : {}", id);
        Optional<WayBill> wayBill = wayBillRepository.findById(id);
        return ResponseUtil.wrapOrNotFound(wayBill);
    }

    /**
     * {@code DELETE  /way-bills/:id} : delete the "id" wayBill.
     *
     * @param id the id of the wayBill to delete.
     * @return the {@link ResponseEntity} with status {@code 204 (NO_CONTENT)}.
     */
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteWayBill(@PathVariable("id") Long id) {
        LOG.debug("REST request to delete WayBill : {}", id);
        wayBillRepository.deleteById(id);
        return ResponseEntity.noContent()
            .headers(HeaderUtil.createEntityDeletionAlert(applicationName, true, ENTITY_NAME, id.toString()))
            .build();
    }
}
