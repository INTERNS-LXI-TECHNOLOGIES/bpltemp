package com.lxisoft.organizationbackend.web.rest;

import com.lxisoft.organizationbackend.domain.Parentorganization;
import com.lxisoft.organizationbackend.repository.ParentorganizationRepository;
import com.lxisoft.organizationbackend.web.rest.errors.BadRequestAlertException;
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
 * REST controller for managing {@link com.lxisoft.organizationbackend.domain.Parentorganization}.
 */
@RestController
@RequestMapping("/api/parentorganizations")
@Transactional
public class ParentorganizationResource {

    private static final Logger LOG = LoggerFactory.getLogger(ParentorganizationResource.class);

    private static final String ENTITY_NAME = "parentorganization";

    @Value("${jhipster.clientApp.name}")
    private String applicationName;

    private final ParentorganizationRepository parentorganizationRepository;

    public ParentorganizationResource(ParentorganizationRepository parentorganizationRepository) {
        this.parentorganizationRepository = parentorganizationRepository;
    }

    /**
     * {@code POST  /parentorganizations} : Create a new parentorganization.
     *
     * @param parentorganization the parentorganization to create.
     * @return the {@link ResponseEntity} with status {@code 201 (Created)} and with body the new parentorganization, or with status {@code 400 (Bad Request)} if the parentorganization has already an ID.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PostMapping("")
    public ResponseEntity<Parentorganization> createParentorganization(@RequestBody Parentorganization parentorganization)
        throws URISyntaxException {
        LOG.debug("REST request to save Parentorganization : {}", parentorganization);
        if (parentorganization.getId() != null) {
            throw new BadRequestAlertException("A new parentorganization cannot already have an ID", ENTITY_NAME, "idexists");
        }
        parentorganization = parentorganizationRepository.save(parentorganization);
        return ResponseEntity.created(new URI("/api/parentorganizations/" + parentorganization.getId()))
            .headers(HeaderUtil.createEntityCreationAlert(applicationName, true, ENTITY_NAME, parentorganization.getId().toString()))
            .body(parentorganization);
    }

    /**
     * {@code PUT  /parentorganizations/:id} : Updates an existing parentorganization.
     *
     * @param id the id of the parentorganization to save.
     * @param parentorganization the parentorganization to update.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the updated parentorganization,
     * or with status {@code 400 (Bad Request)} if the parentorganization is not valid,
     * or with status {@code 500 (Internal Server Error)} if the parentorganization couldn't be updated.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PutMapping("/{id}")
    public ResponseEntity<Parentorganization> updateParentorganization(
        @PathVariable(value = "id", required = false) final Long id,
        @RequestBody Parentorganization parentorganization
    ) throws URISyntaxException {
        LOG.debug("REST request to update Parentorganization : {}, {}", id, parentorganization);
        if (parentorganization.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, parentorganization.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!parentorganizationRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        parentorganization = parentorganizationRepository.save(parentorganization);
        return ResponseEntity.ok()
            .headers(HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, parentorganization.getId().toString()))
            .body(parentorganization);
    }

    /**
     * {@code PATCH  /parentorganizations/:id} : Partial updates given fields of an existing parentorganization, field will ignore if it is null
     *
     * @param id the id of the parentorganization to save.
     * @param parentorganization the parentorganization to update.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the updated parentorganization,
     * or with status {@code 400 (Bad Request)} if the parentorganization is not valid,
     * or with status {@code 404 (Not Found)} if the parentorganization is not found,
     * or with status {@code 500 (Internal Server Error)} if the parentorganization couldn't be updated.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PatchMapping(value = "/{id}", consumes = { "application/json", "application/merge-patch+json" })
    public ResponseEntity<Parentorganization> partialUpdateParentorganization(
        @PathVariable(value = "id", required = false) final Long id,
        @RequestBody Parentorganization parentorganization
    ) throws URISyntaxException {
        LOG.debug("REST request to partial update Parentorganization partially : {}, {}", id, parentorganization);
        if (parentorganization.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, parentorganization.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!parentorganizationRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        Optional<Parentorganization> result = parentorganizationRepository
            .findById(parentorganization.getId())
            .map(existingParentorganization -> {
                if (parentorganization.getName() != null) {
                    existingParentorganization.setName(parentorganization.getName());
                }
                if (parentorganization.getDescription() != null) {
                    existingParentorganization.setDescription(parentorganization.getDescription());
                }

                return existingParentorganization;
            })
            .map(parentorganizationRepository::save);

        return ResponseUtil.wrapOrNotFound(
            result,
            HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, parentorganization.getId().toString())
        );
    }

    /**
     * {@code GET  /parentorganizations} : get all the parentorganizations.
     *
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and the list of parentorganizations in body.
     */
    @GetMapping("")
    public List<Parentorganization> getAllParentorganizations() {
        LOG.debug("REST request to get all Parentorganizations");
        return parentorganizationRepository.findAll();
    }

    /**
     * {@code GET  /parentorganizations/:id} : get the "id" parentorganization.
     *
     * @param id the id of the parentorganization to retrieve.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the parentorganization, or with status {@code 404 (Not Found)}.
     */
    @GetMapping("/{id}")
    public ResponseEntity<Parentorganization> getParentorganization(@PathVariable("id") Long id) {
        LOG.debug("REST request to get Parentorganization : {}", id);
        Optional<Parentorganization> parentorganization = parentorganizationRepository.findById(id);
        return ResponseUtil.wrapOrNotFound(parentorganization);
    }

    /**
     * {@code DELETE  /parentorganizations/:id} : delete the "id" parentorganization.
     *
     * @param id the id of the parentorganization to delete.
     * @return the {@link ResponseEntity} with status {@code 204 (NO_CONTENT)}.
     */
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteParentorganization(@PathVariable("id") Long id) {
        LOG.debug("REST request to delete Parentorganization : {}", id);
        parentorganizationRepository.deleteById(id);
        return ResponseEntity.noContent()
            .headers(HeaderUtil.createEntityDeletionAlert(applicationName, true, ENTITY_NAME, id.toString()))
            .build();
    }
}
