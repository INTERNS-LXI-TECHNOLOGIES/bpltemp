package com.bpl.domain;

import java.util.Random;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicLong;

public class AgentTypeTestSamples {

    private static final Random random = new Random();
    private static final AtomicLong longCount = new AtomicLong(random.nextInt() + (2 * Integer.MAX_VALUE));

    public static AgentType getAgentTypeSample1() {
        return new AgentType().id(1L).name("name1").description("description1");
    }

    public static AgentType getAgentTypeSample2() {
        return new AgentType().id(2L).name("name2").description("description2");
    }

    public static AgentType getAgentTypeRandomSampleGenerator() {
        return new AgentType().id(longCount.incrementAndGet()).name(UUID.randomUUID().toString()).description(UUID.randomUUID().toString());
    }
}
