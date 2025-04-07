package com.lxisofttech.invoice.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
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

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "currencyType")
    @Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
    @JsonIgnoreProperties(value = { "currencyType" }, allowSetters = true)
    private Set<WayBill> currencyTypes = new HashSet<>();

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

    public Set<WayBill> getCurrencyTypes() {
        return this.currencyTypes;
    }

    public void setCurrencyTypes(Set<WayBill> wayBills) {
        if (this.currencyTypes != null) {
            this.currencyTypes.forEach(i -> i.setCurrencyType(null));
        }
        if (wayBills != null) {
            wayBills.forEach(i -> i.setCurrencyType(this));
        }
        this.currencyTypes = wayBills;
    }

    public CurrencyType currencyTypes(Set<WayBill> wayBills) {
        this.setCurrencyTypes(wayBills);
        return this;
    }

    public CurrencyType addCurrencyType(WayBill wayBill) {
        this.currencyTypes.add(wayBill);
        wayBill.setCurrencyType(this);
        return this;
    }

    public CurrencyType removeCurrencyType(WayBill wayBill) {
        this.currencyTypes.remove(wayBill);
        wayBill.setCurrencyType(null);
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
