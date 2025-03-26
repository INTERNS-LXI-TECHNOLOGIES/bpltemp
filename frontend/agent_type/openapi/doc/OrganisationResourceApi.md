# openapi.api.OrganisationResourceApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**countOrganisations**](OrganisationResourceApi.md#countorganisations) | **GET** /api/organisations/count | 
[**createOrganisation**](OrganisationResourceApi.md#createorganisation) | **POST** /api/organisations | 
[**deleteOrganisation**](OrganisationResourceApi.md#deleteorganisation) | **DELETE** /api/organisations/{id} | 
[**getAllOrganisations**](OrganisationResourceApi.md#getallorganisations) | **GET** /api/organisations | 
[**getOrganisation**](OrganisationResourceApi.md#getorganisation) | **GET** /api/organisations/{id} | 
[**partialUpdateOrganisation**](OrganisationResourceApi.md#partialupdateorganisation) | **PATCH** /api/organisations/{id} | 
[**updateOrganisation**](OrganisationResourceApi.md#updateorganisation) | **PUT** /api/organisations/{id} | 


# **countOrganisations**
> int countOrganisations(idPeriodGreaterThan, idPeriodLessThan, idPeriodGreaterThanOrEqual, idPeriodLessThanOrEqual, idPeriodEquals, idPeriodNotEquals, idPeriodSpecified, idPeriodIn, idPeriodNotIn, namePeriodContains, namePeriodDoesNotContain, namePeriodEquals, namePeriodNotEquals, namePeriodSpecified, namePeriodIn, namePeriodNotIn, agentTypeIdPeriodGreaterThan, agentTypeIdPeriodLessThan, agentTypeIdPeriodGreaterThanOrEqual, agentTypeIdPeriodLessThanOrEqual, agentTypeIdPeriodEquals, agentTypeIdPeriodNotEquals, agentTypeIdPeriodSpecified, agentTypeIdPeriodIn, agentTypeIdPeriodNotIn, distinct)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getOrganisationResourceApi();
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
final int agentTypeIdPeriodGreaterThan = 789; // int | 
final int agentTypeIdPeriodLessThan = 789; // int | 
final int agentTypeIdPeriodGreaterThanOrEqual = 789; // int | 
final int agentTypeIdPeriodLessThanOrEqual = 789; // int | 
final int agentTypeIdPeriodEquals = 789; // int | 
final int agentTypeIdPeriodNotEquals = 789; // int | 
final bool agentTypeIdPeriodSpecified = true; // bool | 
final BuiltList<int> agentTypeIdPeriodIn = ; // BuiltList<int> | 
final BuiltList<int> agentTypeIdPeriodNotIn = ; // BuiltList<int> | 
final bool distinct = true; // bool | 

try {
    final response = api.countOrganisations(idPeriodGreaterThan, idPeriodLessThan, idPeriodGreaterThanOrEqual, idPeriodLessThanOrEqual, idPeriodEquals, idPeriodNotEquals, idPeriodSpecified, idPeriodIn, idPeriodNotIn, namePeriodContains, namePeriodDoesNotContain, namePeriodEquals, namePeriodNotEquals, namePeriodSpecified, namePeriodIn, namePeriodNotIn, agentTypeIdPeriodGreaterThan, agentTypeIdPeriodLessThan, agentTypeIdPeriodGreaterThanOrEqual, agentTypeIdPeriodLessThanOrEqual, agentTypeIdPeriodEquals, agentTypeIdPeriodNotEquals, agentTypeIdPeriodSpecified, agentTypeIdPeriodIn, agentTypeIdPeriodNotIn, distinct);
    print(response);
} catch on DioException (e) {
    print('Exception when calling OrganisationResourceApi->countOrganisations: $e\n');
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
 **agentTypeIdPeriodGreaterThan** | **int**|  | [optional] 
 **agentTypeIdPeriodLessThan** | **int**|  | [optional] 
 **agentTypeIdPeriodGreaterThanOrEqual** | **int**|  | [optional] 
 **agentTypeIdPeriodLessThanOrEqual** | **int**|  | [optional] 
 **agentTypeIdPeriodEquals** | **int**|  | [optional] 
 **agentTypeIdPeriodNotEquals** | **int**|  | [optional] 
 **agentTypeIdPeriodSpecified** | **bool**|  | [optional] 
 **agentTypeIdPeriodIn** | [**BuiltList&lt;int&gt;**](int.md)|  | [optional] 
 **agentTypeIdPeriodNotIn** | [**BuiltList&lt;int&gt;**](int.md)|  | [optional] 
 **distinct** | **bool**|  | [optional] 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createOrganisation**
> OrganisationDTO createOrganisation(organisationDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getOrganisationResourceApi();
final OrganisationDTO organisationDTO = ; // OrganisationDTO | 

try {
    final response = api.createOrganisation(organisationDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling OrganisationResourceApi->createOrganisation: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organisationDTO** | [**OrganisationDTO**](OrganisationDTO.md)|  | 

### Return type

[**OrganisationDTO**](OrganisationDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteOrganisation**
> deleteOrganisation(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getOrganisationResourceApi();
final int id = 789; // int | 

try {
    api.deleteOrganisation(id);
} catch on DioException (e) {
    print('Exception when calling OrganisationResourceApi->deleteOrganisation: $e\n');
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

# **getAllOrganisations**
> BuiltList<OrganisationDTO> getAllOrganisations(idPeriodGreaterThan, idPeriodLessThan, idPeriodGreaterThanOrEqual, idPeriodLessThanOrEqual, idPeriodEquals, idPeriodNotEquals, idPeriodSpecified, idPeriodIn, idPeriodNotIn, namePeriodContains, namePeriodDoesNotContain, namePeriodEquals, namePeriodNotEquals, namePeriodSpecified, namePeriodIn, namePeriodNotIn, agentTypeIdPeriodGreaterThan, agentTypeIdPeriodLessThan, agentTypeIdPeriodGreaterThanOrEqual, agentTypeIdPeriodLessThanOrEqual, agentTypeIdPeriodEquals, agentTypeIdPeriodNotEquals, agentTypeIdPeriodSpecified, agentTypeIdPeriodIn, agentTypeIdPeriodNotIn, distinct, page, size, sort)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getOrganisationResourceApi();
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
final int agentTypeIdPeriodGreaterThan = 789; // int | 
final int agentTypeIdPeriodLessThan = 789; // int | 
final int agentTypeIdPeriodGreaterThanOrEqual = 789; // int | 
final int agentTypeIdPeriodLessThanOrEqual = 789; // int | 
final int agentTypeIdPeriodEquals = 789; // int | 
final int agentTypeIdPeriodNotEquals = 789; // int | 
final bool agentTypeIdPeriodSpecified = true; // bool | 
final BuiltList<int> agentTypeIdPeriodIn = ; // BuiltList<int> | 
final BuiltList<int> agentTypeIdPeriodNotIn = ; // BuiltList<int> | 
final bool distinct = true; // bool | 
final int page = 56; // int | Zero-based page index (0..N)
final int size = 56; // int | The size of the page to be returned
final BuiltList<String> sort = ; // BuiltList<String> | Sorting criteria in the format: property,(asc|desc). Default sort order is ascending. Multiple sort criteria are supported.

try {
    final response = api.getAllOrganisations(idPeriodGreaterThan, idPeriodLessThan, idPeriodGreaterThanOrEqual, idPeriodLessThanOrEqual, idPeriodEquals, idPeriodNotEquals, idPeriodSpecified, idPeriodIn, idPeriodNotIn, namePeriodContains, namePeriodDoesNotContain, namePeriodEquals, namePeriodNotEquals, namePeriodSpecified, namePeriodIn, namePeriodNotIn, agentTypeIdPeriodGreaterThan, agentTypeIdPeriodLessThan, agentTypeIdPeriodGreaterThanOrEqual, agentTypeIdPeriodLessThanOrEqual, agentTypeIdPeriodEquals, agentTypeIdPeriodNotEquals, agentTypeIdPeriodSpecified, agentTypeIdPeriodIn, agentTypeIdPeriodNotIn, distinct, page, size, sort);
    print(response);
} catch on DioException (e) {
    print('Exception when calling OrganisationResourceApi->getAllOrganisations: $e\n');
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
 **agentTypeIdPeriodGreaterThan** | **int**|  | [optional] 
 **agentTypeIdPeriodLessThan** | **int**|  | [optional] 
 **agentTypeIdPeriodGreaterThanOrEqual** | **int**|  | [optional] 
 **agentTypeIdPeriodLessThanOrEqual** | **int**|  | [optional] 
 **agentTypeIdPeriodEquals** | **int**|  | [optional] 
 **agentTypeIdPeriodNotEquals** | **int**|  | [optional] 
 **agentTypeIdPeriodSpecified** | **bool**|  | [optional] 
 **agentTypeIdPeriodIn** | [**BuiltList&lt;int&gt;**](int.md)|  | [optional] 
 **agentTypeIdPeriodNotIn** | [**BuiltList&lt;int&gt;**](int.md)|  | [optional] 
 **distinct** | **bool**|  | [optional] 
 **page** | **int**| Zero-based page index (0..N) | [optional] [default to 0]
 **size** | **int**| The size of the page to be returned | [optional] [default to 20]
 **sort** | [**BuiltList&lt;String&gt;**](String.md)| Sorting criteria in the format: property,(asc|desc). Default sort order is ascending. Multiple sort criteria are supported. | [optional] 

### Return type

[**BuiltList&lt;OrganisationDTO&gt;**](OrganisationDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOrganisation**
> OrganisationDTO getOrganisation(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getOrganisationResourceApi();
final int id = 789; // int | 

try {
    final response = api.getOrganisation(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling OrganisationResourceApi->getOrganisation: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**OrganisationDTO**](OrganisationDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **partialUpdateOrganisation**
> OrganisationDTO partialUpdateOrganisation(id, organisationDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getOrganisationResourceApi();
final int id = 789; // int | 
final OrganisationDTO organisationDTO = ; // OrganisationDTO | 

try {
    final response = api.partialUpdateOrganisation(id, organisationDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling OrganisationResourceApi->partialUpdateOrganisation: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **organisationDTO** | [**OrganisationDTO**](OrganisationDTO.md)|  | 

### Return type

[**OrganisationDTO**](OrganisationDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/merge-patch+json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateOrganisation**
> OrganisationDTO updateOrganisation(id, organisationDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getOrganisationResourceApi();
final int id = 789; // int | 
final OrganisationDTO organisationDTO = ; // OrganisationDTO | 

try {
    final response = api.updateOrganisation(id, organisationDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling OrganisationResourceApi->updateOrganisation: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **organisationDTO** | [**OrganisationDTO**](OrganisationDTO.md)|  | 

### Return type

[**OrganisationDTO**](OrganisationDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

