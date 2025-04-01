# openapi.api.PersonResourceApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createPerson**](PersonResourceApi.md#createperson) | **POST** /api/people | 
[**deletePerson**](PersonResourceApi.md#deleteperson) | **DELETE** /api/people/{id} | 
[**getAllPeople**](PersonResourceApi.md#getallpeople) | **GET** /api/people | 
[**getPerson**](PersonResourceApi.md#getperson) | **GET** /api/people/{id} | 
[**partialUpdatePerson**](PersonResourceApi.md#partialupdateperson) | **PATCH** /api/people/{id} | 
[**updatePerson**](PersonResourceApi.md#updateperson) | **PUT** /api/people/{id} | 


# **createPerson**
> PersonDTO createPerson(personDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getPersonResourceApi();
final PersonDTO personDTO = ; // PersonDTO | 

try {
    final response = api.createPerson(personDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PersonResourceApi->createPerson: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **personDTO** | [**PersonDTO**](PersonDTO.md)|  | 

### Return type

[**PersonDTO**](PersonDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deletePerson**
> deletePerson(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getPersonResourceApi();
final int id = 789; // int | 

try {
    api.deletePerson(id);
} catch on DioException (e) {
    print('Exception when calling PersonResourceApi->deletePerson: $e\n');
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

# **getAllPeople**
> BuiltList<PersonDTO> getAllPeople(page, size, sort)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getPersonResourceApi();
final int page = 56; // int | Zero-based page index (0..N)
final int size = 56; // int | The size of the page to be returned
final BuiltList<String> sort = ; // BuiltList<String> | Sorting criteria in the format: property,(asc|desc). Default sort order is ascending. Multiple sort criteria are supported.

try {
    final response = api.getAllPeople(page, size, sort);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PersonResourceApi->getAllPeople: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Zero-based page index (0..N) | [optional] [default to 0]
 **size** | **int**| The size of the page to be returned | [optional] [default to 20]
 **sort** | [**BuiltList&lt;String&gt;**](String.md)| Sorting criteria in the format: property,(asc|desc). Default sort order is ascending. Multiple sort criteria are supported. | [optional] 

### Return type

[**BuiltList&lt;PersonDTO&gt;**](PersonDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPerson**
> PersonDTO getPerson(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getPersonResourceApi();
final int id = 789; // int | 

try {
    final response = api.getPerson(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PersonResourceApi->getPerson: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**PersonDTO**](PersonDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **partialUpdatePerson**
> PersonDTO partialUpdatePerson(id, personDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getPersonResourceApi();
final int id = 789; // int | 
final PersonDTO personDTO = ; // PersonDTO | 

try {
    final response = api.partialUpdatePerson(id, personDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PersonResourceApi->partialUpdatePerson: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **personDTO** | [**PersonDTO**](PersonDTO.md)|  | 

### Return type

[**PersonDTO**](PersonDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/merge-patch+json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updatePerson**
> PersonDTO updatePerson(id, personDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getPersonResourceApi();
final int id = 789; // int | 
final PersonDTO personDTO = ; // PersonDTO | 

try {
    final response = api.updatePerson(id, personDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PersonResourceApi->updatePerson: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **personDTO** | [**PersonDTO**](PersonDTO.md)|  | 

### Return type

[**PersonDTO**](PersonDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

