# openapi.api.CurrencyTypeResourceApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createCurrencyType**](CurrencyTypeResourceApi.md#createcurrencytype) | **POST** /api/currency-types | 
[**deleteCurrencyType**](CurrencyTypeResourceApi.md#deletecurrencytype) | **DELETE** /api/currency-types/{id} | 
[**getAllCurrencyTypes**](CurrencyTypeResourceApi.md#getallcurrencytypes) | **GET** /api/currency-types | 
[**getCurrencyType**](CurrencyTypeResourceApi.md#getcurrencytype) | **GET** /api/currency-types/{id} | 
[**partialUpdateCurrencyType**](CurrencyTypeResourceApi.md#partialupdatecurrencytype) | **PATCH** /api/currency-types/{id} | 
[**updateCurrencyType**](CurrencyTypeResourceApi.md#updatecurrencytype) | **PUT** /api/currency-types/{id} | 


# **createCurrencyType**
> CurrencyType createCurrencyType(currencyType)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCurrencyTypeResourceApi();
final CurrencyType currencyType = ; // CurrencyType | 

try {
    final response = api.createCurrencyType(currencyType);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CurrencyTypeResourceApi->createCurrencyType: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **currencyType** | [**CurrencyType**](CurrencyType.md)|  | 

### Return type

[**CurrencyType**](CurrencyType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteCurrencyType**
> deleteCurrencyType(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCurrencyTypeResourceApi();
final int id = 789; // int | 

try {
    api.deleteCurrencyType(id);
} catch on DioException (e) {
    print('Exception when calling CurrencyTypeResourceApi->deleteCurrencyType: $e\n');
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

# **getAllCurrencyTypes**
> BuiltList<CurrencyType> getAllCurrencyTypes(filter)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCurrencyTypeResourceApi();
final String filter = filter_example; // String | 

try {
    final response = api.getAllCurrencyTypes(filter);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CurrencyTypeResourceApi->getAllCurrencyTypes: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **filter** | **String**|  | [optional] 

### Return type

[**BuiltList&lt;CurrencyType&gt;**](CurrencyType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCurrencyType**
> CurrencyType getCurrencyType(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCurrencyTypeResourceApi();
final int id = 789; // int | 

try {
    final response = api.getCurrencyType(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CurrencyTypeResourceApi->getCurrencyType: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**CurrencyType**](CurrencyType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **partialUpdateCurrencyType**
> CurrencyType partialUpdateCurrencyType(id, currencyType)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCurrencyTypeResourceApi();
final int id = 789; // int | 
final CurrencyType currencyType = ; // CurrencyType | 

try {
    final response = api.partialUpdateCurrencyType(id, currencyType);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CurrencyTypeResourceApi->partialUpdateCurrencyType: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **currencyType** | [**CurrencyType**](CurrencyType.md)|  | 

### Return type

[**CurrencyType**](CurrencyType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/merge-patch+json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateCurrencyType**
> CurrencyType updateCurrencyType(id, currencyType)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCurrencyTypeResourceApi();
final int id = 789; // int | 
final CurrencyType currencyType = ; // CurrencyType | 

try {
    final response = api.updateCurrencyType(id, currencyType);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CurrencyTypeResourceApi->updateCurrencyType: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **currencyType** | [**CurrencyType**](CurrencyType.md)|  | 

### Return type

[**CurrencyType**](CurrencyType.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

