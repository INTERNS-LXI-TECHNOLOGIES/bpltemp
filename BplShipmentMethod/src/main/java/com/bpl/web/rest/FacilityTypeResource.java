package com.bpl.web.rest;

import com.bpl.repository.FacilityTypeRepository;
import com.bpl.service.FacilityTypeService;
import com.bpl.service.dto.FacilityTypeDTO;
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
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import tech.jhipster.web.util.HeaderUtil;
import tech.jhipster.web.util.ResponseUtil;

/**
 * REST controller for managing {@link com.bpl.domain.FacilityType}.
 */
@RestController
@RequestMapping("/api/facility-types")
public class FacilityTypeResource {

    private static final Logger LOG = LoggerFactory.getLogger(FacilityTypeResource.class);

    private static final String ENTITY_NAME = "facilityType";

    @Value("${jhipster.clientApp.name}")
    private String applicationName;

    private final FacilityTypeService facilityTypeService;

    private final FacilityTypeRepository facilityTypeRepository;

    public FacilityTypeResource(FacilityTypeService facilityTypeService, FacilityTypeRepository facilityTypeRepository) {
        this.facilityTypeService = facilityTypeService;
        this.facilityTypeRepository = facilityTypeRepository;
    }

    /**
     * {@code POST  /facility-types} : Create a new facilityType.
     *
     * @param facilityTypeDTO the facilityTypeDTO to create.
     * @return the {@link ResponseEntity} with status {@code 201 (Created)} and with body the new facilityTypeDTO, or with status {@code 400 (Bad Request)} if the facilityType has already an ID.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PostMapping("")
    public ResponseEntity<FacilityTypeDTO> createFacilityType(@Valid @RequestBody FacilityTypeDTO facilityTypeDTO)
        throws URISyntaxException {
        LOG.debug("REST request to save FacilityType : {}", facilityTypeDTO);
        if (facilityTypeDTO.getId() != null) {
            throw new BadRequestAlertException("A new facilityType cannot already have an ID", ENTITY_NAME, "idexists");
        }
        facilityTypeDTO = facilityTypeService.save(facilityTypeDTO);
        return ResponseEntity.created(new URI("/api/facility-types/" + facilityTypeDTO.getId()))
            .headers(HeaderUtil.createEntityCreationAlert(applicationName, true, ENTITY_NAME, facilityTypeDTO.getId().toString()))
            .body(facilityTypeDTO);
    }

    /**
     * {@code PUT  /facility-types/:id} : Updates an existing facilityType.
     *
     * @param id the id of the facilityTypeDTO to save.
     * @param facilityTypeDTO the facilityTypeDTO to update.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the updated facilityTypeDTO,
     * or with status {@code 400 (Bad Request)} if the facilityTypeDTO is not valid,
     * or with status {@code 500 (Internal Server Error)} if the facilityTypeDTO couldn't be updated.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PutMapping("/{id}")
    public ResponseEntity<FacilityTypeDTO> updateFacilityType(
        @PathVariable(value = "id", required = false) final Long id,
        @Valid @RequestBody FacilityTypeDTO facilityTypeDTO
    ) throws URISyntaxException {
        LOG.debug("REST request to update FacilityType : {}, {}", id, facilityTypeDTO);
        if (facilityTypeDTO.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, facilityTypeDTO.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!facilityTypeRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        facilityTypeDTO = facilityTypeService.update(facilityTypeDTO);
        return ResponseEntity.ok()
            .headers(HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, facilityTypeDTO.getId().toString()))
            .body(facilityTypeDTO);
    }

    /**
     * {@code PATCH  /facility-types/:id} : Partial updates given fields of an existing facilityType, field will ignore if it is null
     *
     * @param id the id of the facilityTypeDTO to save.
     * @param facilityTypeDTO the facilityTypeDTO to update.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the updated facilityTypeDTO,
     * or with status {@code 400 (Bad Request)} if the facilityTypeDTO is not valid,
     * or with status {@code 404 (Not Found)} if the facilityTypeDTO is not found,
     * or with status {@code 500 (Internal Server Error)} if the facilityTypeDTO couldn't be updated.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PatchMapping(value = "/{id}", consumes = { "application/json", "application/merge-patch+json" })
    public ResponseEntity<FacilityTypeDTO> partialUpdateFacilityType(
        @PathVariable(value = "id", required = false) final Long id,
        @NotNull @RequestBody FacilityTypeDTO facilityTypeDTO
    ) throws URISyntaxException {
        LOG.debug("REST request to partial update FacilityType partially : {}, {}", id, facilityTypeDTO);
        if (facilityTypeDTO.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, facilityTypeDTO.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!facilityTypeRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        Optional<FacilityTypeDTO> result = facilityTypeService.partialUpdate(facilityTypeDTO);

        return ResponseUtil.wrapOrNotFound(
            result,
            HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, facilityTypeDTO.getId().toString())
        );
    }

    /**
     * {@code GET  /facility-types} : get all the facilityTypes.
     *
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and the list of facilityTypes in body.
     */
    @GetMapping("")
    public List<FacilityTypeDTO> getAllFacilityTypes() {
        LOG.debug("REST request to get all FacilityTypes");
        return facilityTypeService.findAll();
    }

    /**
     * {@code GET  /facility-types/:id} : get the "id" facilityType.
     *
     * @param id the id of the facilityTypeDTO to retrieve.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the facilityTypeDTO, or with status {@code 404 (Not Found)}.
     */
    @GetMapping("/{id}")
    public ResponseEntity<FacilityTypeDTO> getFacilityType(@PathVariable("id") Long id) {
        LOG.debug("REST request to get FacilityType : {}", id);
        Optional<FacilityTypeDTO> facilityTypeDTO = facilityTypeService.findOne(id);
        return ResponseUtil.wrapOrNotFound(facilityTypeDTO);
    }

    /**
     * {@code DELETE  /facility-types/:id} : delete the "id" facilityType.
     *
     * @param id the id of the facilityTypeDTO to delete.
     * @return the {@link ResponseEntity} with status {@code 204 (NO_CONTENT)}.
     */
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteFacilityType(@PathVariable("id") Long id) {
        LOG.debug("REST request to delete FacilityType : {}", id);
        facilityTypeService.delete(id);
        return ResponseEntity.noContent()
            .headers(HeaderUtil.createEntityDeletionAlert(applicationName, true, ENTITY_NAME, id.toString()))
            .build();
    }
}
