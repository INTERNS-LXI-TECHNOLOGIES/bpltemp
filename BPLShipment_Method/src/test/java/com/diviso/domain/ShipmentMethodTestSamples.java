package com.diviso.domain;

import java.util.Random;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicLong;

public class ShipmentMethodTestSamples {

    private static final Random random = new Random();
    private static final AtomicLong longCount = new AtomicLong(random.nextInt() + (2 * Integer.MAX_VALUE));

    public static ShipmentMethod getShipmentMethodSample1() {
        return new ShipmentMethod().id(1L).name("name1").description("description1");
    }

    public static ShipmentMethod getShipmentMethodSample2() {
        return new ShipmentMethod().id(2L).name("name2").description("description2");
    }

    public static ShipmentMethod getShipmentMethodRandomSampleGenerator() {
        return new ShipmentMethod()
            .id(longCount.incrementAndGet())
            .name(UUID.randomUUID().toString())
            .description(UUID.randomUUID().toString());
    }
}
