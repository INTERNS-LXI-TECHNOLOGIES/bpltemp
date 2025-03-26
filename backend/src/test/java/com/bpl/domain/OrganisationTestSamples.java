package com.bpl.domain;

import java.util.Random;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicLong;

public class OrganisationTestSamples {

    private static final Random random = new Random();
    private static final AtomicLong longCount = new AtomicLong(random.nextInt() + (2 * Integer.MAX_VALUE));

    public static Organisation getOrganisationSample1() {
        return new Organisation().id(1L).name("name1");
    }

    public static Organisation getOrganisationSample2() {
        return new Organisation().id(2L).name("name2");
    }

    public static Organisation getOrganisationRandomSampleGenerator() {
        return new Organisation().id(longCount.incrementAndGet()).name(UUID.randomUUID().toString());
    }
}
