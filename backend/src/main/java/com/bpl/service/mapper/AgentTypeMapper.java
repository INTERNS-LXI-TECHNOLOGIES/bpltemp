package com.bpl.service.mapper;

import com.bpl.domain.AgentType;
import com.bpl.service.dto.AgentTypeDTO;
import org.mapstruct.*;

/**
 * Mapper for the entity {@link AgentType} and its DTO {@link AgentTypeDTO}.
 */
@Mapper(componentModel = "spring")
public interface AgentTypeMapper extends EntityMapper<AgentTypeDTO, AgentType> {}
