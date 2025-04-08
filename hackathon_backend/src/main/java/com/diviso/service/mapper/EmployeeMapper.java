package com.diviso.service.mapper;

import com.diviso.domain.Company;
import com.diviso.domain.Employee;
import com.diviso.service.dto.CompanyDTO;
import com.diviso.service.dto.EmployeeDTO;
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
