package com.lxisofttech.invoice.service.mapper;

import static com.lxisofttech.invoice.domain.WayBillAsserts.*;
import static com.lxisofttech.invoice.domain.WayBillTestSamples.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class WayBillMapperTest {

    private WayBillMapper wayBillMapper;

    @BeforeEach
    void setUp() {
        wayBillMapper = new WayBillMapperImpl();
    }

    @Test
    void shouldConvertToDtoAndBack() {
        var expected = getWayBillSample1();
        var actual = wayBillMapper.toEntity(wayBillMapper.toDto(expected));
        assertWayBillAllPropertiesEquals(expected, actual);
    }
}
