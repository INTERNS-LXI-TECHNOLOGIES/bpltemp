package com.diviso.service.dto;

import jakarta.validation.constraints.*;
import java.io.Serializable;
import java.util.Objects;

/**
 * A DTO for the {@link com.diviso.domain.FacilityType} entity.
 */
@SuppressWarnings("common-java:DuplicatedBlocks")
public class FacilityTypeDTO implements Serializable {

    private Long id;

    @NotNull(message = "must not be null")
    @Size(max = 100)
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
        if (!(o instanceof FacilityTypeDTO)) {
            return false;
        }

        FacilityTypeDTO facilityTypeDTO = (FacilityTypeDTO) o;
        if (this.id == null) {
            return false;
        }
        return Objects.equals(this.id, facilityTypeDTO.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(this.id);
    }

    // prettier-ignore
    @Override
    public String toString() {
        return "FacilityTypeDTO{" +
            "id=" + getId() +
            ", name='" + getName() + "'" +
            "}";
    }
}
