package com.mycompany.organizationbackend.domain;

import static com.mycompany.organizationbackend.domain.OrganizationTestSamples.*;
import static com.mycompany.organizationbackend.domain.ParentOrganizationTestSamples.*;
import static org.assertj.core.api.Assertions.assertThat;

import com.mycompany.organizationbackend.web.rest.TestUtil;
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

    @Test
    void parentOrganizationTest() {
        Organization organization = getOrganizationRandomSampleGenerator();
        ParentOrganization parentOrganizationBack = getParentOrganizationRandomSampleGenerator();

        organization.setParentOrganization(parentOrganizationBack);
        assertThat(organization.getParentOrganization()).isEqualTo(parentOrganizationBack);

        organization.parentOrganization(null);
        assertThat(organization.getParentOrganization()).isNull();
    }
}
