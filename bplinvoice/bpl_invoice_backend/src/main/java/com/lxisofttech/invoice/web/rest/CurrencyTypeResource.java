package com.lxisofttech.invoice.web.rest;

import com.lxisofttech.invoice.domain.CurrencyType;
import com.lxisofttech.invoice.repository.CurrencyTypeRepository;
import com.lxisofttech.invoice.web.rest.errors.BadRequestAlertException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.StreamSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import tech.jhipster.web.util.HeaderUtil;
import tech.jhipster.web.util.ResponseUtil;

/**
 * REST controller for managing {@link com.lxisofttech.invoice.domain.CurrencyType}.
 */
@RestController
@RequestMapping("/api/currency-types")
@Transactional
public class CurrencyTypeResource {

    private static final Logger LOG = LoggerFactory.getLogger(CurrencyTypeResource.class);

    private static final String ENTITY_NAME = "currencyType";

    @Value("${jhipster.clientApp.name}")
    private String applicationName;

    private final CurrencyTypeRepository currencyTypeRepository;

    public CurrencyTypeResource(CurrencyTypeRepository currencyTypeRepository) {
        this.currencyTypeRepository = currencyTypeRepository;
    }

    /**
     * {@code POST  /currency-types} : Create a new currencyType.
     *
     * @param currencyType the currencyType to create.
     * @return the {@link ResponseEntity} with status {@code 201 (Created)} and with body the new currencyType, or with status {@code 400 (Bad Request)} if the currencyType has already an ID.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PostMapping("")
    public ResponseEntity<CurrencyType> createCurrencyType(@RequestBody CurrencyType currencyType) throws URISyntaxException {
        LOG.debug("REST request to save CurrencyType : {}", currencyType);
        if (currencyType.getId() != null) {
            throw new BadRequestAlertException("A new currencyType cannot already have an ID", ENTITY_NAME, "idexists");
        }
        currencyType = currencyTypeRepository.save(currencyType);
        return ResponseEntity.created(new URI("/api/currency-types/" + currencyType.getId()))
            .headers(HeaderUtil.createEntityCreationAlert(applicationName, true, ENTITY_NAME, currencyType.getId().toString()))
            .body(currencyType);
    }

    /**
     * {@code PUT  /currency-types/:id} : Updates an existing currencyType.
     *
     * @param id the id of the currencyType to save.
     * @param currencyType the currencyType to update.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the updated currencyType,
     * or with status {@code 400 (Bad Request)} if the currencyType is not valid,
     * or with status {@code 500 (Internal Server Error)} if the currencyType couldn't be updated.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PutMapping("/{id}")
    public ResponseEntity<CurrencyType> updateCurrencyType(
        @PathVariable(value = "id", required = false) final Long id,
        @RequestBody CurrencyType currencyType
    ) throws URISyntaxException {
        LOG.debug("REST request to update CurrencyType : {}, {}", id, currencyType);
        if (currencyType.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, currencyType.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!currencyTypeRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        currencyType = currencyTypeRepository.save(currencyType);
        return ResponseEntity.ok()
            .headers(HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, currencyType.getId().toString()))
            .body(currencyType);
    }

    /**
     * {@code PATCH  /currency-types/:id} : Partial updates given fields of an existing currencyType, field will ignore if it is null
     *
     * @param id the id of the currencyType to save.
     * @param currencyType the currencyType to update.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the updated currencyType,
     * or with status {@code 400 (Bad Request)} if the currencyType is not valid,
     * or with status {@code 404 (Not Found)} if the currencyType is not found,
     * or with status {@code 500 (Internal Server Error)} if the currencyType couldn't be updated.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PatchMapping(value = "/{id}", consumes = { "application/json", "application/merge-patch+json" })
    public ResponseEntity<CurrencyType> partialUpdateCurrencyType(
        @PathVariable(value = "id", required = false) final Long id,
        @RequestBody CurrencyType currencyType
    ) throws URISyntaxException {
        LOG.debug("REST request to partial update CurrencyType partially : {}, {}", id, currencyType);
        if (currencyType.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, currencyType.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!currencyTypeRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        Optional<CurrencyType> result = currencyTypeRepository
            .findById(currencyType.getId())
            .map(existingCurrencyType -> {
                if (currencyType.getName() != null) {
                    existingCurrencyType.setName(currencyType.getName());
                }

                return existingCurrencyType;
            })
            .map(currencyTypeRepository::save);

        return ResponseUtil.wrapOrNotFound(
            result,
            HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, currencyType.getId().toString())
        );
    }

    /**
     * {@code GET  /currency-types} : get all the currencyTypes.
     *
     * @param filter the filter of the request.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and the list of currencyTypes in body.
     */
    @GetMapping("")
    public List<CurrencyType> getAllCurrencyTypes(@RequestParam(name = "filter", required = false) String filter) {
        if ("waybill-is-null".equals(filter)) {
            LOG.debug("REST request to get all CurrencyTypes where wayBill is null");
            return StreamSupport.stream(currencyTypeRepository.findAll().spliterator(), false)
                .filter(currencyType -> currencyType.getWayBill() == null)
                .toList();
        }
        LOG.debug("REST request to get all CurrencyTypes");
        return currencyTypeRepository.findAll();
    }

    /**
     * {@code GET  /currency-types/:id} : get the "id" currencyType.
     *
     * @param id the id of the currencyType to retrieve.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the currencyType, or with status {@code 404 (Not Found)}.
     */
    @GetMapping("/{id}")
    public ResponseEntity<CurrencyType> getCurrencyType(@PathVariable("id") Long id) {
        LOG.debug("REST request to get CurrencyType : {}", id);
        Optional<CurrencyType> currencyType = currencyTypeRepository.findById(id);
        return ResponseUtil.wrapOrNotFound(currencyType);
    }

    /**
     * {@code DELETE  /currency-types/:id} : delete the "id" currencyType.
     *
     * @param id the id of the currencyType to delete.
     * @return the {@link ResponseEntity} with status {@code 204 (NO_CONTENT)}.
     */
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteCurrencyType(@PathVariable("id") Long id) {
        LOG.debug("REST request to delete CurrencyType : {}", id);
        currencyTypeRepository.deleteById(id);
        return ResponseEntity.noContent()
            .headers(HeaderUtil.createEntityDeletionAlert(applicationName, true, ENTITY_NAME, id.toString()))
            .build();
    }
}
