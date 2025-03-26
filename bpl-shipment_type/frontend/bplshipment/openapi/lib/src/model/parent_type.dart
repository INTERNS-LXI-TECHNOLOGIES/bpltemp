//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'parent_type.g.dart';

/// ParentType
///
/// Properties:
/// * [id] 
/// * [typeLabel] 
@BuiltValue()
abstract class ParentType implements Built<ParentType, ParentTypeBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'typeLabel')
  String get typeLabel;

  ParentType._();

  factory ParentType([void updates(ParentTypeBuilder b)]) = _$ParentType;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ParentTypeBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ParentType> get serializer => _$ParentTypeSerializer();
}

class _$ParentTypeSerializer implements PrimitiveSerializer<ParentType> {
  @override
  final Iterable<Type> types = const [ParentType, _$ParentType];

  @override
  final String wireName = r'ParentType';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ParentType object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
    yield r'typeLabel';
    yield serializers.serialize(
      object.typeLabel,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ParentType object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ParentTypeBuilder result,
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
        case r'typeLabel':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.typeLabel = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ParentType deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ParentTypeBuilder();
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

