package com.lxisofttech.invoice.web.rest;

import com.lxisofttech.invoice.repository.CurrencyTypeRepository;
import com.lxisofttech.invoice.service.CurrencyTypeQueryService;
import com.lxisofttech.invoice.service.CurrencyTypeService;
import com.lxisofttech.invoice.service.criteria.CurrencyTypeCriteria;
import com.lxisofttech.invoice.service.dto.CurrencyTypeDTO;
import com.lxisofttech.invoice.web.rest.errors.BadRequestAlertException;
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
 * REST controller for managing {@link com.lxisofttech.invoice.domain.CurrencyType}.
 */
@RestController
@RequestMapping("/api/currency-types")
public class CurrencyTypeResource {

    private static final Logger LOG = LoggerFactory.getLogger(CurrencyTypeResource.class);

    private static final String ENTITY_NAME = "currencyType";

    @Value("${jhipster.clientApp.name}")
    private String applicationName;

    private final CurrencyTypeService currencyTypeService;

    private final CurrencyTypeRepository currencyTypeRepository;

    private final CurrencyTypeQueryService currencyTypeQueryService;

    public CurrencyTypeResource(
        CurrencyTypeService currencyTypeService,
        CurrencyTypeRepository currencyTypeRepository,
        CurrencyTypeQueryService currencyTypeQueryService
    ) {
        this.currencyTypeService = currencyTypeService;
        this.currencyTypeRepository = currencyTypeRepository;
        this.currencyTypeQueryService = currencyTypeQueryService;
    }

    /**
     * {@code POST  /currency-types} : Create a new currencyType.
     *
     * @param currencyTypeDTO the currencyTypeDTO to create.
     * @return the {@link ResponseEntity} with status {@code 201 (Created)} and with body the new currencyTypeDTO, or with status {@code 400 (Bad Request)} if the currencyType has already an ID.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PostMapping("")
    public ResponseEntity<CurrencyTypeDTO> createCurrencyType(@Valid @RequestBody CurrencyTypeDTO currencyTypeDTO)
        throws URISyntaxException {
        LOG.debug("REST request to save CurrencyType : {}", currencyTypeDTO);
        if (currencyTypeDTO.getId() != null) {
            throw new BadRequestAlertException("A new currencyType cannot already have an ID", ENTITY_NAME, "idexists");
        }
        currencyTypeDTO = currencyTypeService.save(currencyTypeDTO);
        return ResponseEntity.created(new URI("/api/currency-types/" + currencyTypeDTO.getId()))
            .headers(HeaderUtil.createEntityCreationAlert(applicationName, true, ENTITY_NAME, currencyTypeDTO.getId().toString()))
            .body(currencyTypeDTO);
    }

    /**
     * {@code PUT  /currency-types/:id} : Updates an existing currencyType.
     *
     * @param id the id of the currencyTypeDTO to save.
     * @param currencyTypeDTO the currencyTypeDTO to update.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the updated currencyTypeDTO,
     * or with status {@code 400 (Bad Request)} if the currencyTypeDTO is not valid,
     * or with status {@code 500 (Internal Server Error)} if the currencyTypeDTO couldn't be updated.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PutMapping("/{id}")
    public ResponseEntity<CurrencyTypeDTO> updateCurrencyType(
        @PathVariable(value = "id", required = false) final Long id,
        @Valid @RequestBody CurrencyTypeDTO currencyTypeDTO
    ) throws URISyntaxException {
        LOG.debug("REST request to update CurrencyType : {}, {}", id, currencyTypeDTO);
        if (currencyTypeDTO.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, currencyTypeDTO.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!currencyTypeRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        currencyTypeDTO = currencyTypeService.update(currencyTypeDTO);
        return ResponseEntity.ok()
            .headers(HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, currencyTypeDTO.getId().toString()))
            .body(currencyTypeDTO);
    }

    /**
     * {@code PATCH  /currency-types/:id} : Partial updates given fields of an existing currencyType, field will ignore if it is null
     *
     * @param id the id of the currencyTypeDTO to save.
     * @param currencyTypeDTO the currencyTypeDTO to update.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the updated currencyTypeDTO,
     * or with status {@code 400 (Bad Request)} if the currencyTypeDTO is not valid,
     * or with status {@code 404 (Not Found)} if the currencyTypeDTO is not found,
     * or with status {@code 500 (Internal Server Error)} if the currencyTypeDTO couldn't be updated.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PatchMapping(value = "/{id}", consumes = { "application/json", "application/merge-patch+json" })
    public ResponseEntity<CurrencyTypeDTO> partialUpdateCurrencyType(
        @PathVariable(value = "id", required = false) final Long id,
        @NotNull @RequestBody CurrencyTypeDTO currencyTypeDTO
    ) throws URISyntaxException {
        LOG.debug("REST request to partial update CurrencyType partially : {}, {}", id, currencyTypeDTO);
        if (currencyTypeDTO.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, currencyTypeDTO.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!currencyTypeRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        Optional<CurrencyTypeDTO> result = currencyTypeService.partialUpdate(currencyTypeDTO);

        return ResponseUtil.wrapOrNotFound(
            result,
            HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, currencyTypeDTO.getId().toString())
        );
    }

    /**
     * {@code GET  /currency-types} : get all the currencyTypes.
     *
     * @param pageable the pagination information.
     * @param criteria the criteria which the requested entities should match.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and the list of currencyTypes in body.
     */
    @GetMapping("")
    public ResponseEntity<List<CurrencyTypeDTO>> getAllCurrencyTypes(
        CurrencyTypeCriteria criteria,
        @org.springdoc.core.annotations.ParameterObject Pageable pageable
    ) {
        LOG.debug("REST request to get CurrencyTypes by criteria: {}", criteria);

        Page<CurrencyTypeDTO> page = currencyTypeQueryService.findByCriteria(criteria, pageable);
        HttpHeaders headers = PaginationUtil.generatePaginationHttpHeaders(ServletUriComponentsBuilder.fromCurrentRequest(), page);
        return ResponseEntity.ok().headers(headers).body(page.getContent());
    }

