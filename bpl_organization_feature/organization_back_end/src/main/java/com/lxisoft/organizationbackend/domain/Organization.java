package com.lxisoft.organizationbackend.domain;

import jakarta.persistence.*;
import java.io.Serializable;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * A Organization.
 */
@Entity
@Table(name = "organization")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SuppressWarnings("common-java:DuplicatedBlocks")
public class Organization implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "external_id")
    private Integer externalId;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "organization_type")
    private String organizationType;

    @Column(name = "organization_group")
    private String organizationGroup;

    @Column(name = "parent_organization")
    private String parentOrganization;

    // jhipster-needle-entity-add-field - JHipster will add fields here

    public Long getId() {
        return this.id;
    }

    public Organization id(Long id) {
        this.setId(id);
        return this;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getExternalId() {
        return this.externalId;
    }

    public Organization externalId(Integer externalId) {
        this.setExternalId(externalId);
        return this;
    }

    public void setExternalId(Integer externalId) {
        this.externalId = externalId;
    }

    public String getName() {
        return this.name;
    }

    public Organization name(String name) {
        this.setName(name);
        return this;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return this.description;
    }

    public Organization description(String description) {
        this.setDescription(description);
        return this;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getOrganizationType() {
        return this.organizationType;
    }

    public Organization organizationType(String organizationType) {
        this.setOrganizationType(organizationType);
        return this;
    }

    public void setOrganizationType(String organizationType) {
        this.organizationType = organizationType;
    }

    public String getOrganizationGroup() {
        return this.organizationGroup;
    }

    public Organization organizationGroup(String organizationGroup) {
        this.setOrganizationGroup(organizationGroup);
        return this;
    }

    public void setOrganizationGroup(String organizationGroup) {
        this.organizationGroup = organizationGroup;
    }

    public String getParentOrganization() {
        return this.parentOrganization;
    }

    public Organization parentOrganization(String parentOrganization) {
        this.setParentOrganization(parentOrganization);
        return this;
    }

    public void setParentOrganization(String parentOrganization) {
        this.parentOrganization = parentOrganization;
    }

    // jhipster-needle-entity-add-getters-setters - JHipster will add getters and setters here

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof Organization)) {
            return false;
        }
        return getId() != null && getId().equals(((Organization) o).getId());
    }

    @Override
    public int hashCode() {
        // see https://vladmihalcea.com/how-to-implement-equals-and-hashcode-using-the-jpa-entity-identifier/
        return getClass().hashCode();
    }

    // prettier-ignore
    @Override
    public String toString() {
        return "Organization{" +
            "id=" + getId() +
            ", externalId=" + getExternalId() +
            ", name='" + getName() + "'" +
            ", description='" + getDescription() + "'" +
            ", organizationType='" + getOrganizationType() + "'" +
            ", organizationGroup='" + getOrganizationGroup() + "'" +
            ", parentOrganization='" + getParentOrganization() + "'" +
            "}";
    }
}
