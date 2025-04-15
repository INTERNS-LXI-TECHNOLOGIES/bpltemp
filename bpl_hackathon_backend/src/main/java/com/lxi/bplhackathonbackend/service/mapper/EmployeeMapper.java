package com.lxi.bplhackathonbackend.service.mapper;

import com.lxi.bplhackathonbackend.domain.Company;
import com.lxi.bplhackathonbackend.domain.Employee;
import com.lxi.bplhackathonbackend.service.dto.CompanyDTO;
import com.lxi.bplhackathonbackend.service.dto.EmployeeDTO;
import org.mapstruct.*;

/**
 * Mapper for the entity {@link Employee} and its DTO {@link EmployeeDTO}.
 */
@Mapper(componentModel = "spring")
public interface EmployeeMapper extends EntityMapper<EmployeeDTO, Employee> {
    @Mapping(target = "company", source = "company", qualifiedByName = "companyId")
    EmployeeDTO toDto(Employee s);

    @Named("companyId")
    @BeanMapping(ignoreByDefault = true)
    @Mapping(target = "id", source = "id")
    CompanyDTO toDtoCompanyId(Company company);
}
