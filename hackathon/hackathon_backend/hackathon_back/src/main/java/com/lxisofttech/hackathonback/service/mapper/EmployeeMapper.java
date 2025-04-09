package com.lxisofttech.hackathonback.service.mapper;

import com.lxisofttech.hackathonback.domain.Company;
import com.lxisofttech.hackathonback.domain.Employee;
import com.lxisofttech.hackathonback.service.dto.CompanyDTO;
import com.lxisofttech.hackathonback.service.dto.EmployeeDTO;
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
