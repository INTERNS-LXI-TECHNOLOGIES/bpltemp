package com.lxisofttech.invoice.service.mapper;

import static com.lxisofttech.invoice.domain.CurrencyTypeAsserts.*;
import static com.lxisofttech.invoice.domain.CurrencyTypeTestSamples.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class CurrencyTypeMapperTest {

    private CurrencyTypeMapper currencyTypeMapper;

    @BeforeEach
    void setUp() {
        currencyTypeMapper = new CurrencyTypeMapperImpl();
    }

    @Test
    void shouldConvertToDtoAndBack() {
        var expected = getCurrencyTypeSample1();
        var actual = currencyTypeMapper.toEntity(currencyTypeMapper.toDto(expected));
        assertCurrencyTypeAllPropertiesEquals(expected, actual);
    }
}
