package com.lxisoft.organizationbackend.domain;

import static com.lxisoft.organizationbackend.domain.OrganizationTestSamples.*;
import static org.assertj.core.api.Assertions.assertThat;

import com.lxisoft.organizationbackend.web.rest.TestUtil;
import org.junit.jupiter.api.Test;

class OrganizationTest {

    @Test
    void equalsVerifier() throws Exception {
        TestUtil.equalsVerifier(Organization.class);
        Organization organization1 = getOrganizationSample1();
        Organization organization2 = new Organization();
        assertThat(organization1).isNotEqualTo(organization2);

        organization2.setId(organization1.getId());
        assertThat(organization1).isEqualTo(organization2);

        organization2 = getOrganizationSample2();
        assertThat(organization1).isNotEqualTo(organization2);
    }
}
