package com.lxisofttech.invoice.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import java.io.Serializable;
import java.time.Instant;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * A WayBill.
 */
@Entity
@Table(name = "way_bill")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SuppressWarnings("common-java:DuplicatedBlocks")
public class WayBill implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "box_limit")
    private Integer boxLimit;

    @Column(name = "shipment_type")
    private String shipmentType;

    @Column(name = "opfac")
    private String opfac;

    @Column(name = "delivery_agent")
    private String deliveryAgent;

    @Column(name = "estimated_ready_date")
    private Instant estimatedReadyDate;

    @Column(name = "currency_uom")
    private String currencyUom;

    @Column(name = "estimated_ship_date")
    private Instant estimatedShipDate;

    @Column(name = "status")
    private String status;

    @Column(name = "reference_number")
    private String referenceNumber;

    @JsonIgnoreProperties(value = { "wayBill" }, allowSetters = true)
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(unique = true)
    private CurrencyType currencyType;

    // jhipster-needle-entity-add-field - JHipster will add fields here

    public Long getId() {
        return this.id;
    }

    public WayBill id(Long id) {
        this.setId(id);
        return this;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getBoxLimit() {
        return this.boxLimit;
    }

    public WayBill boxLimit(Integer boxLimit) {
        this.setBoxLimit(boxLimit);
        return this;
    }

    public void setBoxLimit(Integer boxLimit) {
        this.boxLimit = boxLimit;
    }

    public String getShipmentType() {
        return this.shipmentType;
    }

    public WayBill shipmentType(String shipmentType) {
        this.setShipmentType(shipmentType);
        return this;
    }

    public void setShipmentType(String shipmentType) {
        this.shipmentType = shipmentType;
    }

    public String getOpfac() {
        return this.opfac;
    }

    public WayBill opfac(String opfac) {
        this.setOpfac(opfac);
        return this;
    }

    public void setOpfac(String opfac) {
        this.opfac = opfac;
    }

    public String getDeliveryAgent() {
        return this.deliveryAgent;
    }

    public WayBill deliveryAgent(String deliveryAgent) {
        this.setDeliveryAgent(deliveryAgent);
        return this;
    }

    public void setDeliveryAgent(String deliveryAgent) {
        this.deliveryAgent = deliveryAgent;
    }

    public Instant getEstimatedReadyDate() {
        return this.estimatedReadyDate;
    }

    public WayBill estimatedReadyDate(Instant estimatedReadyDate) {
        this.setEstimatedReadyDate(estimatedReadyDate);
        return this;
    }

    public void setEstimatedReadyDate(Instant estimatedReadyDate) {
        this.estimatedReadyDate = estimatedReadyDate;
    }

    public String getCurrencyUom() {
        return this.currencyUom;
    }

    public WayBill currencyUom(String currencyUom) {
        this.setCurrencyUom(currencyUom);
        return this;
    }

    public void setCurrencyUom(String currencyUom) {
        this.currencyUom = currencyUom;
    }

    public Instant getEstimatedShipDate() {
        return this.estimatedShipDate;
    }

    public WayBill estimatedShipDate(Instant estimatedShipDate) {
        this.setEstimatedShipDate(estimatedShipDate);
        return this;
    }

    public void setEstimatedShipDate(Instant estimatedShipDate) {
        this.estimatedShipDate = estimatedShipDate;
    }

    public String getStatus() {
        return this.status;
    }

    public WayBill status(String status) {
        this.setStatus(status);
        return this;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getReferenceNumber() {
        return this.referenceNumber;
    }

    public WayBill referenceNumber(String referenceNumber) {
        this.setReferenceNumber(referenceNumber);
        return this;
    }

    public void setReferenceNumber(String referenceNumber) {
        this.referenceNumber = referenceNumber;
    }

    public CurrencyType getCurrencyType() {
        return this.currencyType;
    }

    public void setCurrencyType(CurrencyType currencyType) {
        this.currencyType = currencyType;
    }

    public WayBill currencyType(CurrencyType currencyType) {
        this.setCurrencyType(currencyType);
        return this;
    }

    // jhipster-needle-entity-add-getters-setters - JHipster will add getters and setters here

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof WayBill)) {
            return false;
        }
        return getId() != null && getId().equals(((WayBill) o).getId());
    }

    @Override
    public int hashCode() {
        // see https://vladmihalcea.com/how-to-implement-equals-and-hashcode-using-the-jpa-entity-identifier/
        return getClass().hashCode();
    }

    // prettier-ignore
    @Override
    public String toString() {
        return "WayBill{" +
            "id=" + getId() +
            ", boxLimit=" + getBoxLimit() +
            ", shipmentType='" + getShipmentType() + "'" +
            ", opfac='" + getOpfac() + "'" +
            ", deliveryAgent='" + getDeliveryAgent() + "'" +
            ", estimatedReadyDate='" + getEstimatedReadyDate() + "'" +
            ", currencyUom='" + getCurrencyUom() + "'" +
            ", estimatedShipDate='" + getEstimatedShipDate() + "'" +
            ", status='" + getStatus() + "'" +
            ", referenceNumber='" + getReferenceNumber() + "'" +
            "}";
    }
}
