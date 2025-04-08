//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';

import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/api_util.dart';
import 'package:openapi/src/model/way_bill_dto.dart';

class WayBillResourceApi {

  final Dio _dio;

  final Serializers _serializers;

  const WayBillResourceApi(this._dio, this._serializers);

  /// countWayBills
  /// 
  ///
  /// Parameters:
  /// * [idPeriodGreaterThan] 
  /// * [idPeriodLessThan] 
  /// * [idPeriodGreaterThanOrEqual] 
  /// * [idPeriodLessThanOrEqual] 
  /// * [idPeriodEquals] 
  /// * [idPeriodNotEquals] 
  /// * [idPeriodSpecified] 
  /// * [idPeriodIn] 
  /// * [idPeriodNotIn] 
  /// * [boxLimitPeriodGreaterThan] 
  /// * [boxLimitPeriodLessThan] 
  /// * [boxLimitPeriodGreaterThanOrEqual] 
  /// * [boxLimitPeriodLessThanOrEqual] 
  /// * [boxLimitPeriodEquals] 
  /// * [boxLimitPeriodNotEquals] 
  /// * [boxLimitPeriodSpecified] 
  /// * [boxLimitPeriodIn] 
  /// * [boxLimitPeriodNotIn] 
  /// * [shipmentTypePeriodContains] 
  /// * [shipmentTypePeriodDoesNotContain] 
  /// * [shipmentTypePeriodEquals] 
  /// * [shipmentTypePeriodNotEquals] 
  /// * [shipmentTypePeriodSpecified] 
  /// * [shipmentTypePeriodIn] 
  /// * [shipmentTypePeriodNotIn] 
  /// * [opfacPeriodContains] 
  /// * [opfacPeriodDoesNotContain] 
  /// * [opfacPeriodEquals] 
  /// * [opfacPeriodNotEquals] 
  /// * [opfacPeriodSpecified] 
  /// * [opfacPeriodIn] 
  /// * [opfacPeriodNotIn] 
  /// * [deliveryAgentPeriodContains] 
  /// * [deliveryAgentPeriodDoesNotContain] 
  /// * [deliveryAgentPeriodEquals] 
  /// * [deliveryAgentPeriodNotEquals] 
  /// * [deliveryAgentPeriodSpecified] 
  /// * [deliveryAgentPeriodIn] 
  /// * [deliveryAgentPeriodNotIn] 
  /// * [estimatedReadyDatePeriodGreaterThan] 
  /// * [estimatedReadyDatePeriodLessThan] 
  /// * [estimatedReadyDatePeriodGreaterThanOrEqual] 
  /// * [estimatedReadyDatePeriodLessThanOrEqual] 
  /// * [estimatedReadyDatePeriodEquals] 
  /// * [estimatedReadyDatePeriodNotEquals] 
  /// * [estimatedReadyDatePeriodSpecified] 
  /// * [estimatedReadyDatePeriodIn] 
  /// * [estimatedReadyDatePeriodNotIn] 
  /// * [currencyUomPeriodContains] 
  /// * [currencyUomPeriodDoesNotContain] 
  /// * [currencyUomPeriodEquals] 
  /// * [currencyUomPeriodNotEquals] 
  /// * [currencyUomPeriodSpecified] 
  /// * [currencyUomPeriodIn] 
  /// * [currencyUomPeriodNotIn] 
  /// * [estimatedShipDatePeriodGreaterThan] 
  /// * [estimatedShipDatePeriodLessThan] 
  /// * [estimatedShipDatePeriodGreaterThanOrEqual] 
  /// * [estimatedShipDatePeriodLessThanOrEqual] 
  /// * [estimatedShipDatePeriodEquals] 
  /// * [estimatedShipDatePeriodNotEquals] 
  /// * [estimatedShipDatePeriodSpecified] 
  /// * [estimatedShipDatePeriodIn] 
  /// * [estimatedShipDatePeriodNotIn] 
  /// * [statusPeriodContains] 
  /// * [statusPeriodDoesNotContain] 
  /// * [statusPeriodEquals] 
  /// * [statusPeriodNotEquals] 
  /// * [statusPeriodSpecified] 
  /// * [statusPeriodIn] 
  /// * [statusPeriodNotIn] 
  /// * [referenceNumberPeriodContains] 
  /// * [referenceNumberPeriodDoesNotContain] 
  /// * [referenceNumberPeriodEquals] 
  /// * [referenceNumberPeriodNotEquals] 
  /// * [referenceNumberPeriodSpecified] 
  /// * [referenceNumberPeriodIn] 
  /// * [referenceNumberPeriodNotIn] 
  /// * [currencyTypeIdPeriodGreaterThan] 
  /// * [currencyTypeIdPeriodLessThan] 
  /// * [currencyTypeIdPeriodGreaterThanOrEqual] 
  /// * [currencyTypeIdPeriodLessThanOrEqual] 
  /// * [currencyTypeIdPeriodEquals] 
  /// * [currencyTypeIdPeriodNotEquals] 
  /// * [currencyTypeIdPeriodSpecified] 
  /// * [currencyTypeIdPeriodIn] 
  /// * [currencyTypeIdPeriodNotIn] 
  /// * [distinct] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [int] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<int>> countWayBills({ 
    int? idPeriodGreaterThan,
    int? idPeriodLessThan,
    int? idPeriodGreaterThanOrEqual,
    int? idPeriodLessThanOrEqual,
    int? idPeriodEquals,
    int? idPeriodNotEquals,
    bool? idPeriodSpecified,
    BuiltList<int>? idPeriodIn,
    BuiltList<int>? idPeriodNotIn,
    int? boxLimitPeriodGreaterThan,
    int? boxLimitPeriodLessThan,
    int? boxLimitPeriodGreaterThanOrEqual,
    int? boxLimitPeriodLessThanOrEqual,
    int? boxLimitPeriodEquals,
    int? boxLimitPeriodNotEquals,
    bool? boxLimitPeriodSpecified,
    BuiltList<int>? boxLimitPeriodIn,
    BuiltList<int>? boxLimitPeriodNotIn,
    String? shipmentTypePeriodContains,
    String? shipmentTypePeriodDoesNotContain,
    String? shipmentTypePeriodEquals,
    String? shipmentTypePeriodNotEquals,
    bool? shipmentTypePeriodSpecified,
    BuiltList<String>? shipmentTypePeriodIn,
    BuiltList<String>? shipmentTypePeriodNotIn,
    String? opfacPeriodContains,
    String? opfacPeriodDoesNotContain,
    String? opfacPeriodEquals,
    String? opfacPeriodNotEquals,
    bool? opfacPeriodSpecified,
    BuiltList<String>? opfacPeriodIn,
    BuiltList<String>? opfacPeriodNotIn,
    String? deliveryAgentPeriodContains,
    String? deliveryAgentPeriodDoesNotContain,
    String? deliveryAgentPeriodEquals,
    String? deliveryAgentPeriodNotEquals,
    bool? deliveryAgentPeriodSpecified,
    BuiltList<String>? deliveryAgentPeriodIn,
    BuiltList<String>? deliveryAgentPeriodNotIn,
    DateTime? estimatedReadyDatePeriodGreaterThan,
    DateTime? estimatedReadyDatePeriodLessThan,
    DateTime? estimatedReadyDatePeriodGreaterThanOrEqual,
    DateTime? estimatedReadyDatePeriodLessThanOrEqual,
    DateTime? estimatedReadyDatePeriodEquals,
    DateTime? estimatedReadyDatePeriodNotEquals,
    bool? estimatedReadyDatePeriodSpecified,
    BuiltList<DateTime>? estimatedReadyDatePeriodIn,
    BuiltList<DateTime>? estimatedReadyDatePeriodNotIn,
    String? currencyUomPeriodContains,
    String? currencyUomPeriodDoesNotContain,
    String? currencyUomPeriodEquals,
    String? currencyUomPeriodNotEquals,
    bool? currencyUomPeriodSpecified,
    BuiltList<String>? currencyUomPeriodIn,
    BuiltList<String>? currencyUomPeriodNotIn,
    DateTime? estimatedShipDatePeriodGreaterThan,
    DateTime? estimatedShipDatePeriodLessThan,
    DateTime? estimatedShipDatePeriodGreaterThanOrEqual,
    DateTime? estimatedShipDatePeriodLessThanOrEqual,
    DateTime? estimatedShipDatePeriodEquals,
    DateTime? estimatedShipDatePeriodNotEquals,
    bool? estimatedShipDatePeriodSpecified,
    BuiltList<DateTime>? estimatedShipDatePeriodIn,
    BuiltList<DateTime>? estimatedShipDatePeriodNotIn,
    String? statusPeriodContains,
    String? statusPeriodDoesNotContain,
    String? statusPeriodEquals,
    String? statusPeriodNotEquals,
    bool? statusPeriodSpecified,
    BuiltList<String>? statusPeriodIn,
    BuiltList<String>? statusPeriodNotIn,
    String? referenceNumberPeriodContains,
    String? referenceNumberPeriodDoesNotContain,
    String? referenceNumberPeriodEquals,
    String? referenceNumberPeriodNotEquals,
    bool? referenceNumberPeriodSpecified,
    BuiltList<String>? referenceNumberPeriodIn,
    BuiltList<String>? referenceNumberPeriodNotIn,
    int? currencyTypeIdPeriodGreaterThan,
    int? currencyTypeIdPeriodLessThan,
    int? currencyTypeIdPeriodGreaterThanOrEqual,
    int? currencyTypeIdPeriodLessThanOrEqual,
    int? currencyTypeIdPeriodEquals,
    int? currencyTypeIdPeriodNotEquals,
    bool? currencyTypeIdPeriodSpecified,
    BuiltList<int>? currencyTypeIdPeriodIn,
    BuiltList<int>? currencyTypeIdPeriodNotIn,
    bool? distinct,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/way-bills/count';
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      if (idPeriodGreaterThan != null) r'id.greaterThan': encodeQueryParameter(_serializers, idPeriodGreaterThan, const FullType(int)),
      if (idPeriodLessThan != null) r'id.lessThan': encodeQueryParameter(_serializers, idPeriodLessThan, const FullType(int)),
      if (idPeriodGreaterThanOrEqual != null) r'id.greaterThanOrEqual': encodeQueryParameter(_serializers, idPeriodGreaterThanOrEqual, const FullType(int)),
      if (idPeriodLessThanOrEqual != null) r'id.lessThanOrEqual': encodeQueryParameter(_serializers, idPeriodLessThanOrEqual, const FullType(int)),
      if (idPeriodEquals != null) r'id.equals': encodeQueryParameter(_serializers, idPeriodEquals, const FullType(int)),
      if (idPeriodNotEquals != null) r'id.notEquals': encodeQueryParameter(_serializers, idPeriodNotEquals, const FullType(int)),
      if (idPeriodSpecified != null) r'id.specified': encodeQueryParameter(_serializers, idPeriodSpecified, const FullType(bool)),
      if (idPeriodIn != null) r'id.in': encodeCollectionQueryParameter<int>(_serializers, idPeriodIn, const FullType(BuiltList, [FullType(int)]), format: ListFormat.multi,),
      if (idPeriodNotIn != null) r'id.notIn': encodeCollectionQueryParameter<int>(_serializers, idPeriodNotIn, const FullType(BuiltList, [FullType(int)]), format: ListFormat.multi,),
      if (boxLimitPeriodGreaterThan != null) r'boxLimit.greaterThan': encodeQueryParameter(_serializers, boxLimitPeriodGreaterThan, const FullType(int)),
      if (boxLimitPeriodLessThan != null) r'boxLimit.lessThan': encodeQueryParameter(_serializers, boxLimitPeriodLessThan, const FullType(int)),
      if (boxLimitPeriodGreaterThanOrEqual != null) r'boxLimit.greaterThanOrEqual': encodeQueryParameter(_serializers, boxLimitPeriodGreaterThanOrEqual, const FullType(int)),
      if (boxLimitPeriodLessThanOrEqual != null) r'boxLimit.lessThanOrEqual': encodeQueryParameter(_serializers, boxLimitPeriodLessThanOrEqual, const FullType(int)),
      if (boxLimitPeriodEquals != null) r'boxLimit.equals': encodeQueryParameter(_serializers, boxLimitPeriodEquals, const FullType(int)),
      if (boxLimitPeriodNotEquals != null) r'boxLimit.notEquals': encodeQueryParameter(_serializers, boxLimitPeriodNotEquals, const FullType(int)),
      if (boxLimitPeriodSpecified != null) r'boxLimit.specified': encodeQueryParameter(_serializers, boxLimitPeriodSpecified, const FullType(bool)),
      if (boxLimitPeriodIn != null) r'boxLimit.in': encodeCollectionQueryParameter<int>(_serializers, boxLimitPeriodIn, const FullType(BuiltList, [FullType(int)]), format: ListFormat.multi,),
      if (boxLimitPeriodNotIn != null) r'boxLimit.notIn': encodeCollectionQueryParameter<int>(_serializers, boxLimitPeriodNotIn, const FullType(BuiltList, [FullType(int)]), format: ListFormat.multi,),
      if (shipmentTypePeriodContains != null) r'shipmentType.contains': encodeQueryParameter(_serializers, shipmentTypePeriodContains, const FullType(String)),
      if (shipmentTypePeriodDoesNotContain != null) r'shipmentType.doesNotContain': encodeQueryParameter(_serializers, shipmentTypePeriodDoesNotContain, const FullType(String)),
      if (shipmentTypePeriodEquals != null) r'shipmentType.equals': encodeQueryParameter(_serializers, shipmentTypePeriodEquals, const FullType(String)),
      if (shipmentTypePeriodNotEquals != null) r'shipmentType.notEquals': encodeQueryParameter(_serializers, shipmentTypePeriodNotEquals, const FullType(String)),
      if (shipmentTypePeriodSpecified != null) r'shipmentType.specified': encodeQueryParameter(_serializers, shipmentTypePeriodSpecified, const FullType(bool)),
      if (shipmentTypePeriodIn != null) r'shipmentType.in': encodeCollectionQueryParameter<String>(_serializers, shipmentTypePeriodIn, const FullType(BuiltList, [FullType(String)]), format: ListFormat.multi,),
      if (shipmentTypePeriodNotIn != null) r'shipmentType.notIn': encodeCollectionQueryParameter<String>(_serializers, shipmentTypePeriodNotIn, const FullType(BuiltList, [FullType(String)]), format: ListFormat.multi,),
      if (opfacPeriodContains != null) r'opfac.contains': encodeQueryParameter(_serializers, opfacPeriodContains, const FullType(String)),
      if (opfacPeriodDoesNotContain != null) r'opfac.doesNotContain': encodeQueryParameter(_serializers, opfacPeriodDoesNotContain, const FullType(String)),
      if (opfacPeriodEquals != null) r'opfac.equals': encodeQueryParameter(_serializers, opfacPeriodEquals, const FullType(String)),
      if (opfacPeriodNotEquals != null) r'opfac.notEquals': encodeQueryParameter(_serializers, opfacPeriodNotEquals, const FullType(String)),
      if (opfacPeriodSpecified != null) r'opfac.specified': encodeQueryParameter(_serializers, opfacPeriodSpecified, const FullType(bool)),
      if (opfacPeriodIn != null) r'opfac.in': encodeCollectionQueryParameter<String>(_serializers, opfacPeriodIn, const FullType(BuiltList, [FullType(String)]), format: ListFormat.multi,),
      if (opfacPeriodNotIn != null) r'opfac.notIn': encodeCollectionQueryParameter<String>(_serializers, opfacPeriodNotIn, const FullType(BuiltList, [FullType(String)]), format: ListFormat.multi,),
      if (deliveryAgentPeriodContains != null) r'deliveryAgent.contains': encodeQueryParameter(_serializers, deliveryAgentPeriodContains, const FullType(String)),
      if (deliveryAgentPeriodDoesNotContain != null) r'deliveryAgent.doesNotContain': encodeQueryParameter(_serializers, deliveryAgentPeriodDoesNotContain, const FullType(String)),
      if (deliveryAgentPeriodEquals != null) r'deliveryAgent.equals': encodeQueryParameter(_serializers, deliveryAgentPeriodEquals, const FullType(String)),
      if (deliveryAgentPeriodNotEquals != null) r'deliveryAgent.notEquals': encodeQueryParameter(_serializers, deliveryAgentPeriodNotEquals, const FullType(String)),
      if (deliveryAgentPeriodSpecified != null) r'deliveryAgent.specified': encodeQueryParameter(_serializers, deliveryAgentPeriodSpecified, const FullType(bool)),
      if (deliveryAgentPeriodIn != null) r'deliveryAgent.in': encodeCollectionQueryParameter<String>(_serializers, deliveryAgentPeriodIn, const FullType(BuiltList, [FullType(String)]), format: ListFormat.multi,),
      if (deliveryAgentPeriodNotIn != null) r'deliveryAgent.notIn': encodeCollectionQueryParameter<String>(_serializers, deliveryAgentPeriodNotIn, const FullType(BuiltList, [FullType(String)]), format: ListFormat.multi,),
      if (estimatedReadyDatePeriodGreaterThan != null) r'estimatedReadyDate.greaterThan': encodeQueryParameter(_serializers, estimatedReadyDatePeriodGreaterThan, const FullType(DateTime)),
      if (estimatedReadyDatePeriodLessThan != null) r'estimatedReadyDate.lessThan': encodeQueryParameter(_serializers, estimatedReadyDatePeriodLessThan, const FullType(DateTime)),
      if (estimatedReadyDatePeriodGreaterThanOrEqual != null) r'estimatedReadyDate.greaterThanOrEqual': encodeQueryParameter(_serializers, estimatedReadyDatePeriodGreaterThanOrEqual, const FullType(DateTime)),
      if (estimatedReadyDatePeriodLessThanOrEqual != null) r'estimatedReadyDate.lessThanOrEqual': encodeQueryParameter(_serializers, estimatedReadyDatePeriodLessThanOrEqual, const FullType(DateTime)),
      if (estimatedReadyDatePeriodEquals != null) r'estimatedReadyDate.equals': encodeQueryParameter(_serializers, estimatedReadyDatePeriodEquals, const FullType(DateTime)),
      if (estimatedReadyDatePeriodNotEquals != null) r'estimatedReadyDate.notEquals': encodeQueryParameter(_serializers, estimatedReadyDatePeriodNotEquals, const FullType(DateTime)),
      if (estimatedReadyDatePeriodSpecified != null) r'estimatedReadyDate.specified': encodeQueryParameter(_serializers, estimatedReadyDatePeriodSpecified, const FullType(bool)),
      if (estimatedReadyDatePeriodIn != null) r'estimatedReadyDate.in': encodeCollectionQueryParameter<DateTime>(_serializers, estimatedReadyDatePeriodIn, const FullType(BuiltList, [FullType(DateTime)]), format: ListFormat.multi,),
      if (estimatedReadyDatePeriodNotIn != null) r'estimatedReadyDate.notIn': encodeCollectionQueryParameter<DateTime>(_serializers, estimatedReadyDatePeriodNotIn, const FullType(BuiltList, [FullType(DateTime)]), format: ListFormat.multi,),
      if (currencyUomPeriodContains != null) r'currencyUom.contains': encodeQueryParameter(_serializers, currencyUomPeriodContains, const FullType(String)),
      if (currencyUomPeriodDoesNotContain != null) r'currencyUom.doesNotContain': encodeQueryParameter(_serializers, currencyUomPeriodDoesNotContain, const FullType(String)),
      if (currencyUomPeriodEquals != null) r'currencyUom.equals': encodeQueryParameter(_serializers, currencyUomPeriodEquals, const FullType(String)),
      if (currencyUomPeriodNotEquals != null) r'currencyUom.notEquals': encodeQueryParameter(_serializers, currencyUomPeriodNotEquals, const FullType(String)),
      if (currencyUomPeriodSpecified != null) r'currencyUom.specified': encodeQueryParameter(_serializers, currencyUomPeriodSpecified, const FullType(bool)),
      if (currencyUomPeriodIn != null) r'currencyUom.in': encodeCollectionQueryParameter<String>(_serializers, currencyUomPeriodIn, const FullType(BuiltList, [FullType(String)]), format: ListFormat.multi,),
      if (currencyUomPeriodNotIn != null) r'currencyUom.notIn': encodeCollectionQueryParameter<String>(_serializers, currencyUomPeriodNotIn, const FullType(BuiltList, [FullType(String)]), format: ListFormat.multi,),
      if (estimatedShipDatePeriodGreaterThan != null) r'estimatedShipDate.greaterThan': encodeQueryParameter(_serializers, estimatedShipDatePeriodGreaterThan, const FullType(DateTime)),
      if (estimatedShipDatePeriodLessThan != null) r'estimatedShipDate.lessThan': encodeQueryParameter(_serializers, estimatedShipDatePeriodLessThan, const FullType(DateTime)),
      if (estimatedShipDatePeriodGreaterThanOrEqual != null) r'estimatedShipDate.greaterThanOrEqual': encodeQueryParameter(_serializers, estimatedShipDatePeriodGreaterThanOrEqual, const FullType(DateTime)),
      if (estimatedShipDatePeriodLessThanOrEqual != null) r'estimatedShipDate.lessThanOrEqual': encodeQueryParameter(_serializers, estimatedShipDatePeriodLessThanOrEqual, const FullType(DateTime)),
      if (estimatedShipDatePeriodEquals != null) r'estimatedShipDate.equals': encodeQueryParameter(_serializers, estimatedShipDatePeriodEquals, const FullType(DateTime)),
      if (estimatedShipDatePeriodNotEquals != null) r'estimatedShipDate.notEquals': encodeQueryParameter(_serializers, estimatedShipDatePeriodNotEquals, const FullType(DateTime)),
      if (estimatedShipDatePeriodSpecified != null) r'estimatedShipDate.specified': encodeQueryParameter(_serializers, estimatedShipDatePeriodSpecified, const FullType(bool)),
      if (estimatedShipDatePeriodIn != null) r'estimatedShipDate.in': encodeCollectionQueryParameter<DateTime>(_serializers, estimatedShipDatePeriodIn, const FullType(BuiltList, [FullType(DateTime)]), format: ListFormat.multi,),
      if (estimatedShipDatePeriodNotIn != null) r'estimatedShipDate.notIn': encodeCollectionQueryParameter<DateTime>(_serializers, estimatedShipDatePeriodNotIn, const FullType(BuiltList, [FullType(DateTime)]), format: ListFormat.multi,),
      if (statusPeriodContains != null) r'status.contains': encodeQueryParameter(_serializers, statusPeriodContains, const FullType(String)),
      if (statusPeriodDoesNotContain != null) r'status.doesNotContain': encodeQueryParameter(_serializers, statusPeriodDoesNotContain, const FullType(String)),
      if (statusPeriodEquals != null) r'status.equals': encodeQueryParameter(_serializers, statusPeriodEquals, const FullType(String)),
      if (statusPeriodNotEquals != null) r'status.notEquals': encodeQueryParameter(_serializers, statusPeriodNotEquals, const FullType(String)),
      if (statusPeriodSpecified != null) r'status.specified': encodeQueryParameter(_serializers, statusPeriodSpecified, const FullType(bool)),
      if (statusPeriodIn != null) r'status.in': encodeCollectionQueryParameter<String>(_serializers, statusPeriodIn, const FullType(BuiltList, [FullType(String)]), format: ListFormat.multi,),
      if (statusPeriodNotIn != null) r'status.notIn': encodeCollectionQueryParameter<String>(_serializers, statusPeriodNotIn, const FullType(BuiltList, [FullType(String)]), format: ListFormat.multi,),
      if (referenceNumberPeriodContains != null) r'referenceNumber.contains': encodeQueryParameter(_serializers, referenceNumberPeriodContains, const FullType(String)),
      if (referenceNumberPeriodDoesNotContain != null) r'referenceNumber.doesNotContain': encodeQueryParameter(_serializers, referenceNumberPeriodDoesNotContain, const FullType(String)),
      if (referenceNumberPeriodEquals != null) r'referenceNumber.equals': encodeQueryParameter(_serializers, referenceNumberPeriodEquals, const FullType(String)),
      if (referenceNumberPeriodNotEquals != null) r'referenceNumber.notEquals': encodeQueryParameter(_serializers, referenceNumberPeriodNotEquals, const FullType(String)),
      if (referenceNumberPeriodSpecified != null) r'referenceNumber.specified': encodeQueryParameter(_serializers, referenceNumberPeriodSpecified, const FullType(bool)),
      if (referenceNumberPeriodIn != null) r'referenceNumber.in': encodeCollectionQueryParameter<String>(_serializers, referenceNumberPeriodIn, const FullType(BuiltList, [FullType(String)]), format: ListFormat.multi,),
      if (referenceNumberPeriodNotIn != null) r'referenceNumber.notIn': encodeCollectionQueryParameter<String>(_serializers, referenceNumberPeriodNotIn, const FullType(BuiltList, [FullType(String)]), format: ListFormat.multi,),
      if (currencyTypeIdPeriodGreaterThan != null) r'currencyTypeId.greaterThan': encodeQueryParameter(_serializers, currencyTypeIdPeriodGreaterThan, const FullType(int)),
      if (currencyTypeIdPeriodLessThan != null) r'currencyTypeId.lessThan': encodeQueryParameter(_serializers, currencyTypeIdPeriodLessThan, const FullType(int)),
      if (currencyTypeIdPeriodGreaterThanOrEqual != null) r'currencyTypeId.greaterThanOrEqual': encodeQueryParameter(_serializers, currencyTypeIdPeriodGreaterThanOrEqual, const FullType(int)),
      if (currencyTypeIdPeriodLessThanOrEqual != null) r'currencyTypeId.lessThanOrEqual': encodeQueryParameter(_serializers, currencyTypeIdPeriodLessThanOrEqual, const FullType(int)),
      if (currencyTypeIdPeriodEquals != null) r'currencyTypeId.equals': encodeQueryParameter(_serializers, currencyTypeIdPeriodEquals, const FullType(int)),
      if (currencyTypeIdPeriodNotEquals != null) r'currencyTypeId.notEquals': encodeQueryParameter(_serializers, currencyTypeIdPeriodNotEquals, const FullType(int)),
      if (currencyTypeIdPeriodSpecified != null) r'currencyTypeId.specified': encodeQueryParameter(_serializers, currencyTypeIdPeriodSpecified, const FullType(bool)),
      if (currencyTypeIdPeriodIn != null) r'currencyTypeId.in': encodeCollectionQueryParameter<int>(_serializers, currencyTypeIdPeriodIn, const FullType(BuiltList, [FullType(int)]), format: ListFormat.multi,),
      if (currencyTypeIdPeriodNotIn != null) r'currencyTypeId.notIn': encodeCollectionQueryParameter<int>(_serializers, currencyTypeIdPeriodNotIn, const FullType(BuiltList, [FullType(int)]), format: ListFormat.multi,),
      if (distinct != null) r'distinct': encodeQueryParameter(_serializers, distinct, const FullType(bool)),
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    int? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : rawResponse as int;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<int>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// createWayBill
  /// 
  ///
  /// Parameters:
  /// * [wayBillDTO] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [WayBillDTO] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<WayBillDTO>> createWayBill({ 
    required WayBillDTO wayBillDTO,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/way-bills';
    final _options = Options(
      method: r'POST',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      contentType: 'application/json',
      validateStatus: validateStatus,
    );

