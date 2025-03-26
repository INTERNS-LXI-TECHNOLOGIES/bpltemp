//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/agent_type_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'organisation_dto.g.dart';

/// OrganisationDTO
///
/// Properties:
/// * [id] 
/// * [name] 
/// * [agentType] 
@BuiltValue()
abstract class OrganisationDTO implements Built<OrganisationDTO, OrganisationDTOBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'agentType')
  AgentTypeDTO? get agentType;

  OrganisationDTO._();

  factory OrganisationDTO([void updates(OrganisationDTOBuilder b)]) = _$OrganisationDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(OrganisationDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<OrganisationDTO> get serializer => _$OrganisationDTOSerializer();
}

class _$OrganisationDTOSerializer implements PrimitiveSerializer<OrganisationDTO> {
  @override
  final Iterable<Type> types = const [OrganisationDTO, _$OrganisationDTO];

  @override
  final String wireName = r'OrganisationDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    OrganisationDTO object, {
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
    if (object.agentType != null) {
      yield r'agentType';
      yield serializers.serialize(
        object.agentType,
        specifiedType: const FullType(AgentTypeDTO),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    OrganisationDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required OrganisationDTOBuilder result,
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
        case r'agentType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AgentTypeDTO),
          ) as AgentTypeDTO;
          result.agentType.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  OrganisationDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = OrganisationDTOBuilder();
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

