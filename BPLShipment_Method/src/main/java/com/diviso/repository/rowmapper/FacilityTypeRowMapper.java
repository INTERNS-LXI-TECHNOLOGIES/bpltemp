package com.diviso.repository.rowmapper;

import com.diviso.domain.FacilityType;
import io.r2dbc.spi.Row;
import java.util.function.BiFunction;
import org.springframework.stereotype.Service;

/**
 * Converter between {@link Row} to {@link FacilityType}, with proper type conversions.
 */
@Service
public class FacilityTypeRowMapper implements BiFunction<Row, String, FacilityType> {

    private final ColumnConverter converter;

    public FacilityTypeRowMapper(ColumnConverter converter) {
        this.converter = converter;
    }

    /**
     * Take a {@link Row} and a column prefix, and extract all the fields.
     * @return the {@link FacilityType} stored in the database.
     */
    @Override
    public FacilityType apply(Row row, String prefix) {
        FacilityType entity = new FacilityType();
        entity.setId(converter.fromRow(row, prefix + "_id", Long.class));
        entity.setName(converter.fromRow(row, prefix + "_name", String.class));
        return entity;
    }
}
