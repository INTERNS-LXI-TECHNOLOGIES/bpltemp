package com.lxisofttech.invoice.domain;

import static com.lxisofttech.invoice.domain.CurrencyTypeTestSamples.*;
import static com.lxisofttech.invoice.domain.WayBillTestSamples.*;
import static org.assertj.core.api.Assertions.assertThat;

import com.lxisofttech.invoice.web.rest.TestUtil;
import org.junit.jupiter.api.Test;

class WayBillTest {

    @Test
    void equalsVerifier() throws Exception {
        TestUtil.equalsVerifier(WayBill.class);
        WayBill wayBill1 = getWayBillSample1();
        WayBill wayBill2 = new WayBill();
        assertThat(wayBill1).isNotEqualTo(wayBill2);

        wayBill2.setId(wayBill1.getId());
        assertThat(wayBill1).isEqualTo(wayBill2);

        wayBill2 = getWayBillSample2();
        assertThat(wayBill1).isNotEqualTo(wayBill2);
    }

    @Test
    void currencyTypeTest() {
        WayBill wayBill = getWayBillRandomSampleGenerator();
        CurrencyType currencyTypeBack = getCurrencyTypeRandomSampleGenerator();

        wayBill.setCurrencyType(currencyTypeBack);
        assertThat(wayBill.getCurrencyType()).isEqualTo(currencyTypeBack);

        wayBill.currencyType(null);
        assertThat(wayBill.getCurrencyType()).isNull();
    }
}
