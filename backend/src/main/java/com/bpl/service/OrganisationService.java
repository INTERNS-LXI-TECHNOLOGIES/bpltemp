package com.bpl.service;

import com.bpl.service.dto.OrganisationDTO;
import java.util.Optional;

/**
 * Service Interface for managing {@link com.bpl.domain.Organisation}.
 */
public interface OrganisationService {
    /**
     * Save a organisation.
     *
     * @param organisationDTO the entity to save.
     * @return the persisted entity.
     */
    OrganisationDTO save(OrganisationDTO organisationDTO);

    /**
     * Updates a organisation.
     *
     * @param organisationDTO the entity to update.
     * @return the persisted entity.
     */
    OrganisationDTO update(OrganisationDTO organisationDTO);

    /**
     * Partially updates a organisation.
     *
     * @param organisationDTO the entity to update partially.
     * @return the persisted entity.
     */
    Optional<OrganisationDTO> partialUpdate(OrganisationDTO organisationDTO);

    /**
     * Get the "id" organisation.
     *
     * @param id the id of the entity.
     * @return the entity.
     */
    Optional<OrganisationDTO> findOne(Long id);

    /**
     * Delete the "id" organisation.
     *
     * @param id the id of the entity.
     */
    void delete(Long id);
}
