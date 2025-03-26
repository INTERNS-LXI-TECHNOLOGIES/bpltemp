//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:dio/dio.dart';
import 'package:built_value/serializer.dart';
import 'package:openapi/src/serializers.dart';
import 'package:openapi/src/auth/api_key_auth.dart';
import 'package:openapi/src/auth/basic_auth.dart';
import 'package:openapi/src/auth/bearer_auth.dart';
import 'package:openapi/src/auth/oauth.dart';
import 'package:openapi/src/api/account_resource_api.dart';
import 'package:openapi/src/api/authenticate_controller_api.dart';
import 'package:openapi/src/api/authority_resource_api.dart';
import 'package:openapi/src/api/currency_type_resource_api.dart';
import 'package:openapi/src/api/public_user_resource_api.dart';
import 'package:openapi/src/api/user_resource_api.dart';
import 'package:openapi/src/api/way_bill_resource_api.dart';

class Openapi {
  static const String basePath = r'http://localhost:8080';
  static String? jwt = "";


  final Dio dio;
  final Serializers serializers;

  Openapi({
    Dio? dio,
    Serializers? serializers,
    String? basePathOverride,
    List<Interceptor>? interceptors,
  })  : this.serializers = serializers ?? standardSerializers,
        this.dio = dio ??
            Dio(BaseOptions(
              baseUrl: basePathOverride ?? basePath,
              connectTimeout: const Duration(milliseconds: 5000),
              receiveTimeout: const Duration(milliseconds: 3000),
            )) {
    if (interceptors == null) {
      this.dio.interceptors.addAll([
        OAuthInterceptor(),
        BasicAuthInterceptor(),
        BearerAuthInterceptor(),
        ApiKeyAuthInterceptor(),
      ]);
    } else {
      this.dio.interceptors.addAll(interceptors);
    }

        // Ensure the Bearer token is set correctly
    if (jwt != null && jwt!.isNotEmpty) {
      setBearerAuth('default', jwt!);
    }
  }

  void setOAuthToken(String name, String token) {
    if (this.dio.interceptors.any((i) => i is OAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is OAuthInterceptor) as OAuthInterceptor).tokens[name] = token;
    }
  }

  void setBearerAuth(String name, String token) {
    if (this.dio.interceptors.any((i) => i is BearerAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BearerAuthInterceptor) as BearerAuthInterceptor).tokens[name] = token;
    }
  }

  void setBasicAuth(String name, String username, String password) {
    if (this.dio.interceptors.any((i) => i is BasicAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BasicAuthInterceptor) as BasicAuthInterceptor).authInfo[name] = BasicAuthInfo(username, password);
    }
  }

  void setApiKey(String name, String apiKey) {
    if (this.dio.interceptors.any((i) => i is ApiKeyAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((element) => element is ApiKeyAuthInterceptor) as ApiKeyAuthInterceptor).apiKeys[name] = apiKey;
    }
  }

  /// Get AccountResourceApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AccountResourceApi getAccountResourceApi() {
    return AccountResourceApi(dio, serializers);
  }

  /// Get AuthenticateControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AuthenticateControllerApi getAuthenticateControllerApi() {
    return AuthenticateControllerApi(dio, serializers);
  }

  /// Get AuthorityResourceApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AuthorityResourceApi getAuthorityResourceApi() {
    return AuthorityResourceApi(dio, serializers);
  }

  /// Get CurrencyTypeResourceApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  CurrencyTypeResourceApi getCurrencyTypeResourceApi() {
    return CurrencyTypeResourceApi(dio, serializers);
  }

  /// Get PublicUserResourceApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  PublicUserResourceApi getPublicUserResourceApi() {
    return PublicUserResourceApi(dio, serializers);
  }

  /// Get UserResourceApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  UserResourceApi getUserResourceApi() {
    return UserResourceApi(dio, serializers);
  }

  /// Get WayBillResourceApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  WayBillResourceApi getWayBillResourceApi() {
    return WayBillResourceApi(dio, serializers);
  }
}
