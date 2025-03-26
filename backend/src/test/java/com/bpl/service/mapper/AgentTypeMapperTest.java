package com.bpl.service.mapper;

import static com.bpl.domain.AgentTypeAsserts.*;
import static com.bpl.domain.AgentTypeTestSamples.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class AgentTypeMapperTest {

    private AgentTypeMapper agentTypeMapper;

    @BeforeEach
    void setUp() {
        agentTypeMapper = new AgentTypeMapperImpl();
    }

    @Test
    void shouldConvertToDtoAndBack() {
        var expected = getAgentTypeSample1();
        var actual = agentTypeMapper.toEntity(agentTypeMapper.toDto(expected));
        assertAgentTypeAllPropertiesEquals(expected, actual);
    }
}
