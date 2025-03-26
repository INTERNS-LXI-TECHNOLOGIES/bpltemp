package com.bpl.service.dto;

import jakarta.validation.constraints.*;
import java.io.Serializable;
import java.util.Objects;

/**
 * A DTO for the {@link com.bpl.domain.Organisation} entity.
 */
@SuppressWarnings("common-java:DuplicatedBlocks")
public class OrganisationDTO implements Serializable {

    private Long id;

    @NotNull
    private String name;

    private AgentTypeDTO agentType;

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

    public AgentTypeDTO getAgentType() {
        return agentType;
    }

    public void setAgentType(AgentTypeDTO agentType) {
        this.agentType = agentType;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof OrganisationDTO)) {
            return false;
        }

        OrganisationDTO organisationDTO = (OrganisationDTO) o;
        if (this.id == null) {
            return false;
        }
        return Objects.equals(this.id, organisationDTO.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(this.id);
    }

    // prettier-ignore
    @Override
    public String toString() {
        return "OrganisationDTO{" +
            "id=" + getId() +
            ", name='" + getName() + "'" +
            ", agentType=" + getAgentType() +
            "}";
    }
}
