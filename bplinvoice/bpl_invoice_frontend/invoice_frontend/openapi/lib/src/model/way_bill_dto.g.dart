// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'way_bill_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WayBillDTO extends WayBillDTO {
  @override
  final int? id;
  @override
  final int? boxLimit;
  @override
  final String? shipmentType;
  @override
  final String? opfac;
  @override
  final String? deliveryAgent;
  @override
  final DateTime? estimatedReadyDate;
  @override
  final String? currencyUom;
  @override
  final DateTime? estimatedShipDate;
  @override
  final String? status;
  @override
  final String? referenceNumber;
  @override
  final CurrencyTypeDTO? currencyType;

  factory _$WayBillDTO([void Function(WayBillDTOBuilder)? updates]) =>
      (new WayBillDTOBuilder()..update(updates))._build();

  _$WayBillDTO._(
      {this.id,
      this.boxLimit,
      this.shipmentType,
      this.opfac,
      this.deliveryAgent,
      this.estimatedReadyDate,
      this.currencyUom,
      this.estimatedShipDate,
      this.status,
      this.referenceNumber,
      this.currencyType})
      : super._();

  @override
  WayBillDTO rebuild(void Function(WayBillDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WayBillDTOBuilder toBuilder() => new WayBillDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WayBillDTO &&
        id == other.id &&
        boxLimit == other.boxLimit &&
        shipmentType == other.shipmentType &&
        opfac == other.opfac &&
        deliveryAgent == other.deliveryAgent &&
        estimatedReadyDate == other.estimatedReadyDate &&
        currencyUom == other.currencyUom &&
        estimatedShipDate == other.estimatedShipDate &&
        status == other.status &&
        referenceNumber == other.referenceNumber &&
        currencyType == other.currencyType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, boxLimit.hashCode);
    _$hash = $jc(_$hash, shipmentType.hashCode);
    _$hash = $jc(_$hash, opfac.hashCode);
    _$hash = $jc(_$hash, deliveryAgent.hashCode);
    _$hash = $jc(_$hash, estimatedReadyDate.hashCode);
    _$hash = $jc(_$hash, currencyUom.hashCode);
    _$hash = $jc(_$hash, estimatedShipDate.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, referenceNumber.hashCode);
    _$hash = $jc(_$hash, currencyType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WayBillDTO')
          ..add('id', id)
          ..add('boxLimit', boxLimit)
          ..add('shipmentType', shipmentType)
          ..add('opfac', opfac)
          ..add('deliveryAgent', deliveryAgent)
          ..add('estimatedReadyDate', estimatedReadyDate)
          ..add('currencyUom', currencyUom)
          ..add('estimatedShipDate', estimatedShipDate)
          ..add('status', status)
          ..add('referenceNumber', referenceNumber)
          ..add('currencyType', currencyType))
        .toString();
  }
}

class WayBillDTOBuilder implements Builder<WayBillDTO, WayBillDTOBuilder> {
  _$WayBillDTO? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _boxLimit;
  int? get boxLimit => _$this._boxLimit;
  set boxLimit(int? boxLimit) => _$this._boxLimit = boxLimit;

  String? _shipmentType;
  String? get shipmentType => _$this._shipmentType;
  set shipmentType(String? shipmentType) => _$this._shipmentType = shipmentType;

  String? _opfac;
  String? get opfac => _$this._opfac;
  set opfac(String? opfac) => _$this._opfac = opfac;

  String? _deliveryAgent;
  String? get deliveryAgent => _$this._deliveryAgent;
  set deliveryAgent(String? deliveryAgent) =>
      _$this._deliveryAgent = deliveryAgent;

  DateTime? _estimatedReadyDate;
  DateTime? get estimatedReadyDate => _$this._estimatedReadyDate;
  set estimatedReadyDate(DateTime? estimatedReadyDate) =>
      _$this._estimatedReadyDate = estimatedReadyDate;

  String? _currencyUom;
  String? get currencyUom => _$this._currencyUom;
  set currencyUom(String? currencyUom) => _$this._currencyUom = currencyUom;

  DateTime? _estimatedShipDate;
  DateTime? get estimatedShipDate => _$this._estimatedShipDate;
  set estimatedShipDate(DateTime? estimatedShipDate) =>
      _$this._estimatedShipDate = estimatedShipDate;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _referenceNumber;
  String? get referenceNumber => _$this._referenceNumber;
  set referenceNumber(String? referenceNumber) =>
      _$this._referenceNumber = referenceNumber;

  CurrencyTypeDTOBuilder? _currencyType;
  CurrencyTypeDTOBuilder get currencyType =>
      _$this._currencyType ??= new CurrencyTypeDTOBuilder();
  set currencyType(CurrencyTypeDTOBuilder? currencyType) =>
      _$this._currencyType = currencyType;

  WayBillDTOBuilder() {
    WayBillDTO._defaults(this);
  }

  WayBillDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _boxLimit = $v.boxLimit;
      _shipmentType = $v.shipmentType;
      _opfac = $v.opfac;
      _deliveryAgent = $v.deliveryAgent;
      _estimatedReadyDate = $v.estimatedReadyDate;
      _currencyUom = $v.currencyUom;
      _estimatedShipDate = $v.estimatedShipDate;
      _status = $v.status;
      _referenceNumber = $v.referenceNumber;
      _currencyType = $v.currencyType?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WayBillDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WayBillDTO;
  }

  @override
  void update(void Function(WayBillDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WayBillDTO build() => _build();

  _$WayBillDTO _build() {
    _$WayBillDTO _$result;
    try {
      _$result = _$v ??
          new _$WayBillDTO._(
            id: id,
            boxLimit: boxLimit,
            shipmentType: shipmentType,
            opfac: opfac,
            deliveryAgent: deliveryAgent,
            estimatedReadyDate: estimatedReadyDate,
            currencyUom: currencyUom,
            estimatedShipDate: estimatedShipDate,
            status: status,
            referenceNumber: referenceNumber,
            currencyType: _currencyType?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'currencyType';
        _currencyType?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'WayBillDTO', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
