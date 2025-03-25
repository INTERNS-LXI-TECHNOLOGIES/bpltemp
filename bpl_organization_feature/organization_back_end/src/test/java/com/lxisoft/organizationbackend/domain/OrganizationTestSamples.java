package com.lxisoft.organizationbackend.domain;

import java.util.Random;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;

public class OrganizationTestSamples {

    private static final Random random = new Random();
    private static final AtomicLong longCount = new AtomicLong(random.nextInt() + (2 * Integer.MAX_VALUE));
    private static final AtomicInteger intCount = new AtomicInteger(random.nextInt() + (2 * Short.MAX_VALUE));

    public static Organization getOrganizationSample1() {
        return new Organization()
            .id(1L)
            .externalId(1)
            .name("name1")
            .description("description1")
            .organizationType("organizationType1")
            .organizationGroup("organizationGroup1")
            .parentOrganization("parentOrganization1");
    }

    public static Organization getOrganizationSample2() {
        return new Organization()
            .id(2L)
            .externalId(2)
            .name("name2")
            .description("description2")
            .organizationType("organizationType2")
            .organizationGroup("organizationGroup2")
            .parentOrganization("parentOrganization2");
    }

    public static Organization getOrganizationRandomSampleGenerator() {
        return new Organization()
            .id(longCount.incrementAndGet())
            .externalId(intCount.incrementAndGet())
            .name(UUID.randomUUID().toString())
            .description(UUID.randomUUID().toString())
            .organizationType(UUID.randomUUID().toString())
            .organizationGroup(UUID.randomUUID().toString())
            .parentOrganization(UUID.randomUUID().toString());
    }
}
