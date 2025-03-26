package com.bpl.web.rest;

import com.bpl.repository.AgentTypeRepository;
import com.bpl.service.AgentTypeQueryService;
import com.bpl.service.AgentTypeService;
import com.bpl.service.criteria.AgentTypeCriteria;
import com.bpl.service.dto.AgentTypeDTO;
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
 * REST controller for managing {@link com.bpl.domain.AgentType}.
 */
@RestController
@RequestMapping("/api/agent-types")
public class AgentTypeResource {

    private static final Logger LOG = LoggerFactory.getLogger(AgentTypeResource.class);

    private static final String ENTITY_NAME = "agentType";

    @Value("${jhipster.clientApp.name}")
    private String applicationName;

    private final AgentTypeService agentTypeService;

    private final AgentTypeRepository agentTypeRepository;

    private final AgentTypeQueryService agentTypeQueryService;

    public AgentTypeResource(
        AgentTypeService agentTypeService,
        AgentTypeRepository agentTypeRepository,
        AgentTypeQueryService agentTypeQueryService
    ) {
        this.agentTypeService = agentTypeService;
        this.agentTypeRepository = agentTypeRepository;
        this.agentTypeQueryService = agentTypeQueryService;
    }

    /**
     * {@code POST  /agent-types} : Create a new agentType.
     *
     * @param agentTypeDTO the agentTypeDTO to create.
     * @return the {@link ResponseEntity} with status {@code 201 (Created)} and with body the new agentTypeDTO, or with status {@code 400 (Bad Request)} if the agentType has already an ID.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PostMapping("")
    public ResponseEntity<AgentTypeDTO> createAgentType(@Valid @RequestBody AgentTypeDTO agentTypeDTO) throws URISyntaxException {
        LOG.debug("REST request to save AgentType : {}", agentTypeDTO);
        if (agentTypeDTO.getId() != null) {
            throw new BadRequestAlertException("A new agentType cannot already have an ID", ENTITY_NAME, "idexists");
        }
        agentTypeDTO = agentTypeService.save(agentTypeDTO);
        return ResponseEntity.created(new URI("/api/agent-types/" + agentTypeDTO.getId()))
            .headers(HeaderUtil.createEntityCreationAlert(applicationName, true, ENTITY_NAME, agentTypeDTO.getId().toString()))
            .body(agentTypeDTO);
    }

    /**
     * {@code PUT  /agent-types/:id} : Updates an existing agentType.
     *
     * @param id the id of the agentTypeDTO to save.
     * @param agentTypeDTO the agentTypeDTO to update.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the updated agentTypeDTO,
     * or with status {@code 400 (Bad Request)} if the agentTypeDTO is not valid,
     * or with status {@code 500 (Internal Server Error)} if the agentTypeDTO couldn't be updated.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PutMapping("/{id}")
    public ResponseEntity<AgentTypeDTO> updateAgentType(
        @PathVariable(value = "id", required = false) final Long id,
        @Valid @RequestBody AgentTypeDTO agentTypeDTO
    ) throws URISyntaxException {
        LOG.debug("REST request to update AgentType : {}, {}", id, agentTypeDTO);
        if (agentTypeDTO.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, agentTypeDTO.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!agentTypeRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        agentTypeDTO = agentTypeService.update(agentTypeDTO);
        return ResponseEntity.ok()
            .headers(HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, agentTypeDTO.getId().toString()))
            .body(agentTypeDTO);
    }

    /**
     * {@code PATCH  /agent-types/:id} : Partial updates given fields of an existing agentType, field will ignore if it is null
     *
     * @param id the id of the agentTypeDTO to save.
     * @param agentTypeDTO the agentTypeDTO to update.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the updated agentTypeDTO,
     * or with status {@code 400 (Bad Request)} if the agentTypeDTO is not valid,
     * or with status {@code 404 (Not Found)} if the agentTypeDTO is not found,
     * or with status {@code 500 (Internal Server Error)} if the agentTypeDTO couldn't be updated.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PatchMapping(value = "/{id}", consumes = { "application/json", "application/merge-patch+json" })
    public ResponseEntity<AgentTypeDTO> partialUpdateAgentType(
        @PathVariable(value = "id", required = false) final Long id,
        @NotNull @RequestBody AgentTypeDTO agentTypeDTO
    ) throws URISyntaxException {
        LOG.debug("REST request to partial update AgentType partially : {}, {}", id, agentTypeDTO);
        if (agentTypeDTO.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, agentTypeDTO.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!agentTypeRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        Optional<AgentTypeDTO> result = agentTypeService.partialUpdate(agentTypeDTO);

        return ResponseUtil.wrapOrNotFound(
            result,
            HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, agentTypeDTO.getId().toString())
        );
    }

    /**
     * {@code GET  /agent-types} : get all the agentTypes.
     *
     * @param pageable the pagination information.
     * @param criteria the criteria which the requested entities should match.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and the list of agentTypes in body.
     */
    @GetMapping("")
    public ResponseEntity<List<AgentTypeDTO>> getAllAgentTypes(
        AgentTypeCriteria criteria,
        @org.springdoc.core.annotations.ParameterObject Pageable pageable
    ) {
        LOG.debug("REST request to get AgentTypes by criteria: {}", criteria);

        Page<AgentTypeDTO> page = agentTypeQueryService.findByCriteria(criteria, pageable);
        HttpHeaders headers = PaginationUtil.generatePaginationHttpHeaders(ServletUriComponentsBuilder.fromCurrentRequest(), page);
        return ResponseEntity.ok().headers(headers).body(page.getContent());
    }

    /**
     * {@code GET  /agent-types/count} : count all the agentTypes.
     *
     * @param criteria the criteria which the requested entities should match.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and the count in body.
     */
    @GetMapping("/count")
    public ResponseEntity<Long> countAgentTypes(AgentTypeCriteria criteria) {
        LOG.debug("REST request to count AgentTypes by criteria: {}", criteria);
        return ResponseEntity.ok().body(agentTypeQueryService.countByCriteria(criteria));
    }

    /**
     * {@code GET  /agent-types/:id} : get the "id" agentType.
     *
     * @param id the id of the agentTypeDTO to retrieve.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the agentTypeDTO, or with status {@code 404 (Not Found)}.
     */
    @GetMapping("/{id}")
    public ResponseEntity<AgentTypeDTO> getAgentType(@PathVariable("id") Long id) {
        LOG.debug("REST request to get AgentType : {}", id);
        Optional<AgentTypeDTO> agentTypeDTO = agentTypeService.findOne(id);
        return ResponseUtil.wrapOrNotFound(agentTypeDTO);
    }

    /**
     * {@code DELETE  /agent-types/:id} : delete the "id" agentType.
     *
     * @param id the id of the agentTypeDTO to delete.
     * @return the {@link ResponseEntity} with status {@code 204 (NO_CONTENT)}.
     */
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteAgentType(@PathVariable("id") Long id) {
        LOG.debug("REST request to delete AgentType : {}", id);
        agentTypeService.delete(id);
        return ResponseEntity.noContent()
            .headers(HeaderUtil.createEntityDeletionAlert(applicationName, true, ENTITY_NAME, id.toString()))
            .build();
    }
}
