//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';

import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/api_util.dart';
import 'package:openapi/src/model/organisation_dto.dart';

class OrganisationResourceApi {

  final Dio _dio;

  final Serializers _serializers;

  const OrganisationResourceApi(this._dio, this._serializers);

  /// countOrganisations
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
  /// * [namePeriodContains] 
  /// * [namePeriodDoesNotContain] 
  /// * [namePeriodEquals] 
  /// * [namePeriodNotEquals] 
  /// * [namePeriodSpecified] 
  /// * [namePeriodIn] 
  /// * [namePeriodNotIn] 
  /// * [agentTypeIdPeriodGreaterThan] 
  /// * [agentTypeIdPeriodLessThan] 
  /// * [agentTypeIdPeriodGreaterThanOrEqual] 
  /// * [agentTypeIdPeriodLessThanOrEqual] 
  /// * [agentTypeIdPeriodEquals] 
  /// * [agentTypeIdPeriodNotEquals] 
  /// * [agentTypeIdPeriodSpecified] 
  /// * [agentTypeIdPeriodIn] 
  /// * [agentTypeIdPeriodNotIn] 
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
  Future<Response<int>> countOrganisations({ 
    int? idPeriodGreaterThan,
    int? idPeriodLessThan,
    int? idPeriodGreaterThanOrEqual,
    int? idPeriodLessThanOrEqual,
    int? idPeriodEquals,
    int? idPeriodNotEquals,
    bool? idPeriodSpecified,
    BuiltList<int>? idPeriodIn,
    BuiltList<int>? idPeriodNotIn,
    String? namePeriodContains,
    String? namePeriodDoesNotContain,
    String? namePeriodEquals,
    String? namePeriodNotEquals,
    bool? namePeriodSpecified,
    BuiltList<String>? namePeriodIn,
    BuiltList<String>? namePeriodNotIn,
    int? agentTypeIdPeriodGreaterThan,
    int? agentTypeIdPeriodLessThan,
    int? agentTypeIdPeriodGreaterThanOrEqual,
    int? agentTypeIdPeriodLessThanOrEqual,
    int? agentTypeIdPeriodEquals,
    int? agentTypeIdPeriodNotEquals,
    bool? agentTypeIdPeriodSpecified,
    BuiltList<int>? agentTypeIdPeriodIn,
    BuiltList<int>? agentTypeIdPeriodNotIn,
    bool? distinct,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/organisations/count';
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
      if (namePeriodContains != null) r'name.contains': encodeQueryParameter(_serializers, namePeriodContains, const FullType(String)),
      if (namePeriodDoesNotContain != null) r'name.doesNotContain': encodeQueryParameter(_serializers, namePeriodDoesNotContain, const FullType(String)),
      if (namePeriodEquals != null) r'name.equals': encodeQueryParameter(_serializers, namePeriodEquals, const FullType(String)),
      if (namePeriodNotEquals != null) r'name.notEquals': encodeQueryParameter(_serializers, namePeriodNotEquals, const FullType(String)),
      if (namePeriodSpecified != null) r'name.specified': encodeQueryParameter(_serializers, namePeriodSpecified, const FullType(bool)),
      if (namePeriodIn != null) r'name.in': encodeCollectionQueryParameter<String>(_serializers, namePeriodIn, const FullType(BuiltList, [FullType(String)]), format: ListFormat.multi,),
      if (namePeriodNotIn != null) r'name.notIn': encodeCollectionQueryParameter<String>(_serializers, namePeriodNotIn, const FullType(BuiltList, [FullType(String)]), format: ListFormat.multi,),
      if (agentTypeIdPeriodGreaterThan != null) r'agentTypeId.greaterThan': encodeQueryParameter(_serializers, agentTypeIdPeriodGreaterThan, const FullType(int)),
      if (agentTypeIdPeriodLessThan != null) r'agentTypeId.lessThan': encodeQueryParameter(_serializers, agentTypeIdPeriodLessThan, const FullType(int)),
      if (agentTypeIdPeriodGreaterThanOrEqual != null) r'agentTypeId.greaterThanOrEqual': encodeQueryParameter(_serializers, agentTypeIdPeriodGreaterThanOrEqual, const FullType(int)),
      if (agentTypeIdPeriodLessThanOrEqual != null) r'agentTypeId.lessThanOrEqual': encodeQueryParameter(_serializers, agentTypeIdPeriodLessThanOrEqual, const FullType(int)),
      if (agentTypeIdPeriodEquals != null) r'agentTypeId.equals': encodeQueryParameter(_serializers, agentTypeIdPeriodEquals, const FullType(int)),
      if (agentTypeIdPeriodNotEquals != null) r'agentTypeId.notEquals': encodeQueryParameter(_serializers, agentTypeIdPeriodNotEquals, const FullType(int)),
      if (agentTypeIdPeriodSpecified != null) r'agentTypeId.specified': encodeQueryParameter(_serializers, agentTypeIdPeriodSpecified, const FullType(bool)),
      if (agentTypeIdPeriodIn != null) r'agentTypeId.in': encodeCollectionQueryParameter<int>(_serializers, agentTypeIdPeriodIn, const FullType(BuiltList, [FullType(int)]), format: ListFormat.multi,),
      if (agentTypeIdPeriodNotIn != null) r'agentTypeId.notIn': encodeCollectionQueryParameter<int>(_serializers, agentTypeIdPeriodNotIn, const FullType(BuiltList, [FullType(int)]), format: ListFormat.multi,),
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

  /// createOrganisation
  /// 
  ///
  /// Parameters:
  /// * [organisationDTO] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [OrganisationDTO] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<OrganisationDTO>> createOrganisation({ 
    required OrganisationDTO organisationDTO,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/organisations';
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
      const _type = FullType(OrganisationDTO);
      _bodyData = _serializers.serialize(organisationDTO, specifiedType: _type);

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

    OrganisationDTO? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(OrganisationDTO),
      ) as OrganisationDTO;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<OrganisationDTO>(
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

  /// deleteOrganisation
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
  Future<Response<void>> deleteOrganisation({ 
    required int id,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/organisations/{id}'.replaceAll('{' r'id' '}', encodeQueryParameter(_serializers, id, const FullType(int)).toString());
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

  /// getAllOrganisations
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
  /// * [namePeriodContains] 
  /// * [namePeriodDoesNotContain] 
  /// * [namePeriodEquals] 
  /// * [namePeriodNotEquals] 
  /// * [namePeriodSpecified] 
  /// * [namePeriodIn] 
  /// * [namePeriodNotIn] 
  /// * [agentTypeIdPeriodGreaterThan] 
  /// * [agentTypeIdPeriodLessThan] 
  /// * [agentTypeIdPeriodGreaterThanOrEqual] 
  /// * [agentTypeIdPeriodLessThanOrEqual] 
  /// * [agentTypeIdPeriodEquals] 
  /// * [agentTypeIdPeriodNotEquals] 
  /// * [agentTypeIdPeriodSpecified] 
  /// * [agentTypeIdPeriodIn] 
  /// * [agentTypeIdPeriodNotIn] 
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
  /// Returns a [Future] containing a [Response] with a [BuiltList<OrganisationDTO>] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<BuiltList<OrganisationDTO>>> getAllOrganisations({ 
    int? idPeriodGreaterThan,
    int? idPeriodLessThan,
    int? idPeriodGreaterThanOrEqual,
    int? idPeriodLessThanOrEqual,
    int? idPeriodEquals,
    int? idPeriodNotEquals,
    bool? idPeriodSpecified,
    BuiltList<int>? idPeriodIn,
    BuiltList<int>? idPeriodNotIn,
    String? namePeriodContains,
    String? namePeriodDoesNotContain,
    String? namePeriodEquals,
    String? namePeriodNotEquals,
    bool? namePeriodSpecified,
    BuiltList<String>? namePeriodIn,
    BuiltList<String>? namePeriodNotIn,
    int? agentTypeIdPeriodGreaterThan,
    int? agentTypeIdPeriodLessThan,
    int? agentTypeIdPeriodGreaterThanOrEqual,
    int? agentTypeIdPeriodLessThanOrEqual,
    int? agentTypeIdPeriodEquals,
    int? agentTypeIdPeriodNotEquals,
    bool? agentTypeIdPeriodSpecified,
    BuiltList<int>? agentTypeIdPeriodIn,
    BuiltList<int>? agentTypeIdPeriodNotIn,
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
    final _path = r'/api/organisations';
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
      if (namePeriodContains != null) r'name.contains': encodeQueryParameter(_serializers, namePeriodContains, const FullType(String)),
      if (namePeriodDoesNotContain != null) r'name.doesNotContain': encodeQueryParameter(_serializers, namePeriodDoesNotContain, const FullType(String)),
      if (namePeriodEquals != null) r'name.equals': encodeQueryParameter(_serializers, namePeriodEquals, const FullType(String)),
      if (namePeriodNotEquals != null) r'name.notEquals': encodeQueryParameter(_serializers, namePeriodNotEquals, const FullType(String)),
      if (namePeriodSpecified != null) r'name.specified': encodeQueryParameter(_serializers, namePeriodSpecified, const FullType(bool)),
      if (namePeriodIn != null) r'name.in': encodeCollectionQueryParameter<String>(_serializers, namePeriodIn, const FullType(BuiltList, [FullType(String)]), format: ListFormat.multi,),
      if (namePeriodNotIn != null) r'name.notIn': encodeCollectionQueryParameter<String>(_serializers, namePeriodNotIn, const FullType(BuiltList, [FullType(String)]), format: ListFormat.multi,),
      if (agentTypeIdPeriodGreaterThan != null) r'agentTypeId.greaterThan': encodeQueryParameter(_serializers, agentTypeIdPeriodGreaterThan, const FullType(int)),
      if (agentTypeIdPeriodLessThan != null) r'agentTypeId.lessThan': encodeQueryParameter(_serializers, agentTypeIdPeriodLessThan, const FullType(int)),
      if (agentTypeIdPeriodGreaterThanOrEqual != null) r'agentTypeId.greaterThanOrEqual': encodeQueryParameter(_serializers, agentTypeIdPeriodGreaterThanOrEqual, const FullType(int)),
      if (agentTypeIdPeriodLessThanOrEqual != null) r'agentTypeId.lessThanOrEqual': encodeQueryParameter(_serializers, agentTypeIdPeriodLessThanOrEqual, const FullType(int)),
      if (agentTypeIdPeriodEquals != null) r'agentTypeId.equals': encodeQueryParameter(_serializers, agentTypeIdPeriodEquals, const FullType(int)),
      if (agentTypeIdPeriodNotEquals != null) r'agentTypeId.notEquals': encodeQueryParameter(_serializers, agentTypeIdPeriodNotEquals, const FullType(int)),
      if (agentTypeIdPeriodSpecified != null) r'agentTypeId.specified': encodeQueryParameter(_serializers, agentTypeIdPeriodSpecified, const FullType(bool)),
      if (agentTypeIdPeriodIn != null) r'agentTypeId.in': encodeCollectionQueryParameter<int>(_serializers, agentTypeIdPeriodIn, const FullType(BuiltList, [FullType(int)]), format: ListFormat.multi,),
      if (agentTypeIdPeriodNotIn != null) r'agentTypeId.notIn': encodeCollectionQueryParameter<int>(_serializers, agentTypeIdPeriodNotIn, const FullType(BuiltList, [FullType(int)]), format: ListFormat.multi,),
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

    BuiltList<OrganisationDTO>? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(BuiltList, [FullType(OrganisationDTO)]),
      ) as BuiltList<OrganisationDTO>;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<BuiltList<OrganisationDTO>>(
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

  /// getOrganisation
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
  /// Returns a [Future] containing a [Response] with a [OrganisationDTO] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<OrganisationDTO>> getOrganisation({ 
    required int id,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/organisations/{id}'.replaceAll('{' r'id' '}', encodeQueryParameter(_serializers, id, const FullType(int)).toString());
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

    OrganisationDTO? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(OrganisationDTO),
      ) as OrganisationDTO;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<OrganisationDTO>(
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

  /// partialUpdateOrganisation
  /// 
  ///
  /// Parameters:
  /// * [id] 
  /// * [organisationDTO] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [OrganisationDTO] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<OrganisationDTO>> partialUpdateOrganisation({ 
    required int id,
    required OrganisationDTO organisationDTO,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/organisations/{id}'.replaceAll('{' r'id' '}', encodeQueryParameter(_serializers, id, const FullType(int)).toString());
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
      const _type = FullType(OrganisationDTO);
      _bodyData = _serializers.serialize(organisationDTO, specifiedType: _type);

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

    OrganisationDTO? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(OrganisationDTO),
      ) as OrganisationDTO;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<OrganisationDTO>(
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

  /// updateOrganisation
  /// 
  ///
  /// Parameters:
  /// * [id] 
  /// * [organisationDTO] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [OrganisationDTO] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<OrganisationDTO>> updateOrganisation({ 
    required int id,
    required OrganisationDTO organisationDTO,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/organisations/{id}'.replaceAll('{' r'id' '}', encodeQueryParameter(_serializers, id, const FullType(int)).toString());
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
      const _type = FullType(OrganisationDTO);
      _bodyData = _serializers.serialize(organisationDTO, specifiedType: _type);

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

    OrganisationDTO? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(OrganisationDTO),
      ) as OrganisationDTO;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<OrganisationDTO>(
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
