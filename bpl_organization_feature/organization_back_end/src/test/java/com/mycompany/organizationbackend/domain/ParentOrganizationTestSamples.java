package com.mycompany.organizationbackend.domain;

import java.util.Random;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicLong;

public class ParentOrganizationTestSamples {

    private static final Random random = new Random();
    private static final AtomicLong longCount = new AtomicLong(random.nextInt() + (2 * Integer.MAX_VALUE));

    public static ParentOrganization getParentOrganizationSample1() {
        return new ParentOrganization().id(1L).name("name1");
    }

    public static ParentOrganization getParentOrganizationSample2() {
        return new ParentOrganization().id(2L).name("name2");
    }

    public static ParentOrganization getParentOrganizationRandomSampleGenerator() {
        return new ParentOrganization().id(longCount.incrementAndGet()).name(UUID.randomUUID().toString());
    }
}
