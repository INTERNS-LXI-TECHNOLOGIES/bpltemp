package com.lxisofttech.invoice.domain;

import static com.lxisofttech.invoice.domain.CurrencyTypeTestSamples.*;
import static com.lxisofttech.invoice.domain.WayBillTestSamples.*;
import static org.assertj.core.api.Assertions.assertThat;

import com.lxisofttech.invoice.web.rest.TestUtil;
import java.util.HashSet;
import java.util.Set;
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
    void currencyTypeTest() {
        CurrencyType currencyType = getCurrencyTypeRandomSampleGenerator();
        WayBill wayBillBack = getWayBillRandomSampleGenerator();

        currencyType.addCurrencyType(wayBillBack);
        assertThat(currencyType.getCurrencyTypes()).containsOnly(wayBillBack);
        assertThat(wayBillBack.getCurrencyType()).isEqualTo(currencyType);

        currencyType.removeCurrencyType(wayBillBack);
        assertThat(currencyType.getCurrencyTypes()).doesNotContain(wayBillBack);
        assertThat(wayBillBack.getCurrencyType()).isNull();

        currencyType.currencyTypes(new HashSet<>(Set.of(wayBillBack)));
        assertThat(currencyType.getCurrencyTypes()).containsOnly(wayBillBack);
        assertThat(wayBillBack.getCurrencyType()).isEqualTo(currencyType);

        currencyType.setCurrencyTypes(new HashSet<>());
        assertThat(currencyType.getCurrencyTypes()).doesNotContain(wayBillBack);
        assertThat(wayBillBack.getCurrencyType()).isNull();
    }
}
