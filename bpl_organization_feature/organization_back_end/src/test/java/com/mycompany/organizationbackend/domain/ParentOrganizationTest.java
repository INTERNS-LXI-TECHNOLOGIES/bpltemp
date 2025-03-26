package com.mycompany.organizationbackend.domain;

import static com.mycompany.organizationbackend.domain.OrganizationTestSamples.*;
import static com.mycompany.organizationbackend.domain.ParentOrganizationTestSamples.*;
import static org.assertj.core.api.Assertions.assertThat;

import com.mycompany.organizationbackend.web.rest.TestUtil;
import org.junit.jupiter.api.Test;

class ParentOrganizationTest {

    @Test
    void equalsVerifier() throws Exception {
        TestUtil.equalsVerifier(ParentOrganization.class);
        ParentOrganization parentOrganization1 = getParentOrganizationSample1();
        ParentOrganization parentOrganization2 = new ParentOrganization();
        assertThat(parentOrganization1).isNotEqualTo(parentOrganization2);

        parentOrganization2.setId(parentOrganization1.getId());
        assertThat(parentOrganization1).isEqualTo(parentOrganization2);

        parentOrganization2 = getParentOrganizationSample2();
        assertThat(parentOrganization1).isNotEqualTo(parentOrganization2);
    }

    @Test
    void organizationTest() {
        ParentOrganization parentOrganization = getParentOrganizationRandomSampleGenerator();
        Organization organizationBack = getOrganizationRandomSampleGenerator();

        parentOrganization.setOrganization(organizationBack);
        assertThat(parentOrganization.getOrganization()).isEqualTo(organizationBack);
        assertThat(organizationBack.getParentOrganization()).isEqualTo(parentOrganization);

        parentOrganization.organization(null);
        assertThat(parentOrganization.getOrganization()).isNull();
        assertThat(organizationBack.getParentOrganization()).isNull();
    }
}
