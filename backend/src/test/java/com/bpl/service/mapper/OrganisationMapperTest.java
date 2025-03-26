package com.bpl.service.mapper;

import static com.bpl.domain.OrganisationAsserts.*;
import static com.bpl.domain.OrganisationTestSamples.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class OrganisationMapperTest {

    private OrganisationMapper organisationMapper;

    @BeforeEach
    void setUp() {
        organisationMapper = new OrganisationMapperImpl();
    }

    @Test
    void shouldConvertToDtoAndBack() {
        var expected = getOrganisationSample1();
        var actual = organisationMapper.toEntity(organisationMapper.toDto(expected));
        assertOrganisationAllPropertiesEquals(expected, actual);
    }
}
