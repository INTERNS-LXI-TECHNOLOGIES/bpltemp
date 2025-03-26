package com.bpl.service.impl;

import com.bpl.domain.AgentType;
import com.bpl.repository.AgentTypeRepository;
import com.bpl.service.AgentTypeService;
import com.bpl.service.dto.AgentTypeDTO;
import com.bpl.service.mapper.AgentTypeMapper;
import java.util.Optional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Service Implementation for managing {@link com.bpl.domain.AgentType}.
 */
@Service
@Transactional
public class AgentTypeServiceImpl implements AgentTypeService {

    private static final Logger LOG = LoggerFactory.getLogger(AgentTypeServiceImpl.class);

    private final AgentTypeRepository agentTypeRepository;

    private final AgentTypeMapper agentTypeMapper;

    public AgentTypeServiceImpl(AgentTypeRepository agentTypeRepository, AgentTypeMapper agentTypeMapper) {
        this.agentTypeRepository = agentTypeRepository;
        this.agentTypeMapper = agentTypeMapper;
    }

    @Override
    public AgentTypeDTO save(AgentTypeDTO agentTypeDTO) {
        LOG.debug("Request to save AgentType : {}", agentTypeDTO);
        AgentType agentType = agentTypeMapper.toEntity(agentTypeDTO);
        agentType = agentTypeRepository.save(agentType);
        return agentTypeMapper.toDto(agentType);
    }

    @Override
    public AgentTypeDTO update(AgentTypeDTO agentTypeDTO) {
        LOG.debug("Request to update AgentType : {}", agentTypeDTO);
        AgentType agentType = agentTypeMapper.toEntity(agentTypeDTO);
        agentType = agentTypeRepository.save(agentType);
        return agentTypeMapper.toDto(agentType);
    }

    @Override
    public Optional<AgentTypeDTO> partialUpdate(AgentTypeDTO agentTypeDTO) {
        LOG.debug("Request to partially update AgentType : {}", agentTypeDTO);

        return agentTypeRepository
            .findById(agentTypeDTO.getId())
            .map(existingAgentType -> {
                agentTypeMapper.partialUpdate(existingAgentType, agentTypeDTO);

                return existingAgentType;
            })
            .map(agentTypeRepository::save)
            .map(agentTypeMapper::toDto);
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<AgentTypeDTO> findOne(Long id) {
        LOG.debug("Request to get AgentType : {}", id);
        return agentTypeRepository.findById(id).map(agentTypeMapper::toDto);
    }

    @Override
    public void delete(Long id) {
        LOG.debug("Request to delete AgentType : {}", id);
        agentTypeRepository.deleteById(id);
    }
}
