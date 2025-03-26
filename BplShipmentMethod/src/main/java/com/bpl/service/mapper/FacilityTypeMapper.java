package com.bpl.service.mapper;

import com.bpl.domain.FacilityType;
import com.bpl.service.dto.FacilityTypeDTO;
import org.mapstruct.*;

/**
 * Mapper for the entity {@link FacilityType} and its DTO {@link FacilityTypeDTO}.
 */
@Mapper(componentModel = "spring")
public interface FacilityTypeMapper extends EntityMapper<FacilityTypeDTO, FacilityType> {}
