# openapi.api.WayBillResourceApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createWayBill**](WayBillResourceApi.md#createwaybill) | **POST** /api/way-bills | 
[**deleteWayBill**](WayBillResourceApi.md#deletewaybill) | **DELETE** /api/way-bills/{id} | 
[**getAllWayBills**](WayBillResourceApi.md#getallwaybills) | **GET** /api/way-bills | 
[**getWayBill**](WayBillResourceApi.md#getwaybill) | **GET** /api/way-bills/{id} | 
[**partialUpdateWayBill**](WayBillResourceApi.md#partialupdatewaybill) | **PATCH** /api/way-bills/{id} | 
[**updateWayBill**](WayBillResourceApi.md#updatewaybill) | **PUT** /api/way-bills/{id} | 


# **createWayBill**
> WayBill createWayBill(wayBill)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getWayBillResourceApi();
final WayBill wayBill = ; // WayBill | 

try {
    final response = api.createWayBill(wayBill);
    print(response);
} catch on DioException (e) {
    print('Exception when calling WayBillResourceApi->createWayBill: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **wayBill** | [**WayBill**](WayBill.md)|  | 

### Return type

[**WayBill**](WayBill.md)

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
> BuiltList<WayBill> getAllWayBills()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getWayBillResourceApi();

try {
    final response = api.getAllWayBills();
    print(response);
} catch on DioException (e) {
    print('Exception when calling WayBillResourceApi->getAllWayBills: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;WayBill&gt;**](WayBill.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getWayBill**
> WayBill getWayBill(id)



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

[**WayBill**](WayBill.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **partialUpdateWayBill**
> WayBill partialUpdateWayBill(id, wayBill)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getWayBillResourceApi();
final int id = 789; // int | 
final WayBill wayBill = ; // WayBill | 

try {
    final response = api.partialUpdateWayBill(id, wayBill);
    print(response);
} catch on DioException (e) {
    print('Exception when calling WayBillResourceApi->partialUpdateWayBill: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **wayBill** | [**WayBill**](WayBill.md)|  | 

### Return type

[**WayBill**](WayBill.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/merge-patch+json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateWayBill**
> WayBill updateWayBill(id, wayBill)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getWayBillResourceApi();
final int id = 789; // int | 
final WayBill wayBill = ; // WayBill | 

try {
    final response = api.updateWayBill(id, wayBill);
    print(response);
} catch on DioException (e) {
    print('Exception when calling WayBillResourceApi->updateWayBill: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **wayBill** | [**WayBill**](WayBill.md)|  | 

### Return type

[**WayBill**](WayBill.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

