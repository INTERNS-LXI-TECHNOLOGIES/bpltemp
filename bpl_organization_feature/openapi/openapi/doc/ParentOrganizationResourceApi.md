# openapi.api.ParentOrganizationResourceApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createParentOrganization**](ParentOrganizationResourceApi.md#createparentorganization) | **POST** /api/parent-organizations | 
[**deleteParentOrganization**](ParentOrganizationResourceApi.md#deleteparentorganization) | **DELETE** /api/parent-organizations/{id} | 
[**getAllParentOrganizations**](ParentOrganizationResourceApi.md#getallparentorganizations) | **GET** /api/parent-organizations | 
[**getParentOrganization**](ParentOrganizationResourceApi.md#getparentorganization) | **GET** /api/parent-organizations/{id} | 
[**partialUpdateParentOrganization**](ParentOrganizationResourceApi.md#partialupdateparentorganization) | **PATCH** /api/parent-organizations/{id} | 
[**updateParentOrganization**](ParentOrganizationResourceApi.md#updateparentorganization) | **PUT** /api/parent-organizations/{id} | 


# **createParentOrganization**
> ParentOrganization createParentOrganization(parentOrganization)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getParentOrganizationResourceApi();
final ParentOrganization parentOrganization = ; // ParentOrganization | 

try {
    final response = api.createParentOrganization(parentOrganization);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ParentOrganizationResourceApi->createParentOrganization: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **parentOrganization** | [**ParentOrganization**](ParentOrganization.md)|  | 

### Return type

[**ParentOrganization**](ParentOrganization.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteParentOrganization**
> deleteParentOrganization(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getParentOrganizationResourceApi();
final int id = 789; // int | 

try {
    api.deleteParentOrganization(id);
} catch on DioException (e) {
    print('Exception when calling ParentOrganizationResourceApi->deleteParentOrganization: $e\n');
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

# **getAllParentOrganizations**
> BuiltList<ParentOrganization> getAllParentOrganizations(filter)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getParentOrganizationResourceApi();
final String filter = filter_example; // String | 

try {
    final response = api.getAllParentOrganizations(filter);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ParentOrganizationResourceApi->getAllParentOrganizations: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **filter** | **String**|  | [optional] 

### Return type

[**BuiltList&lt;ParentOrganization&gt;**](ParentOrganization.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getParentOrganization**
> ParentOrganization getParentOrganization(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getParentOrganizationResourceApi();
final int id = 789; // int | 

try {
    final response = api.getParentOrganization(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ParentOrganizationResourceApi->getParentOrganization: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**ParentOrganization**](ParentOrganization.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **partialUpdateParentOrganization**
> ParentOrganization partialUpdateParentOrganization(id, parentOrganization)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getParentOrganizationResourceApi();
final int id = 789; // int | 
final ParentOrganization parentOrganization = ; // ParentOrganization | 

try {
    final response = api.partialUpdateParentOrganization(id, parentOrganization);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ParentOrganizationResourceApi->partialUpdateParentOrganization: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **parentOrganization** | [**ParentOrganization**](ParentOrganization.md)|  | 

### Return type

[**ParentOrganization**](ParentOrganization.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/merge-patch+json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateParentOrganization**
> ParentOrganization updateParentOrganization(id, parentOrganization)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getParentOrganizationResourceApi();
final int id = 789; // int | 
final ParentOrganization parentOrganization = ; // ParentOrganization | 

try {
    final response = api.updateParentOrganization(id, parentOrganization);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ParentOrganizationResourceApi->updateParentOrganization: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **parentOrganization** | [**ParentOrganization**](ParentOrganization.md)|  | 

### Return type

[**ParentOrganization**](ParentOrganization.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

