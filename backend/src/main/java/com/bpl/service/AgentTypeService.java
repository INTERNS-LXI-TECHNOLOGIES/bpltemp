package com.bpl.service;

import com.bpl.service.dto.AgentTypeDTO;
import java.util.Optional;

/**
 * Service Interface for managing {@link com.bpl.domain.AgentType}.
 */
public interface AgentTypeService {
    /**
     * Save a agentType.
     *
     * @param agentTypeDTO the entity to save.
     * @return the persisted entity.
     */
    AgentTypeDTO save(AgentTypeDTO agentTypeDTO);

    /**
     * Updates a agentType.
     *
     * @param agentTypeDTO the entity to update.
     * @return the persisted entity.
     */
    AgentTypeDTO update(AgentTypeDTO agentTypeDTO);

    /**
     * Partially updates a agentType.
     *
     * @param agentTypeDTO the entity to update partially.
     * @return the persisted entity.
     */
    Optional<AgentTypeDTO> partialUpdate(AgentTypeDTO agentTypeDTO);

    /**
     * Get the "id" agentType.
     *
     * @param id the id of the entity.
     * @return the entity.
     */
    Optional<AgentTypeDTO> findOne(Long id);

    /**
     * Delete the "id" agentType.
     *
     * @param id the id of the entity.
     */
    void delete(Long id);
}
