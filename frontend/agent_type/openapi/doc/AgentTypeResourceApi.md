# openapi.api.AgentTypeResourceApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**countAgentTypes**](AgentTypeResourceApi.md#countagenttypes) | **GET** /api/agent-types/count | 
[**createAgentType**](AgentTypeResourceApi.md#createagenttype) | **POST** /api/agent-types | 
[**deleteAgentType**](AgentTypeResourceApi.md#deleteagenttype) | **DELETE** /api/agent-types/{id} | 
[**getAgentType**](AgentTypeResourceApi.md#getagenttype) | **GET** /api/agent-types/{id} | 
[**getAllAgentTypes**](AgentTypeResourceApi.md#getallagenttypes) | **GET** /api/agent-types | 
[**partialUpdateAgentType**](AgentTypeResourceApi.md#partialupdateagenttype) | **PATCH** /api/agent-types/{id} | 
[**updateAgentType**](AgentTypeResourceApi.md#updateagenttype) | **PUT** /api/agent-types/{id} | 


# **countAgentTypes**
> int countAgentTypes(idPeriodGreaterThan, idPeriodLessThan, idPeriodGreaterThanOrEqual, idPeriodLessThanOrEqual, idPeriodEquals, idPeriodNotEquals, idPeriodSpecified, idPeriodIn, idPeriodNotIn, namePeriodContains, namePeriodDoesNotContain, namePeriodEquals, namePeriodNotEquals, namePeriodSpecified, namePeriodIn, namePeriodNotIn, descriptionPeriodContains, descriptionPeriodDoesNotContain, descriptionPeriodEquals, descriptionPeriodNotEquals, descriptionPeriodSpecified, descriptionPeriodIn, descriptionPeriodNotIn, organisationIdPeriodGreaterThan, organisationIdPeriodLessThan, organisationIdPeriodGreaterThanOrEqual, organisationIdPeriodLessThanOrEqual, organisationIdPeriodEquals, organisationIdPeriodNotEquals, organisationIdPeriodSpecified, organisationIdPeriodIn, organisationIdPeriodNotIn, distinct)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAgentTypeResourceApi();
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
final String descriptionPeriodContains = descriptionPeriodContains_example; // String | 
final String descriptionPeriodDoesNotContain = descriptionPeriodDoesNotContain_example; // String | 
final String descriptionPeriodEquals = descriptionPeriodEquals_example; // String | 
final String descriptionPeriodNotEquals = descriptionPeriodNotEquals_example; // String | 
final bool descriptionPeriodSpecified = true; // bool | 
final BuiltList<String> descriptionPeriodIn = ; // BuiltList<String> | 
final BuiltList<String> descriptionPeriodNotIn = ; // BuiltList<String> | 
final int organisationIdPeriodGreaterThan = 789; // int | 
final int organisationIdPeriodLessThan = 789; // int | 
final int organisationIdPeriodGreaterThanOrEqual = 789; // int | 
final int organisationIdPeriodLessThanOrEqual = 789; // int | 
final int organisationIdPeriodEquals = 789; // int | 
final int organisationIdPeriodNotEquals = 789; // int | 
final bool organisationIdPeriodSpecified = true; // bool | 
final BuiltList<int> organisationIdPeriodIn = ; // BuiltList<int> | 
final BuiltList<int> organisationIdPeriodNotIn = ; // BuiltList<int> | 
final bool distinct = true; // bool | 

try {
    final response = api.countAgentTypes(idPeriodGreaterThan, idPeriodLessThan, idPeriodGreaterThanOrEqual, idPeriodLessThanOrEqual, idPeriodEquals, idPeriodNotEquals, idPeriodSpecified, idPeriodIn, idPeriodNotIn, namePeriodContains, namePeriodDoesNotContain, namePeriodEquals, namePeriodNotEquals, namePeriodSpecified, namePeriodIn, namePeriodNotIn, descriptionPeriodContains, descriptionPeriodDoesNotContain, descriptionPeriodEquals, descriptionPeriodNotEquals, descriptionPeriodSpecified, descriptionPeriodIn, descriptionPeriodNotIn, organisationIdPeriodGreaterThan, organisationIdPeriodLessThan, organisationIdPeriodGreaterThanOrEqual, organisationIdPeriodLessThanOrEqual, organisationIdPeriodEquals, organisationIdPeriodNotEquals, organisationIdPeriodSpecified, organisationIdPeriodIn, organisationIdPeriodNotIn, distinct);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AgentTypeResourceApi->countAgentTypes: $e\n');
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
 **descriptionPeriodContains** | **String**|  | [optional] 
 **descriptionPeriodDoesNotContain** | **String**|  | [optional] 
 **descriptionPeriodEquals** | **String**|  | [optional] 
 **descriptionPeriodNotEquals** | **String**|  | [optional] 
 **descriptionPeriodSpecified** | **bool**|  | [optional] 
 **descriptionPeriodIn** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 
 **descriptionPeriodNotIn** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 
 **organisationIdPeriodGreaterThan** | **int**|  | [optional] 
 **organisationIdPeriodLessThan** | **int**|  | [optional] 
 **organisationIdPeriodGreaterThanOrEqual** | **int**|  | [optional] 
 **organisationIdPeriodLessThanOrEqual** | **int**|  | [optional] 
 **organisationIdPeriodEquals** | **int**|  | [optional] 
 **organisationIdPeriodNotEquals** | **int**|  | [optional] 
 **organisationIdPeriodSpecified** | **bool**|  | [optional] 
 **organisationIdPeriodIn** | [**BuiltList&lt;int&gt;**](int.md)|  | [optional] 
 **organisationIdPeriodNotIn** | [**BuiltList&lt;int&gt;**](int.md)|  | [optional] 
 **distinct** | **bool**|  | [optional] 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createAgentType**
> AgentTypeDTO createAgentType(agentTypeDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAgentTypeResourceApi();
final AgentTypeDTO agentTypeDTO = ; // AgentTypeDTO | 

try {
    final response = api.createAgentType(agentTypeDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AgentTypeResourceApi->createAgentType: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **agentTypeDTO** | [**AgentTypeDTO**](AgentTypeDTO.md)|  | 

### Return type

[**AgentTypeDTO**](AgentTypeDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteAgentType**
> deleteAgentType(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAgentTypeResourceApi();
final int id = 789; // int | 

try {
    api.deleteAgentType(id);
} catch on DioException (e) {
    print('Exception when calling AgentTypeResourceApi->deleteAgentType: $e\n');
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

# **getAgentType**
> AgentTypeDTO getAgentType(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAgentTypeResourceApi();
final int id = 789; // int | 

try {
    final response = api.getAgentType(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AgentTypeResourceApi->getAgentType: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**AgentTypeDTO**](AgentTypeDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAllAgentTypes**
> BuiltList<AgentTypeDTO> getAllAgentTypes(idPeriodGreaterThan, idPeriodLessThan, idPeriodGreaterThanOrEqual, idPeriodLessThanOrEqual, idPeriodEquals, idPeriodNotEquals, idPeriodSpecified, idPeriodIn, idPeriodNotIn, namePeriodContains, namePeriodDoesNotContain, namePeriodEquals, namePeriodNotEquals, namePeriodSpecified, namePeriodIn, namePeriodNotIn, descriptionPeriodContains, descriptionPeriodDoesNotContain, descriptionPeriodEquals, descriptionPeriodNotEquals, descriptionPeriodSpecified, descriptionPeriodIn, descriptionPeriodNotIn, organisationIdPeriodGreaterThan, organisationIdPeriodLessThan, organisationIdPeriodGreaterThanOrEqual, organisationIdPeriodLessThanOrEqual, organisationIdPeriodEquals, organisationIdPeriodNotEquals, organisationIdPeriodSpecified, organisationIdPeriodIn, organisationIdPeriodNotIn, distinct, page, size, sort)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAgentTypeResourceApi();
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
final String descriptionPeriodContains = descriptionPeriodContains_example; // String | 
final String descriptionPeriodDoesNotContain = descriptionPeriodDoesNotContain_example; // String | 
final String descriptionPeriodEquals = descriptionPeriodEquals_example; // String | 
final String descriptionPeriodNotEquals = descriptionPeriodNotEquals_example; // String | 
final bool descriptionPeriodSpecified = true; // bool | 
final BuiltList<String> descriptionPeriodIn = ; // BuiltList<String> | 
final BuiltList<String> descriptionPeriodNotIn = ; // BuiltList<String> | 
final int organisationIdPeriodGreaterThan = 789; // int | 
final int organisationIdPeriodLessThan = 789; // int | 
final int organisationIdPeriodGreaterThanOrEqual = 789; // int | 
final int organisationIdPeriodLessThanOrEqual = 789; // int | 
final int organisationIdPeriodEquals = 789; // int | 
final int organisationIdPeriodNotEquals = 789; // int | 
final bool organisationIdPeriodSpecified = true; // bool | 
final BuiltList<int> organisationIdPeriodIn = ; // BuiltList<int> | 
final BuiltList<int> organisationIdPeriodNotIn = ; // BuiltList<int> | 
final bool distinct = true; // bool | 
final int page = 56; // int | Zero-based page index (0..N)
final int size = 56; // int | The size of the page to be returned
final BuiltList<String> sort = ; // BuiltList<String> | Sorting criteria in the format: property,(asc|desc). Default sort order is ascending. Multiple sort criteria are supported.

try {
    final response = api.getAllAgentTypes(idPeriodGreaterThan, idPeriodLessThan, idPeriodGreaterThanOrEqual, idPeriodLessThanOrEqual, idPeriodEquals, idPeriodNotEquals, idPeriodSpecified, idPeriodIn, idPeriodNotIn, namePeriodContains, namePeriodDoesNotContain, namePeriodEquals, namePeriodNotEquals, namePeriodSpecified, namePeriodIn, namePeriodNotIn, descriptionPeriodContains, descriptionPeriodDoesNotContain, descriptionPeriodEquals, descriptionPeriodNotEquals, descriptionPeriodSpecified, descriptionPeriodIn, descriptionPeriodNotIn, organisationIdPeriodGreaterThan, organisationIdPeriodLessThan, organisationIdPeriodGreaterThanOrEqual, organisationIdPeriodLessThanOrEqual, organisationIdPeriodEquals, organisationIdPeriodNotEquals, organisationIdPeriodSpecified, organisationIdPeriodIn, organisationIdPeriodNotIn, distinct, page, size, sort);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AgentTypeResourceApi->getAllAgentTypes: $e\n');
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
 **descriptionPeriodContains** | **String**|  | [optional] 
 **descriptionPeriodDoesNotContain** | **String**|  | [optional] 
 **descriptionPeriodEquals** | **String**|  | [optional] 
 **descriptionPeriodNotEquals** | **String**|  | [optional] 
 **descriptionPeriodSpecified** | **bool**|  | [optional] 
 **descriptionPeriodIn** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 
 **descriptionPeriodNotIn** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 
 **organisationIdPeriodGreaterThan** | **int**|  | [optional] 
 **organisationIdPeriodLessThan** | **int**|  | [optional] 
 **organisationIdPeriodGreaterThanOrEqual** | **int**|  | [optional] 
 **organisationIdPeriodLessThanOrEqual** | **int**|  | [optional] 
 **organisationIdPeriodEquals** | **int**|  | [optional] 
 **organisationIdPeriodNotEquals** | **int**|  | [optional] 
 **organisationIdPeriodSpecified** | **bool**|  | [optional] 
 **organisationIdPeriodIn** | [**BuiltList&lt;int&gt;**](int.md)|  | [optional] 
 **organisationIdPeriodNotIn** | [**BuiltList&lt;int&gt;**](int.md)|  | [optional] 
 **distinct** | **bool**|  | [optional] 
 **page** | **int**| Zero-based page index (0..N) | [optional] [default to 0]
 **size** | **int**| The size of the page to be returned | [optional] [default to 20]
 **sort** | [**BuiltList&lt;String&gt;**](String.md)| Sorting criteria in the format: property,(asc|desc). Default sort order is ascending. Multiple sort criteria are supported. | [optional] 

### Return type

[**BuiltList&lt;AgentTypeDTO&gt;**](AgentTypeDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **partialUpdateAgentType**
> AgentTypeDTO partialUpdateAgentType(id, agentTypeDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAgentTypeResourceApi();
final int id = 789; // int | 
final AgentTypeDTO agentTypeDTO = ; // AgentTypeDTO | 

try {
    final response = api.partialUpdateAgentType(id, agentTypeDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AgentTypeResourceApi->partialUpdateAgentType: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **agentTypeDTO** | [**AgentTypeDTO**](AgentTypeDTO.md)|  | 

### Return type

[**AgentTypeDTO**](AgentTypeDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/merge-patch+json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateAgentType**
> AgentTypeDTO updateAgentType(id, agentTypeDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAgentTypeResourceApi();
final int id = 789; // int | 
final AgentTypeDTO agentTypeDTO = ; // AgentTypeDTO | 

try {
    final response = api.updateAgentType(id, agentTypeDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AgentTypeResourceApi->updateAgentType: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **agentTypeDTO** | [**AgentTypeDTO**](AgentTypeDTO.md)|  | 

### Return type

[**AgentTypeDTO**](AgentTypeDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

