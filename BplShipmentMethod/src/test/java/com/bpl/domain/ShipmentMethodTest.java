package com.bpl.domain;

import static com.bpl.domain.FacilityTypeTestSamples.*;
import static com.bpl.domain.ShipmentMethodTestSamples.*;
import static org.assertj.core.api.Assertions.assertThat;

import com.bpl.web.rest.TestUtil;
import org.junit.jupiter.api.Test;

class ShipmentMethodTest {

    @Test
    void equalsVerifier() throws Exception {
        TestUtil.equalsVerifier(ShipmentMethod.class);
        ShipmentMethod shipmentMethod1 = getShipmentMethodSample1();
        ShipmentMethod shipmentMethod2 = new ShipmentMethod();
        assertThat(shipmentMethod1).isNotEqualTo(shipmentMethod2);

        shipmentMethod2.setId(shipmentMethod1.getId());
        assertThat(shipmentMethod1).isEqualTo(shipmentMethod2);

        shipmentMethod2 = getShipmentMethodSample2();
        assertThat(shipmentMethod1).isNotEqualTo(shipmentMethod2);
    }

    @Test
    void parentTypeTest() {
        ShipmentMethod shipmentMethod = getShipmentMethodRandomSampleGenerator();
        FacilityType facilityTypeBack = getFacilityTypeRandomSampleGenerator();

        shipmentMethod.setParentType(facilityTypeBack);
        assertThat(shipmentMethod.getParentType()).isEqualTo(facilityTypeBack);

        shipmentMethod.parentType(null);
        assertThat(shipmentMethod.getParentType()).isNull();
    }
}
