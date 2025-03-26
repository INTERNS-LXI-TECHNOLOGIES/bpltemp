package com.lxisofttech.invoice.domain;

import java.util.Random;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicLong;

public class CurrencyTypeTestSamples {

    private static final Random random = new Random();
    private static final AtomicLong longCount = new AtomicLong(random.nextInt() + (2 * Integer.MAX_VALUE));

    public static CurrencyType getCurrencyTypeSample1() {
        return new CurrencyType().id(1L).name("name1");
    }

    public static CurrencyType getCurrencyTypeSample2() {
        return new CurrencyType().id(2L).name("name2");
    }

    public static CurrencyType getCurrencyTypeRandomSampleGenerator() {
        return new CurrencyType().id(longCount.incrementAndGet()).name(UUID.randomUUID().toString());
    }
}
