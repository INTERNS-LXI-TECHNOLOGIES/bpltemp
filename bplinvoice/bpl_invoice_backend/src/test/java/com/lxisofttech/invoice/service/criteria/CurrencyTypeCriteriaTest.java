package com.lxisofttech.invoice.service.criteria;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.Objects;
import java.util.function.BiFunction;
import java.util.function.Function;
import org.assertj.core.api.Condition;
import org.junit.jupiter.api.Test;

class CurrencyTypeCriteriaTest {

    @Test
    void newCurrencyTypeCriteriaHasAllFiltersNullTest() {
        var currencyTypeCriteria = new CurrencyTypeCriteria();
        assertThat(currencyTypeCriteria).is(criteriaFiltersAre(Objects::isNull));
    }

    @Test
    void currencyTypeCriteriaFluentMethodsCreatesFiltersTest() {
        var currencyTypeCriteria = new CurrencyTypeCriteria();

        setAllFilters(currencyTypeCriteria);

        assertThat(currencyTypeCriteria).is(criteriaFiltersAre(Objects::nonNull));
    }

    @Test
    void currencyTypeCriteriaCopyCreatesNullFilterTest() {
        var currencyTypeCriteria = new CurrencyTypeCriteria();
        var copy = currencyTypeCriteria.copy();

        assertThat(currencyTypeCriteria).satisfies(
            criteria ->
                assertThat(criteria).is(
                    copyFiltersAre(copy, (a, b) -> (a == null || a instanceof Boolean) ? a == b : (a != b && a.equals(b)))
                ),
            criteria -> assertThat(criteria).isEqualTo(copy),
            criteria -> assertThat(criteria).hasSameHashCodeAs(copy)
        );

        assertThat(copy).satisfies(
            criteria -> assertThat(criteria).is(criteriaFiltersAre(Objects::isNull)),
            criteria -> assertThat(criteria).isEqualTo(currencyTypeCriteria)
        );
    }

    @Test
    void currencyTypeCriteriaCopyDuplicatesEveryExistingFilterTest() {
        var currencyTypeCriteria = new CurrencyTypeCriteria();
        setAllFilters(currencyTypeCriteria);

        var copy = currencyTypeCriteria.copy();

        assertThat(currencyTypeCriteria).satisfies(
            criteria ->
                assertThat(criteria).is(
                    copyFiltersAre(copy, (a, b) -> (a == null || a instanceof Boolean) ? a == b : (a != b && a.equals(b)))
                ),
            criteria -> assertThat(criteria).isEqualTo(copy),
            criteria -> assertThat(criteria).hasSameHashCodeAs(copy)
        );

        assertThat(copy).satisfies(
            criteria -> assertThat(criteria).is(criteriaFiltersAre(Objects::nonNull)),
            criteria -> assertThat(criteria).isEqualTo(currencyTypeCriteria)
        );
    }

    @Test
    void toStringVerifier() {
        var currencyTypeCriteria = new CurrencyTypeCriteria();

        assertThat(currencyTypeCriteria).hasToString("CurrencyTypeCriteria{}");
    }

    private static void setAllFilters(CurrencyTypeCriteria currencyTypeCriteria) {
        currencyTypeCriteria.id();
        currencyTypeCriteria.name();
        currencyTypeCriteria.currencyTypeId();
        currencyTypeCriteria.distinct();
    }

    private static Condition<CurrencyTypeCriteria> criteriaFiltersAre(Function<Object, Boolean> condition) {
        return new Condition<>(
            criteria ->
                condition.apply(criteria.getId()) &&
                condition.apply(criteria.getName()) &&
                condition.apply(criteria.getCurrencyTypeId()) &&
                condition.apply(criteria.getDistinct()),
            "every filter matches"
        );
    }

    private static Condition<CurrencyTypeCriteria> copyFiltersAre(
        CurrencyTypeCriteria copy,
        BiFunction<Object, Object, Boolean> condition
    ) {
        return new Condition<>(
            criteria ->
                condition.apply(criteria.getId(), copy.getId()) &&
                condition.apply(criteria.getName(), copy.getName()) &&
                condition.apply(criteria.getCurrencyTypeId(), copy.getCurrencyTypeId()) &&
                condition.apply(criteria.getDistinct(), copy.getDistinct()),
            "every filter matches"
        );
    }
}
