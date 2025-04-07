package com.lxisofttech.invoice.service.mapper;

import com.lxisofttech.invoice.domain.CurrencyType;
import com.lxisofttech.invoice.service.dto.CurrencyTypeDTO;
import org.mapstruct.*;

/**
 * Mapper for the entity {@link CurrencyType} and its DTO {@link CurrencyTypeDTO}.
 */
@Mapper(componentModel = "spring")
public interface CurrencyTypeMapper extends EntityMapper<CurrencyTypeDTO, CurrencyType> {}
