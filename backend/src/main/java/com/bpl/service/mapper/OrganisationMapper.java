package com.bpl.service.mapper;

import com.bpl.domain.AgentType;
import com.bpl.domain.Organisation;
import com.bpl.service.dto.AgentTypeDTO;
import com.bpl.service.dto.OrganisationDTO;
import org.mapstruct.*;

/**
 * Mapper for the entity {@link Organisation} and its DTO {@link OrganisationDTO}.
 */
@Mapper(componentModel = "spring")
public interface OrganisationMapper extends EntityMapper<OrganisationDTO, Organisation> {
    @Mapping(target = "agentType", source = "agentType", qualifiedByName = "agentTypeId")
    OrganisationDTO toDto(Organisation s);

    @Named("agentTypeId")
    @BeanMapping(ignoreByDefault = true)
    @Mapping(target = "id", source = "id")
    AgentTypeDTO toDtoAgentTypeId(AgentType agentType);
}