    dynamic _bodyData;

    try {
      const _type = FullType(WayBillDTO);
      _bodyData = _serializers.serialize(wayBillDTO, specifiedType: _type);

    } catch(error, stackTrace) {
      throw DioException(
         requestOptions: _options.compose(
          _dio.options,
          _path,
        ),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    WayBillDTO? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(WayBillDTO),
      ) as WayBillDTO;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<WayBillDTO>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// deleteWayBill
  /// 
  ///
  /// Parameters:
  /// * [id] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future]
  /// Throws [DioException] if API call or serialization fails
  Future<Response<void>> deleteWayBill({ 
    required int id,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/way-bills/{id}'.replaceAll('{' r'id' '}', encodeQueryParameter(_serializers, id, const FullType(int)).toString());
    final _options = Options(
      method: r'DELETE',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    return _response;
  }

  /// getAllWayBills
  /// 
  ///
  /// Parameters:
  /// * [idPeriodGreaterThan] 
  /// * [idPeriodLessThan] 
  /// * [idPeriodGreaterThanOrEqual] 
  /// * [idPeriodLessThanOrEqual] 
  /// * [idPeriodEquals] 
  /// * [idPeriodNotEquals] 
  /// * [idPeriodSpecified] 
  /// * [idPeriodIn] 
  /// * [idPeriodNotIn] 
  /// * [boxLimitPeriodGreaterThan] 
  /// * [boxLimitPeriodLessThan] 
  /// * [boxLimitPeriodGreaterThanOrEqual] 
  /// * [boxLimitPeriodLessThanOrEqual] 
  /// * [boxLimitPeriodEquals] 
  /// * [boxLimitPeriodNotEquals] 
  /// * [boxLimitPeriodSpecified] 
  /// * [boxLimitPeriodIn] 
  /// * [boxLimitPeriodNotIn] 
  /// * [shipmentTypePeriodContains] 
  /// * [shipmentTypePeriodDoesNotContain] 
  /// * [shipmentTypePeriodEquals] 
  /// * [shipmentTypePeriodNotEquals] 
  /// * [shipmentTypePeriodSpecified] 
  /// * [shipmentTypePeriodIn] 
  /// * [shipmentTypePeriodNotIn] 
  /// * [opfacPeriodContains] 
  /// * [opfacPeriodDoesNotContain] 
  /// * [opfacPeriodEquals] 
  /// * [opfacPeriodNotEquals] 
  /// * [opfacPeriodSpecified] 
  /// * [opfacPeriodIn] 
  /// * [opfacPeriodNotIn] 
  /// * [deliveryAgentPeriodContains] 
  /// * [deliveryAgentPeriodDoesNotContain] 
  /// * [deliveryAgentPeriodEquals] 
  /// * [deliveryAgentPeriodNotEquals] 
  /// * [deliveryAgentPeriodSpecified] 
  /// * [deliveryAgentPeriodIn] 
  /// * [deliveryAgentPeriodNotIn] 
  /// * [estimatedReadyDatePeriodGreaterThan] 
  /// * [estimatedReadyDatePeriodLessThan] 
  /// * [estimatedReadyDatePeriodGreaterThanOrEqual] 
  /// * [estimatedReadyDatePeriodLessThanOrEqual] 
  /// * [estimatedReadyDatePeriodEquals] 
  /// * [estimatedReadyDatePeriodNotEquals] 
  /// * [estimatedReadyDatePeriodSpecified] 
  /// * [estimatedReadyDatePeriodIn] 
  /// * [estimatedReadyDatePeriodNotIn] 
  /// * [currencyUomPeriodContains] 
  /// * [currencyUomPeriodDoesNotContain] 
  /// * [currencyUomPeriodEquals] 
  /// * [currencyUomPeriodNotEquals] 
  /// * [currencyUomPeriodSpecified] 
  /// * [currencyUomPeriodIn] 
  /// * [currencyUomPeriodNotIn] 
  /// * [estimatedShipDatePeriodGreaterThan] 
  /// * [estimatedShipDatePeriodLessThan] 
  /// * [estimatedShipDatePeriodGreaterThanOrEqual] 
  /// * [estimatedShipDatePeriodLessThanOrEqual] 
  /// * [estimatedShipDatePeriodEquals] 
  /// * [estimatedShipDatePeriodNotEquals] 
  /// * [estimatedShipDatePeriodSpecified] 
  /// * [estimatedShipDatePeriodIn] 
  /// * [estimatedShipDatePeriodNotIn] 
  /// * [statusPeriodContains] 
  /// * [statusPeriodDoesNotContain] 
  /// * [statusPeriodEquals] 
  /// * [statusPeriodNotEquals] 
  /// * [statusPeriodSpecified] 
  /// * [statusPeriodIn] 
  /// * [statusPeriodNotIn] 
  /// * [referenceNumberPeriodContains] 
  /// * [referenceNumberPeriodDoesNotContain] 
  /// * [referenceNumberPeriodEquals] 
  /// * [referenceNumberPeriodNotEquals] 
  /// * [referenceNumberPeriodSpecified] 
  /// * [referenceNumberPeriodIn] 
  /// * [referenceNumberPeriodNotIn] 
  /// * [currencyTypeIdPeriodGreaterThan] 
  /// * [currencyTypeIdPeriodLessThan] 
  /// * [currencyTypeIdPeriodGreaterThanOrEqual] 
  /// * [currencyTypeIdPeriodLessThanOrEqual] 
  /// * [currencyTypeIdPeriodEquals] 
  /// * [currencyTypeIdPeriodNotEquals] 
  /// * [currencyTypeIdPeriodSpecified] 
  /// * [currencyTypeIdPeriodIn] 
  /// * [currencyTypeIdPeriodNotIn] 
  /// * [distinct] 
  /// * [page] - Zero-based page index (0..N)
  /// * [size] - The size of the page to be returned
  /// * [sort] - Sorting criteria in the format: property,(asc|desc). Default sort order is ascending. Multiple sort criteria are supported.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [BuiltList<WayBillDTO>] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<BuiltList<WayBillDTO>>> getAllWayBills({ 
    int? idPeriodGreaterThan,
    int? idPeriodLessThan,
    int? idPeriodGreaterThanOrEqual,
    int? idPeriodLessThanOrEqual,
    int? idPeriodEquals,
    int? idPeriodNotEquals,
    bool? idPeriodSpecified,
    BuiltList<int>? idPeriodIn,
    BuiltList<int>? idPeriodNotIn,
    int? boxLimitPeriodGreaterThan,
    int? boxLimitPeriodLessThan,
    int? boxLimitPeriodGreaterThanOrEqual,
    int? boxLimitPeriodLessThanOrEqual,
    int? boxLimitPeriodEquals,
    int? boxLimitPeriodNotEquals,
    bool? boxLimitPeriodSpecified,
    BuiltList<int>? boxLimitPeriodIn,
    BuiltList<int>? boxLimitPeriodNotIn,
    String? shipmentTypePeriodContains,
    String? shipmentTypePeriodDoesNotContain,
    String? shipmentTypePeriodEquals,
    String? shipmentTypePeriodNotEquals,
    bool? shipmentTypePeriodSpecified,
    BuiltList<String>? shipmentTypePeriodIn,
    BuiltList<String>? shipmentTypePeriodNotIn,
    String? opfacPeriodContains,
    String? opfacPeriodDoesNotContain,
    String? opfacPeriodEquals,
    String? opfacPeriodNotEquals,
    bool? opfacPeriodSpecified,
    BuiltList<String>? opfacPeriodIn,
    BuiltList<String>? opfacPeriodNotIn,
    String? deliveryAgentPeriodContains,
    String? deliveryAgentPeriodDoesNotContain,
    String? deliveryAgentPeriodEquals,
    String? deliveryAgentPeriodNotEquals,
    bool? deliveryAgentPeriodSpecified,
    BuiltList<String>? deliveryAgentPeriodIn,
    BuiltList<String>? deliveryAgentPeriodNotIn,
    DateTime? estimatedReadyDatePeriodGreaterThan,
    DateTime? estimatedReadyDatePeriodLessThan,
    DateTime? estimatedReadyDatePeriodGreaterThanOrEqual,
    DateTime? estimatedReadyDatePeriodLessThanOrEqual,
    DateTime? estimatedReadyDatePeriodEquals,
    DateTime? estimatedReadyDatePeriodNotEquals,
    bool? estimatedReadyDatePeriodSpecified,
    BuiltList<DateTime>? estimatedReadyDatePeriodIn,
    BuiltList<DateTime>? estimatedReadyDatePeriodNotIn,
    String? currencyUomPeriodContains,
    String? currencyUomPeriodDoesNotContain,
    String? currencyUomPeriodEquals,
    String? currencyUomPeriodNotEquals,
    bool? currencyUomPeriodSpecified,
    BuiltList<String>? currencyUomPeriodIn,
    BuiltList<String>? currencyUomPeriodNotIn,
    DateTime? estimatedShipDatePeriodGreaterThan,
    DateTime? estimatedShipDatePeriodLessThan,
    DateTime? estimatedShipDatePeriodGreaterThanOrEqual,
    DateTime? estimatedShipDatePeriodLessThanOrEqual,
    DateTime? estimatedShipDatePeriodEquals,
    DateTime? estimatedShipDatePeriodNotEquals,
    bool? estimatedShipDatePeriodSpecified,
    BuiltList<DateTime>? estimatedShipDatePeriodIn,
    BuiltList<DateTime>? estimatedShipDatePeriodNotIn,
    String? statusPeriodContains,
    String? statusPeriodDoesNotContain,
    String? statusPeriodEquals,
    String? statusPeriodNotEquals,
    bool? statusPeriodSpecified,
    BuiltList<String>? statusPeriodIn,
    BuiltList<String>? statusPeriodNotIn,
    String? referenceNumberPeriodContains,
    String? referenceNumberPeriodDoesNotContain,
    String? referenceNumberPeriodEquals,
    String? referenceNumberPeriodNotEquals,
    bool? referenceNumberPeriodSpecified,
    BuiltList<String>? referenceNumberPeriodIn,
    BuiltList<String>? referenceNumberPeriodNotIn,
    int? currencyTypeIdPeriodGreaterThan,
    int? currencyTypeIdPeriodLessThan,
    int? currencyTypeIdPeriodGreaterThanOrEqual,
    int? currencyTypeIdPeriodLessThanOrEqual,
    int? currencyTypeIdPeriodEquals,
    int? currencyTypeIdPeriodNotEquals,
    bool? currencyTypeIdPeriodSpecified,
    BuiltList<int>? currencyTypeIdPeriodIn,
    BuiltList<int>? currencyTypeIdPeriodNotIn,
    bool? distinct,
    int? page = 0,
    int? size = 20,
    BuiltList<String>? sort,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/way-bills';
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      if (idPeriodGreaterThan != null) r'id.greaterThan': encodeQueryParameter(_serializers, idPeriodGreaterThan, const FullType(int)),
      if (idPeriodLessThan != null) r'id.lessThan': encodeQueryParameter(_serializers, idPeriodLessThan, const FullType(int)),
      if (idPeriodGreaterThanOrEqual != null) r'id.greaterThanOrEqual': encodeQueryParameter(_serializers, idPeriodGreaterThanOrEqual, const FullType(int)),
      if (idPeriodLessThanOrEqual != null) r'id.lessThanOrEqual': encodeQueryParameter(_serializers, idPeriodLessThanOrEqual, const FullType(int)),
      if (idPeriodEquals != null) r'id.equals': encodeQueryParameter(_serializers, idPeriodEquals, const FullType(int)),
      if (idPeriodNotEquals != null) r'id.notEquals': encodeQueryParameter(_serializers, idPeriodNotEquals, const FullType(int)),
      if (idPeriodSpecified != null) r'id.specified': encodeQueryParameter(_serializers, idPeriodSpecified, const FullType(bool)),
      if (idPeriodIn != null) r'id.in': encodeCollectionQueryParameter<int>(_serializers, idPeriodIn, const FullType(BuiltList, [FullType(int)]), format: ListFormat.multi,),
      if (idPeriodNotIn != null) r'id.notIn': encodeCollectionQueryParameter<int>(_serializers, idPeriodNotIn, const FullType(BuiltList, [FullType(int)]), format: ListFormat.multi,),
      if (boxLimitPeriodGreaterThan != null) r'boxLimit.greaterThan': encodeQueryParameter(_serializers, boxLimitPeriodGreaterThan, const FullType(int)),
      if (boxLimitPeriodLessThan != null) r'boxLimit.lessThan': encodeQueryParameter(_serializers, boxLimitPeriodLessThan, const FullType(int)),
      if (boxLimitPeriodGreaterThanOrEqual != null) r'boxLimit.greaterThanOrEqual': encodeQueryParameter(_serializers, boxLimitPeriodGreaterThanOrEqual, const FullType(int)),
      if (boxLimitPeriodLessThanOrEqual != null) r'boxLimit.lessThanOrEqual': encodeQueryParameter(_serializers, boxLimitPeriodLessThanOrEqual, const FullType(int)),
      if (boxLimitPeriodEquals != null) r'boxLimit.equals': encodeQueryParameter(_serializers, boxLimitPeriodEquals, const FullType(int)),
      if (boxLimitPeriodNotEquals != null) r'boxLimit.notEquals': encodeQueryParameter(_serializers, boxLimitPeriodNotEquals, const FullType(int)),
      if (boxLimitPeriodSpecified != null) r'boxLimit.specified': encodeQueryParameter(_serializers, boxLimitPeriodSpecified, const FullType(bool)),
      if (boxLimitPeriodIn != null) r'boxLimit.in': encodeCollectionQueryParameter<int>(_serializers, boxLimitPeriodIn, const FullType(BuiltList, [FullType(int)]), format: ListFormat.multi,),
      if (boxLimitPeriodNotIn != null) r'boxLimit.notIn': encodeCollectionQueryParameter<int>(_serializers, boxLimitPeriodNotIn, const FullType(BuiltList, [FullType(int)]), format: ListFormat.multi,),
      if (shipmentTypePeriodContains != null) r'shipmentType.contains': encodeQueryParameter(_serializers, shipmentTypePeriodContains, const FullType(String)),
      if (shipmentTypePeriodDoesNotContain != null) r'shipmentType.doesNotContain': encodeQueryParameter(_serializers, shipmentTypePeriodDoesNotContain, const FullType(String)),
      if (shipmentTypePeriodEquals != null) r'shipmentType.equals': encodeQueryParameter(_serializers, shipmentTypePeriodEquals, const FullType(String)),
      if (shipmentTypePeriodNotEquals != null) r'shipmentType.notEquals': encodeQueryParameter(_serializers, shipmentTypePeriodNotEquals, const FullType(String)),
      if (shipmentTypePeriodSpecified != null) r'shipmentType.specified': encodeQueryParameter(_serializers, shipmentTypePeriodSpecified, const FullType(bool)),
      if (shipmentTypePeriodIn != null) r'shipmentType.in': encodeCollectionQueryParameter<String>(_serializers, shipmentTypePeriodIn, const FullType(BuiltList, [FullType(String)]), format: ListFormat.multi,),
      if (shipmentTypePeriodNotIn != null) r'shipmentType.notIn': encodeCollectionQueryParameter<String>(_serializers, shipmentTypePeriodNotIn, const FullType(BuiltList, [FullType(String)]), format: ListFormat.multi,),
      if (opfacPeriodContains != null) r'opfac.contains': encodeQueryParameter(_serializers, opfacPeriodContains, const FullType(String)),
      if (opfacPeriodDoesNotContain != null) r'opfac.doesNotContain': encodeQueryParameter(_serializers, opfacPeriodDoesNotContain, const FullType(String)),
      if (opfacPeriodEquals != null) r'opfac.equals': encodeQueryParameter(_serializers, opfacPeriodEquals, const FullType(String)),
      if (opfacPeriodNotEquals != null) r'opfac.notEquals': encodeQueryParameter(_serializers, opfacPeriodNotEquals, const FullType(String)),
      if (opfacPeriodSpecified != null) r'opfac.specified': encodeQueryParameter(_serializers, opfacPeriodSpecified, const FullType(bool)),
      if (opfacPeriodIn != null) r'opfac.in': encodeCollectionQueryParameter<String>(_serializers, opfacPeriodIn, const FullType(BuiltList, [FullType(String)]), format: ListFormat.multi,),
      if (opfacPeriodNotIn != null) r'opfac.notIn': encodeCollectionQueryParameter<String>(_serializers, opfacPeriodNotIn, const FullType(BuiltList, [FullType(String)]), format: ListFormat.multi,),
      if (deliveryAgentPeriodContains != null) r'deliveryAgent.contains': encodeQueryParameter(_serializers, deliveryAgentPeriodContains, const FullType(String)),
      if (deliveryAgentPeriodDoesNotContain != null) r'deliveryAgent.doesNotContain': encodeQueryParameter(_serializers, deliveryAgentPeriodDoesNotContain, const FullType(String)),
      if (deliveryAgentPeriodEquals != null) r'deliveryAgent.equals': encodeQueryParameter(_serializers, deliveryAgentPeriodEquals, const FullType(String)),
      if (deliveryAgentPeriodNotEquals != null) r'deliveryAgent.notEquals': encodeQueryParameter(_serializers, deliveryAgentPeriodNotEquals, const FullType(String)),
      if (deliveryAgentPeriodSpecified != null) r'deliveryAgent.specified': encodeQueryParameter(_serializers, deliveryAgentPeriodSpecified, const FullType(bool)),
      if (deliveryAgentPeriodIn != null) r'deliveryAgent.in': encodeCollectionQueryParameter<String>(_serializers, deliveryAgentPeriodIn, const FullType(BuiltList, [FullType(String)]), format: ListFormat.multi,),
      if (deliveryAgentPeriodNotIn != null) r'deliveryAgent.notIn': encodeCollectionQueryParameter<String>(_serializers, deliveryAgentPeriodNotIn, const FullType(BuiltList, [FullType(String)]), format: ListFormat.multi,),
      if (estimatedReadyDatePeriodGreaterThan != null) r'estimatedReadyDate.greaterThan': encodeQueryParameter(_serializers, estimatedReadyDatePeriodGreaterThan, const FullType(DateTime)),
      if (estimatedReadyDatePeriodLessThan != null) r'estimatedReadyDate.lessThan': encodeQueryParameter(_serializers, estimatedReadyDatePeriodLessThan, const FullType(DateTime)),
      if (estimatedReadyDatePeriodGreaterThanOrEqual != null) r'estimatedReadyDate.greaterThanOrEqual': encodeQueryParameter(_serializers, estimatedReadyDatePeriodGreaterThanOrEqual, const FullType(DateTime)),
      if (estimatedReadyDatePeriodLessThanOrEqual != null) r'estimatedReadyDate.lessThanOrEqual': encodeQueryParameter(_serializers, estimatedReadyDatePeriodLessThanOrEqual, const FullType(DateTime)),
      if (estimatedReadyDatePeriodEquals != null) r'estimatedReadyDate.equals': encodeQueryParameter(_serializers, estimatedReadyDatePeriodEquals, const FullType(DateTime)),
      if (estimatedReadyDatePeriodNotEquals != null) r'estimatedReadyDate.notEquals': encodeQueryParameter(_serializers, estimatedReadyDatePeriodNotEquals, const FullType(DateTime)),
      if (estimatedReadyDatePeriodSpecified != null) r'estimatedReadyDate.specified': encodeQueryParameter(_serializers, estimatedReadyDatePeriodSpecified, const FullType(bool)),
      if (estimatedReadyDatePeriodIn != null) r'estimatedReadyDate.in': encodeCollectionQueryParameter<DateTime>(_serializers, estimatedReadyDatePeriodIn, const FullType(BuiltList, [FullType(DateTime)]), format: ListFormat.multi,),
      if (estimatedReadyDatePeriodNotIn != null) r'estimatedReadyDate.notIn': encodeCollectionQueryParameter<DateTime>(_serializers, estimatedReadyDatePeriodNotIn, const FullType(BuiltList, [FullType(DateTime)]), format: ListFormat.multi,),
      if (currencyUomPeriodContains != null) r'currencyUom.contains': encodeQueryParameter(_serializers, currencyUomPeriodContains, const FullType(String)),
      if (currencyUomPeriodDoesNotContain != null) r'currencyUom.doesNotContain': encodeQueryParameter(_serializers, currencyUomPeriodDoesNotContain, const FullType(String)),
      if (currencyUomPeriodEquals != null) r'currencyUom.equals': encodeQueryParameter(_serializers, currencyUomPeriodEquals, const FullType(String)),
      if (currencyUomPeriodNotEquals != null) r'currencyUom.notEquals': encodeQueryParameter(_serializers, currencyUomPeriodNotEquals, const FullType(String)),
      if (currencyUomPeriodSpecified != null) r'currencyUom.specified': encodeQueryParameter(_serializers, currencyUomPeriodSpecified, const FullType(bool)),
      if (currencyUomPeriodIn != null) r'currencyUom.in': encodeCollectionQueryParameter<String>(_serializers, currencyUomPeriodIn, const FullType(BuiltList, [FullType(String)]), format: ListFormat.multi,),
      if (currencyUomPeriodNotIn != null) r'currencyUom.notIn': encodeCollectionQueryParameter<String>(_serializers, currencyUomPeriodNotIn, const FullType(BuiltList, [FullType(String)]), format: ListFormat.multi,),
      if (estimatedShipDatePeriodGreaterThan != null) r'estimatedShipDate.greaterThan': encodeQueryParameter(_serializers, estimatedShipDatePeriodGreaterThan, const FullType(DateTime)),
      if (estimatedShipDatePeriodLessThan != null) r'estimatedShipDate.lessThan': encodeQueryParameter(_serializers, estimatedShipDatePeriodLessThan, const FullType(DateTime)),
      if (estimatedShipDatePeriodGreaterThanOrEqual != null) r'estimatedShipDate.greaterThanOrEqual': encodeQueryParameter(_serializers, estimatedShipDatePeriodGreaterThanOrEqual, const FullType(DateTime)),
      if (estimatedShipDatePeriodLessThanOrEqual != null) r'estimatedShipDate.lessThanOrEqual': encodeQueryParameter(_serializers, estimatedShipDatePeriodLessThanOrEqual, const FullType(DateTime)),
      if (estimatedShipDatePeriodEquals != null) r'estimatedShipDate.equals': encodeQueryParameter(_serializers, estimatedShipDatePeriodEquals, const FullType(DateTime)),
      if (estimatedShipDatePeriodNotEquals != null) r'estimatedShipDate.notEquals': encodeQueryParameter(_serializers, estimatedShipDatePeriodNotEquals, const FullType(DateTime)),
      if (estimatedShipDatePeriodSpecified != null) r'estimatedShipDate.specified': encodeQueryParameter(_serializers, estimatedShipDatePeriodSpecified, const FullType(bool)),
      if (estimatedShipDatePeriodIn != null) r'estimatedShipDate.in': encodeCollectionQueryParameter<DateTime>(_serializers, estimatedShipDatePeriodIn, const FullType(BuiltList, [FullType(DateTime)]), format: ListFormat.multi,),
      if (estimatedShipDatePeriodNotIn != null) r'estimatedShipDate.notIn': encodeCollectionQueryParameter<DateTime>(_serializers, estimatedShipDatePeriodNotIn, const FullType(BuiltList, [FullType(DateTime)]), format: ListFormat.multi,),
      if (statusPeriodContains != null) r'status.contains': encodeQueryParameter(_serializers, statusPeriodContains, const FullType(String)),
      if (statusPeriodDoesNotContain != null) r'status.doesNotContain': encodeQueryParameter(_serializers, statusPeriodDoesNotContain, const FullType(String)),
      if (statusPeriodEquals != null) r'status.equals': encodeQueryParameter(_serializers, statusPeriodEquals, const FullType(String)),
      if (statusPeriodNotEquals != null) r'status.notEquals': encodeQueryParameter(_serializers, statusPeriodNotEquals, const FullType(String)),
      if (statusPeriodSpecified != null) r'status.specified': encodeQueryParameter(_serializers, statusPeriodSpecified, const FullType(bool)),
      if (statusPeriodIn != null) r'status.in': encodeCollectionQueryParameter<String>(_serializers, statusPeriodIn, const FullType(BuiltList, [FullType(String)]), format: ListFormat.multi,),
      if (statusPeriodNotIn != null) r'status.notIn': encodeCollectionQueryParameter<String>(_serializers, statusPeriodNotIn, const FullType(BuiltList, [FullType(String)]), format: ListFormat.multi,),
      if (referenceNumberPeriodContains != null) r'referenceNumber.contains': encodeQueryParameter(_serializers, referenceNumberPeriodContains, const FullType(String)),
      if (referenceNumberPeriodDoesNotContain != null) r'referenceNumber.doesNotContain': encodeQueryParameter(_serializers, referenceNumberPeriodDoesNotContain, const FullType(String)),
      if (referenceNumberPeriodEquals != null) r'referenceNumber.equals': encodeQueryParameter(_serializers, referenceNumberPeriodEquals, const FullType(String)),
      if (referenceNumberPeriodNotEquals != null) r'referenceNumber.notEquals': encodeQueryParameter(_serializers, referenceNumberPeriodNotEquals, const FullType(String)),
      if (referenceNumberPeriodSpecified != null) r'referenceNumber.specified': encodeQueryParameter(_serializers, referenceNumberPeriodSpecified, const FullType(bool)),
      if (referenceNumberPeriodIn != null) r'referenceNumber.in': encodeCollectionQueryParameter<String>(_serializers, referenceNumberPeriodIn, const FullType(BuiltList, [FullType(String)]), format: ListFormat.multi,),
      if (referenceNumberPeriodNotIn != null) r'referenceNumber.notIn': encodeCollectionQueryParameter<String>(_serializers, referenceNumberPeriodNotIn, const FullType(BuiltList, [FullType(String)]), format: ListFormat.multi,),
      if (currencyTypeIdPeriodGreaterThan != null) r'currencyTypeId.greaterThan': encodeQueryParameter(_serializers, currencyTypeIdPeriodGreaterThan, const FullType(int)),
      if (currencyTypeIdPeriodLessThan != null) r'currencyTypeId.lessThan': encodeQueryParameter(_serializers, currencyTypeIdPeriodLessThan, const FullType(int)),
      if (currencyTypeIdPeriodGreaterThanOrEqual != null) r'currencyTypeId.greaterThanOrEqual': encodeQueryParameter(_serializers, currencyTypeIdPeriodGreaterThanOrEqual, const FullType(int)),
      if (currencyTypeIdPeriodLessThanOrEqual != null) r'currencyTypeId.lessThanOrEqual': encodeQueryParameter(_serializers, currencyTypeIdPeriodLessThanOrEqual, const FullType(int)),
      if (currencyTypeIdPeriodEquals != null) r'currencyTypeId.equals': encodeQueryParameter(_serializers, currencyTypeIdPeriodEquals, const FullType(int)),
      if (currencyTypeIdPeriodNotEquals != null) r'currencyTypeId.notEquals': encodeQueryParameter(_serializers, currencyTypeIdPeriodNotEquals, const FullType(int)),
      if (currencyTypeIdPeriodSpecified != null) r'currencyTypeId.specified': encodeQueryParameter(_serializers, currencyTypeIdPeriodSpecified, const FullType(bool)),
      if (currencyTypeIdPeriodIn != null) r'currencyTypeId.in': encodeCollectionQueryParameter<int>(_serializers, currencyTypeIdPeriodIn, const FullType(BuiltList, [FullType(int)]), format: ListFormat.multi,),
      if (currencyTypeIdPeriodNotIn != null) r'currencyTypeId.notIn': encodeCollectionQueryParameter<int>(_serializers, currencyTypeIdPeriodNotIn, const FullType(BuiltList, [FullType(int)]), format: ListFormat.multi,),
      if (distinct != null) r'distinct': encodeQueryParameter(_serializers, distinct, const FullType(bool)),
      if (page != null) r'page': encodeQueryParameter(_serializers, page, const FullType(int)),
      if (size != null) r'size': encodeQueryParameter(_serializers, size, const FullType(int)),
      if (sort != null) r'sort': encodeCollectionQueryParameter<String>(_serializers, sort, const FullType(BuiltList, [FullType(String)]), format: ListFormat.multi,),
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    BuiltList<WayBillDTO>? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(BuiltList, [FullType(WayBillDTO)]),
      ) as BuiltList<WayBillDTO>;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<BuiltList<WayBillDTO>>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// getWayBill
  /// 
  ///
  /// Parameters:
  /// * [id] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [WayBillDTO] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<WayBillDTO>> getWayBill({ 
    required int id,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/way-bills/{id}'.replaceAll('{' r'id' '}', encodeQueryParameter(_serializers, id, const FullType(int)).toString());
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    WayBillDTO? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(WayBillDTO),
      ) as WayBillDTO;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<WayBillDTO>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// getWayBillIdsByCurrency
  /// 
  ///
  /// Parameters:
  /// * [currency] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [BuiltList<int>] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<BuiltList<int>>> getWayBillIdsByCurrency({ 
    required String currency,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/way-bills/waybills/by-currency/{currency}'.replaceAll('{' r'currency' '}', encodeQueryParameter(_serializers, currency, const FullType(String)).toString());
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    BuiltList<int>? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(BuiltList, [FullType(int)]),
      ) as BuiltList<int>;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<BuiltList<int>>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// getWayBillIdsByCurrency1
  /// 
  ///
  /// Parameters:
  /// * [currencyId] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [BuiltList<int>] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<BuiltList<int>>> getWayBillIdsByCurrency1({ 
    required int currencyId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/way-bills/by-currency-id/{currencyId}'.replaceAll('{' r'currencyId' '}', encodeQueryParameter(_serializers, currencyId, const FullType(int)).toString());
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    BuiltList<int>? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(BuiltList, [FullType(int)]),
      ) as BuiltList<int>;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<BuiltList<int>>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// partialUpdateWayBill
  /// 
  ///
  /// Parameters:
  /// * [id] 
  /// * [wayBillDTO] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [WayBillDTO] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<WayBillDTO>> partialUpdateWayBill({ 
    required int id,
    required WayBillDTO wayBillDTO,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/way-bills/{id}'.replaceAll('{' r'id' '}', encodeQueryParameter(_serializers, id, const FullType(int)).toString());
    final _options = Options(
      method: r'PATCH',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      contentType: 'application/json',
      validateStatus: validateStatus,
    );

    dynamic _bodyData;

    try {
      const _type = FullType(WayBillDTO);
      _bodyData = _serializers.serialize(wayBillDTO, specifiedType: _type);

    } catch(error, stackTrace) {
      throw DioException(
         requestOptions: _options.compose(
          _dio.options,
          _path,
        ),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    WayBillDTO? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(WayBillDTO),
      ) as WayBillDTO;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<WayBillDTO>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// updateWayBill
  /// 
  ///
  /// Parameters:
  /// * [id] 
  /// * [wayBillDTO] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [WayBillDTO] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<WayBillDTO>> updateWayBill({ 
    required int id,
    required WayBillDTO wayBillDTO,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/way-bills/{id}'.replaceAll('{' r'id' '}', encodeQueryParameter(_serializers, id, const FullType(int)).toString());
    final _options = Options(
      method: r'PUT',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      contentType: 'application/json',
      validateStatus: validateStatus,
    );

    dynamic _bodyData;

    try {
      const _type = FullType(WayBillDTO);
      _bodyData = _serializers.serialize(wayBillDTO, specifiedType: _type);

    } catch(error, stackTrace) {
      throw DioException(
         requestOptions: _options.compose(
          _dio.options,
          _path,
        ),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    WayBillDTO? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(WayBillDTO),
      ) as WayBillDTO;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<WayBillDTO>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

}
