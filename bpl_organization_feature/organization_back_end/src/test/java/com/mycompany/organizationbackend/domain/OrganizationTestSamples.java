package com.mycompany.organizationbackend.domain;

import java.util.Random;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicLong;

public class OrganizationTestSamples {

    private static final Random random = new Random();
    private static final AtomicLong longCount = new AtomicLong(random.nextInt() + (2 * Integer.MAX_VALUE));

    public static Organization getOrganizationSample1() {
        return new Organization()
            .id(1L)
            .externalId("externalId1")
            .name("name1")
            .description("description1")
            .organizationType("organizationType1")
            .organizationGroup("organizationGroup1");
    }

    public static Organization getOrganizationSample2() {
        return new Organization()
            .id(2L)
            .externalId("externalId2")
            .name("name2")
            .description("description2")
            .organizationType("organizationType2")
            .organizationGroup("organizationGroup2");
    }

    public static Organization getOrganizationRandomSampleGenerator() {
        return new Organization()
            .id(longCount.incrementAndGet())
            .externalId(UUID.randomUUID().toString())
            .name(UUID.randomUUID().toString())
            .description(UUID.randomUUID().toString())
            .organizationType(UUID.randomUUID().toString())
            .organizationGroup(UUID.randomUUID().toString());
    }
}
