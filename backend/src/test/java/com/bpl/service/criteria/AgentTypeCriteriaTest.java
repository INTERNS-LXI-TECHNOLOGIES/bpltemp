package com.bpl.service.criteria;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.Objects;
import java.util.function.BiFunction;
import java.util.function.Function;
import org.assertj.core.api.Condition;
import org.junit.jupiter.api.Test;

class AgentTypeCriteriaTest {

    @Test
    void newAgentTypeCriteriaHasAllFiltersNullTest() {
        var agentTypeCriteria = new AgentTypeCriteria();
        assertThat(agentTypeCriteria).is(criteriaFiltersAre(Objects::isNull));
    }

    @Test
    void agentTypeCriteriaFluentMethodsCreatesFiltersTest() {
        var agentTypeCriteria = new AgentTypeCriteria();

        setAllFilters(agentTypeCriteria);

        assertThat(agentTypeCriteria).is(criteriaFiltersAre(Objects::nonNull));
    }

    @Test
    void agentTypeCriteriaCopyCreatesNullFilterTest() {
        var agentTypeCriteria = new AgentTypeCriteria();
        var copy = agentTypeCriteria.copy();

        assertThat(agentTypeCriteria).satisfies(
            criteria ->
                assertThat(criteria).is(
                    copyFiltersAre(copy, (a, b) -> (a == null || a instanceof Boolean) ? a == b : (a != b && a.equals(b)))
                ),
            criteria -> assertThat(criteria).isEqualTo(copy),
            criteria -> assertThat(criteria).hasSameHashCodeAs(copy)
        );

        assertThat(copy).satisfies(
            criteria -> assertThat(criteria).is(criteriaFiltersAre(Objects::isNull)),
            criteria -> assertThat(criteria).isEqualTo(agentTypeCriteria)
        );
    }

    @Test
    void agentTypeCriteriaCopyDuplicatesEveryExistingFilterTest() {
        var agentTypeCriteria = new AgentTypeCriteria();
        setAllFilters(agentTypeCriteria);

        var copy = agentTypeCriteria.copy();

        assertThat(agentTypeCriteria).satisfies(
            criteria ->
                assertThat(criteria).is(
                    copyFiltersAre(copy, (a, b) -> (a == null || a instanceof Boolean) ? a == b : (a != b && a.equals(b)))
                ),
            criteria -> assertThat(criteria).isEqualTo(copy),
            criteria -> assertThat(criteria).hasSameHashCodeAs(copy)
        );

        assertThat(copy).satisfies(
            criteria -> assertThat(criteria).is(criteriaFiltersAre(Objects::nonNull)),
            criteria -> assertThat(criteria).isEqualTo(agentTypeCriteria)
        );
    }

    @Test
    void toStringVerifier() {
        var agentTypeCriteria = new AgentTypeCriteria();

        assertThat(agentTypeCriteria).hasToString("AgentTypeCriteria{}");
    }

    private static void setAllFilters(AgentTypeCriteria agentTypeCriteria) {
        agentTypeCriteria.id();
        agentTypeCriteria.name();
        agentTypeCriteria.description();
        agentTypeCriteria.organisationId();
        agentTypeCriteria.distinct();
    }

    private static Condition<AgentTypeCriteria> criteriaFiltersAre(Function<Object, Boolean> condition) {
        return new Condition<>(
            criteria ->
                condition.apply(criteria.getId()) &&
                condition.apply(criteria.getName()) &&
                condition.apply(criteria.getDescription()) &&
                condition.apply(criteria.getOrganisationId()) &&
                condition.apply(criteria.getDistinct()),
            "every filter matches"
        );
    }

    private static Condition<AgentTypeCriteria> copyFiltersAre(AgentTypeCriteria copy, BiFunction<Object, Object, Boolean> condition) {
        return new Condition<>(
            criteria ->
                condition.apply(criteria.getId(), copy.getId()) &&
                condition.apply(criteria.getName(), copy.getName()) &&
                condition.apply(criteria.getDescription(), copy.getDescription()) &&
                condition.apply(criteria.getOrganisationId(), copy.getOrganisationId()) &&
                condition.apply(criteria.getDistinct(), copy.getDistinct()),
            "every filter matches"
        );
    }
}
