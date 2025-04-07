package com.lxisofttech.invoice.service.dto;

import static org.assertj.core.api.Assertions.assertThat;

import com.lxisofttech.invoice.web.rest.TestUtil;
import org.junit.jupiter.api.Test;

class WayBillDTOTest {

    @Test
    void dtoEqualsVerifier() throws Exception {
        TestUtil.equalsVerifier(WayBillDTO.class);
        WayBillDTO wayBillDTO1 = new WayBillDTO();
        wayBillDTO1.setId(1L);
        WayBillDTO wayBillDTO2 = new WayBillDTO();
        assertThat(wayBillDTO1).isNotEqualTo(wayBillDTO2);
        wayBillDTO2.setId(wayBillDTO1.getId());
        assertThat(wayBillDTO1).isEqualTo(wayBillDTO2);
        wayBillDTO2.setId(2L);
        assertThat(wayBillDTO1).isNotEqualTo(wayBillDTO2);
        wayBillDTO1.setId(null);
        assertThat(wayBillDTO1).isNotEqualTo(wayBillDTO2);
    }
}
