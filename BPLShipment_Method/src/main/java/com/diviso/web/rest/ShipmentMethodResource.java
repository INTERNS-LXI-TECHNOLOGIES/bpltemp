package com.diviso.web.rest;

import com.diviso.repository.ShipmentMethodRepository;
import com.diviso.service.ShipmentMethodService;
import com.diviso.service.dto.ShipmentMethodDTO;
import com.diviso.web.rest.errors.BadRequestAlertException;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Objects;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.util.ForwardedHeaderUtils;
import reactor.core.publisher.Mono;
import tech.jhipster.web.util.HeaderUtil;
import tech.jhipster.web.util.PaginationUtil;
import tech.jhipster.web.util.reactive.ResponseUtil;

/**
 * REST controller for managing {@link com.diviso.domain.ShipmentMethod}.
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
    public Mono<ResponseEntity<ShipmentMethodDTO>> createShipmentMethod(@Valid @RequestBody ShipmentMethodDTO shipmentMethodDTO)
        throws URISyntaxException {
        LOG.debug("REST request to save ShipmentMethod : {}", shipmentMethodDTO);
        if (shipmentMethodDTO.getId() != null) {
            throw new BadRequestAlertException("A new shipmentMethod cannot already have an ID", ENTITY_NAME, "idexists");
        }
        return shipmentMethodService
            .save(shipmentMethodDTO)
            .map(result -> {
                try {
                    return ResponseEntity.created(new URI("/api/shipment-methods/" + result.getId()))
                        .headers(HeaderUtil.createEntityCreationAlert(applicationName, true, ENTITY_NAME, result.getId().toString()))
                        .body(result);
                } catch (URISyntaxException e) {
                    throw new RuntimeException(e);
                }
            });
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
    public Mono<ResponseEntity<ShipmentMethodDTO>> updateShipmentMethod(
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

        return shipmentMethodRepository
            .existsById(id)
            .flatMap(exists -> {
                if (!exists) {
                    return Mono.error(new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound"));
                }

                return shipmentMethodService
                    .update(shipmentMethodDTO)
                    .switchIfEmpty(Mono.error(new ResponseStatusException(HttpStatus.NOT_FOUND)))
                    .map(result ->
                        ResponseEntity.ok()
                            .headers(HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, result.getId().toString()))
                            .body(result)
                    );
            });
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
    public Mono<ResponseEntity<ShipmentMethodDTO>> partialUpdateShipmentMethod(
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

        return shipmentMethodRepository
            .existsById(id)
            .flatMap(exists -> {
                if (!exists) {
                    return Mono.error(new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound"));
                }

                Mono<ShipmentMethodDTO> result = shipmentMethodService.partialUpdate(shipmentMethodDTO);

                return result
                    .switchIfEmpty(Mono.error(new ResponseStatusException(HttpStatus.NOT_FOUND)))
                    .map(res ->
                        ResponseEntity.ok()
                            .headers(HeaderUtil.createEntityUpdateAlert(applicationName, true, ENTITY_NAME, res.getId().toString()))
                            .body(res)
                    );
            });
    }

    /**
     * {@code GET  /shipment-methods} : get all the shipmentMethods.
     *
     * @param pageable the pagination information.
     * @param request a {@link ServerHttpRequest} request.
     * @param eagerload flag to eager load entities from relationships (This is applicable for many-to-many).
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and the list of shipmentMethods in body.
     */
    @GetMapping(value = "", produces = MediaType.APPLICATION_JSON_VALUE)
    public Mono<ResponseEntity<List<ShipmentMethodDTO>>> getAllShipmentMethods(
        @org.springdoc.core.annotations.ParameterObject Pageable pageable,
        ServerHttpRequest request,
        @RequestParam(name = "eagerload", required = false, defaultValue = "true") boolean eagerload
    ) {
        LOG.debug("REST request to get a page of ShipmentMethods");
        return shipmentMethodService
            .countAll()
            .zipWith(shipmentMethodService.findAll(pageable).collectList())
            .map(countWithEntities ->
                ResponseEntity.ok()
                    .headers(
                        PaginationUtil.generatePaginationHttpHeaders(
                            ForwardedHeaderUtils.adaptFromForwardedHeaders(request.getURI(), request.getHeaders()),
                            new PageImpl<>(countWithEntities.getT2(), pageable, countWithEntities.getT1())
                        )
                    )
                    .body(countWithEntities.getT2())
            );
    }

    /**
     * {@code GET  /shipment-methods/:id} : get the "id" shipmentMethod.
     *
     * @param id the id of the shipmentMethodDTO to retrieve.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the shipmentMethodDTO, or with status {@code 404 (Not Found)}.
     */
    @GetMapping("/{id}")
    public Mono<ResponseEntity<ShipmentMethodDTO>> getShipmentMethod(@PathVariable("id") Long id) {
        LOG.debug("REST request to get ShipmentMethod : {}", id);
        Mono<ShipmentMethodDTO> shipmentMethodDTO = shipmentMethodService.findOne(id);
        return ResponseUtil.wrapOrNotFound(shipmentMethodDTO);
    }

    /**
     * {@code DELETE  /shipment-methods/:id} : delete the "id" shipmentMethod.
     *
     * @param id the id of the shipmentMethodDTO to delete.
     * @return the {@link ResponseEntity} with status {@code 204 (NO_CONTENT)}.
     */
    @DeleteMapping("/{id}")
    public Mono<ResponseEntity<Void>> deleteShipmentMethod(@PathVariable("id") Long id) {
        LOG.debug("REST request to delete ShipmentMethod : {}", id);
        return shipmentMethodService
            .delete(id)
            .then(
                Mono.just(
                    ResponseEntity.noContent()
                        .headers(HeaderUtil.createEntityDeletionAlert(applicationName, true, ENTITY_NAME, id.toString()))
                        .build()
                )
            );
    }
}
