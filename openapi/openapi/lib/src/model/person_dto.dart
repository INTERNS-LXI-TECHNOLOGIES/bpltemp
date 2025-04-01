//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/contact_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'person_dto.g.dart';

/// PersonDTO
///
/// Properties:
/// * [id] 
/// * [name] 
/// * [location] 
/// * [mailId] 
/// * [contact] 
@BuiltValue()
abstract class PersonDTO implements Built<PersonDTO, PersonDTOBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'location')
  String? get location;

  @BuiltValueField(wireName: r'mailId')
  String get mailId;

  @BuiltValueField(wireName: r'contact')
  ContactDTO? get contact;

  PersonDTO._();

  factory PersonDTO([void updates(PersonDTOBuilder b)]) = _$PersonDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PersonDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PersonDTO> get serializer => _$PersonDTOSerializer();
}

class _$PersonDTOSerializer implements PrimitiveSerializer<PersonDTO> {
  @override
  final Iterable<Type> types = const [PersonDTO, _$PersonDTO];

  @override
  final String wireName = r'PersonDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PersonDTO object, {
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
    if (object.location != null) {
      yield r'location';
      yield serializers.serialize(
        object.location,
        specifiedType: const FullType(String),
      );
    }
    yield r'mailId';
    yield serializers.serialize(
      object.mailId,
      specifiedType: const FullType(String),
    );
    if (object.contact != null) {
      yield r'contact';
      yield serializers.serialize(
        object.contact,
        specifiedType: const FullType(ContactDTO),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PersonDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PersonDTOBuilder result,
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
        case r'location':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.location = valueDes;
          break;
        case r'mailId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.mailId = valueDes;
          break;
        case r'contact':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ContactDTO),
          ) as ContactDTO;
          result.contact.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PersonDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PersonDTOBuilder();
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

