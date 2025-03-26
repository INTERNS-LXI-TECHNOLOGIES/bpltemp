package com.diviso.domain;

import jakarta.validation.constraints.*;
import java.io.Serializable;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

/**
 * A ShipmentMethod.
 */
@Table("shipment_method")
@SuppressWarnings("common-java:DuplicatedBlocks")
public class ShipmentMethod implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column("id")
    private Long id;

    @NotNull(message = "must not be null")
    @Size(max = 100)
    @Column("name")
    private String name;

    @Size(max = 255)
    @Column("description")
    private String description;

    @org.springframework.data.annotation.Transient
    private FacilityType parentType;

    @Column("parent_type_id")
    private Long parentTypeId;

    // jhipster-needle-entity-add-field - JHipster will add fields here

    public Long getId() {
        return this.id;
    }

    public ShipmentMethod id(Long id) {
        this.setId(id);
        return this;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
    }

    public ShipmentMethod name(String name) {
        this.setName(name);
        return this;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return this.description;
    }

    public ShipmentMethod description(String description) {
        this.setDescription(description);
        return this;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public FacilityType getParentType() {
        return this.parentType;
    }

    public void setParentType(FacilityType facilityType) {
        this.parentType = facilityType;
        this.parentTypeId = facilityType != null ? facilityType.getId() : null;
    }

    public ShipmentMethod parentType(FacilityType facilityType) {
        this.setParentType(facilityType);
        return this;
    }

    public Long getParentTypeId() {
        return this.parentTypeId;
    }

    public void setParentTypeId(Long facilityType) {
        this.parentTypeId = facilityType;
    }

    // jhipster-needle-entity-add-getters-setters - JHipster will add getters and setters here

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof ShipmentMethod)) {
            return false;
        }
        return getId() != null && getId().equals(((ShipmentMethod) o).getId());
    }

    @Override
    public int hashCode() {
        // see https://vladmihalcea.com/how-to-implement-equals-and-hashcode-using-the-jpa-entity-identifier/
        return getClass().hashCode();
    }

    // prettier-ignore
    @Override
    public String toString() {
        return "ShipmentMethod{" +
            "id=" + getId() +
            ", name='" + getName() + "'" +
            ", description='" + getDescription() + "'" +
            "}";
    }
}
