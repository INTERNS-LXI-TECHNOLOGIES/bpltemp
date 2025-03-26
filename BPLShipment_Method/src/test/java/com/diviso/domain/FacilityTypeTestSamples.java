package com.diviso.domain;

import java.util.Random;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicLong;

public class FacilityTypeTestSamples {

    private static final Random random = new Random();
    private static final AtomicLong longCount = new AtomicLong(random.nextInt() + (2 * Integer.MAX_VALUE));

    public static FacilityType getFacilityTypeSample1() {
        return new FacilityType().id(1L).name("name1");
    }

    public static FacilityType getFacilityTypeSample2() {
        return new FacilityType().id(2L).name("name2");
    }

    public static FacilityType getFacilityTypeRandomSampleGenerator() {
        return new FacilityType().id(longCount.incrementAndGet()).name(UUID.randomUUID().toString());
    }
}
