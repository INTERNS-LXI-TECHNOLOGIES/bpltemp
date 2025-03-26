package com.diviso.repository;

import com.diviso.domain.ShipmentMethod;
import com.diviso.repository.rowmapper.FacilityTypeRowMapper;
import com.diviso.repository.rowmapper.ShipmentMethodRowMapper;
import io.r2dbc.spi.Row;
import io.r2dbc.spi.RowMetadata;
import java.util.List;
import org.springframework.data.domain.Pageable;
import org.springframework.data.r2dbc.convert.R2dbcConverter;
import org.springframework.data.r2dbc.core.R2dbcEntityOperations;
import org.springframework.data.r2dbc.core.R2dbcEntityTemplate;
import org.springframework.data.r2dbc.repository.support.SimpleR2dbcRepository;
import org.springframework.data.relational.core.sql.Column;
import org.springframework.data.relational.core.sql.Comparison;
import org.springframework.data.relational.core.sql.Condition;
import org.springframework.data.relational.core.sql.Conditions;
import org.springframework.data.relational.core.sql.Expression;
import org.springframework.data.relational.core.sql.Select;
import org.springframework.data.relational.core.sql.SelectBuilder.SelectFromAndJoinCondition;
import org.springframework.data.relational.core.sql.Table;
import org.springframework.data.relational.repository.support.MappingRelationalEntityInformation;
import org.springframework.r2dbc.core.DatabaseClient;
import org.springframework.r2dbc.core.RowsFetchSpec;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

/**
 * Spring Data R2DBC custom repository implementation for the ShipmentMethod entity.
 */
@SuppressWarnings("unused")
class ShipmentMethodRepositoryInternalImpl extends SimpleR2dbcRepository<ShipmentMethod, Long> implements ShipmentMethodRepositoryInternal {

    private final DatabaseClient db;
    private final R2dbcEntityTemplate r2dbcEntityTemplate;
    private final EntityManager entityManager;

    private final FacilityTypeRowMapper facilitytypeMapper;
    private final ShipmentMethodRowMapper shipmentmethodMapper;

    private static final Table entityTable = Table.aliased("shipment_method", EntityManager.ENTITY_ALIAS);
    private static final Table parentTypeTable = Table.aliased("facility_type", "parentType");

    public ShipmentMethodRepositoryInternalImpl(
        R2dbcEntityTemplate template,
        EntityManager entityManager,
        FacilityTypeRowMapper facilitytypeMapper,
        ShipmentMethodRowMapper shipmentmethodMapper,
        R2dbcEntityOperations entityOperations,
        R2dbcConverter converter
    ) {
        super(
            new MappingRelationalEntityInformation(converter.getMappingContext().getRequiredPersistentEntity(ShipmentMethod.class)),
            entityOperations,
            converter
        );
        this.db = template.getDatabaseClient();
        this.r2dbcEntityTemplate = template;
        this.entityManager = entityManager;
        this.facilitytypeMapper = facilitytypeMapper;
        this.shipmentmethodMapper = shipmentmethodMapper;
    }

    @Override
    public Flux<ShipmentMethod> findAllBy(Pageable pageable) {
        return createQuery(pageable, null).all();
    }

    RowsFetchSpec<ShipmentMethod> createQuery(Pageable pageable, Condition whereClause) {
        List<Expression> columns = ShipmentMethodSqlHelper.getColumns(entityTable, EntityManager.ENTITY_ALIAS);
        columns.addAll(FacilityTypeSqlHelper.getColumns(parentTypeTable, "parentType"));
        SelectFromAndJoinCondition selectFrom = Select.builder()
            .select(columns)
            .from(entityTable)
            .leftOuterJoin(parentTypeTable)
            .on(Column.create("parent_type_id", entityTable))
            .equals(Column.create("id", parentTypeTable));
        // we do not support Criteria here for now as of https://github.com/jhipster/generator-jhipster/issues/18269
        String select = entityManager.createSelect(selectFrom, ShipmentMethod.class, pageable, whereClause);
        return db.sql(select).map(this::process);
    }

    @Override
    public Flux<ShipmentMethod> findAll() {
        return findAllBy(null);
    }

    @Override
    public Mono<ShipmentMethod> findById(Long id) {
        Comparison whereClause = Conditions.isEqual(entityTable.column("id"), Conditions.just(id.toString()));
        return createQuery(null, whereClause).one();
    }

    @Override
    public Mono<ShipmentMethod> findOneWithEagerRelationships(Long id) {
        return findById(id);
    }

    @Override
    public Flux<ShipmentMethod> findAllWithEagerRelationships() {
        return findAll();
    }

    @Override
    public Flux<ShipmentMethod> findAllWithEagerRelationships(Pageable page) {
        return findAllBy(page);
    }

    private ShipmentMethod process(Row row, RowMetadata metadata) {
        ShipmentMethod entity = shipmentmethodMapper.apply(row, "e");
        entity.setParentType(facilitytypeMapper.apply(row, "parentType"));
        return entity;
    }

    @Override
    public <S extends ShipmentMethod> Mono<S> save(S entity) {
        return super.save(entity);
    }
}
