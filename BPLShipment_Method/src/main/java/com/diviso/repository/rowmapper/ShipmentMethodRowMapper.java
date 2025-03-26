package com.diviso.repository.rowmapper;

import com.diviso.domain.ShipmentMethod;
import io.r2dbc.spi.Row;
import java.util.function.BiFunction;
import org.springframework.stereotype.Service;

/**
 * Converter between {@link Row} to {@link ShipmentMethod}, with proper type conversions.
 */
@Service
public class ShipmentMethodRowMapper implements BiFunction<Row, String, ShipmentMethod> {

    private final ColumnConverter converter;

    public ShipmentMethodRowMapper(ColumnConverter converter) {
        this.converter = converter;
    }

    /**
     * Take a {@link Row} and a column prefix, and extract all the fields.
     * @return the {@link ShipmentMethod} stored in the database.
     */
    @Override
    public ShipmentMethod apply(Row row, String prefix) {
        ShipmentMethod entity = new ShipmentMethod();
        entity.setId(converter.fromRow(row, prefix + "_id", Long.class));
        entity.setName(converter.fromRow(row, prefix + "_name", String.class));
        entity.setDescription(converter.fromRow(row, prefix + "_description", String.class));
        entity.setParentTypeId(converter.fromRow(row, prefix + "_parent_type_id", Long.class));
        return entity;
    }
}
