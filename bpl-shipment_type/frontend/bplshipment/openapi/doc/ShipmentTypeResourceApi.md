# openapi.api.ShipmentTypeResourceApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://192.168.42.152:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createShipmentType**](ShipmentTypeResourceApi.md#createshipmenttype) | **POST** /api/shipment-types | 
[**deleteShipmentType**](ShipmentTypeResourceApi.md#deleteshipmenttype) | **DELETE** /api/shipment-types/{id} | 
[**getAllShipmentTypes**](ShipmentTypeResourceApi.md#getallshipmenttypes) | **GET** /api/shipment-types | 
[**getShipmentType**](ShipmentTypeResourceApi.md#getshipmenttype) | **GET** /api/shipment-types/{id} | 
[**partialUpdateShipmentType**](ShipmentTypeResourceApi.md#partialupdateshipmenttype) | **PATCH** /api/shipment-types/{id} | 
[**updateShipmentType**](ShipmentTypeResourceApi.md#updateshipmenttype) | **PUT** /api/shipment-types/{id} | 


# **createShipmentType**
> ShipmentType createShipmentType(shipmentType)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getShipmentTypeResourceApi();
final ShipmentType shipmentType = ; // ShipmentType | 

try {
    final response = api.createShipmentType(shipmentType);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ShipmentTypeResourceApi->createShipmentType: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **shipmentType** | [**ShipmentType**](ShipmentType.md)|  | 

### Return type

[**ShipmentType**](ShipmentType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteShipmentType**
> deleteShipmentType(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getShipmentTypeResourceApi();
final int id = 789; // int | 

try {
    api.deleteShipmentType(id);
} catch on DioException (e) {
    print('Exception when calling ShipmentTypeResourceApi->deleteShipmentType: $e\n');
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

# **getAllShipmentTypes**
> BuiltList<ShipmentType> getAllShipmentTypes(page, size, sort)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getShipmentTypeResourceApi();
final int page = 56; // int | Zero-based page index (0..N)
final int size = 56; // int | The size of the page to be returned
final BuiltList<String> sort = ; // BuiltList<String> | Sorting criteria in the format: property,(asc|desc). Default sort order is ascending. Multiple sort criteria are supported.

try {
    final response = api.getAllShipmentTypes(page, size, sort);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ShipmentTypeResourceApi->getAllShipmentTypes: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Zero-based page index (0..N) | [optional] [default to 0]
 **size** | **int**| The size of the page to be returned | [optional] [default to 20]
 **sort** | [**BuiltList&lt;String&gt;**](String.md)| Sorting criteria in the format: property,(asc|desc). Default sort order is ascending. Multiple sort criteria are supported. | [optional] 

### Return type

[**BuiltList&lt;ShipmentType&gt;**](ShipmentType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getShipmentType**
> ShipmentType getShipmentType(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getShipmentTypeResourceApi();
final int id = 789; // int | 

try {
    final response = api.getShipmentType(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ShipmentTypeResourceApi->getShipmentType: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**ShipmentType**](ShipmentType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **partialUpdateShipmentType**
> ShipmentType partialUpdateShipmentType(id, shipmentType)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getShipmentTypeResourceApi();
final int id = 789; // int | 
final ShipmentType shipmentType = ; // ShipmentType | 

try {
    final response = api.partialUpdateShipmentType(id, shipmentType);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ShipmentTypeResourceApi->partialUpdateShipmentType: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **shipmentType** | [**ShipmentType**](ShipmentType.md)|  | 

### Return type

[**ShipmentType**](ShipmentType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/merge-patch+json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateShipmentType**
> ShipmentType updateShipmentType(id, shipmentType)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getShipmentTypeResourceApi();
final int id = 789; // int | 
final ShipmentType shipmentType = ; // ShipmentType | 

try {
    final response = api.updateShipmentType(id, shipmentType);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ShipmentTypeResourceApi->updateShipmentType: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **shipmentType** | [**ShipmentType**](ShipmentType.md)|  | 

### Return type

[**ShipmentType**](ShipmentType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