    /**
     * {@code GET  /currency-types/count} : count all the currencyTypes.
     *
     * @param criteria the criteria which the requested entities should match.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and the count in body.
     */
    @GetMapping("/count")
    public ResponseEntity<Long> countCurrencyTypes(CurrencyTypeCriteria criteria) {
        LOG.debug("REST request to count CurrencyTypes by criteria: {}", criteria);
        return ResponseEntity.ok().body(currencyTypeQueryService.countByCriteria(criteria));
    }

    /**
     * {@code GET  /currency-types/:id} : get the "id" currencyType.
     *
     * @param id the id of the currencyTypeDTO to retrieve.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the currencyTypeDTO, or with status {@code 404 (Not Found)}.
     */
    @GetMapping("/{id}")
    public ResponseEntity<CurrencyTypeDTO> getCurrencyType(@PathVariable("id") Long id) {
        LOG.debug("REST request to get CurrencyType : {}", id);
        Optional<CurrencyTypeDTO> currencyTypeDTO = currencyTypeService.findOne(id);
        return ResponseUtil.wrapOrNotFound(currencyTypeDTO);
    }

    /**
     * {@code DELETE  /currency-types/:id} : delete the "id" currencyType.
     *
     * @param id the id of the currencyTypeDTO to delete.
     * @return the {@link ResponseEntity} with status {@code 204 (NO_CONTENT)}.
     */
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteCurrencyType(@PathVariable("id") Long id) {
        LOG.debug("REST request to delete CurrencyType : {}", id);
        currencyTypeService.delete(id);
        return ResponseEntity.noContent()
            .headers(HeaderUtil.createEntityDeletionAlert(applicationName, true, ENTITY_NAME, id.toString()))
            .build();
    }
}
