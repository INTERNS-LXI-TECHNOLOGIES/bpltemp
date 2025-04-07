package com.lxisofttech.invoice.service.mapper;

import com.lxisofttech.invoice.domain.CurrencyType;
import com.lxisofttech.invoice.domain.WayBill;
import com.lxisofttech.invoice.service.dto.CurrencyTypeDTO;
import com.lxisofttech.invoice.service.dto.WayBillDTO;
import org.mapstruct.*;

/**
 * Mapper for the entity {@link WayBill} and its DTO {@link WayBillDTO}.
 */
@Mapper(componentModel = "spring")
public interface WayBillMapper extends EntityMapper<WayBillDTO, WayBill> {
    @Mapping(target = "currencyType", source = "currencyType", qualifiedByName = "currencyTypeId")
    WayBillDTO toDto(WayBill s);

    @Named("currencyTypeId")
    @BeanMapping(ignoreByDefault = true)
    @Mapping(target = "id", source = "id")
    CurrencyTypeDTO toDtoCurrencyTypeId(CurrencyType currencyType);
}
