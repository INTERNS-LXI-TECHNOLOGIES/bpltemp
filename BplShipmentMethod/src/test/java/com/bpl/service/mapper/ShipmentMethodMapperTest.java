package com.bpl.service.mapper;

import static com.bpl.domain.ShipmentMethodAsserts.*;
import static com.bpl.domain.ShipmentMethodTestSamples.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class ShipmentMethodMapperTest {

    private ShipmentMethodMapper shipmentMethodMapper;

    @BeforeEach
    void setUp() {
        shipmentMethodMapper = new ShipmentMethodMapperImpl();
    }

    @Test
    void shouldConvertToDtoAndBack() {
        var expected = getShipmentMethodSample1();
        var actual = shipmentMethodMapper.toEntity(shipmentMethodMapper.toDto(expected));
        assertShipmentMethodAllPropertiesEquals(expected, actual);
    }
}
