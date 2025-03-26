package com.bpl.service.dto;

import static org.assertj.core.api.Assertions.assertThat;

import com.bpl.web.rest.TestUtil;
import org.junit.jupiter.api.Test;

class AgentTypeDTOTest {

    @Test
    void dtoEqualsVerifier() throws Exception {
        TestUtil.equalsVerifier(AgentTypeDTO.class);
        AgentTypeDTO agentTypeDTO1 = new AgentTypeDTO();
        agentTypeDTO1.setId(1L);
        AgentTypeDTO agentTypeDTO2 = new AgentTypeDTO();
        assertThat(agentTypeDTO1).isNotEqualTo(agentTypeDTO2);
        agentTypeDTO2.setId(agentTypeDTO1.getId());
        assertThat(agentTypeDTO1).isEqualTo(agentTypeDTO2);
        agentTypeDTO2.setId(2L);
        assertThat(agentTypeDTO1).isNotEqualTo(agentTypeDTO2);
        agentTypeDTO1.setId(null);
        assertThat(agentTypeDTO1).isNotEqualTo(agentTypeDTO2);
    }
}
