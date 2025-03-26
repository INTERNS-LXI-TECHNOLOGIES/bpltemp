package com.diviso.service.dto;

import static org.assertj.core.api.Assertions.assertThat;

import com.diviso.web.rest.TestUtil;
import org.junit.jupiter.api.Test;

class ShipmentMethodDTOTest {

    @Test
    void dtoEqualsVerifier() throws Exception {
        TestUtil.equalsVerifier(ShipmentMethodDTO.class);
        ShipmentMethodDTO shipmentMethodDTO1 = new ShipmentMethodDTO();
        shipmentMethodDTO1.setId(1L);
        ShipmentMethodDTO shipmentMethodDTO2 = new ShipmentMethodDTO();
        assertThat(shipmentMethodDTO1).isNotEqualTo(shipmentMethodDTO2);
        shipmentMethodDTO2.setId(shipmentMethodDTO1.getId());
        assertThat(shipmentMethodDTO1).isEqualTo(shipmentMethodDTO2);
        shipmentMethodDTO2.setId(2L);
        assertThat(shipmentMethodDTO1).isNotEqualTo(shipmentMethodDTO2);
        shipmentMethodDTO1.setId(null);
        assertThat(shipmentMethodDTO1).isNotEqualTo(shipmentMethodDTO2);
    }
}
