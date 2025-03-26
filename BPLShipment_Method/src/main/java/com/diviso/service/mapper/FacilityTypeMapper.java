package com.diviso.service.mapper;

import com.diviso.domain.FacilityType;
import com.diviso.service.dto.FacilityTypeDTO;
import org.mapstruct.*;

/**
 * Mapper for the entity {@link FacilityType} and its DTO {@link FacilityTypeDTO}.
 */
@Mapper(componentModel = "spring")
public interface FacilityTypeMapper extends EntityMapper<FacilityTypeDTO, FacilityType> {}
