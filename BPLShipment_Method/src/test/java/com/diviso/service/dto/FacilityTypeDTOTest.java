package com.diviso.service.dto;

import static org.assertj.core.api.Assertions.assertThat;

import com.diviso.web.rest.TestUtil;
import org.junit.jupiter.api.Test;

class FacilityTypeDTOTest {

    @Test
    void dtoEqualsVerifier() throws Exception {
        TestUtil.equalsVerifier(FacilityTypeDTO.class);
        FacilityTypeDTO facilityTypeDTO1 = new FacilityTypeDTO();
        facilityTypeDTO1.setId(1L);
        FacilityTypeDTO facilityTypeDTO2 = new FacilityTypeDTO();
        assertThat(facilityTypeDTO1).isNotEqualTo(facilityTypeDTO2);
        facilityTypeDTO2.setId(facilityTypeDTO1.getId());
        assertThat(facilityTypeDTO1).isEqualTo(facilityTypeDTO2);
        facilityTypeDTO2.setId(2L);
        assertThat(facilityTypeDTO1).isNotEqualTo(facilityTypeDTO2);
        facilityTypeDTO1.setId(null);
        assertThat(facilityTypeDTO1).isNotEqualTo(facilityTypeDTO2);
    }
}
