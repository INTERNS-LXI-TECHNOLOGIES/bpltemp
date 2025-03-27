//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'facility_type_dto.g.dart';

/// FacilityTypeDTO
///
/// Properties:
/// * [id] 
/// * [name] 
@BuiltValue()
abstract class FacilityTypeDTO implements Built<FacilityTypeDTO, FacilityTypeDTOBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'name')
  String get name;

  FacilityTypeDTO._();

  factory FacilityTypeDTO([void updates(FacilityTypeDTOBuilder b)]) = _$FacilityTypeDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(FacilityTypeDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<FacilityTypeDTO> get serializer => _$FacilityTypeDTOSerializer();
}

class _$FacilityTypeDTOSerializer implements PrimitiveSerializer<FacilityTypeDTO> {
  @override
  final Iterable<Type> types = const [FacilityTypeDTO, _$FacilityTypeDTO];

  @override
  final String wireName = r'FacilityTypeDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    FacilityTypeDTO object, {
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
  }

  @override
  Object serialize(
    Serializers serializers,
    FacilityTypeDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required FacilityTypeDTOBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  FacilityTypeDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = FacilityTypeDTOBuilder();
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

