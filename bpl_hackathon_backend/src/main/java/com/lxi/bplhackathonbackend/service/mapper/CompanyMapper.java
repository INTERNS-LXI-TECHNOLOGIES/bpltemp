package com.lxi.bplhackathonbackend.service.mapper;

import com.lxi.bplhackathonbackend.domain.Company;
import com.lxi.bplhackathonbackend.service.dto.CompanyDTO;
import org.mapstruct.*;

/**
 * Mapper for the entity {@link Company} and its DTO {@link CompanyDTO}.
 */
@Mapper(componentModel = "spring")
public interface CompanyMapper extends EntityMapper<CompanyDTO, Company> {}
