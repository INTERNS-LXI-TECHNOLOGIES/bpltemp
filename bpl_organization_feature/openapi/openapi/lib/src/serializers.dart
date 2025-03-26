//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:openapi/src/date_serializer.dart';
import 'package:openapi/src/model/date.dart';

import 'package:openapi/src/model/admin_user_dto.dart';
import 'package:openapi/src/model/authority.dart';
import 'package:openapi/src/model/jwt_token.dart';
import 'package:openapi/src/model/key_and_password_vm.dart';
import 'package:openapi/src/model/login_vm.dart';
import 'package:openapi/src/model/managed_user_vm.dart';
import 'package:openapi/src/model/organization.dart';
import 'package:openapi/src/model/parent_organization.dart';
import 'package:openapi/src/model/password_change_dto.dart';
import 'package:openapi/src/model/user.dart';
import 'package:openapi/src/model/user_dto.dart';

part 'serializers.g.dart';

@SerializersFor([
  AdminUserDTO,
  Authority,
  JWTToken,
  KeyAndPasswordVM,
  LoginVM,
  ManagedUserVM,
  Organization,
  ParentOrganization,
  PasswordChangeDTO,
  User,
  UserDTO,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(Organization)]),
        () => ListBuilder<Organization>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(ParentOrganization)]),
        () => ListBuilder<ParentOrganization>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(AdminUserDTO)]),
        () => ListBuilder<AdminUserDTO>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(String)]),
        () => ListBuilder<String>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(UserDTO)]),
        () => ListBuilder<UserDTO>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(Authority)]),
        () => ListBuilder<Authority>(),
      )
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
