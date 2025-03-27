# openapi.api.ShipmentMethodResourceApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createShipmentMethod**](ShipmentMethodResourceApi.md#createshipmentmethod) | **POST** /api/shipment-methods | 
[**deleteShipmentMethod**](ShipmentMethodResourceApi.md#deleteshipmentmethod) | **DELETE** /api/shipment-methods/{id} | 
[**getAllShipmentMethods**](ShipmentMethodResourceApi.md#getallshipmentmethods) | **GET** /api/shipment-methods | 
[**getShipmentMethod**](ShipmentMethodResourceApi.md#getshipmentmethod) | **GET** /api/shipment-methods/{id} | 
[**partialUpdateShipmentMethod**](ShipmentMethodResourceApi.md#partialupdateshipmentmethod) | **PATCH** /api/shipment-methods/{id} | 
[**updateShipmentMethod**](ShipmentMethodResourceApi.md#updateshipmentmethod) | **PUT** /api/shipment-methods/{id} | 


# **createShipmentMethod**
> ShipmentMethodDTO createShipmentMethod(shipmentMethodDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getShipmentMethodResourceApi();
final ShipmentMethodDTO shipmentMethodDTO = ; // ShipmentMethodDTO | 

try {
    final response = api.createShipmentMethod(shipmentMethodDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ShipmentMethodResourceApi->createShipmentMethod: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **shipmentMethodDTO** | [**ShipmentMethodDTO**](ShipmentMethodDTO.md)|  | 

### Return type

[**ShipmentMethodDTO**](ShipmentMethodDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteShipmentMethod**
> deleteShipmentMethod(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getShipmentMethodResourceApi();
final int id = 789; // int | 

try {
    api.deleteShipmentMethod(id);
} catch on DioException (e) {
    print('Exception when calling ShipmentMethodResourceApi->deleteShipmentMethod: $e\n');
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

# **getAllShipmentMethods**
> BuiltList<ShipmentMethodDTO> getAllShipmentMethods(page, size, sort, eagerload)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getShipmentMethodResourceApi();
final int page = 56; // int | Zero-based page index (0..N)
final int size = 56; // int | The size of the page to be returned
final BuiltList<String> sort = ; // BuiltList<String> | Sorting criteria in the format: property,(asc|desc). Default sort order is ascending. Multiple sort criteria are supported.
final bool eagerload = true; // bool | 

try {
    final response = api.getAllShipmentMethods(page, size, sort, eagerload);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ShipmentMethodResourceApi->getAllShipmentMethods: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Zero-based page index (0..N) | [optional] [default to 0]
 **size** | **int**| The size of the page to be returned | [optional] [default to 20]
 **sort** | [**BuiltList&lt;String&gt;**](String.md)| Sorting criteria in the format: property,(asc|desc). Default sort order is ascending. Multiple sort criteria are supported. | [optional] 
 **eagerload** | **bool**|  | [optional] [default to true]

### Return type

[**BuiltList&lt;ShipmentMethodDTO&gt;**](ShipmentMethodDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getShipmentMethod**
> ShipmentMethodDTO getShipmentMethod(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getShipmentMethodResourceApi();
final int id = 789; // int | 

try {
    final response = api.getShipmentMethod(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ShipmentMethodResourceApi->getShipmentMethod: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**ShipmentMethodDTO**](ShipmentMethodDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **partialUpdateShipmentMethod**
> ShipmentMethodDTO partialUpdateShipmentMethod(id, shipmentMethodDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getShipmentMethodResourceApi();
final int id = 789; // int | 
final ShipmentMethodDTO shipmentMethodDTO = ; // ShipmentMethodDTO | 

try {
    final response = api.partialUpdateShipmentMethod(id, shipmentMethodDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ShipmentMethodResourceApi->partialUpdateShipmentMethod: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **shipmentMethodDTO** | [**ShipmentMethodDTO**](ShipmentMethodDTO.md)|  | 

### Return type

[**ShipmentMethodDTO**](ShipmentMethodDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/merge-patch+json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateShipmentMethod**
> ShipmentMethodDTO updateShipmentMethod(id, shipmentMethodDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getShipmentMethodResourceApi();
final int id = 789; // int | 
final ShipmentMethodDTO shipmentMethodDTO = ; // ShipmentMethodDTO | 

try {
    final response = api.updateShipmentMethod(id, shipmentMethodDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ShipmentMethodResourceApi->updateShipmentMethod: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **shipmentMethodDTO** | [**ShipmentMethodDTO**](ShipmentMethodDTO.md)|  | 

### Return type

[**ShipmentMethodDTO**](ShipmentMethodDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

