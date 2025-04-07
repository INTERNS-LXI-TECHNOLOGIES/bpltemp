package com.lxisofttech.invoice.service.criteria;

import java.io.Serializable;
import java.util.Objects;
import java.util.Optional;
import org.springdoc.core.annotations.ParameterObject;
import tech.jhipster.service.Criteria;
import tech.jhipster.service.filter.*;

/**
 * Criteria class for the {@link com.lxisofttech.invoice.domain.WayBill} entity. This class is used
 * in {@link com.lxisofttech.invoice.web.rest.WayBillResource} to receive all the possible filtering options from
 * the Http GET request parameters.
 * For example the following could be a valid request:
 * {@code /way-bills?id.greaterThan=5&attr1.contains=something&attr2.specified=false}
 * As Spring is unable to properly convert the types, unless specific {@link Filter} class are used, we need to use
 * fix type specific filters.
 */
@ParameterObject
@SuppressWarnings("common-java:DuplicatedBlocks")
public class WayBillCriteria implements Serializable, Criteria {

    private static final long serialVersionUID = 1L;

    private LongFilter id;

    private IntegerFilter boxLimit;

    private StringFilter shipmentType;

    private StringFilter opfac;

    private StringFilter deliveryAgent;

    private InstantFilter estimatedReadyDate;

    private StringFilter currencyUom;

    private InstantFilter estimatedShipDate;

    private StringFilter status;

    private StringFilter referenceNumber;

    private LongFilter currencyTypeId;

    private Boolean distinct;

    public WayBillCriteria() {}

    public WayBillCriteria(WayBillCriteria other) {
        this.id = other.optionalId().map(LongFilter::copy).orElse(null);
        this.boxLimit = other.optionalBoxLimit().map(IntegerFilter::copy).orElse(null);
        this.shipmentType = other.optionalShipmentType().map(StringFilter::copy).orElse(null);
        this.opfac = other.optionalOpfac().map(StringFilter::copy).orElse(null);
        this.deliveryAgent = other.optionalDeliveryAgent().map(StringFilter::copy).orElse(null);
        this.estimatedReadyDate = other.optionalEstimatedReadyDate().map(InstantFilter::copy).orElse(null);
        this.currencyUom = other.optionalCurrencyUom().map(StringFilter::copy).orElse(null);
        this.estimatedShipDate = other.optionalEstimatedShipDate().map(InstantFilter::copy).orElse(null);
        this.status = other.optionalStatus().map(StringFilter::copy).orElse(null);
        this.referenceNumber = other.optionalReferenceNumber().map(StringFilter::copy).orElse(null);
        this.currencyTypeId = other.optionalCurrencyTypeId().map(LongFilter::copy).orElse(null);
        this.distinct = other.distinct;
    }

    @Override
    public WayBillCriteria copy() {
        return new WayBillCriteria(this);
    }

    public LongFilter getId() {
        return id;
    }

    public Optional<LongFilter> optionalId() {
        return Optional.ofNullable(id);
    }

    public LongFilter id() {
        if (id == null) {
            setId(new LongFilter());
        }
        return id;
    }

    public void setId(LongFilter id) {
        this.id = id;
    }

    public IntegerFilter getBoxLimit() {
        return boxLimit;
    }

    public Optional<IntegerFilter> optionalBoxLimit() {
        return Optional.ofNullable(boxLimit);
    }

    public IntegerFilter boxLimit() {
        if (boxLimit == null) {
            setBoxLimit(new IntegerFilter());
        }
        return boxLimit;
    }

    public void setBoxLimit(IntegerFilter boxLimit) {
        this.boxLimit = boxLimit;
    }

    public StringFilter getShipmentType() {
        return shipmentType;
    }

    public Optional<StringFilter> optionalShipmentType() {
        return Optional.ofNullable(shipmentType);
    }

    public StringFilter shipmentType() {
        if (shipmentType == null) {
            setShipmentType(new StringFilter());
        }
        return shipmentType;
    }

    public void setShipmentType(StringFilter shipmentType) {
        this.shipmentType = shipmentType;
    }

    public StringFilter getOpfac() {
        return opfac;
    }

    public Optional<StringFilter> optionalOpfac() {
        return Optional.ofNullable(opfac);
    }

    public StringFilter opfac() {
        if (opfac == null) {
            setOpfac(new StringFilter());
        }
        return opfac;
    }

    public void setOpfac(StringFilter opfac) {
        this.opfac = opfac;
    }

    public StringFilter getDeliveryAgent() {
        return deliveryAgent;
    }

    public Optional<StringFilter> optionalDeliveryAgent() {
        return Optional.ofNullable(deliveryAgent);
    }

    public StringFilter deliveryAgent() {
        if (deliveryAgent == null) {
            setDeliveryAgent(new StringFilter());
        }
        return deliveryAgent;
    }

    public void setDeliveryAgent(StringFilter deliveryAgent) {
        this.deliveryAgent = deliveryAgent;
    }

    public InstantFilter getEstimatedReadyDate() {
        return estimatedReadyDate;
    }

    public Optional<InstantFilter> optionalEstimatedReadyDate() {
        return Optional.ofNullable(estimatedReadyDate);
    }

    public InstantFilter estimatedReadyDate() {
        if (estimatedReadyDate == null) {
            setEstimatedReadyDate(new InstantFilter());
        }
        return estimatedReadyDate;
    }

