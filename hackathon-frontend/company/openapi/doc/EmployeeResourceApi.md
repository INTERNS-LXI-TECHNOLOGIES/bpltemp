# openapi.api.EmployeeResourceApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createEmployee**](EmployeeResourceApi.md#createemployee) | **POST** /api/employees | 
[**deleteEmployee**](EmployeeResourceApi.md#deleteemployee) | **DELETE** /api/employees/{id} | 
[**getAllEmployees**](EmployeeResourceApi.md#getallemployees) | **GET** /api/employees | 
[**getEmployee**](EmployeeResourceApi.md#getemployee) | **GET** /api/employees/{id} | 
[**partialUpdateEmployee**](EmployeeResourceApi.md#partialupdateemployee) | **PATCH** /api/employees/{id} | 
[**updateEmployee**](EmployeeResourceApi.md#updateemployee) | **PUT** /api/employees/{id} | 


# **createEmployee**
> EmployeeDTO createEmployee(employeeDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getEmployeeResourceApi();
final EmployeeDTO employeeDTO = ; // EmployeeDTO | 

try {
    final response = api.createEmployee(employeeDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EmployeeResourceApi->createEmployee: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **employeeDTO** | [**EmployeeDTO**](EmployeeDTO.md)|  | 

### Return type

[**EmployeeDTO**](EmployeeDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteEmployee**
> deleteEmployee(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getEmployeeResourceApi();
final int id = 789; // int | 

try {
    api.deleteEmployee(id);
} catch on DioException (e) {
    print('Exception when calling EmployeeResourceApi->deleteEmployee: $e\n');
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

# **getAllEmployees**
> BuiltList<EmployeeDTO> getAllEmployees(page, size, sort)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getEmployeeResourceApi();
final int page = 56; // int | Zero-based page index (0..N)
final int size = 56; // int | The size of the page to be returned
final BuiltList<String> sort = ; // BuiltList<String> | Sorting criteria in the format: property,(asc|desc). Default sort order is ascending. Multiple sort criteria are supported.

try {
    final response = api.getAllEmployees(page, size, sort);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EmployeeResourceApi->getAllEmployees: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Zero-based page index (0..N) | [optional] [default to 0]
 **size** | **int**| The size of the page to be returned | [optional] [default to 20]
 **sort** | [**BuiltList&lt;String&gt;**](String.md)| Sorting criteria in the format: property,(asc|desc). Default sort order is ascending. Multiple sort criteria are supported. | [optional] 

### Return type

[**BuiltList&lt;EmployeeDTO&gt;**](EmployeeDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getEmployee**
> EmployeeDTO getEmployee(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getEmployeeResourceApi();
final int id = 789; // int | 

try {
    final response = api.getEmployee(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EmployeeResourceApi->getEmployee: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**EmployeeDTO**](EmployeeDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **partialUpdateEmployee**
> EmployeeDTO partialUpdateEmployee(id, employeeDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getEmployeeResourceApi();
final int id = 789; // int | 
final EmployeeDTO employeeDTO = ; // EmployeeDTO | 

try {
    final response = api.partialUpdateEmployee(id, employeeDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EmployeeResourceApi->partialUpdateEmployee: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **employeeDTO** | [**EmployeeDTO**](EmployeeDTO.md)|  | 

### Return type

[**EmployeeDTO**](EmployeeDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/merge-patch+json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateEmployee**
> EmployeeDTO updateEmployee(id, employeeDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getEmployeeResourceApi();
final int id = 789; // int | 
final EmployeeDTO employeeDTO = ; // EmployeeDTO | 

try {
    final response = api.updateEmployee(id, employeeDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EmployeeResourceApi->updateEmployee: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **employeeDTO** | [**EmployeeDTO**](EmployeeDTO.md)|  | 

### Return type

[**EmployeeDTO**](EmployeeDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

