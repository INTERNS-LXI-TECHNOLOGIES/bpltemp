# openapi.api.WayBillResourceApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**countWayBills**](WayBillResourceApi.md#countwaybills) | **GET** /api/way-bills/count | 
[**createWayBill**](WayBillResourceApi.md#createwaybill) | **POST** /api/way-bills | 
[**deleteWayBill**](WayBillResourceApi.md#deletewaybill) | **DELETE** /api/way-bills/{id} | 
[**getAllWayBills**](WayBillResourceApi.md#getallwaybills) | **GET** /api/way-bills | 
[**getWayBill**](WayBillResourceApi.md#getwaybill) | **GET** /api/way-bills/{id} | 
[**getWayBillIdsByCurrency**](WayBillResourceApi.md#getwaybillidsbycurrency) | **GET** /api/way-bills/waybills/by-currency/{currency} | 
[**getWayBillIdsByCurrency1**](WayBillResourceApi.md#getwaybillidsbycurrency1) | **GET** /api/way-bills/by-currency-id/{currencyId} | 
[**partialUpdateWayBill**](WayBillResourceApi.md#partialupdatewaybill) | **PATCH** /api/way-bills/{id} | 
[**updateWayBill**](WayBillResourceApi.md#updatewaybill) | **PUT** /api/way-bills/{id} | 


# **countWayBills**
> int countWayBills(idPeriodGreaterThan, idPeriodLessThan, idPeriodGreaterThanOrEqual, idPeriodLessThanOrEqual, idPeriodEquals, idPeriodNotEquals, idPeriodSpecified, idPeriodIn, idPeriodNotIn, boxLimitPeriodGreaterThan, boxLimitPeriodLessThan, boxLimitPeriodGreaterThanOrEqual, boxLimitPeriodLessThanOrEqual, boxLimitPeriodEquals, boxLimitPeriodNotEquals, boxLimitPeriodSpecified, boxLimitPeriodIn, boxLimitPeriodNotIn, shipmentTypePeriodContains, shipmentTypePeriodDoesNotContain, shipmentTypePeriodEquals, shipmentTypePeriodNotEquals, shipmentTypePeriodSpecified, shipmentTypePeriodIn, shipmentTypePeriodNotIn, opfacPeriodContains, opfacPeriodDoesNotContain, opfacPeriodEquals, opfacPeriodNotEquals, opfacPeriodSpecified, opfacPeriodIn, opfacPeriodNotIn, deliveryAgentPeriodContains, deliveryAgentPeriodDoesNotContain, deliveryAgentPeriodEquals, deliveryAgentPeriodNotEquals, deliveryAgentPeriodSpecified, deliveryAgentPeriodIn, deliveryAgentPeriodNotIn, estimatedReadyDatePeriodGreaterThan, estimatedReadyDatePeriodLessThan, estimatedReadyDatePeriodGreaterThanOrEqual, estimatedReadyDatePeriodLessThanOrEqual, estimatedReadyDatePeriodEquals, estimatedReadyDatePeriodNotEquals, estimatedReadyDatePeriodSpecified, estimatedReadyDatePeriodIn, estimatedReadyDatePeriodNotIn, currencyUomPeriodContains, currencyUomPeriodDoesNotContain, currencyUomPeriodEquals, currencyUomPeriodNotEquals, currencyUomPeriodSpecified, currencyUomPeriodIn, currencyUomPeriodNotIn, estimatedShipDatePeriodGreaterThan, estimatedShipDatePeriodLessThan, estimatedShipDatePeriodGreaterThanOrEqual, estimatedShipDatePeriodLessThanOrEqual, estimatedShipDatePeriodEquals, estimatedShipDatePeriodNotEquals, estimatedShipDatePeriodSpecified, estimatedShipDatePeriodIn, estimatedShipDatePeriodNotIn, statusPeriodContains, statusPeriodDoesNotContain, statusPeriodEquals, statusPeriodNotEquals, statusPeriodSpecified, statusPeriodIn, statusPeriodNotIn, referenceNumberPeriodContains, referenceNumberPeriodDoesNotContain, referenceNumberPeriodEquals, referenceNumberPeriodNotEquals, referenceNumberPeriodSpecified, referenceNumberPeriodIn, referenceNumberPeriodNotIn, currencyTypeIdPeriodGreaterThan, currencyTypeIdPeriodLessThan, currencyTypeIdPeriodGreaterThanOrEqual, currencyTypeIdPeriodLessThanOrEqual, currencyTypeIdPeriodEquals, currencyTypeIdPeriodNotEquals, currencyTypeIdPeriodSpecified, currencyTypeIdPeriodIn, currencyTypeIdPeriodNotIn, distinct)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getWayBillResourceApi();
final int idPeriodGreaterThan = 789; // int | 
final int idPeriodLessThan = 789; // int | 
final int idPeriodGreaterThanOrEqual = 789; // int | 
final int idPeriodLessThanOrEqual = 789; // int | 
final int idPeriodEquals = 789; // int | 
final int idPeriodNotEquals = 789; // int | 
final bool idPeriodSpecified = true; // bool | 
final BuiltList<int> idPeriodIn = ; // BuiltList<int> | 
final BuiltList<int> idPeriodNotIn = ; // BuiltList<int> | 
final int boxLimitPeriodGreaterThan = 56; // int | 
final int boxLimitPeriodLessThan = 56; // int | 
final int boxLimitPeriodGreaterThanOrEqual = 56; // int | 
final int boxLimitPeriodLessThanOrEqual = 56; // int | 
final int boxLimitPeriodEquals = 56; // int | 
final int boxLimitPeriodNotEquals = 56; // int | 
final bool boxLimitPeriodSpecified = true; // bool | 
final BuiltList<int> boxLimitPeriodIn = ; // BuiltList<int> | 
final BuiltList<int> boxLimitPeriodNotIn = ; // BuiltList<int> | 
final String shipmentTypePeriodContains = shipmentTypePeriodContains_example; // String | 
final String shipmentTypePeriodDoesNotContain = shipmentTypePeriodDoesNotContain_example; // String | 
final String shipmentTypePeriodEquals = shipmentTypePeriodEquals_example; // String | 
final String shipmentTypePeriodNotEquals = shipmentTypePeriodNotEquals_example; // String | 
final bool shipmentTypePeriodSpecified = true; // bool | 
final BuiltList<String> shipmentTypePeriodIn = ; // BuiltList<String> | 
final BuiltList<String> shipmentTypePeriodNotIn = ; // BuiltList<String> | 
final String opfacPeriodContains = opfacPeriodContains_example; // String | 
final String opfacPeriodDoesNotContain = opfacPeriodDoesNotContain_example; // String | 
final String opfacPeriodEquals = opfacPeriodEquals_example; // String | 
final String opfacPeriodNotEquals = opfacPeriodNotEquals_example; // String | 
final bool opfacPeriodSpecified = true; // bool | 
final BuiltList<String> opfacPeriodIn = ; // BuiltList<String> | 
final BuiltList<String> opfacPeriodNotIn = ; // BuiltList<String> | 
final String deliveryAgentPeriodContains = deliveryAgentPeriodContains_example; // String | 
final String deliveryAgentPeriodDoesNotContain = deliveryAgentPeriodDoesNotContain_example; // String | 
final String deliveryAgentPeriodEquals = deliveryAgentPeriodEquals_example; // String | 
final String deliveryAgentPeriodNotEquals = deliveryAgentPeriodNotEquals_example; // String | 
final bool deliveryAgentPeriodSpecified = true; // bool | 
final BuiltList<String> deliveryAgentPeriodIn = ; // BuiltList<String> | 
final BuiltList<String> deliveryAgentPeriodNotIn = ; // BuiltList<String> | 
final DateTime estimatedReadyDatePeriodGreaterThan = 2013-10-20T19:20:30+01:00; // DateTime | 
final DateTime estimatedReadyDatePeriodLessThan = 2013-10-20T19:20:30+01:00; // DateTime | 
final DateTime estimatedReadyDatePeriodGreaterThanOrEqual = 2013-10-20T19:20:30+01:00; // DateTime | 
final DateTime estimatedReadyDatePeriodLessThanOrEqual = 2013-10-20T19:20:30+01:00; // DateTime | 
final DateTime estimatedReadyDatePeriodEquals = 2013-10-20T19:20:30+01:00; // DateTime | 
final DateTime estimatedReadyDatePeriodNotEquals = 2013-10-20T19:20:30+01:00; // DateTime | 
final bool estimatedReadyDatePeriodSpecified = true; // bool | 
final BuiltList<DateTime> estimatedReadyDatePeriodIn = ; // BuiltList<DateTime> | 
final BuiltList<DateTime> estimatedReadyDatePeriodNotIn = ; // BuiltList<DateTime> | 
final String currencyUomPeriodContains = currencyUomPeriodContains_example; // String | 
final String currencyUomPeriodDoesNotContain = currencyUomPeriodDoesNotContain_example; // String | 
final String currencyUomPeriodEquals = currencyUomPeriodEquals_example; // String | 
final String currencyUomPeriodNotEquals = currencyUomPeriodNotEquals_example; // String | 
final bool currencyUomPeriodSpecified = true; // bool | 
final BuiltList<String> currencyUomPeriodIn = ; // BuiltList<String> | 
final BuiltList<String> currencyUomPeriodNotIn = ; // BuiltList<String> | 
final DateTime estimatedShipDatePeriodGreaterThan = 2013-10-20T19:20:30+01:00; // DateTime | 
final DateTime estimatedShipDatePeriodLessThan = 2013-10-20T19:20:30+01:00; // DateTime | 
final DateTime estimatedShipDatePeriodGreaterThanOrEqual = 2013-10-20T19:20:30+01:00; // DateTime | 
final DateTime estimatedShipDatePeriodLessThanOrEqual = 2013-10-20T19:20:30+01:00; // DateTime | 
final DateTime estimatedShipDatePeriodEquals = 2013-10-20T19:20:30+01:00; // DateTime | 
final DateTime estimatedShipDatePeriodNotEquals = 2013-10-20T19:20:30+01:00; // DateTime | 
final bool estimatedShipDatePeriodSpecified = true; // bool | 
final BuiltList<DateTime> estimatedShipDatePeriodIn = ; // BuiltList<DateTime> | 
final BuiltList<DateTime> estimatedShipDatePeriodNotIn = ; // BuiltList<DateTime> | 
final String statusPeriodContains = statusPeriodContains_example; // String | 
final String statusPeriodDoesNotContain = statusPeriodDoesNotContain_example; // String | 
final String statusPeriodEquals = statusPeriodEquals_example; // String | 
final String statusPeriodNotEquals = statusPeriodNotEquals_example; // String | 
final bool statusPeriodSpecified = true; // bool | 
final BuiltList<String> statusPeriodIn = ; // BuiltList<String> | 
final BuiltList<String> statusPeriodNotIn = ; // BuiltList<String> | 
final String referenceNumberPeriodContains = referenceNumberPeriodContains_example; // String | 
final String referenceNumberPeriodDoesNotContain = referenceNumberPeriodDoesNotContain_example; // String | 
final String referenceNumberPeriodEquals = referenceNumberPeriodEquals_example; // String | 
final String referenceNumberPeriodNotEquals = referenceNumberPeriodNotEquals_example; // String | 
final bool referenceNumberPeriodSpecified = true; // bool | 
final BuiltList<String> referenceNumberPeriodIn = ; // BuiltList<String> | 
final BuiltList<String> referenceNumberPeriodNotIn = ; // BuiltList<String> | 
final int currencyTypeIdPeriodGreaterThan = 789; // int | 
final int currencyTypeIdPeriodLessThan = 789; // int | 
final int currencyTypeIdPeriodGreaterThanOrEqual = 789; // int | 
final int currencyTypeIdPeriodLessThanOrEqual = 789; // int | 
final int currencyTypeIdPeriodEquals = 789; // int | 
final int currencyTypeIdPeriodNotEquals = 789; // int | 
final bool currencyTypeIdPeriodSpecified = true; // bool | 
final BuiltList<int> currencyTypeIdPeriodIn = ; // BuiltList<int> | 
final BuiltList<int> currencyTypeIdPeriodNotIn = ; // BuiltList<int> | 
final bool distinct = true; // bool | 

try {
    final response = api.countWayBills(idPeriodGreaterThan, idPeriodLessThan, idPeriodGreaterThanOrEqual, idPeriodLessThanOrEqual, idPeriodEquals, idPeriodNotEquals, idPeriodSpecified, idPeriodIn, idPeriodNotIn, boxLimitPeriodGreaterThan, boxLimitPeriodLessThan, boxLimitPeriodGreaterThanOrEqual, boxLimitPeriodLessThanOrEqual, boxLimitPeriodEquals, boxLimitPeriodNotEquals, boxLimitPeriodSpecified, boxLimitPeriodIn, boxLimitPeriodNotIn, shipmentTypePeriodContains, shipmentTypePeriodDoesNotContain, shipmentTypePeriodEquals, shipmentTypePeriodNotEquals, shipmentTypePeriodSpecified, shipmentTypePeriodIn, shipmentTypePeriodNotIn, opfacPeriodContains, opfacPeriodDoesNotContain, opfacPeriodEquals, opfacPeriodNotEquals, opfacPeriodSpecified, opfacPeriodIn, opfacPeriodNotIn, deliveryAgentPeriodContains, deliveryAgentPeriodDoesNotContain, deliveryAgentPeriodEquals, deliveryAgentPeriodNotEquals, deliveryAgentPeriodSpecified, deliveryAgentPeriodIn, deliveryAgentPeriodNotIn, estimatedReadyDatePeriodGreaterThan, estimatedReadyDatePeriodLessThan, estimatedReadyDatePeriodGreaterThanOrEqual, estimatedReadyDatePeriodLessThanOrEqual, estimatedReadyDatePeriodEquals, estimatedReadyDatePeriodNotEquals, estimatedReadyDatePeriodSpecified, estimatedReadyDatePeriodIn, estimatedReadyDatePeriodNotIn, currencyUomPeriodContains, currencyUomPeriodDoesNotContain, currencyUomPeriodEquals, currencyUomPeriodNotEquals, currencyUomPeriodSpecified, currencyUomPeriodIn, currencyUomPeriodNotIn, estimatedShipDatePeriodGreaterThan, estimatedShipDatePeriodLessThan, estimatedShipDatePeriodGreaterThanOrEqual, estimatedShipDatePeriodLessThanOrEqual, estimatedShipDatePeriodEquals, estimatedShipDatePeriodNotEquals, estimatedShipDatePeriodSpecified, estimatedShipDatePeriodIn, estimatedShipDatePeriodNotIn, statusPeriodContains, statusPeriodDoesNotContain, statusPeriodEquals, statusPeriodNotEquals, statusPeriodSpecified, statusPeriodIn, statusPeriodNotIn, referenceNumberPeriodContains, referenceNumberPeriodDoesNotContain, referenceNumberPeriodEquals, referenceNumberPeriodNotEquals, referenceNumberPeriodSpecified, referenceNumberPeriodIn, referenceNumberPeriodNotIn, currencyTypeIdPeriodGreaterThan, currencyTypeIdPeriodLessThan, currencyTypeIdPeriodGreaterThanOrEqual, currencyTypeIdPeriodLessThanOrEqual, currencyTypeIdPeriodEquals, currencyTypeIdPeriodNotEquals, currencyTypeIdPeriodSpecified, currencyTypeIdPeriodIn, currencyTypeIdPeriodNotIn, distinct);
    print(response);
} catch on DioException (e) {
    print('Exception when calling WayBillResourceApi->countWayBills: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **idPeriodGreaterThan** | **int**|  | [optional] 
 **idPeriodLessThan** | **int**|  | [optional] 
 **idPeriodGreaterThanOrEqual** | **int**|  | [optional] 
 **idPeriodLessThanOrEqual** | **int**|  | [optional] 
 **idPeriodEquals** | **int**|  | [optional] 
 **idPeriodNotEquals** | **int**|  | [optional] 
 **idPeriodSpecified** | **bool**|  | [optional] 
 **idPeriodIn** | [**BuiltList&lt;int&gt;**](int.md)|  | [optional] 
 **idPeriodNotIn** | [**BuiltList&lt;int&gt;**](int.md)|  | [optional] 
 **boxLimitPeriodGreaterThan** | **int**|  | [optional] 
 **boxLimitPeriodLessThan** | **int**|  | [optional] 
 **boxLimitPeriodGreaterThanOrEqual** | **int**|  | [optional] 
 **boxLimitPeriodLessThanOrEqual** | **int**|  | [optional] 
 **boxLimitPeriodEquals** | **int**|  | [optional] 
 **boxLimitPeriodNotEquals** | **int**|  | [optional] 
 **boxLimitPeriodSpecified** | **bool**|  | [optional] 
 **boxLimitPeriodIn** | [**BuiltList&lt;int&gt;**](int.md)|  | [optional] 
 **boxLimitPeriodNotIn** | [**BuiltList&lt;int&gt;**](int.md)|  | [optional] 
 **shipmentTypePeriodContains** | **String**|  | [optional] 
 **shipmentTypePeriodDoesNotContain** | **String**|  | [optional] 
 **shipmentTypePeriodEquals** | **String**|  | [optional] 
 **shipmentTypePeriodNotEquals** | **String**|  | [optional] 
 **shipmentTypePeriodSpecified** | **bool**|  | [optional] 
 **shipmentTypePeriodIn** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 
 **shipmentTypePeriodNotIn** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 
 **opfacPeriodContains** | **String**|  | [optional] 
 **opfacPeriodDoesNotContain** | **String**|  | [optional] 
 **opfacPeriodEquals** | **String**|  | [optional] 
 **opfacPeriodNotEquals** | **String**|  | [optional] 
 **opfacPeriodSpecified** | **bool**|  | [optional] 
 **opfacPeriodIn** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 
 **opfacPeriodNotIn** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 
 **deliveryAgentPeriodContains** | **String**|  | [optional] 
 **deliveryAgentPeriodDoesNotContain** | **String**|  | [optional] 
 **deliveryAgentPeriodEquals** | **String**|  | [optional] 
 **deliveryAgentPeriodNotEquals** | **String**|  | [optional] 
 **deliveryAgentPeriodSpecified** | **bool**|  | [optional] 
 **deliveryAgentPeriodIn** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 
 **deliveryAgentPeriodNotIn** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 
 **estimatedReadyDatePeriodGreaterThan** | **DateTime**|  | [optional] 
 **estimatedReadyDatePeriodLessThan** | **DateTime**|  | [optional] 
 **estimatedReadyDatePeriodGreaterThanOrEqual** | **DateTime**|  | [optional] 
 **estimatedReadyDatePeriodLessThanOrEqual** | **DateTime**|  | [optional] 
 **estimatedReadyDatePeriodEquals** | **DateTime**|  | [optional] 
 **estimatedReadyDatePeriodNotEquals** | **DateTime**|  | [optional] 
 **estimatedReadyDatePeriodSpecified** | **bool**|  | [optional] 
 **estimatedReadyDatePeriodIn** | [**BuiltList&lt;DateTime&gt;**](DateTime.md)|  | [optional] 
 **estimatedReadyDatePeriodNotIn** | [**BuiltList&lt;DateTime&gt;**](DateTime.md)|  | [optional] 
 **currencyUomPeriodContains** | **String**|  | [optional] 
 **currencyUomPeriodDoesNotContain** | **String**|  | [optional] 
 **currencyUomPeriodEquals** | **String**|  | [optional] 
 **currencyUomPeriodNotEquals** | **String**|  | [optional] 
 **currencyUomPeriodSpecified** | **bool**|  | [optional] 
 **currencyUomPeriodIn** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 
 **currencyUomPeriodNotIn** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 
 **estimatedShipDatePeriodGreaterThan** | **DateTime**|  | [optional] 
 **estimatedShipDatePeriodLessThan** | **DateTime**|  | [optional] 
 **estimatedShipDatePeriodGreaterThanOrEqual** | **DateTime**|  | [optional] 
 **estimatedShipDatePeriodLessThanOrEqual** | **DateTime**|  | [optional] 
 **estimatedShipDatePeriodEquals** | **DateTime**|  | [optional] 
 **estimatedShipDatePeriodNotEquals** | **DateTime**|  | [optional] 
 **estimatedShipDatePeriodSpecified** | **bool**|  | [optional] 
 **estimatedShipDatePeriodIn** | [**BuiltList&lt;DateTime&gt;**](DateTime.md)|  | [optional] 
 **estimatedShipDatePeriodNotIn** | [**BuiltList&lt;DateTime&gt;**](DateTime.md)|  | [optional] 
 **statusPeriodContains** | **String**|  | [optional] 
 **statusPeriodDoesNotContain** | **String**|  | [optional] 
 **statusPeriodEquals** | **String**|  | [optional] 
 **statusPeriodNotEquals** | **String**|  | [optional] 
 **statusPeriodSpecified** | **bool**|  | [optional] 
 **statusPeriodIn** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 
 **statusPeriodNotIn** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 
 **referenceNumberPeriodContains** | **String**|  | [optional] 
 **referenceNumberPeriodDoesNotContain** | **String**|  | [optional] 
 **referenceNumberPeriodEquals** | **String**|  | [optional] 
 **referenceNumberPeriodNotEquals** | **String**|  | [optional] 
 **referenceNumberPeriodSpecified** | **bool**|  | [optional] 
 **referenceNumberPeriodIn** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 
 **referenceNumberPeriodNotIn** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 
 **currencyTypeIdPeriodGreaterThan** | **int**|  | [optional] 
 **currencyTypeIdPeriodLessThan** | **int**|  | [optional] 
 **currencyTypeIdPeriodGreaterThanOrEqual** | **int**|  | [optional] 
 **currencyTypeIdPeriodLessThanOrEqual** | **int**|  | [optional] 
 **currencyTypeIdPeriodEquals** | **int**|  | [optional] 
 **currencyTypeIdPeriodNotEquals** | **int**|  | [optional] 
 **currencyTypeIdPeriodSpecified** | **bool**|  | [optional] 
 **currencyTypeIdPeriodIn** | [**BuiltList&lt;int&gt;**](int.md)|  | [optional] 
 **currencyTypeIdPeriodNotIn** | [**BuiltList&lt;int&gt;**](int.md)|  | [optional] 
 **distinct** | **bool**|  | [optional] 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createWayBill**
> WayBillDTO createWayBill(wayBillDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getWayBillResourceApi();
final WayBillDTO wayBillDTO = ; // WayBillDTO | 

try {
    final response = api.createWayBill(wayBillDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling WayBillResourceApi->createWayBill: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **wayBillDTO** | [**WayBillDTO**](WayBillDTO.md)|  | 

### Return type

[**WayBillDTO**](WayBillDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteWayBill**
> deleteWayBill(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getWayBillResourceApi();
final int id = 789; // int | 

try {
    api.deleteWayBill(id);
} catch on DioException (e) {
    print('Exception when calling WayBillResourceApi->deleteWayBill: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAllWayBills**
> BuiltList<WayBillDTO> getAllWayBills(idPeriodGreaterThan, idPeriodLessThan, idPeriodGreaterThanOrEqual, idPeriodLessThanOrEqual, idPeriodEquals, idPeriodNotEquals, idPeriodSpecified, idPeriodIn, idPeriodNotIn, boxLimitPeriodGreaterThan, boxLimitPeriodLessThan, boxLimitPeriodGreaterThanOrEqual, boxLimitPeriodLessThanOrEqual, boxLimitPeriodEquals, boxLimitPeriodNotEquals, boxLimitPeriodSpecified, boxLimitPeriodIn, boxLimitPeriodNotIn, shipmentTypePeriodContains, shipmentTypePeriodDoesNotContain, shipmentTypePeriodEquals, shipmentTypePeriodNotEquals, shipmentTypePeriodSpecified, shipmentTypePeriodIn, shipmentTypePeriodNotIn, opfacPeriodContains, opfacPeriodDoesNotContain, opfacPeriodEquals, opfacPeriodNotEquals, opfacPeriodSpecified, opfacPeriodIn, opfacPeriodNotIn, deliveryAgentPeriodContains, deliveryAgentPeriodDoesNotContain, deliveryAgentPeriodEquals, deliveryAgentPeriodNotEquals, deliveryAgentPeriodSpecified, deliveryAgentPeriodIn, deliveryAgentPeriodNotIn, estimatedReadyDatePeriodGreaterThan, estimatedReadyDatePeriodLessThan, estimatedReadyDatePeriodGreaterThanOrEqual, estimatedReadyDatePeriodLessThanOrEqual, estimatedReadyDatePeriodEquals, estimatedReadyDatePeriodNotEquals, estimatedReadyDatePeriodSpecified, estimatedReadyDatePeriodIn, estimatedReadyDatePeriodNotIn, currencyUomPeriodContains, currencyUomPeriodDoesNotContain, currencyUomPeriodEquals, currencyUomPeriodNotEquals, currencyUomPeriodSpecified, currencyUomPeriodIn, currencyUomPeriodNotIn, estimatedShipDatePeriodGreaterThan, estimatedShipDatePeriodLessThan, estimatedShipDatePeriodGreaterThanOrEqual, estimatedShipDatePeriodLessThanOrEqual, estimatedShipDatePeriodEquals, estimatedShipDatePeriodNotEquals, estimatedShipDatePeriodSpecified, estimatedShipDatePeriodIn, estimatedShipDatePeriodNotIn, statusPeriodContains, statusPeriodDoesNotContain, statusPeriodEquals, statusPeriodNotEquals, statusPeriodSpecified, statusPeriodIn, statusPeriodNotIn, referenceNumberPeriodContains, referenceNumberPeriodDoesNotContain, referenceNumberPeriodEquals, referenceNumberPeriodNotEquals, referenceNumberPeriodSpecified, referenceNumberPeriodIn, referenceNumberPeriodNotIn, currencyTypeIdPeriodGreaterThan, currencyTypeIdPeriodLessThan, currencyTypeIdPeriodGreaterThanOrEqual, currencyTypeIdPeriodLessThanOrEqual, currencyTypeIdPeriodEquals, currencyTypeIdPeriodNotEquals, currencyTypeIdPeriodSpecified, currencyTypeIdPeriodIn, currencyTypeIdPeriodNotIn, distinct, page, size, sort)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getWayBillResourceApi();
final int idPeriodGreaterThan = 789; // int | 
final int idPeriodLessThan = 789; // int | 
final int idPeriodGreaterThanOrEqual = 789; // int | 
final int idPeriodLessThanOrEqual = 789; // int | 
final int idPeriodEquals = 789; // int | 
final int idPeriodNotEquals = 789; // int | 
final bool idPeriodSpecified = true; // bool | 
final BuiltList<int> idPeriodIn = ; // BuiltList<int> | 
final BuiltList<int> idPeriodNotIn = ; // BuiltList<int> | 
final int boxLimitPeriodGreaterThan = 56; // int | 
final int boxLimitPeriodLessThan = 56; // int | 
final int boxLimitPeriodGreaterThanOrEqual = 56; // int | 
final int boxLimitPeriodLessThanOrEqual = 56; // int | 
final int boxLimitPeriodEquals = 56; // int | 
final int boxLimitPeriodNotEquals = 56; // int | 
final bool boxLimitPeriodSpecified = true; // bool | 
final BuiltList<int> boxLimitPeriodIn = ; // BuiltList<int> | 
final BuiltList<int> boxLimitPeriodNotIn = ; // BuiltList<int> | 
final String shipmentTypePeriodContains = shipmentTypePeriodContains_example; // String | 
final String shipmentTypePeriodDoesNotContain = shipmentTypePeriodDoesNotContain_example; // String | 
final String shipmentTypePeriodEquals = shipmentTypePeriodEquals_example; // String | 
final String shipmentTypePeriodNotEquals = shipmentTypePeriodNotEquals_example; // String | 
final bool shipmentTypePeriodSpecified = true; // bool | 
final BuiltList<String> shipmentTypePeriodIn = ; // BuiltList<String> | 
final BuiltList<String> shipmentTypePeriodNotIn = ; // BuiltList<String> | 
final String opfacPeriodContains = opfacPeriodContains_example; // String | 
final String opfacPeriodDoesNotContain = opfacPeriodDoesNotContain_example; // String | 
final String opfacPeriodEquals = opfacPeriodEquals_example; // String | 
final String opfacPeriodNotEquals = opfacPeriodNotEquals_example; // String | 
final bool opfacPeriodSpecified = true; // bool | 
final BuiltList<String> opfacPeriodIn = ; // BuiltList<String> | 
final BuiltList<String> opfacPeriodNotIn = ; // BuiltList<String> | 
final String deliveryAgentPeriodContains = deliveryAgentPeriodContains_example; // String | 
final String deliveryAgentPeriodDoesNotContain = deliveryAgentPeriodDoesNotContain_example; // String | 
final String deliveryAgentPeriodEquals = deliveryAgentPeriodEquals_example; // String | 
final String deliveryAgentPeriodNotEquals = deliveryAgentPeriodNotEquals_example; // String | 
final bool deliveryAgentPeriodSpecified = true; // bool | 
final BuiltList<String> deliveryAgentPeriodIn = ; // BuiltList<String> | 
final BuiltList<String> deliveryAgentPeriodNotIn = ; // BuiltList<String> | 
final DateTime estimatedReadyDatePeriodGreaterThan = 2013-10-20T19:20:30+01:00; // DateTime | 
final DateTime estimatedReadyDatePeriodLessThan = 2013-10-20T19:20:30+01:00; // DateTime | 
final DateTime estimatedReadyDatePeriodGreaterThanOrEqual = 2013-10-20T19:20:30+01:00; // DateTime | 
final DateTime estimatedReadyDatePeriodLessThanOrEqual = 2013-10-20T19:20:30+01:00; // DateTime | 
final DateTime estimatedReadyDatePeriodEquals = 2013-10-20T19:20:30+01:00; // DateTime | 
final DateTime estimatedReadyDatePeriodNotEquals = 2013-10-20T19:20:30+01:00; // DateTime | 
final bool estimatedReadyDatePeriodSpecified = true; // bool | 
final BuiltList<DateTime> estimatedReadyDatePeriodIn = ; // BuiltList<DateTime> | 
final BuiltList<DateTime> estimatedReadyDatePeriodNotIn = ; // BuiltList<DateTime> | 
final String currencyUomPeriodContains = currencyUomPeriodContains_example; // String | 
final String currencyUomPeriodDoesNotContain = currencyUomPeriodDoesNotContain_example; // String | 
final String currencyUomPeriodEquals = currencyUomPeriodEquals_example; // String | 
final String currencyUomPeriodNotEquals = currencyUomPeriodNotEquals_example; // String | 
final bool currencyUomPeriodSpecified = true; // bool | 
final BuiltList<String> currencyUomPeriodIn = ; // BuiltList<String> | 
final BuiltList<String> currencyUomPeriodNotIn = ; // BuiltList<String> | 
final DateTime estimatedShipDatePeriodGreaterThan = 2013-10-20T19:20:30+01:00; // DateTime | 
final DateTime estimatedShipDatePeriodLessThan = 2013-10-20T19:20:30+01:00; // DateTime | 
final DateTime estimatedShipDatePeriodGreaterThanOrEqual = 2013-10-20T19:20:30+01:00; // DateTime | 
final DateTime estimatedShipDatePeriodLessThanOrEqual = 2013-10-20T19:20:30+01:00; // DateTime | 
final DateTime estimatedShipDatePeriodEquals = 2013-10-20T19:20:30+01:00; // DateTime | 
final DateTime estimatedShipDatePeriodNotEquals = 2013-10-20T19:20:30+01:00; // DateTime | 
final bool estimatedShipDatePeriodSpecified = true; // bool | 
final BuiltList<DateTime> estimatedShipDatePeriodIn = ; // BuiltList<DateTime> | 
final BuiltList<DateTime> estimatedShipDatePeriodNotIn = ; // BuiltList<DateTime> | 
final String statusPeriodContains = statusPeriodContains_example; // String | 
final String statusPeriodDoesNotContain = statusPeriodDoesNotContain_example; // String | 
final String statusPeriodEquals = statusPeriodEquals_example; // String | 
final String statusPeriodNotEquals = statusPeriodNotEquals_example; // String | 
final bool statusPeriodSpecified = true; // bool | 
final BuiltList<String> statusPeriodIn = ; // BuiltList<String> | 
final BuiltList<String> statusPeriodNotIn = ; // BuiltList<String> | 
final String referenceNumberPeriodContains = referenceNumberPeriodContains_example; // String | 
final String referenceNumberPeriodDoesNotContain = referenceNumberPeriodDoesNotContain_example; // String | 
final String referenceNumberPeriodEquals = referenceNumberPeriodEquals_example; // String | 
final String referenceNumberPeriodNotEquals = referenceNumberPeriodNotEquals_example; // String | 
final bool referenceNumberPeriodSpecified = true; // bool | 
final BuiltList<String> referenceNumberPeriodIn = ; // BuiltList<String> | 
final BuiltList<String> referenceNumberPeriodNotIn = ; // BuiltList<String> | 
final int currencyTypeIdPeriodGreaterThan = 789; // int | 
final int currencyTypeIdPeriodLessThan = 789; // int | 
final int currencyTypeIdPeriodGreaterThanOrEqual = 789; // int | 
final int currencyTypeIdPeriodLessThanOrEqual = 789; // int | 
final int currencyTypeIdPeriodEquals = 789; // int | 
final int currencyTypeIdPeriodNotEquals = 789; // int | 
final bool currencyTypeIdPeriodSpecified = true; // bool | 
final BuiltList<int> currencyTypeIdPeriodIn = ; // BuiltList<int> | 
final BuiltList<int> currencyTypeIdPeriodNotIn = ; // BuiltList<int> | 
final bool distinct = true; // bool | 
final int page = 56; // int | Zero-based page index (0..N)
final int size = 56; // int | The size of the page to be returned
final BuiltList<String> sort = ; // BuiltList<String> | Sorting criteria in the format: property,(asc|desc). Default sort order is ascending. Multiple sort criteria are supported.

try {
    final response = api.getAllWayBills(idPeriodGreaterThan, idPeriodLessThan, idPeriodGreaterThanOrEqual, idPeriodLessThanOrEqual, idPeriodEquals, idPeriodNotEquals, idPeriodSpecified, idPeriodIn, idPeriodNotIn, boxLimitPeriodGreaterThan, boxLimitPeriodLessThan, boxLimitPeriodGreaterThanOrEqual, boxLimitPeriodLessThanOrEqual, boxLimitPeriodEquals, boxLimitPeriodNotEquals, boxLimitPeriodSpecified, boxLimitPeriodIn, boxLimitPeriodNotIn, shipmentTypePeriodContains, shipmentTypePeriodDoesNotContain, shipmentTypePeriodEquals, shipmentTypePeriodNotEquals, shipmentTypePeriodSpecified, shipmentTypePeriodIn, shipmentTypePeriodNotIn, opfacPeriodContains, opfacPeriodDoesNotContain, opfacPeriodEquals, opfacPeriodNotEquals, opfacPeriodSpecified, opfacPeriodIn, opfacPeriodNotIn, deliveryAgentPeriodContains, deliveryAgentPeriodDoesNotContain, deliveryAgentPeriodEquals, deliveryAgentPeriodNotEquals, deliveryAgentPeriodSpecified, deliveryAgentPeriodIn, deliveryAgentPeriodNotIn, estimatedReadyDatePeriodGreaterThan, estimatedReadyDatePeriodLessThan, estimatedReadyDatePeriodGreaterThanOrEqual, estimatedReadyDatePeriodLessThanOrEqual, estimatedReadyDatePeriodEquals, estimatedReadyDatePeriodNotEquals, estimatedReadyDatePeriodSpecified, estimatedReadyDatePeriodIn, estimatedReadyDatePeriodNotIn, currencyUomPeriodContains, currencyUomPeriodDoesNotContain, currencyUomPeriodEquals, currencyUomPeriodNotEquals, currencyUomPeriodSpecified, currencyUomPeriodIn, currencyUomPeriodNotIn, estimatedShipDatePeriodGreaterThan, estimatedShipDatePeriodLessThan, estimatedShipDatePeriodGreaterThanOrEqual, estimatedShipDatePeriodLessThanOrEqual, estimatedShipDatePeriodEquals, estimatedShipDatePeriodNotEquals, estimatedShipDatePeriodSpecified, estimatedShipDatePeriodIn, estimatedShipDatePeriodNotIn, statusPeriodContains, statusPeriodDoesNotContain, statusPeriodEquals, statusPeriodNotEquals, statusPeriodSpecified, statusPeriodIn, statusPeriodNotIn, referenceNumberPeriodContains, referenceNumberPeriodDoesNotContain, referenceNumberPeriodEquals, referenceNumberPeriodNotEquals, referenceNumberPeriodSpecified, referenceNumberPeriodIn, referenceNumberPeriodNotIn, currencyTypeIdPeriodGreaterThan, currencyTypeIdPeriodLessThan, currencyTypeIdPeriodGreaterThanOrEqual, currencyTypeIdPeriodLessThanOrEqual, currencyTypeIdPeriodEquals, currencyTypeIdPeriodNotEquals, currencyTypeIdPeriodSpecified, currencyTypeIdPeriodIn, currencyTypeIdPeriodNotIn, distinct, page, size, sort);
    print(response);
} catch on DioException (e) {
    print('Exception when calling WayBillResourceApi->getAllWayBills: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **idPeriodGreaterThan** | **int**|  | [optional] 
 **idPeriodLessThan** | **int**|  | [optional] 
 **idPeriodGreaterThanOrEqual** | **int**|  | [optional] 
 **idPeriodLessThanOrEqual** | **int**|  | [optional] 
 **idPeriodEquals** | **int**|  | [optional] 
 **idPeriodNotEquals** | **int**|  | [optional] 
 **idPeriodSpecified** | **bool**|  | [optional] 
 **idPeriodIn** | [**BuiltList&lt;int&gt;**](int.md)|  | [optional] 
 **idPeriodNotIn** | [**BuiltList&lt;int&gt;**](int.md)|  | [optional] 
 **boxLimitPeriodGreaterThan** | **int**|  | [optional] 
 **boxLimitPeriodLessThan** | **int**|  | [optional] 
 **boxLimitPeriodGreaterThanOrEqual** | **int**|  | [optional] 
 **boxLimitPeriodLessThanOrEqual** | **int**|  | [optional] 
 **boxLimitPeriodEquals** | **int**|  | [optional] 
 **boxLimitPeriodNotEquals** | **int**|  | [optional] 
 **boxLimitPeriodSpecified** | **bool**|  | [optional] 
 **boxLimitPeriodIn** | [**BuiltList&lt;int&gt;**](int.md)|  | [optional] 
 **boxLimitPeriodNotIn** | [**BuiltList&lt;int&gt;**](int.md)|  | [optional] 
 **shipmentTypePeriodContains** | **String**|  | [optional] 
 **shipmentTypePeriodDoesNotContain** | **String**|  | [optional] 
 **shipmentTypePeriodEquals** | **String**|  | [optional] 
 **shipmentTypePeriodNotEquals** | **String**|  | [optional] 
 **shipmentTypePeriodSpecified** | **bool**|  | [optional] 
 **shipmentTypePeriodIn** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 
 **shipmentTypePeriodNotIn** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 
 **opfacPeriodContains** | **String**|  | [optional] 
 **opfacPeriodDoesNotContain** | **String**|  | [optional] 
 **opfacPeriodEquals** | **String**|  | [optional] 
 **opfacPeriodNotEquals** | **String**|  | [optional] 
 **opfacPeriodSpecified** | **bool**|  | [optional] 
 **opfacPeriodIn** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 
 **opfacPeriodNotIn** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 
 **deliveryAgentPeriodContains** | **String**|  | [optional] 
 **deliveryAgentPeriodDoesNotContain** | **String**|  | [optional] 
 **deliveryAgentPeriodEquals** | **String**|  | [optional] 
 **deliveryAgentPeriodNotEquals** | **String**|  | [optional] 
 **deliveryAgentPeriodSpecified** | **bool**|  | [optional] 
 **deliveryAgentPeriodIn** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 
 **deliveryAgentPeriodNotIn** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 
 **estimatedReadyDatePeriodGreaterThan** | **DateTime**|  | [optional] 
 **estimatedReadyDatePeriodLessThan** | **DateTime**|  | [optional] 
 **estimatedReadyDatePeriodGreaterThanOrEqual** | **DateTime**|  | [optional] 
 **estimatedReadyDatePeriodLessThanOrEqual** | **DateTime**|  | [optional] 
 **estimatedReadyDatePeriodEquals** | **DateTime**|  | [optional] 
 **estimatedReadyDatePeriodNotEquals** | **DateTime**|  | [optional] 
 **estimatedReadyDatePeriodSpecified** | **bool**|  | [optional] 
 **estimatedReadyDatePeriodIn** | [**BuiltList&lt;DateTime&gt;**](DateTime.md)|  | [optional] 
 **estimatedReadyDatePeriodNotIn** | [**BuiltList&lt;DateTime&gt;**](DateTime.md)|  | [optional] 
 **currencyUomPeriodContains** | **String**|  | [optional] 
 **currencyUomPeriodDoesNotContain** | **String**|  | [optional] 
 **currencyUomPeriodEquals** | **String**|  | [optional] 
 **currencyUomPeriodNotEquals** | **String**|  | [optional] 
 **currencyUomPeriodSpecified** | **bool**|  | [optional] 
 **currencyUomPeriodIn** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 
 **currencyUomPeriodNotIn** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 
 **estimatedShipDatePeriodGreaterThan** | **DateTime**|  | [optional] 
 **estimatedShipDatePeriodLessThan** | **DateTime**|  | [optional] 
 **estimatedShipDatePeriodGreaterThanOrEqual** | **DateTime**|  | [optional] 
 **estimatedShipDatePeriodLessThanOrEqual** | **DateTime**|  | [optional] 
 **estimatedShipDatePeriodEquals** | **DateTime**|  | [optional] 
 **estimatedShipDatePeriodNotEquals** | **DateTime**|  | [optional] 
 **estimatedShipDatePeriodSpecified** | **bool**|  | [optional] 
 **estimatedShipDatePeriodIn** | [**BuiltList&lt;DateTime&gt;**](DateTime.md)|  | [optional] 
 **estimatedShipDatePeriodNotIn** | [**BuiltList&lt;DateTime&gt;**](DateTime.md)|  | [optional] 
 **statusPeriodContains** | **String**|  | [optional] 
 **statusPeriodDoesNotContain** | **String**|  | [optional] 
 **statusPeriodEquals** | **String**|  | [optional] 
 **statusPeriodNotEquals** | **String**|  | [optional] 
 **statusPeriodSpecified** | **bool**|  | [optional] 
 **statusPeriodIn** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 
 **statusPeriodNotIn** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 
 **referenceNumberPeriodContains** | **String**|  | [optional] 
 **referenceNumberPeriodDoesNotContain** | **String**|  | [optional] 
 **referenceNumberPeriodEquals** | **String**|  | [optional] 
 **referenceNumberPeriodNotEquals** | **String**|  | [optional] 
 **referenceNumberPeriodSpecified** | **bool**|  | [optional] 
 **referenceNumberPeriodIn** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 
 **referenceNumberPeriodNotIn** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 
 **currencyTypeIdPeriodGreaterThan** | **int**|  | [optional] 
 **currencyTypeIdPeriodLessThan** | **int**|  | [optional] 
 **currencyTypeIdPeriodGreaterThanOrEqual** | **int**|  | [optional] 
 **currencyTypeIdPeriodLessThanOrEqual** | **int**|  | [optional] 
 **currencyTypeIdPeriodEquals** | **int**|  | [optional] 
 **currencyTypeIdPeriodNotEquals** | **int**|  | [optional] 
 **currencyTypeIdPeriodSpecified** | **bool**|  | [optional] 
 **currencyTypeIdPeriodIn** | [**BuiltList&lt;int&gt;**](int.md)|  | [optional] 
 **currencyTypeIdPeriodNotIn** | [**BuiltList&lt;int&gt;**](int.md)|  | [optional] 
 **distinct** | **bool**|  | [optional] 
 **page** | **int**| Zero-based page index (0..N) | [optional] [default to 0]
 **size** | **int**| The size of the page to be returned | [optional] [default to 20]
 **sort** | [**BuiltList&lt;String&gt;**](String.md)| Sorting criteria in the format: property,(asc|desc). Default sort order is ascending. Multiple sort criteria are supported. | [optional] 

### Return type

[**BuiltList&lt;WayBillDTO&gt;**](WayBillDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getWayBill**
> WayBillDTO getWayBill(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getWayBillResourceApi();
final int id = 789; // int | 

try {
    final response = api.getWayBill(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling WayBillResourceApi->getWayBill: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**WayBillDTO**](WayBillDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getWayBillIdsByCurrency**
> BuiltList<int> getWayBillIdsByCurrency(currency)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getWayBillResourceApi();
final String currency = currency_example; // String | 

try {
    final response = api.getWayBillIdsByCurrency(currency);
    print(response);
} catch on DioException (e) {
    print('Exception when calling WayBillResourceApi->getWayBillIdsByCurrency: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **currency** | **String**|  | 

### Return type

**BuiltList&lt;int&gt;**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getWayBillIdsByCurrency1**
> BuiltList<int> getWayBillIdsByCurrency1(currencyId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getWayBillResourceApi();
final int currencyId = 789; // int | 

try {
    final response = api.getWayBillIdsByCurrency1(currencyId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling WayBillResourceApi->getWayBillIdsByCurrency1: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **currencyId** | **int**|  | 

### Return type

**BuiltList&lt;int&gt;**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **partialUpdateWayBill**
> WayBillDTO partialUpdateWayBill(id, wayBillDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getWayBillResourceApi();
final int id = 789; // int | 
final WayBillDTO wayBillDTO = ; // WayBillDTO | 

try {
    final response = api.partialUpdateWayBill(id, wayBillDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling WayBillResourceApi->partialUpdateWayBill: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **wayBillDTO** | [**WayBillDTO**](WayBillDTO.md)|  | 

### Return type

[**WayBillDTO**](WayBillDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/merge-patch+json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateWayBill**
> WayBillDTO updateWayBill(id, wayBillDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getWayBillResourceApi();
final int id = 789; // int | 
final WayBillDTO wayBillDTO = ; // WayBillDTO | 

try {
    final response = api.updateWayBill(id, wayBillDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling WayBillResourceApi->updateWayBill: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **wayBillDTO** | [**WayBillDTO**](WayBillDTO.md)|  | 

### Return type

[**WayBillDTO**](WayBillDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

