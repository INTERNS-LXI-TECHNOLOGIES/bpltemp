# openapi.api.CurrencyTypeResourceApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**countCurrencyTypes**](CurrencyTypeResourceApi.md#countcurrencytypes) | **GET** /api/currency-types/count | 
[**createCurrencyType**](CurrencyTypeResourceApi.md#createcurrencytype) | **POST** /api/currency-types | 
[**deleteCurrencyType**](CurrencyTypeResourceApi.md#deletecurrencytype) | **DELETE** /api/currency-types/{id} | 
[**getAllCurrencyTypes**](CurrencyTypeResourceApi.md#getallcurrencytypes) | **GET** /api/currency-types | 
[**getCurrencyType**](CurrencyTypeResourceApi.md#getcurrencytype) | **GET** /api/currency-types/{id} | 
[**partialUpdateCurrencyType**](CurrencyTypeResourceApi.md#partialupdatecurrencytype) | **PATCH** /api/currency-types/{id} | 
[**updateCurrencyType**](CurrencyTypeResourceApi.md#updatecurrencytype) | **PUT** /api/currency-types/{id} | 


# **countCurrencyTypes**
> int countCurrencyTypes(idPeriodGreaterThan, idPeriodLessThan, idPeriodGreaterThanOrEqual, idPeriodLessThanOrEqual, idPeriodEquals, idPeriodNotEquals, idPeriodSpecified, idPeriodIn, idPeriodNotIn, namePeriodContains, namePeriodDoesNotContain, namePeriodEquals, namePeriodNotEquals, namePeriodSpecified, namePeriodIn, namePeriodNotIn, currencyTypeIdPeriodGreaterThan, currencyTypeIdPeriodLessThan, currencyTypeIdPeriodGreaterThanOrEqual, currencyTypeIdPeriodLessThanOrEqual, currencyTypeIdPeriodEquals, currencyTypeIdPeriodNotEquals, currencyTypeIdPeriodSpecified, currencyTypeIdPeriodIn, currencyTypeIdPeriodNotIn, distinct)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCurrencyTypeResourceApi();
final int idPeriodGreaterThan = 789; // int | 
final int idPeriodLessThan = 789; // int | 
final int idPeriodGreaterThanOrEqual = 789; // int | 
final int idPeriodLessThanOrEqual = 789; // int | 
final int idPeriodEquals = 789; // int | 
final int idPeriodNotEquals = 789; // int | 
final bool idPeriodSpecified = true; // bool | 
final BuiltList<int> idPeriodIn = ; // BuiltList<int> | 
final BuiltList<int> idPeriodNotIn = ; // BuiltList<int> | 
final String namePeriodContains = namePeriodContains_example; // String | 
final String namePeriodDoesNotContain = namePeriodDoesNotContain_example; // String | 
final String namePeriodEquals = namePeriodEquals_example; // String | 
final String namePeriodNotEquals = namePeriodNotEquals_example; // String | 
final bool namePeriodSpecified = true; // bool | 
final BuiltList<String> namePeriodIn = ; // BuiltList<String> | 
final BuiltList<String> namePeriodNotIn = ; // BuiltList<String> | 
final int currencyTypeIdPeriodGreaterThan = 789; // int | 
final int currencyTypeIdPeriodLessThan = 789; // int | 
final int currencyTypeIdPeriodGreaterThanOrEqual = 789; // int | 
final int currencyTypeIdPeriodLessThanOrEqual = 789; // int | 
final int currencyTypeIdPeriodEquals = 789; // int | 
final int currencyTypeIdPeriodNotEquals = 789; // int | 
final bool currencyTypeIdPeriodSpecified = true; // bool | 
final BuiltList<int> currencyTypeIdPeriodIn = ; // BuiltList<int> | 
final BuiltList<int> currencyTypeIdPeriodNotIn = ; // BuiltList<int> | 
final bool distinct = true; // bool | 

try {
    final response = api.countCurrencyTypes(idPeriodGreaterThan, idPeriodLessThan, idPeriodGreaterThanOrEqual, idPeriodLessThanOrEqual, idPeriodEquals, idPeriodNotEquals, idPeriodSpecified, idPeriodIn, idPeriodNotIn, namePeriodContains, namePeriodDoesNotContain, namePeriodEquals, namePeriodNotEquals, namePeriodSpecified, namePeriodIn, namePeriodNotIn, currencyTypeIdPeriodGreaterThan, currencyTypeIdPeriodLessThan, currencyTypeIdPeriodGreaterThanOrEqual, currencyTypeIdPeriodLessThanOrEqual, currencyTypeIdPeriodEquals, currencyTypeIdPeriodNotEquals, currencyTypeIdPeriodSpecified, currencyTypeIdPeriodIn, currencyTypeIdPeriodNotIn, distinct);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CurrencyTypeResourceApi->countCurrencyTypes: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **idPeriodGreaterThan** | **int**|  | [optional] 
 **idPeriodLessThan** | **int**|  | [optional] 
 **idPeriodGreaterThanOrEqual** | **int**|  | [optional] 
 **idPeriodLessThanOrEqual** | **int**|  | [optional] 
 **idPeriodEquals** | **int**|  | [optional] 
 **idPeriodNotEquals** | **int**|  | [optional] 
 **idPeriodSpecified** | **bool**|  | [optional] 
 **idPeriodIn** | [**BuiltList&lt;int&gt;**](int.md)|  | [optional] 
 **idPeriodNotIn** | [**BuiltList&lt;int&gt;**](int.md)|  | [optional] 
 **namePeriodContains** | **String**|  | [optional] 
 **namePeriodDoesNotContain** | **String**|  | [optional] 
 **namePeriodEquals** | **String**|  | [optional] 
 **namePeriodNotEquals** | **String**|  | [optional] 
 **namePeriodSpecified** | **bool**|  | [optional] 
 **namePeriodIn** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 
 **namePeriodNotIn** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 
 **currencyTypeIdPeriodGreaterThan** | **int**|  | [optional] 
 **currencyTypeIdPeriodLessThan** | **int**|  | [optional] 
 **currencyTypeIdPeriodGreaterThanOrEqual** | **int**|  | [optional] 
 **currencyTypeIdPeriodLessThanOrEqual** | **int**|  | [optional] 
 **currencyTypeIdPeriodEquals** | **int**|  | [optional] 
 **currencyTypeIdPeriodNotEquals** | **int**|  | [optional] 
 **currencyTypeIdPeriodSpecified** | **bool**|  | [optional] 
 **currencyTypeIdPeriodIn** | [**BuiltList&lt;int&gt;**](int.md)|  | [optional] 
 **currencyTypeIdPeriodNotIn** | [**BuiltList&lt;int&gt;**](int.md)|  | [optional] 
 **distinct** | **bool**|  | [optional] 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createCurrencyType**
> CurrencyTypeDTO createCurrencyType(currencyTypeDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCurrencyTypeResourceApi();
final CurrencyTypeDTO currencyTypeDTO = ; // CurrencyTypeDTO | 

try {
    final response = api.createCurrencyType(currencyTypeDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CurrencyTypeResourceApi->createCurrencyType: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **currencyTypeDTO** | [**CurrencyTypeDTO**](CurrencyTypeDTO.md)|  | 

### Return type

[**CurrencyTypeDTO**](CurrencyTypeDTO.md)

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
> BuiltList<CurrencyTypeDTO> getAllCurrencyTypes(idPeriodGreaterThan, idPeriodLessThan, idPeriodGreaterThanOrEqual, idPeriodLessThanOrEqual, idPeriodEquals, idPeriodNotEquals, idPeriodSpecified, idPeriodIn, idPeriodNotIn, namePeriodContains, namePeriodDoesNotContain, namePeriodEquals, namePeriodNotEquals, namePeriodSpecified, namePeriodIn, namePeriodNotIn, currencyTypeIdPeriodGreaterThan, currencyTypeIdPeriodLessThan, currencyTypeIdPeriodGreaterThanOrEqual, currencyTypeIdPeriodLessThanOrEqual, currencyTypeIdPeriodEquals, currencyTypeIdPeriodNotEquals, currencyTypeIdPeriodSpecified, currencyTypeIdPeriodIn, currencyTypeIdPeriodNotIn, distinct, page, size, sort)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCurrencyTypeResourceApi();
final int idPeriodGreaterThan = 789; // int | 
final int idPeriodLessThan = 789; // int | 
final int idPeriodGreaterThanOrEqual = 789; // int | 
final int idPeriodLessThanOrEqual = 789; // int | 
final int idPeriodEquals = 789; // int | 
final int idPeriodNotEquals = 789; // int | 
final bool idPeriodSpecified = true; // bool | 
final BuiltList<int> idPeriodIn = ; // BuiltList<int> | 
final BuiltList<int> idPeriodNotIn = ; // BuiltList<int> | 
final String namePeriodContains = namePeriodContains_example; // String | 
final String namePeriodDoesNotContain = namePeriodDoesNotContain_example; // String | 
final String namePeriodEquals = namePeriodEquals_example; // String | 
final String namePeriodNotEquals = namePeriodNotEquals_example; // String | 
final bool namePeriodSpecified = true; // bool | 
final BuiltList<String> namePeriodIn = ; // BuiltList<String> | 
final BuiltList<String> namePeriodNotIn = ; // BuiltList<String> | 
final int currencyTypeIdPeriodGreaterThan = 789; // int | 
final int currencyTypeIdPeriodLessThan = 789; // int | 
final int currencyTypeIdPeriodGreaterThanOrEqual = 789; // int | 
final int currencyTypeIdPeriodLessThanOrEqual = 789; // int | 
final int currencyTypeIdPeriodEquals = 789; // int | 
final int currencyTypeIdPeriodNotEquals = 789; // int | 
final bool currencyTypeIdPeriodSpecified = true; // bool | 
final BuiltList<int> currencyTypeIdPeriodIn = ; // BuiltList<int> | 
final BuiltList<int> currencyTypeIdPeriodNotIn = ; // BuiltList<int> | 
final bool distinct = true; // bool | 
final int page = 56; // int | Zero-based page index (0..N)
final int size = 56; // int | The size of the page to be returned
final BuiltList<String> sort = ; // BuiltList<String> | Sorting criteria in the format: property,(asc|desc). Default sort order is ascending. Multiple sort criteria are supported.

try {
    final response = api.getAllCurrencyTypes(idPeriodGreaterThan, idPeriodLessThan, idPeriodGreaterThanOrEqual, idPeriodLessThanOrEqual, idPeriodEquals, idPeriodNotEquals, idPeriodSpecified, idPeriodIn, idPeriodNotIn, namePeriodContains, namePeriodDoesNotContain, namePeriodEquals, namePeriodNotEquals, namePeriodSpecified, namePeriodIn, namePeriodNotIn, currencyTypeIdPeriodGreaterThan, currencyTypeIdPeriodLessThan, currencyTypeIdPeriodGreaterThanOrEqual, currencyTypeIdPeriodLessThanOrEqual, currencyTypeIdPeriodEquals, currencyTypeIdPeriodNotEquals, currencyTypeIdPeriodSpecified, currencyTypeIdPeriodIn, currencyTypeIdPeriodNotIn, distinct, page, size, sort);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CurrencyTypeResourceApi->getAllCurrencyTypes: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **idPeriodGreaterThan** | **int**|  | [optional] 
 **idPeriodLessThan** | **int**|  | [optional] 
 **idPeriodGreaterThanOrEqual** | **int**|  | [optional] 
 **idPeriodLessThanOrEqual** | **int**|  | [optional] 
 **idPeriodEquals** | **int**|  | [optional] 
 **idPeriodNotEquals** | **int**|  | [optional] 
 **idPeriodSpecified** | **bool**|  | [optional] 
 **idPeriodIn** | [**BuiltList&lt;int&gt;**](int.md)|  | [optional] 
 **idPeriodNotIn** | [**BuiltList&lt;int&gt;**](int.md)|  | [optional] 
 **namePeriodContains** | **String**|  | [optional] 
 **namePeriodDoesNotContain** | **String**|  | [optional] 
 **namePeriodEquals** | **String**|  | [optional] 
 **namePeriodNotEquals** | **String**|  | [optional] 
 **namePeriodSpecified** | **bool**|  | [optional] 
 **namePeriodIn** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 
 **namePeriodNotIn** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 
 **currencyTypeIdPeriodGreaterThan** | **int**|  | [optional] 
 **currencyTypeIdPeriodLessThan** | **int**|  | [optional] 
 **currencyTypeIdPeriodGreaterThanOrEqual** | **int**|  | [optional] 
 **currencyTypeIdPeriodLessThanOrEqual** | **int**|  | [optional] 
 **currencyTypeIdPeriodEquals** | **int**|  | [optional] 
 **currencyTypeIdPeriodNotEquals** | **int**|  | [optional] 
 **currencyTypeIdPeriodSpecified** | **bool**|  | [optional] 
 **currencyTypeIdPeriodIn** | [**BuiltList&lt;int&gt;**](int.md)|  | [optional] 
 **currencyTypeIdPeriodNotIn** | [**BuiltList&lt;int&gt;**](int.md)|  | [optional] 
 **distinct** | **bool**|  | [optional] 
 **page** | **int**| Zero-based page index (0..N) | [optional] [default to 0]
 **size** | **int**| The size of the page to be returned | [optional] [default to 20]
 **sort** | [**BuiltList&lt;String&gt;**](String.md)| Sorting criteria in the format: property,(asc|desc). Default sort order is ascending. Multiple sort criteria are supported. | [optional] 

### Return type

[**BuiltList&lt;CurrencyTypeDTO&gt;**](CurrencyTypeDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCurrencyType**
> CurrencyTypeDTO getCurrencyType(id)



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

[**CurrencyTypeDTO**](CurrencyTypeDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **partialUpdateCurrencyType**
> CurrencyTypeDTO partialUpdateCurrencyType(id, currencyTypeDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCurrencyTypeResourceApi();
final int id = 789; // int | 
final CurrencyTypeDTO currencyTypeDTO = ; // CurrencyTypeDTO | 

try {
    final response = api.partialUpdateCurrencyType(id, currencyTypeDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CurrencyTypeResourceApi->partialUpdateCurrencyType: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **currencyTypeDTO** | [**CurrencyTypeDTO**](CurrencyTypeDTO.md)|  | 

### Return type

[**CurrencyTypeDTO**](CurrencyTypeDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/merge-patch+json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateCurrencyType**
> CurrencyTypeDTO updateCurrencyType(id, currencyTypeDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCurrencyTypeResourceApi();
final int id = 789; // int | 
final CurrencyTypeDTO currencyTypeDTO = ; // CurrencyTypeDTO | 

try {
    final response = api.updateCurrencyType(id, currencyTypeDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CurrencyTypeResourceApi->updateCurrencyType: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **currencyTypeDTO** | [**CurrencyTypeDTO**](CurrencyTypeDTO.md)|  | 

### Return type

[**CurrencyTypeDTO**](CurrencyTypeDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