    public void setEstimatedReadyDate(InstantFilter estimatedReadyDate) {
        this.estimatedReadyDate = estimatedReadyDate;
    }

    public StringFilter getCurrencyUom() {
        return currencyUom;
    }

    public Optional<StringFilter> optionalCurrencyUom() {
        return Optional.ofNullable(currencyUom);
    }

    public StringFilter currencyUom() {
        if (currencyUom == null) {
            setCurrencyUom(new StringFilter());
        }
        return currencyUom;
    }

    public void setCurrencyUom(StringFilter currencyUom) {
        this.currencyUom = currencyUom;
    }

    public InstantFilter getEstimatedShipDate() {
        return estimatedShipDate;
    }

    public Optional<InstantFilter> optionalEstimatedShipDate() {
        return Optional.ofNullable(estimatedShipDate);
    }

    public InstantFilter estimatedShipDate() {
        if (estimatedShipDate == null) {
            setEstimatedShipDate(new InstantFilter());
        }
        return estimatedShipDate;
    }

    public void setEstimatedShipDate(InstantFilter estimatedShipDate) {
        this.estimatedShipDate = estimatedShipDate;
    }

    public StringFilter getStatus() {
        return status;
    }

    public Optional<StringFilter> optionalStatus() {
        return Optional.ofNullable(status);
    }

    public StringFilter status() {
        if (status == null) {
            setStatus(new StringFilter());
        }
        return status;
    }

    public void setStatus(StringFilter status) {
        this.status = status;
    }

    public StringFilter getReferenceNumber() {
        return referenceNumber;
    }

    public Optional<StringFilter> optionalReferenceNumber() {
        return Optional.ofNullable(referenceNumber);
    }

    public StringFilter referenceNumber() {
        if (referenceNumber == null) {
            setReferenceNumber(new StringFilter());
        }
        return referenceNumber;
    }

    public void setReferenceNumber(StringFilter referenceNumber) {
        this.referenceNumber = referenceNumber;
    }

    public LongFilter getCurrencyTypeId() {
        return currencyTypeId;
    }

    public Optional<LongFilter> optionalCurrencyTypeId() {
        return Optional.ofNullable(currencyTypeId);
    }

    public LongFilter currencyTypeId() {
        if (currencyTypeId == null) {
            setCurrencyTypeId(new LongFilter());
        }
        return currencyTypeId;
    }

    public void setCurrencyTypeId(LongFilter currencyTypeId) {
        this.currencyTypeId = currencyTypeId;
    }

    public Boolean getDistinct() {
        return distinct;
    }

    public Optional<Boolean> optionalDistinct() {
        return Optional.ofNullable(distinct);
    }

    public Boolean distinct() {
        if (distinct == null) {
            setDistinct(true);
        }
        return distinct;
    }

    public void setDistinct(Boolean distinct) {
        this.distinct = distinct;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        final WayBillCriteria that = (WayBillCriteria) o;
        return (
            Objects.equals(id, that.id) &&
            Objects.equals(boxLimit, that.boxLimit) &&
            Objects.equals(shipmentType, that.shipmentType) &&
            Objects.equals(opfac, that.opfac) &&
            Objects.equals(deliveryAgent, that.deliveryAgent) &&
            Objects.equals(estimatedReadyDate, that.estimatedReadyDate) &&
            Objects.equals(currencyUom, that.currencyUom) &&
            Objects.equals(estimatedShipDate, that.estimatedShipDate) &&
            Objects.equals(status, that.status) &&
            Objects.equals(referenceNumber, that.referenceNumber) &&
            Objects.equals(currencyTypeId, that.currencyTypeId) &&
            Objects.equals(distinct, that.distinct)
        );
    }

    @Override
    public int hashCode() {
        return Objects.hash(
            id,
            boxLimit,
            shipmentType,
            opfac,
            deliveryAgent,
            estimatedReadyDate,
            currencyUom,
            estimatedShipDate,
            status,
            referenceNumber,
            currencyTypeId,
            distinct
        );
    }

    // prettier-ignore
    @Override
    public String toString() {
        return "WayBillCriteria{" +
            optionalId().map(f -> "id=" + f + ", ").orElse("") +
            optionalBoxLimit().map(f -> "boxLimit=" + f + ", ").orElse("") +
            optionalShipmentType().map(f -> "shipmentType=" + f + ", ").orElse("") +
            optionalOpfac().map(f -> "opfac=" + f + ", ").orElse("") +
            optionalDeliveryAgent().map(f -> "deliveryAgent=" + f + ", ").orElse("") +
            optionalEstimatedReadyDate().map(f -> "estimatedReadyDate=" + f + ", ").orElse("") +
            optionalCurrencyUom().map(f -> "currencyUom=" + f + ", ").orElse("") +
            optionalEstimatedShipDate().map(f -> "estimatedShipDate=" + f + ", ").orElse("") +
            optionalStatus().map(f -> "status=" + f + ", ").orElse("") +
            optionalReferenceNumber().map(f -> "referenceNumber=" + f + ", ").orElse("") +
            optionalCurrencyTypeId().map(f -> "currencyTypeId=" + f + ", ").orElse("") +
            optionalDistinct().map(f -> "distinct=" + f + ", ").orElse("") +
        "}";
    }
}
