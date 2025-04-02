package com.lxisoft.organizationbackend.domain;

import static com.lxisoft.organizationbackend.domain.ParentorganizationTestSamples.*;
import static org.assertj.core.api.Assertions.assertThat;

import com.lxisoft.organizationbackend.web.rest.TestUtil;
import org.junit.jupiter.api.Test;

class ParentorganizationTest {

    @Test
    void equalsVerifier() throws Exception {
        TestUtil.equalsVerifier(Parentorganization.class);
        Parentorganization parentorganization1 = getParentorganizationSample1();
        Parentorganization parentorganization2 = new Parentorganization();
        assertThat(parentorganization1).isNotEqualTo(parentorganization2);

        parentorganization2.setId(parentorganization1.getId());
        assertThat(parentorganization1).isEqualTo(parentorganization2);

        parentorganization2 = getParentorganizationSample2();
        assertThat(parentorganization1).isNotEqualTo(parentorganization2);
    }
}
