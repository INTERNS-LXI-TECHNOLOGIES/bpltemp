//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/organization.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'parent_organization.g.dart';

/// ParentOrganization
///
/// Properties:
/// * [id] 
/// * [name] 
/// * [organization] 
@BuiltValue()
abstract class ParentOrganization implements Built<ParentOrganization, ParentOrganizationBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'organization')
  Organization? get organization;

  ParentOrganization._();

  factory ParentOrganization([void updates(ParentOrganizationBuilder b)]) = _$ParentOrganization;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ParentOrganizationBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ParentOrganization> get serializer => _$ParentOrganizationSerializer();
}

class _$ParentOrganizationSerializer implements PrimitiveSerializer<ParentOrganization> {
  @override
  final Iterable<Type> types = const [ParentOrganization, _$ParentOrganization];

  @override
  final String wireName = r'ParentOrganization';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ParentOrganization object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    if (object.organization != null) {
      yield r'organization';
      yield serializers.serialize(
        object.organization,
        specifiedType: const FullType(Organization),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ParentOrganization object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ParentOrganizationBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'organization':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Organization),
          ) as Organization;
          result.organization.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ParentOrganization deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ParentOrganizationBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

