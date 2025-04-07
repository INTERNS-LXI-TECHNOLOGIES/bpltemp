package com.lxisofttech.invoice.service.dto;

import java.io.Serializable;
import java.time.Instant;
import java.util.Objects;

/**
 * A DTO for the {@link com.lxisofttech.invoice.domain.WayBill} entity.
 */
@SuppressWarnings("common-java:DuplicatedBlocks")
public class WayBillDTO implements Serializable {

    private Long id;

    private Integer boxLimit;

    private String shipmentType;

    private String opfac;

    private String deliveryAgent;

    private Instant estimatedReadyDate;

    private String currencyUom;

    private Instant estimatedShipDate;

    private String status;

    private String referenceNumber;

    private CurrencyTypeDTO currencyType;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getBoxLimit() {
        return boxLimit;
    }

    public void setBoxLimit(Integer boxLimit) {
        this.boxLimit = boxLimit;
    }

    public String getShipmentType() {
        return shipmentType;
    }

    public void setShipmentType(String shipmentType) {
        this.shipmentType = shipmentType;
    }

    public String getOpfac() {
        return opfac;
    }

    public void setOpfac(String opfac) {
        this.opfac = opfac;
    }

    public String getDeliveryAgent() {
        return deliveryAgent;
    }

    public void setDeliveryAgent(String deliveryAgent) {
        this.deliveryAgent = deliveryAgent;
    }

    public Instant getEstimatedReadyDate() {
        return estimatedReadyDate;
    }

    public void setEstimatedReadyDate(Instant estimatedReadyDate) {
        this.estimatedReadyDate = estimatedReadyDate;
    }

    public String getCurrencyUom() {
        return currencyUom;
    }

    public void setCurrencyUom(String currencyUom) {
        this.currencyUom = currencyUom;
    }

    public Instant getEstimatedShipDate() {
        return estimatedShipDate;
    }

    public void setEstimatedShipDate(Instant estimatedShipDate) {
        this.estimatedShipDate = estimatedShipDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getReferenceNumber() {
        return referenceNumber;
    }

    public void setReferenceNumber(String referenceNumber) {
        this.referenceNumber = referenceNumber;
    }

    public CurrencyTypeDTO getCurrencyType() {
        return currencyType;
    }

    public void setCurrencyType(CurrencyTypeDTO currencyType) {
        this.currencyType = currencyType;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof WayBillDTO)) {
            return false;
        }

        WayBillDTO wayBillDTO = (WayBillDTO) o;
        if (this.id == null) {
            return false;
        }
        return Objects.equals(this.id, wayBillDTO.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(this.id);
    }

    // prettier-ignore
    @Override
    public String toString() {
        return "WayBillDTO{" +
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
            ", currencyType=" + getCurrencyType() +
            "}";
    }
}
