package com.lxisoft.organizationbackend.domain;

import java.util.Random;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicLong;

public class ParentorganizationTestSamples {

    private static final Random random = new Random();
    private static final AtomicLong longCount = new AtomicLong(random.nextInt() + (2 * Integer.MAX_VALUE));

    public static Parentorganization getParentorganizationSample1() {
        return new Parentorganization().id(1L).name("name1").description("description1");
    }

    public static Parentorganization getParentorganizationSample2() {
        return new Parentorganization().id(2L).name("name2").description("description2");
    }

    public static Parentorganization getParentorganizationRandomSampleGenerator() {
        return new Parentorganization()
            .id(longCount.incrementAndGet())
            .name(UUID.randomUUID().toString())
            .description(UUID.randomUUID().toString());
    }
}
