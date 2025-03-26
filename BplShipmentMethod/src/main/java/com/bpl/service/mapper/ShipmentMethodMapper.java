package com.bpl.service.mapper;

import com.bpl.domain.FacilityType;
import com.bpl.domain.ShipmentMethod;
import com.bpl.service.dto.FacilityTypeDTO;
import com.bpl.service.dto.ShipmentMethodDTO;
import org.mapstruct.*;

/**
 * Mapper for the entity {@link ShipmentMethod} and its DTO {@link ShipmentMethodDTO}.
 */
@Mapper(componentModel = "spring")
public interface ShipmentMethodMapper extends EntityMapper<ShipmentMethodDTO, ShipmentMethod> {
    @Mapping(target = "parentType", source = "parentType", qualifiedByName = "facilityTypeName")
    ShipmentMethodDTO toDto(ShipmentMethod s);

    @Named("facilityTypeName")
    @BeanMapping(ignoreByDefault = true)
    @Mapping(target = "id", source = "id")
    @Mapping(target = "name", source = "name")
    FacilityTypeDTO toDtoFacilityTypeName(FacilityType facilityType);
}
