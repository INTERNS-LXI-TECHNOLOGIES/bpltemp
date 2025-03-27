import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for ShipmentMethodResourceApi
void main() {
  final instance = Openapi().getShipmentMethodResourceApi();

  group(ShipmentMethodResourceApi, () {
    //Future<ShipmentMethodDTO> createShipmentMethod(ShipmentMethodDTO shipmentMethodDTO) async
    test('test createShipmentMethod', () async {
      // TODO
    });

    //Future deleteShipmentMethod(int id) async
    test('test deleteShipmentMethod', () async {
      // TODO
    });

    //Future<BuiltList<ShipmentMethodDTO>> getAllShipmentMethods({ int page, int size, BuiltList<String> sort, bool eagerload }) async
    test('test getAllShipmentMethods', () async {
      // TODO
    });

    //Future<ShipmentMethodDTO> getShipmentMethod(int id) async
    test('test getShipmentMethod', () async {
      // TODO
    });

    //Future<ShipmentMethodDTO> partialUpdateShipmentMethod(int id, ShipmentMethodDTO shipmentMethodDTO) async
    test('test partialUpdateShipmentMethod', () async {
      // TODO
    });

    //Future<ShipmentMethodDTO> updateShipmentMethod(int id, ShipmentMethodDTO shipmentMethodDTO) async
    test('test updateShipmentMethod', () async {
      // TODO
    });

  });
}
