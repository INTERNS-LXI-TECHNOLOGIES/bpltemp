# openapi.api.CompanyResourceApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createCompany**](CompanyResourceApi.md#createcompany) | **POST** /api/companies | 
[**deleteCompany**](CompanyResourceApi.md#deletecompany) | **DELETE** /api/companies/{id} | 
[**getAllCompanies**](CompanyResourceApi.md#getallcompanies) | **GET** /api/companies | 
[**getCompany**](CompanyResourceApi.md#getcompany) | **GET** /api/companies/{id} | 
[**partialUpdateCompany**](CompanyResourceApi.md#partialupdatecompany) | **PATCH** /api/companies/{id} | 
[**updateCompany**](CompanyResourceApi.md#updatecompany) | **PUT** /api/companies/{id} | 


# **createCompany**
> CompanyDTO createCompany(companyDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCompanyResourceApi();
final CompanyDTO companyDTO = ; // CompanyDTO | 

try {
    final response = api.createCompany(companyDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CompanyResourceApi->createCompany: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **companyDTO** | [**CompanyDTO**](CompanyDTO.md)|  | 

### Return type

[**CompanyDTO**](CompanyDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteCompany**
> deleteCompany(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCompanyResourceApi();
final int id = 789; // int | 

try {
    api.deleteCompany(id);
} catch on DioException (e) {
    print('Exception when calling CompanyResourceApi->deleteCompany: $e\n');
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

# **getAllCompanies**
> BuiltList<CompanyDTO> getAllCompanies(page, size, sort)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCompanyResourceApi();
final int page = 56; // int | Zero-based page index (0..N)
final int size = 56; // int | The size of the page to be returned
final BuiltList<String> sort = ; // BuiltList<String> | Sorting criteria in the format: property,(asc|desc). Default sort order is ascending. Multiple sort criteria are supported.

try {
    final response = api.getAllCompanies(page, size, sort);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CompanyResourceApi->getAllCompanies: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Zero-based page index (0..N) | [optional] [default to 0]
 **size** | **int**| The size of the page to be returned | [optional] [default to 20]
 **sort** | [**BuiltList&lt;String&gt;**](String.md)| Sorting criteria in the format: property,(asc|desc). Default sort order is ascending. Multiple sort criteria are supported. | [optional] 

### Return type

[**BuiltList&lt;CompanyDTO&gt;**](CompanyDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCompany**
> CompanyDTO getCompany(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCompanyResourceApi();
final int id = 789; // int | 

try {
    final response = api.getCompany(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CompanyResourceApi->getCompany: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**CompanyDTO**](CompanyDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **partialUpdateCompany**
> CompanyDTO partialUpdateCompany(id, companyDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCompanyResourceApi();
final int id = 789; // int | 
final CompanyDTO companyDTO = ; // CompanyDTO | 

try {
    final response = api.partialUpdateCompany(id, companyDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CompanyResourceApi->partialUpdateCompany: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **companyDTO** | [**CompanyDTO**](CompanyDTO.md)|  | 

### Return type

[**CompanyDTO**](CompanyDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/merge-patch+json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateCompany**
> CompanyDTO updateCompany(id, companyDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCompanyResourceApi();
final int id = 789; // int | 
final CompanyDTO companyDTO = ; // CompanyDTO | 

try {
    final response = api.updateCompany(id, companyDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CompanyResourceApi->updateCompany: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **companyDTO** | [**CompanyDTO**](CompanyDTO.md)|  | 

### Return type

[**CompanyDTO**](CompanyDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

