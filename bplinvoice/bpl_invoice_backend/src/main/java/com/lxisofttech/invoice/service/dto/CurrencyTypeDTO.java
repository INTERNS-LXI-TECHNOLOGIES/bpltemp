package com.lxisofttech.invoice.service.dto;

import jakarta.validation.constraints.*;
import java.io.Serializable;
import java.util.Objects;

/**
 * A DTO for the {@link com.lxisofttech.invoice.domain.CurrencyType} entity.
 */
@SuppressWarnings("common-java:DuplicatedBlocks")
public class CurrencyTypeDTO implements Serializable {

    private Long id;

    private String name;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof CurrencyTypeDTO)) {
            return false;
        }

        CurrencyTypeDTO currencyTypeDTO = (CurrencyTypeDTO) o;
        if (this.id == null) {
            return false;
        }
        return Objects.equals(this.id, currencyTypeDTO.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(this.id);
    }

    // prettier-ignore
    @Override
    public String toString() {
        return "CurrencyTypeDTO{" +
            "id=" + getId() +
            ", name='" + getName() + "'" +
            "}";
    }
}
