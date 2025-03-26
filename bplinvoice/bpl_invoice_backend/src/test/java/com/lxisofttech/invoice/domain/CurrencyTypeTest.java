package com.lxisofttech.invoice.domain;

import static com.lxisofttech.invoice.domain.CurrencyTypeTestSamples.*;
import static com.lxisofttech.invoice.domain.WayBillTestSamples.*;
import static org.assertj.core.api.Assertions.assertThat;

import com.lxisofttech.invoice.web.rest.TestUtil;
import org.junit.jupiter.api.Test;

class CurrencyTypeTest {

    @Test
    void equalsVerifier() throws Exception {
        TestUtil.equalsVerifier(CurrencyType.class);
        CurrencyType currencyType1 = getCurrencyTypeSample1();
        CurrencyType currencyType2 = new CurrencyType();
        assertThat(currencyType1).isNotEqualTo(currencyType2);

        currencyType2.setId(currencyType1.getId());
        assertThat(currencyType1).isEqualTo(currencyType2);

        currencyType2 = getCurrencyTypeSample2();
        assertThat(currencyType1).isNotEqualTo(currencyType2);
    }

    @Test
    void wayBillTest() {
        CurrencyType currencyType = getCurrencyTypeRandomSampleGenerator();
        WayBill wayBillBack = getWayBillRandomSampleGenerator();

        currencyType.setWayBill(wayBillBack);
        assertThat(currencyType.getWayBill()).isEqualTo(wayBillBack);
        assertThat(wayBillBack.getCurrencyType()).isEqualTo(currencyType);

        currencyType.wayBill(null);
        assertThat(currencyType.getWayBill()).isNull();
        assertThat(wayBillBack.getCurrencyType()).isNull();
    }
}
