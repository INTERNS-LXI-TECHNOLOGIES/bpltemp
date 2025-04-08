//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/company_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'employee_dto.g.dart';

/// EmployeeDTO
///
/// Properties:
/// * [id] 
/// * [name] 
/// * [position] 
/// * [email] 
/// * [company] 
@BuiltValue()
abstract class EmployeeDTO implements Built<EmployeeDTO, EmployeeDTOBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'position')
  String get position;

  @BuiltValueField(wireName: r'email')
  String get email;

  @BuiltValueField(wireName: r'company')
  CompanyDTO? get company;

  EmployeeDTO._();

  factory EmployeeDTO([void updates(EmployeeDTOBuilder b)]) = _$EmployeeDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EmployeeDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EmployeeDTO> get serializer => _$EmployeeDTOSerializer();
}

class _$EmployeeDTOSerializer implements PrimitiveSerializer<EmployeeDTO> {
  @override
  final Iterable<Type> types = const [EmployeeDTO, _$EmployeeDTO];

  @override
  final String wireName = r'EmployeeDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EmployeeDTO object, {
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
    yield r'position';
    yield serializers.serialize(
      object.position,
      specifiedType: const FullType(String),
    );
    yield r'email';
    yield serializers.serialize(
      object.email,
      specifiedType: const FullType(String),
    );
    if (object.company != null) {
      yield r'company';
      yield serializers.serialize(
        object.company,
        specifiedType: const FullType(CompanyDTO),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    EmployeeDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required EmployeeDTOBuilder result,
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
        case r'position':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.position = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        case r'company':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CompanyDTO),
          ) as CompanyDTO;
          result.company.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  EmployeeDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EmployeeDTOBuilder();
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

