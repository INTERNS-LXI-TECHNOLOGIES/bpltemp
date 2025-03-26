package com.mycompany.organizationbackend.web.rest;

import com.mycompany.organizationbackend.domain.ParentOrganization;
import com.mycompany.organizationbackend.repository.ParentOrganizationRepository;
import com.mycompany.organizationbackend.web.rest.errors.BadRequestAlertException;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
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
 * REST controller for managing {@link com.mycompany.organizationbackend.domain.ParentOrganization}.
 */
@RestController
@RequestMapping("/api/parent-organizations")
@Transactional
public class ParentOrganizationResource {

    private static final Logger LOG = LoggerFactory.getLogger(ParentOrganizationResource.class);

    private static final String ENTITY_NAME = "parentOrganization";

    @Value("${jhipster.clientApp.name}")
    private String applicationName;

    private final ParentOrganizationRepository parentOrganizationRepository;

    public ParentOrganizationResource(ParentOrganizationRepository parentOrganizationRepository) {
        this.parentOrganizationRepository = parentOrganizationRepository;
    }

    /**
     * {@code POST  /parent-organizations} : Create a new parentOrganization.
     *
     * @param parentOrganization the parentOrganization to create.
     * @return the {@link ResponseEntity} with status {@code 201 (Created)} and with body the new parentOrganization, or with status {@code 400 (Bad Request)} if the parentOrganization has already an ID.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PostMapping("")
    public ResponseEntity<ParentOrganization> createParentOrganization(@Valid @RequestBody ParentOrganization parentOrganization)
        throws URISyntaxException {
        LOG.debug("REST request to save ParentOrganization : {}", parentOrganization);
        if (parentOrganization.getId() != null) {
            throw new BadRequestAlertException("A new parentOrganization cannot already have an ID", ENTITY_NAME, "idexists");
        }
        parentOrganization = parentOrganizationRepository.save(parentOrganization);
        return ResponseEntity.created(new URI("/api/parent-organizations/" + parentOrganization.getId()))
            .headers(HeaderUtil.createEntityCreationAlert(applicationName, true, ENTITY_NAME, parentOrganization.getId().toString()))
            .body(parentOrganization);
    }

    /**
     * {@code PUT  /parent-organizations/:id} : Updates an existing parentOrganization.
     *
     * @param id the id of the parentOrganization to save.
     * @param parentOrganization the parentOrganization to update.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the updated parentOrganization,
     * or with status {@code 400 (Bad Request)} if the parentOrganization is not valid,
     * or with status {@code 500 (Internal Server Error)} if the parentOrganization couldn't be updated.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PutMapping("/{id}")
    public ResponseEntity<ParentOrganization> updateParentOrganization(
        @PathVariable(value = "id", required = false) final Long id,
        @Valid @RequestBody ParentOrganization parentOrganization
    ) throws URISyntaxException {
        LOG.debug("REST request to update ParentOrganization : {}, {}", id, parentOrganization);
        if (parentOrganization.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, parentOrganization.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!parentOrganizationRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        parentOrganization = parentOrganizationRepository.save(parentOrganization);
        return ResponseEntity.ok()
            .headers(HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, parentOrganization.getId().toString()))
            .body(parentOrganization);
    }

    /**
     * {@code PATCH  /parent-organizations/:id} : Partial updates given fields of an existing parentOrganization, field will ignore if it is null
     *
     * @param id the id of the parentOrganization to save.
     * @param parentOrganization the parentOrganization to update.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the updated parentOrganization,
     * or with status {@code 400 (Bad Request)} if the parentOrganization is not valid,
     * or with status {@code 404 (Not Found)} if the parentOrganization is not found,
     * or with status {@code 500 (Internal Server Error)} if the parentOrganization couldn't be updated.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PatchMapping(value = "/{id}", consumes = { "application/json", "application/merge-patch+json" })
    public ResponseEntity<ParentOrganization> partialUpdateParentOrganization(
        @PathVariable(value = "id", required = false) final Long id,
        @NotNull @RequestBody ParentOrganization parentOrganization
    ) throws URISyntaxException {
        LOG.debug("REST request to partial update ParentOrganization partially : {}, {}", id, parentOrganization);
        if (parentOrganization.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, parentOrganization.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!parentOrganizationRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        Optional<ParentOrganization> result = parentOrganizationRepository
            .findById(parentOrganization.getId())
            .map(existingParentOrganization -> {
                if (parentOrganization.getName() != null) {
                    existingParentOrganization.setName(parentOrganization.getName());
                }

                return existingParentOrganization;
            })
            .map(parentOrganizationRepository::save);

        return ResponseUtil.wrapOrNotFound(
            result,
            HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, parentOrganization.getId().toString())
        );
    }

    /**
     * {@code GET  /parent-organizations} : get all the parentOrganizations.
     *
     * @param filter the filter of the request.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and the list of parentOrganizations in body.
     */
    @GetMapping("")
    public List<ParentOrganization> getAllParentOrganizations(@RequestParam(name = "filter", required = false) String filter) {
        if ("organization-is-null".equals(filter)) {
            LOG.debug("REST request to get all ParentOrganizations where organization is null");
            return StreamSupport.stream(parentOrganizationRepository.findAll().spliterator(), false)
                .filter(parentOrganization -> parentOrganization.getOrganization() == null)
                .toList();
        }
        LOG.debug("REST request to get all ParentOrganizations");
        return parentOrganizationRepository.findAll();
    }

    /**
     * {@code GET  /parent-organizations/:id} : get the "id" parentOrganization.
     *
     * @param id the id of the parentOrganization to retrieve.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the parentOrganization, or with status {@code 404 (Not Found)}.
     */
    @GetMapping("/{id}")
    public ResponseEntity<ParentOrganization> getParentOrganization(@PathVariable("id") Long id) {
        LOG.debug("REST request to get ParentOrganization : {}", id);
        Optional<ParentOrganization> parentOrganization = parentOrganizationRepository.findById(id);
        return ResponseUtil.wrapOrNotFound(parentOrganization);
    }

    /**
     * {@code DELETE  /parent-organizations/:id} : delete the "id" parentOrganization.
     *
     * @param id the id of the parentOrganization to delete.
     * @return the {@link ResponseEntity} with status {@code 204 (NO_CONTENT)}.
     */
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteParentOrganization(@PathVariable("id") Long id) {
        LOG.debug("REST request to delete ParentOrganization : {}", id);
        parentOrganizationRepository.deleteById(id);
        return ResponseEntity.noContent()
            .headers(HeaderUtil.createEntityDeletionAlert(applicationName, true, ENTITY_NAME, id.toString()))
            .build();
    }
}
