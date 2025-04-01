# openapi.api.ContactResourceApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createContact**](ContactResourceApi.md#createcontact) | **POST** /api/contacts | 
[**deleteContact**](ContactResourceApi.md#deletecontact) | **DELETE** /api/contacts/{id} | 
[**getAllContacts**](ContactResourceApi.md#getallcontacts) | **GET** /api/contacts | 
[**getContact**](ContactResourceApi.md#getcontact) | **GET** /api/contacts/{id} | 
[**partialUpdateContact**](ContactResourceApi.md#partialupdatecontact) | **PATCH** /api/contacts/{id} | 
[**updateContact**](ContactResourceApi.md#updatecontact) | **PUT** /api/contacts/{id} | 


# **createContact**
> ContactDTO createContact(contactDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getContactResourceApi();
final ContactDTO contactDTO = ; // ContactDTO | 

try {
    final response = api.createContact(contactDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ContactResourceApi->createContact: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **contactDTO** | [**ContactDTO**](ContactDTO.md)|  | 

### Return type

[**ContactDTO**](ContactDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteContact**
> deleteContact(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getContactResourceApi();
final int id = 789; // int | 

try {
    api.deleteContact(id);
} catch on DioException (e) {
    print('Exception when calling ContactResourceApi->deleteContact: $e\n');
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

# **getAllContacts**
> BuiltList<ContactDTO> getAllContacts(page, size, sort)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getContactResourceApi();
final int page = 56; // int | Zero-based page index (0..N)
final int size = 56; // int | The size of the page to be returned
final BuiltList<String> sort = ; // BuiltList<String> | Sorting criteria in the format: property,(asc|desc). Default sort order is ascending. Multiple sort criteria are supported.

try {
    final response = api.getAllContacts(page, size, sort);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ContactResourceApi->getAllContacts: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Zero-based page index (0..N) | [optional] [default to 0]
 **size** | **int**| The size of the page to be returned | [optional] [default to 20]
 **sort** | [**BuiltList&lt;String&gt;**](String.md)| Sorting criteria in the format: property,(asc|desc). Default sort order is ascending. Multiple sort criteria are supported. | [optional] 

### Return type

[**BuiltList&lt;ContactDTO&gt;**](ContactDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getContact**
> ContactDTO getContact(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getContactResourceApi();
final int id = 789; // int | 

try {
    final response = api.getContact(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ContactResourceApi->getContact: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**ContactDTO**](ContactDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **partialUpdateContact**
> ContactDTO partialUpdateContact(id, contactDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getContactResourceApi();
final int id = 789; // int | 
final ContactDTO contactDTO = ; // ContactDTO | 

try {
    final response = api.partialUpdateContact(id, contactDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ContactResourceApi->partialUpdateContact: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **contactDTO** | [**ContactDTO**](ContactDTO.md)|  | 

### Return type

[**ContactDTO**](ContactDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/merge-patch+json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateContact**
> ContactDTO updateContact(id, contactDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getContactResourceApi();
final int id = 789; // int | 
final ContactDTO contactDTO = ; // ContactDTO | 

try {
    final response = api.updateContact(id, contactDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ContactResourceApi->updateContact: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **contactDTO** | [**ContactDTO**](ContactDTO.md)|  | 

### Return type

[**ContactDTO**](ContactDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

