package com.lxisofttech.invoice.service.criteria;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.Objects;
import java.util.function.BiFunction;
import java.util.function.Function;
import org.assertj.core.api.Condition;
import org.junit.jupiter.api.Test;

class WayBillCriteriaTest {

    @Test
    void newWayBillCriteriaHasAllFiltersNullTest() {
        var wayBillCriteria = new WayBillCriteria();
        assertThat(wayBillCriteria).is(criteriaFiltersAre(Objects::isNull));
    }

    @Test
    void wayBillCriteriaFluentMethodsCreatesFiltersTest() {
        var wayBillCriteria = new WayBillCriteria();

        setAllFilters(wayBillCriteria);

        assertThat(wayBillCriteria).is(criteriaFiltersAre(Objects::nonNull));
    }

    @Test
    void wayBillCriteriaCopyCreatesNullFilterTest() {
        var wayBillCriteria = new WayBillCriteria();
        var copy = wayBillCriteria.copy();

        assertThat(wayBillCriteria).satisfies(
            criteria ->
                assertThat(criteria).is(
                    copyFiltersAre(copy, (a, b) -> (a == null || a instanceof Boolean) ? a == b : (a != b && a.equals(b)))
                ),
            criteria -> assertThat(criteria).isEqualTo(copy),
            criteria -> assertThat(criteria).hasSameHashCodeAs(copy)
        );

        assertThat(copy).satisfies(
            criteria -> assertThat(criteria).is(criteriaFiltersAre(Objects::isNull)),
            criteria -> assertThat(criteria).isEqualTo(wayBillCriteria)
        );
    }

    @Test
    void wayBillCriteriaCopyDuplicatesEveryExistingFilterTest() {
        var wayBillCriteria = new WayBillCriteria();
        setAllFilters(wayBillCriteria);

        var copy = wayBillCriteria.copy();

        assertThat(wayBillCriteria).satisfies(
            criteria ->
                assertThat(criteria).is(
                    copyFiltersAre(copy, (a, b) -> (a == null || a instanceof Boolean) ? a == b : (a != b && a.equals(b)))
                ),
            criteria -> assertThat(criteria).isEqualTo(copy),
            criteria -> assertThat(criteria).hasSameHashCodeAs(copy)
        );

        assertThat(copy).satisfies(
            criteria -> assertThat(criteria).is(criteriaFiltersAre(Objects::nonNull)),
            criteria -> assertThat(criteria).isEqualTo(wayBillCriteria)
        );
    }

    @Test
    void toStringVerifier() {
        var wayBillCriteria = new WayBillCriteria();

        assertThat(wayBillCriteria).hasToString("WayBillCriteria{}");
    }

    private static void setAllFilters(WayBillCriteria wayBillCriteria) {
        wayBillCriteria.id();
        wayBillCriteria.boxLimit();
        wayBillCriteria.shipmentType();
        wayBillCriteria.opfac();
        wayBillCriteria.deliveryAgent();
        wayBillCriteria.estimatedReadyDate();
        wayBillCriteria.currencyUom();
        wayBillCriteria.estimatedShipDate();
        wayBillCriteria.status();
        wayBillCriteria.referenceNumber();
        wayBillCriteria.currencyTypeId();
        wayBillCriteria.distinct();
    }

    private static Condition<WayBillCriteria> criteriaFiltersAre(Function<Object, Boolean> condition) {
        return new Condition<>(
            criteria ->
                condition.apply(criteria.getId()) &&
                condition.apply(criteria.getBoxLimit()) &&
                condition.apply(criteria.getShipmentType()) &&
                condition.apply(criteria.getOpfac()) &&
                condition.apply(criteria.getDeliveryAgent()) &&
                condition.apply(criteria.getEstimatedReadyDate()) &&
                condition.apply(criteria.getCurrencyUom()) &&
                condition.apply(criteria.getEstimatedShipDate()) &&
                condition.apply(criteria.getStatus()) &&
                condition.apply(criteria.getReferenceNumber()) &&
                condition.apply(criteria.getCurrencyTypeId()) &&
                condition.apply(criteria.getDistinct()),
            "every filter matches"
        );
    }

    private static Condition<WayBillCriteria> copyFiltersAre(WayBillCriteria copy, BiFunction<Object, Object, Boolean> condition) {
        return new Condition<>(
            criteria ->
                condition.apply(criteria.getId(), copy.getId()) &&
                condition.apply(criteria.getBoxLimit(), copy.getBoxLimit()) &&
                condition.apply(criteria.getShipmentType(), copy.getShipmentType()) &&
                condition.apply(criteria.getOpfac(), copy.getOpfac()) &&
                condition.apply(criteria.getDeliveryAgent(), copy.getDeliveryAgent()) &&
                condition.apply(criteria.getEstimatedReadyDate(), copy.getEstimatedReadyDate()) &&
                condition.apply(criteria.getCurrencyUom(), copy.getCurrencyUom()) &&
                condition.apply(criteria.getEstimatedShipDate(), copy.getEstimatedShipDate()) &&
                condition.apply(criteria.getStatus(), copy.getStatus()) &&
                condition.apply(criteria.getReferenceNumber(), copy.getReferenceNumber()) &&
                condition.apply(criteria.getCurrencyTypeId(), copy.getCurrencyTypeId()) &&
                condition.apply(criteria.getDistinct(), copy.getDistinct()),
            "every filter matches"
        );
    }
}
