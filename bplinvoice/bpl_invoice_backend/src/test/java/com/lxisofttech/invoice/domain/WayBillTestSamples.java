package com.lxisofttech.invoice.domain;

import java.util.Random;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;

public class WayBillTestSamples {

    private static final Random random = new Random();
    private static final AtomicLong longCount = new AtomicLong(random.nextInt() + (2 * Integer.MAX_VALUE));
    private static final AtomicInteger intCount = new AtomicInteger(random.nextInt() + (2 * Short.MAX_VALUE));

    public static WayBill getWayBillSample1() {
        return new WayBill()
            .id(1L)
            .boxLimit(1)
            .shipmentType("shipmentType1")
            .opfac("opfac1")
            .deliveryAgent("deliveryAgent1")
            .currencyUom("currencyUom1")
            .status("status1")
            .referenceNumber("referenceNumber1");
    }

    public static WayBill getWayBillSample2() {
        return new WayBill()
            .id(2L)
            .boxLimit(2)
            .shipmentType("shipmentType2")
            .opfac("opfac2")
            .deliveryAgent("deliveryAgent2")
            .currencyUom("currencyUom2")
            .status("status2")
            .referenceNumber("referenceNumber2");
    }

    public static WayBill getWayBillRandomSampleGenerator() {
        return new WayBill()
            .id(longCount.incrementAndGet())
            .boxLimit(intCount.incrementAndGet())
            .shipmentType(UUID.randomUUID().toString())
            .opfac(UUID.randomUUID().toString())
            .deliveryAgent(UUID.randomUUID().toString())
            .currencyUom(UUID.randomUUID().toString())
            .status(UUID.randomUUID().toString())
            .referenceNumber(UUID.randomUUID().toString());
    }
}
