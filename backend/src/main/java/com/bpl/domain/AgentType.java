package com.bpl.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * A AgentType.
 */
@Entity
@Table(name = "agent_type")
@SuppressWarnings("common-java:DuplicatedBlocks")
public class AgentType implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @NotNull
    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "description")
    private String description;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "agentType")
    @JsonIgnoreProperties(value = { "agentType" }, allowSetters = true)
    private Set<Organisation> organisations = new HashSet<>();

    // jhipster-needle-entity-add-field - JHipster will add fields here

    public Long getId() {
        return this.id;
    }

    public AgentType id(Long id) {
        this.setId(id);
        return this;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
    }

    public AgentType name(String name) {
        this.setName(name);
        return this;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return this.description;
    }

    public AgentType description(String description) {
        this.setDescription(description);
        return this;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Set<Organisation> getOrganisations() {
        return this.organisations;
    }

    public void setOrganisations(Set<Organisation> organisations) {
        if (this.organisations != null) {
            this.organisations.forEach(i -> i.setAgentType(null));
        }
        if (organisations != null) {
            organisations.forEach(i -> i.setAgentType(this));
        }
        this.organisations = organisations;
    }

    public AgentType organisations(Set<Organisation> organisations) {
        this.setOrganisations(organisations);
        return this;
    }

    public AgentType addOrganisation(Organisation organisation) {
        this.organisations.add(organisation);
        organisation.setAgentType(this);
        return this;
    }

    public AgentType removeOrganisation(Organisation organisation) {
        this.organisations.remove(organisation);
        organisation.setAgentType(null);
        return this;
    }

    // jhipster-needle-entity-add-getters-setters - JHipster will add getters and setters here

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof AgentType)) {
            return false;
        }
        return getId() != null && getId().equals(((AgentType) o).getId());
    }

    @Override
    public int hashCode() {
        // see https://vladmihalcea.com/how-to-implement-equals-and-hashcode-using-the-jpa-entity-identifier/
        return getClass().hashCode();
    }

    // prettier-ignore
    @Override
    public String toString() {
        return "AgentType{" +
            "id=" + getId() +
            ", name='" + getName() + "'" +
            ", description='" + getDescription() + "'" +
            "}";
    }
}
