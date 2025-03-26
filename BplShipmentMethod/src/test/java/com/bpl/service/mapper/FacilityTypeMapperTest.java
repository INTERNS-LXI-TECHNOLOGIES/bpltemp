package com.bpl.service.mapper;

import static com.bpl.domain.FacilityTypeAsserts.*;
import static com.bpl.domain.FacilityTypeTestSamples.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class FacilityTypeMapperTest {

    private FacilityTypeMapper facilityTypeMapper;

    @BeforeEach
    void setUp() {
        facilityTypeMapper = new FacilityTypeMapperImpl();
    }

    @Test
    void shouldConvertToDtoAndBack() {
        var expected = getFacilityTypeSample1();
        var actual = facilityTypeMapper.toEntity(facilityTypeMapper.toDto(expected));
        assertFacilityTypeAllPropertiesEquals(expected, actual);
    }
}
