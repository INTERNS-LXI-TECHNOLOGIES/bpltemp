//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/currency_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'way_bill.g.dart';

/// WayBill
///
/// Properties:
/// * [id] 
/// * [boxLimit] 
/// * [shipmentType] 
/// * [opfac] 
/// * [deliveryAgent] 
/// * [estimatedReadyDate] 
/// * [currencyUom] 
/// * [estimatedShipDate] 
/// * [status] 
/// * [referenceNumber] 
/// * [currencyType] 
@BuiltValue()
abstract class WayBill implements Built<WayBill, WayBillBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'boxLimit')
  int? get boxLimit;

  @BuiltValueField(wireName: r'shipmentType')
  String? get shipmentType;

  @BuiltValueField(wireName: r'opfac')
  String? get opfac;

  @BuiltValueField(wireName: r'deliveryAgent')
  String? get deliveryAgent;

  @BuiltValueField(wireName: r'estimatedReadyDate')
  DateTime? get estimatedReadyDate;

  @BuiltValueField(wireName: r'currencyUom')
  String? get currencyUom;

  @BuiltValueField(wireName: r'estimatedShipDate')
  DateTime? get estimatedShipDate;

  @BuiltValueField(wireName: r'status')
  String? get status;

  @BuiltValueField(wireName: r'referenceNumber')
  String? get referenceNumber;

  @BuiltValueField(wireName: r'currencyType')
  CurrencyType? get currencyType;

  WayBill._();

  factory WayBill([void updates(WayBillBuilder b)]) = _$WayBill;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(WayBillBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<WayBill> get serializer => _$WayBillSerializer();
}

class _$WayBillSerializer implements PrimitiveSerializer<WayBill> {
  @override
  final Iterable<Type> types = const [WayBill, _$WayBill];

  @override
  final String wireName = r'WayBill';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    WayBill object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
    if (object.boxLimit != null) {
      yield r'boxLimit';
      yield serializers.serialize(
        object.boxLimit,
        specifiedType: const FullType(int),
      );
    }
    if (object.shipmentType != null) {
      yield r'shipmentType';
      yield serializers.serialize(
        object.shipmentType,
        specifiedType: const FullType(String),
      );
    }
    if (object.opfac != null) {
      yield r'opfac';
      yield serializers.serialize(
        object.opfac,
        specifiedType: const FullType(String),
      );
    }
    if (object.deliveryAgent != null) {
      yield r'deliveryAgent';
      yield serializers.serialize(
        object.deliveryAgent,
        specifiedType: const FullType(String),
      );
    }
    if (object.estimatedReadyDate != null) {
      yield r'estimatedReadyDate';
      yield serializers.serialize(
        object.estimatedReadyDate,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.currencyUom != null) {
      yield r'currencyUom';
      yield serializers.serialize(
        object.currencyUom,
        specifiedType: const FullType(String),
      );
    }
    if (object.estimatedShipDate != null) {
      yield r'estimatedShipDate';
      yield serializers.serialize(
        object.estimatedShipDate,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(String),
      );
    }
    if (object.referenceNumber != null) {
      yield r'referenceNumber';
      yield serializers.serialize(
        object.referenceNumber,
        specifiedType: const FullType(String),
      );
    }
    if (object.currencyType != null) {
      yield r'currencyType';
      yield serializers.serialize(
        object.currencyType,
        specifiedType: const FullType(CurrencyType),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    WayBill object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required WayBillBuilder result,
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
        case r'boxLimit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.boxLimit = valueDes;
          break;
        case r'shipmentType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.shipmentType = valueDes;
          break;
        case r'opfac':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.opfac = valueDes;
          break;
        case r'deliveryAgent':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.deliveryAgent = valueDes;
          break;
        case r'estimatedReadyDate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.estimatedReadyDate = valueDes;
          break;
        case r'currencyUom':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.currencyUom = valueDes;
          break;
        case r'estimatedShipDate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.estimatedShipDate = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.status = valueDes;
          break;
        case r'referenceNumber':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.referenceNumber = valueDes;
          break;
        case r'currencyType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CurrencyType),
          ) as CurrencyType;
          result.currencyType.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  WayBill deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = WayBillBuilder();
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

