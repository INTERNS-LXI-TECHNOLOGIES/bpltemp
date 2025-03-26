# openapi.api.ParentTypeResourceApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://192.168.42.152:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createParentType**](ParentTypeResourceApi.md#createparenttype) | **POST** /api/parent-types | 
[**deleteParentType**](ParentTypeResourceApi.md#deleteparenttype) | **DELETE** /api/parent-types/{id} | 
[**getAllParentTypes**](ParentTypeResourceApi.md#getallparenttypes) | **GET** /api/parent-types | 
[**getParentType**](ParentTypeResourceApi.md#getparenttype) | **GET** /api/parent-types/{id} | 
[**partialUpdateParentType**](ParentTypeResourceApi.md#partialupdateparenttype) | **PATCH** /api/parent-types/{id} | 
[**updateParentType**](ParentTypeResourceApi.md#updateparenttype) | **PUT** /api/parent-types/{id} | 


# **createParentType**
> ParentType createParentType(parentType)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getParentTypeResourceApi();
final ParentType parentType = ; // ParentType | 

try {
    final response = api.createParentType(parentType);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ParentTypeResourceApi->createParentType: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **parentType** | [**ParentType**](ParentType.md)|  | 

### Return type

[**ParentType**](ParentType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteParentType**
> deleteParentType(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getParentTypeResourceApi();
final int id = 789; // int | 

try {
    api.deleteParentType(id);
} catch on DioException (e) {
    print('Exception when calling ParentTypeResourceApi->deleteParentType: $e\n');
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

# **getAllParentTypes**
> BuiltList<ParentType> getAllParentTypes(page, size, sort)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getParentTypeResourceApi();
final int page = 56; // int | Zero-based page index (0..N)
final int size = 56; // int | The size of the page to be returned
final BuiltList<String> sort = ; // BuiltList<String> | Sorting criteria in the format: property,(asc|desc). Default sort order is ascending. Multiple sort criteria are supported.

try {
    final response = api.getAllParentTypes(page, size, sort);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ParentTypeResourceApi->getAllParentTypes: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Zero-based page index (0..N) | [optional] [default to 0]
 **size** | **int**| The size of the page to be returned | [optional] [default to 20]
 **sort** | [**BuiltList&lt;String&gt;**](String.md)| Sorting criteria in the format: property,(asc|desc). Default sort order is ascending. Multiple sort criteria are supported. | [optional] 

### Return type

[**BuiltList&lt;ParentType&gt;**](ParentType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getParentType**
> ParentType getParentType(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getParentTypeResourceApi();
final int id = 789; // int | 

try {
    final response = api.getParentType(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ParentTypeResourceApi->getParentType: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**ParentType**](ParentType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **partialUpdateParentType**
> ParentType partialUpdateParentType(id, parentType)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getParentTypeResourceApi();
final int id = 789; // int | 
final ParentType parentType = ; // ParentType | 

try {
    final response = api.partialUpdateParentType(id, parentType);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ParentTypeResourceApi->partialUpdateParentType: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **parentType** | [**ParentType**](ParentType.md)|  | 

### Return type

[**ParentType**](ParentType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/merge-patch+json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateParentType**
> ParentType updateParentType(id, parentType)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getParentTypeResourceApi();
final int id = 789; // int | 
final ParentType parentType = ; // ParentType | 

try {
    final response = api.updateParentType(id, parentType);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ParentTypeResourceApi->updateParentType: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **parentType** | [**ParentType**](ParentType.md)|  | 

### Return type

[**ParentType**](ParentType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

