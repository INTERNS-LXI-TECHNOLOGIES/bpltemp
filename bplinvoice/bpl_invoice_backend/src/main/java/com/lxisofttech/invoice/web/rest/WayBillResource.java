package com.lxisofttech.invoice.web.rest;

import com.lxisofttech.invoice.domain.WayBill;
import com.lxisofttech.invoice.repository.WayBillRepository;
import com.lxisofttech.invoice.service.WayBillQueryService;
import com.lxisofttech.invoice.service.WayBillService;
import com.lxisofttech.invoice.service.criteria.WayBillCriteria;
import com.lxisofttech.invoice.service.dto.WayBillDTO;
import com.lxisofttech.invoice.web.rest.errors.BadRequestAlertException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

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
 * REST controller for managing {@link com.lxisofttech.invoice.domain.WayBill}.
 */
@RestController
@RequestMapping("/api/way-bills")
public class WayBillResource {

    private static final Logger LOG = LoggerFactory.getLogger(WayBillResource.class);

    private static final String ENTITY_NAME = "wayBill";

    @Value("${jhipster.clientApp.name}")
    private String applicationName;

    private final WayBillService wayBillService;
    private final WayBillRepository wayBillRepository;
    private final WayBillQueryService wayBillQueryService;

    public WayBillResource(WayBillService wayBillService, WayBillRepository wayBillRepository, WayBillQueryService wayBillQueryService) {
        this.wayBillService = wayBillService;
        this.wayBillRepository = wayBillRepository;
        this.wayBillQueryService = wayBillQueryService;
    }

    @PostMapping("")
    public ResponseEntity<WayBillDTO> createWayBill(@RequestBody WayBillDTO wayBillDTO) throws URISyntaxException {
        LOG.debug("REST request to save WayBill : {}", wayBillDTO);
        if (wayBillDTO.getId() != null) {
            throw new BadRequestAlertException("A new wayBill cannot already have an ID", ENTITY_NAME, "idexists");
        }
        wayBillDTO = wayBillService.save(wayBillDTO);
        return ResponseEntity.created(new URI("/api/way-bills/" + wayBillDTO.getId()))
            .headers(HeaderUtil.createEntityCreationAlert(applicationName, true, ENTITY_NAME, wayBillDTO.getId().toString()))
            .body(wayBillDTO);
    }

    @PutMapping("/{id}")
    public ResponseEntity<WayBillDTO> updateWayBill(
        @PathVariable(value = "id", required = false) final Long id,
        @RequestBody WayBillDTO wayBillDTO
    ) throws URISyntaxException {
        LOG.debug("REST request to update WayBill : {}, {}", id, wayBillDTO);
        if (wayBillDTO.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, wayBillDTO.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }
        if (!wayBillRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }
        wayBillDTO = wayBillService.update(wayBillDTO);
        return ResponseEntity.ok()
            .headers(HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, wayBillDTO.getId().toString()))
            .body(wayBillDTO);
    }

    @PatchMapping(value = "/{id}", consumes = { "application/json", "application/merge-patch+json" })
    public ResponseEntity<WayBillDTO> partialUpdateWayBill(
        @PathVariable(value = "id", required = false) final Long id,
        @RequestBody WayBillDTO wayBillDTO
    ) throws URISyntaxException {
        LOG.debug("REST request to partial update WayBill partially : {}, {}", id, wayBillDTO);
        if (wayBillDTO.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, wayBillDTO.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }
        if (!wayBillRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }
        Optional<WayBillDTO> result = wayBillService.partialUpdate(wayBillDTO);
        return ResponseUtil.wrapOrNotFound(
            result,
            HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, wayBillDTO.getId().toString())
        );
    }

    @GetMapping("")
    public ResponseEntity<List<WayBillDTO>> getAllWayBills(
        WayBillCriteria criteria,
        @org.springdoc.core.annotations.ParameterObject Pageable pageable
    ) {
        LOG.debug("REST request to get WayBills by criteria: {}", criteria);
        Page<WayBillDTO> page = wayBillQueryService.findByCriteria(criteria, pageable);
        HttpHeaders headers = PaginationUtil.generatePaginationHttpHeaders(ServletUriComponentsBuilder.fromCurrentRequest(), page);
        return ResponseEntity.ok().headers(headers).body(page.getContent());
    }

    @GetMapping("/count")
    public ResponseEntity<Long> countWayBills(WayBillCriteria criteria) {
        LOG.debug("REST request to count WayBills by criteria: {}", criteria);
        return ResponseEntity.ok().body(wayBillQueryService.countByCriteria(criteria));
    }

    @GetMapping("/{id}")
    public ResponseEntity<WayBillDTO> getWayBill(@PathVariable("id") Long id) {
        LOG.debug("REST request to get WayBill : {}", id);
        Optional<WayBillDTO> wayBillDTO = wayBillService.findOne(id);
        return ResponseUtil.wrapOrNotFound(wayBillDTO);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteWayBill(@PathVariable("id") Long id) {
        LOG.debug("REST request to delete WayBill : {}", id);
        wayBillService.delete(id);
        return ResponseEntity.noContent()
            .headers(HeaderUtil.createEntityDeletionAlert(applicationName, true, ENTITY_NAME, id.toString()))
            .build();
    }

    /**
     * GET  /by-currency-id/{currencyId} : get all waybill IDs by CurrencyType.
     */
    @GetMapping("/by-currency-id/{currencyId}")
    public ResponseEntity<List<Long>> getWayBillIdsByCurrency(@PathVariable Long currencyId) {
        List<Long> wayBillIds = wayBillRepository.findByCurrencyType_Id(currencyId)
            .stream()
            .map(WayBill::getId)
            .collect(Collectors.toList());
        return ResponseEntity.ok().body(wayBillIds);
    }

    @GetMapping("/waybills/by-currency/{currency}")
    public ResponseEntity<List<Long>> getWayBillIdsByCurrency(@PathVariable String currency) {
        List<Long> wayBillIds = wayBillService.getWayBillIdsByCurrency(currency);
        return ResponseEntity.ok(wayBillIds);
    }
    
    
}
