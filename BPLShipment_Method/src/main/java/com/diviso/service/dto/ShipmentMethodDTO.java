package com.diviso.service.dto;

import jakarta.validation.constraints.*;
import java.io.Serializable;
import java.util.Objects;

/**
 * A DTO for the {@link com.diviso.domain.ShipmentMethod} entity.
 */
@SuppressWarnings("common-java:DuplicatedBlocks")
public class ShipmentMethodDTO implements Serializable {

    private Long id;

    @NotNull(message = "must not be null")
    @Size(max = 100)
    private String name;

    @Size(max = 255)
    private String description;

    private FacilityTypeDTO parentType;

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public FacilityTypeDTO getParentType() {
        return parentType;
    }

    public void setParentType(FacilityTypeDTO parentType) {
        this.parentType = parentType;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof ShipmentMethodDTO)) {
            return false;
        }

        ShipmentMethodDTO shipmentMethodDTO = (ShipmentMethodDTO) o;
        if (this.id == null) {
            return false;
        }
        return Objects.equals(this.id, shipmentMethodDTO.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(this.id);
    }

    // prettier-ignore
    @Override
    public String toString() {
        return "ShipmentMethodDTO{" +
            "id=" + getId() +
            ", name='" + getName() + "'" +
            ", description='" + getDescription() + "'" +
            ", parentType=" + getParentType() +
            "}";
    }
}
