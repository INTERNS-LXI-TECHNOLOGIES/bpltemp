# openapi.api.OrganizationResourceApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createOrganization**](OrganizationResourceApi.md#createorganization) | **POST** /api/organizations | 
[**deleteOrganization**](OrganizationResourceApi.md#deleteorganization) | **DELETE** /api/organizations/{id} | 
[**getAllOrganizations**](OrganizationResourceApi.md#getallorganizations) | **GET** /api/organizations | 
[**getOrganization**](OrganizationResourceApi.md#getorganization) | **GET** /api/organizations/{id} | 
[**partialUpdateOrganization**](OrganizationResourceApi.md#partialupdateorganization) | **PATCH** /api/organizations/{id} | 
[**updateOrganization**](OrganizationResourceApi.md#updateorganization) | **PUT** /api/organizations/{id} | 


# **createOrganization**
> Organization createOrganization(organization)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getOrganizationResourceApi();
final Organization organization = ; // Organization | 

try {
    final response = api.createOrganization(organization);
    print(response);
} catch on DioException (e) {
    print('Exception when calling OrganizationResourceApi->createOrganization: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organization** | [**Organization**](Organization.md)|  | 

### Return type

[**Organization**](Organization.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteOrganization**
> deleteOrganization(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getOrganizationResourceApi();
final int id = 789; // int | 

try {
    api.deleteOrganization(id);
} catch on DioException (e) {
    print('Exception when calling OrganizationResourceApi->deleteOrganization: $e\n');
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

# **getAllOrganizations**
> BuiltList<Organization> getAllOrganizations()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getOrganizationResourceApi();

try {
    final response = api.getAllOrganizations();
    print(response);
} catch on DioException (e) {
    print('Exception when calling OrganizationResourceApi->getAllOrganizations: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;Organization&gt;**](Organization.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOrganization**
> Organization getOrganization(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getOrganizationResourceApi();
final int id = 789; // int | 

try {
    final response = api.getOrganization(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling OrganizationResourceApi->getOrganization: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**Organization**](Organization.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **partialUpdateOrganization**
> Organization partialUpdateOrganization(id, organization)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getOrganizationResourceApi();
final int id = 789; // int | 
final Organization organization = ; // Organization | 

try {
    final response = api.partialUpdateOrganization(id, organization);
    print(response);
} catch on DioException (e) {
    print('Exception when calling OrganizationResourceApi->partialUpdateOrganization: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **organization** | [**Organization**](Organization.md)|  | 

### Return type

[**Organization**](Organization.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/merge-patch+json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateOrganization**
> Organization updateOrganization(id, organization)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getOrganizationResourceApi();
final int id = 789; // int | 
final Organization organization = ; // Organization | 

try {
    final response = api.updateOrganization(id, organization);
    print(response);
} catch on DioException (e) {
    print('Exception when calling OrganizationResourceApi->updateOrganization: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **organization** | [**Organization**](Organization.md)|  | 

### Return type

[**Organization**](Organization.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

