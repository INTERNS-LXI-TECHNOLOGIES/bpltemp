package com.bpl.domain;

import static com.bpl.domain.AgentTypeTestSamples.*;
import static com.bpl.domain.OrganisationTestSamples.*;
import static org.assertj.core.api.Assertions.assertThat;

import com.bpl.web.rest.TestUtil;
import java.util.HashSet;
import java.util.Set;
import org.junit.jupiter.api.Test;

class AgentTypeTest {

    @Test
    void equalsVerifier() throws Exception {
        TestUtil.equalsVerifier(AgentType.class);
        AgentType agentType1 = getAgentTypeSample1();
        AgentType agentType2 = new AgentType();
        assertThat(agentType1).isNotEqualTo(agentType2);

        agentType2.setId(agentType1.getId());
        assertThat(agentType1).isEqualTo(agentType2);

        agentType2 = getAgentTypeSample2();
        assertThat(agentType1).isNotEqualTo(agentType2);
    }

    @Test
    void organisationTest() {
        AgentType agentType = getAgentTypeRandomSampleGenerator();
        Organisation organisationBack = getOrganisationRandomSampleGenerator();

        agentType.addOrganisation(organisationBack);
        assertThat(agentType.getOrganisations()).containsOnly(organisationBack);
        assertThat(organisationBack.getAgentType()).isEqualTo(agentType);

        agentType.removeOrganisation(organisationBack);
        assertThat(agentType.getOrganisations()).doesNotContain(organisationBack);
        assertThat(organisationBack.getAgentType()).isNull();

        agentType.organisations(new HashSet<>(Set.of(organisationBack)));
        assertThat(agentType.getOrganisations()).containsOnly(organisationBack);
        assertThat(organisationBack.getAgentType()).isEqualTo(agentType);

        agentType.setOrganisations(new HashSet<>());
        assertThat(agentType.getOrganisations()).doesNotContain(organisationBack);
        assertThat(organisationBack.getAgentType()).isNull();
    }
}
