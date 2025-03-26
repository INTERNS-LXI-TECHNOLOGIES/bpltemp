package com.diviso.domain;

import static com.diviso.domain.FacilityTypeTestSamples.*;
import static org.assertj.core.api.Assertions.assertThat;

import com.diviso.web.rest.TestUtil;
import org.junit.jupiter.api.Test;

class FacilityTypeTest {

    @Test
    void equalsVerifier() throws Exception {
        TestUtil.equalsVerifier(FacilityType.class);
        FacilityType facilityType1 = getFacilityTypeSample1();
        FacilityType facilityType2 = new FacilityType();
        assertThat(facilityType1).isNotEqualTo(facilityType2);

        facilityType2.setId(facilityType1.getId());
        assertThat(facilityType1).isEqualTo(facilityType2);

        facilityType2 = getFacilityTypeSample2();
        assertThat(facilityType1).isNotEqualTo(facilityType2);
    }
}
