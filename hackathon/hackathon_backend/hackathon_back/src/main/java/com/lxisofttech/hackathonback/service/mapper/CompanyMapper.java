package com.lxisofttech.hackathonback.service.mapper;

import com.lxisofttech.hackathonback.domain.Company;
import com.lxisofttech.hackathonback.service.dto.CompanyDTO;
import org.mapstruct.*;

/**
 * Mapper for the entity {@link Company} and its DTO {@link CompanyDTO}.
 */
@Mapper(componentModel = "spring")
public interface CompanyMapper extends EntityMapper<CompanyDTO, Company> {}
