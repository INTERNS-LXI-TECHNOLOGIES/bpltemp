//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/facility_type_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'shipment_method_dto.g.dart';

/// ShipmentMethodDTO
///
/// Properties:
/// * [id] 
/// * [name] 
/// * [description] 
/// * [parentType] 
@BuiltValue()
abstract class ShipmentMethodDTO implements Built<ShipmentMethodDTO, ShipmentMethodDTOBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'parentType')
  FacilityTypeDTO? get parentType;

  ShipmentMethodDTO._();

  factory ShipmentMethodDTO([void updates(ShipmentMethodDTOBuilder b)]) = _$ShipmentMethodDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ShipmentMethodDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ShipmentMethodDTO> get serializer => _$ShipmentMethodDTOSerializer();
}

class _$ShipmentMethodDTOSerializer implements PrimitiveSerializer<ShipmentMethodDTO> {
  @override
  final Iterable<Type> types = const [ShipmentMethodDTO, _$ShipmentMethodDTO];

  @override
  final String wireName = r'ShipmentMethodDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ShipmentMethodDTO object, {
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
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType(String),
      );
    }
    if (object.parentType != null) {
      yield r'parentType';
      yield serializers.serialize(
        object.parentType,
        specifiedType: const FullType(FacilityTypeDTO),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ShipmentMethodDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ShipmentMethodDTOBuilder result,
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
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'parentType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(FacilityTypeDTO),
          ) as FacilityTypeDTO;
          result.parentType.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ShipmentMethodDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShipmentMethodDTOBuilder();
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

