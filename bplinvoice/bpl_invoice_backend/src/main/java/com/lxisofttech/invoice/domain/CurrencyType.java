package com.lxisofttech.invoice.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import java.io.Serializable;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * A CurrencyType.
 */
@Entity
@Table(name = "currency_type")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SuppressWarnings("common-java:DuplicatedBlocks")
public class CurrencyType implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "name")
    private String name;

    @JsonIgnoreProperties(value = { "currencyType" }, allowSetters = true)
    @OneToOne(fetch = FetchType.LAZY, mappedBy = "currencyType")
    private WayBill wayBill;

    // jhipster-needle-entity-add-field - JHipster will add fields here

    public Long getId() {
        return this.id;
    }

    public CurrencyType id(Long id) {
        this.setId(id);
        return this;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
    }

    public CurrencyType name(String name) {
        this.setName(name);
        return this;
    }

    public void setName(String name) {
        this.name = name;
    }

    public WayBill getWayBill() {
        return this.wayBill;
    }

    public void setWayBill(WayBill wayBill) {
        if (this.wayBill != null) {
            this.wayBill.setCurrencyType(null);
        }
        if (wayBill != null) {
            wayBill.setCurrencyType(this);
        }
        this.wayBill = wayBill;
    }

    public CurrencyType wayBill(WayBill wayBill) {
        this.setWayBill(wayBill);
        return this;
    }

    // jhipster-needle-entity-add-getters-setters - JHipster will add getters and setters here

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof CurrencyType)) {
            return false;
        }
        return getId() != null && getId().equals(((CurrencyType) o).getId());
    }

    @Override
    public int hashCode() {
        // see https://vladmihalcea.com/how-to-implement-equals-and-hashcode-using-the-jpa-entity-identifier/
        return getClass().hashCode();
    }

    // prettier-ignore
    @Override
    public String toString() {
        return "CurrencyType{" +
            "id=" + getId() +
            ", name='" + getName() + "'" +
            "}";
    }
}
