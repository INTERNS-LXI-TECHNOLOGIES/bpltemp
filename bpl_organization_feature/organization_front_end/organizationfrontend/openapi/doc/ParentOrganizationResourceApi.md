# openapi.api.ParentorganizationResourceApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createParentorganization**](ParentorganizationResourceApi.md#createparentorganization) | **POST** /api/parentorganizations | 
[**deleteParentorganization**](ParentorganizationResourceApi.md#deleteparentorganization) | **DELETE** /api/parentorganizations/{id} | 
[**getAllParentorganizations**](ParentorganizationResourceApi.md#getallparentorganizations) | **GET** /api/parentorganizations | 
[**getParentorganization**](ParentorganizationResourceApi.md#getparentorganization) | **GET** /api/parentorganizations/{id} | 
[**partialUpdateParentorganization**](ParentorganizationResourceApi.md#partialupdateparentorganization) | **PATCH** /api/parentorganizations/{id} | 
[**updateParentorganization**](ParentorganizationResourceApi.md#updateparentorganization) | **PUT** /api/parentorganizations/{id} | 


# **createParentorganization**
> Parentorganization createParentorganization(parentorganization)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getParentorganizationResourceApi();
final Parentorganization parentorganization = ; // Parentorganization | 

try {
    final response = api.createParentorganization(parentorganization);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ParentorganizationResourceApi->createParentorganization: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **parentorganization** | [**Parentorganization**](Parentorganization.md)|  | 

### Return type

[**Parentorganization**](Parentorganization.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteParentorganization**
> deleteParentorganization(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getParentorganizationResourceApi();
final int id = 789; // int | 

try {
    api.deleteParentorganization(id);
} catch on DioException (e) {
    print('Exception when calling ParentorganizationResourceApi->deleteParentorganization: $e\n');
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

# **getAllParentorganizations**
> BuiltList<Parentorganization> getAllParentorganizations()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getParentorganizationResourceApi();

try {
    final response = api.getAllParentorganizations();
    print(response);
} catch on DioException (e) {
    print('Exception when calling ParentorganizationResourceApi->getAllParentorganizations: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;Parentorganization&gt;**](Parentorganization.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getParentorganization**
> Parentorganization getParentorganization(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getParentorganizationResourceApi();
final int id = 789; // int | 

try {
    final response = api.getParentorganization(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ParentorganizationResourceApi->getParentorganization: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**Parentorganization**](Parentorganization.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **partialUpdateParentorganization**
> Parentorganization partialUpdateParentorganization(id, parentorganization)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getParentorganizationResourceApi();
final int id = 789; // int | 
final Parentorganization parentorganization = ; // Parentorganization | 

try {
    final response = api.partialUpdateParentorganization(id, parentorganization);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ParentorganizationResourceApi->partialUpdateParentorganization: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **parentorganization** | [**Parentorganization**](Parentorganization.md)|  | 

### Return type

[**Parentorganization**](Parentorganization.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/merge-patch+json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateParentorganization**
> Parentorganization updateParentorganization(id, parentorganization)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getParentorganizationResourceApi();
final int id = 789; // int | 
final Parentorganization parentorganization = ; // Parentorganization | 

try {
    final response = api.updateParentorganization(id, parentorganization);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ParentorganizationResourceApi->updateParentorganization: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **parentorganization** | [**Parentorganization**](Parentorganization.md)|  | 

### Return type

[**Parentorganization**](Parentorganization.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

