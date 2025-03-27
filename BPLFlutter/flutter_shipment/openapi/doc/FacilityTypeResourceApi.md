# openapi.api.FacilityTypeResourceApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createFacilityType**](FacilityTypeResourceApi.md#createfacilitytype) | **POST** /api/facility-types | 
[**deleteFacilityType**](FacilityTypeResourceApi.md#deletefacilitytype) | **DELETE** /api/facility-types/{id} | 
[**getAllFacilityTypes**](FacilityTypeResourceApi.md#getallfacilitytypes) | **GET** /api/facility-types | 
[**getFacilityType**](FacilityTypeResourceApi.md#getfacilitytype) | **GET** /api/facility-types/{id} | 
[**partialUpdateFacilityType**](FacilityTypeResourceApi.md#partialupdatefacilitytype) | **PATCH** /api/facility-types/{id} | 
[**updateFacilityType**](FacilityTypeResourceApi.md#updatefacilitytype) | **PUT** /api/facility-types/{id} | 


# **createFacilityType**
> FacilityTypeDTO createFacilityType(facilityTypeDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getFacilityTypeResourceApi();
final FacilityTypeDTO facilityTypeDTO = ; // FacilityTypeDTO | 

try {
    final response = api.createFacilityType(facilityTypeDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling FacilityTypeResourceApi->createFacilityType: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **facilityTypeDTO** | [**FacilityTypeDTO**](FacilityTypeDTO.md)|  | 

### Return type

[**FacilityTypeDTO**](FacilityTypeDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteFacilityType**
> deleteFacilityType(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getFacilityTypeResourceApi();
final int id = 789; // int | 

try {
    api.deleteFacilityType(id);
} catch on DioException (e) {
    print('Exception when calling FacilityTypeResourceApi->deleteFacilityType: $e\n');
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

# **getAllFacilityTypes**
> BuiltList<FacilityTypeDTO> getAllFacilityTypes()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getFacilityTypeResourceApi();

try {
    final response = api.getAllFacilityTypes();
    print(response);
} catch on DioException (e) {
    print('Exception when calling FacilityTypeResourceApi->getAllFacilityTypes: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;FacilityTypeDTO&gt;**](FacilityTypeDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getFacilityType**
> FacilityTypeDTO getFacilityType(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getFacilityTypeResourceApi();
final int id = 789; // int | 

try {
    final response = api.getFacilityType(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling FacilityTypeResourceApi->getFacilityType: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**FacilityTypeDTO**](FacilityTypeDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **partialUpdateFacilityType**
> FacilityTypeDTO partialUpdateFacilityType(id, facilityTypeDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getFacilityTypeResourceApi();
final int id = 789; // int | 
final FacilityTypeDTO facilityTypeDTO = ; // FacilityTypeDTO | 

try {
    final response = api.partialUpdateFacilityType(id, facilityTypeDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling FacilityTypeResourceApi->partialUpdateFacilityType: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **facilityTypeDTO** | [**FacilityTypeDTO**](FacilityTypeDTO.md)|  | 

### Return type

[**FacilityTypeDTO**](FacilityTypeDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/merge-patch+json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateFacilityType**
> FacilityTypeDTO updateFacilityType(id, facilityTypeDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getFacilityTypeResourceApi();
final int id = 789; // int | 
final FacilityTypeDTO facilityTypeDTO = ; // FacilityTypeDTO | 

try {
    final response = api.updateFacilityType(id, facilityTypeDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling FacilityTypeResourceApi->updateFacilityType: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **facilityTypeDTO** | [**FacilityTypeDTO**](FacilityTypeDTO.md)|  | 

### Return type

[**FacilityTypeDTO**](FacilityTypeDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

