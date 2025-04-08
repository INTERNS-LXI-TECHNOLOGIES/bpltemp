import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for WayBillResourceApi
void main() {
  final instance = Openapi().getWayBillResourceApi();

  group(WayBillResourceApi, () {
    //Future<int> countWayBills({ int idPeriodGreaterThan, int idPeriodLessThan, int idPeriodGreaterThanOrEqual, int idPeriodLessThanOrEqual, int idPeriodEquals, int idPeriodNotEquals, bool idPeriodSpecified, BuiltList<int> idPeriodIn, BuiltList<int> idPeriodNotIn, int boxLimitPeriodGreaterThan, int boxLimitPeriodLessThan, int boxLimitPeriodGreaterThanOrEqual, int boxLimitPeriodLessThanOrEqual, int boxLimitPeriodEquals, int boxLimitPeriodNotEquals, bool boxLimitPeriodSpecified, BuiltList<int> boxLimitPeriodIn, BuiltList<int> boxLimitPeriodNotIn, String shipmentTypePeriodContains, String shipmentTypePeriodDoesNotContain, String shipmentTypePeriodEquals, String shipmentTypePeriodNotEquals, bool shipmentTypePeriodSpecified, BuiltList<String> shipmentTypePeriodIn, BuiltList<String> shipmentTypePeriodNotIn, String opfacPeriodContains, String opfacPeriodDoesNotContain, String opfacPeriodEquals, String opfacPeriodNotEquals, bool opfacPeriodSpecified, BuiltList<String> opfacPeriodIn, BuiltList<String> opfacPeriodNotIn, String deliveryAgentPeriodContains, String deliveryAgentPeriodDoesNotContain, String deliveryAgentPeriodEquals, String deliveryAgentPeriodNotEquals, bool deliveryAgentPeriodSpecified, BuiltList<String> deliveryAgentPeriodIn, BuiltList<String> deliveryAgentPeriodNotIn, DateTime estimatedReadyDatePeriodGreaterThan, DateTime estimatedReadyDatePeriodLessThan, DateTime estimatedReadyDatePeriodGreaterThanOrEqual, DateTime estimatedReadyDatePeriodLessThanOrEqual, DateTime estimatedReadyDatePeriodEquals, DateTime estimatedReadyDatePeriodNotEquals, bool estimatedReadyDatePeriodSpecified, BuiltList<DateTime> estimatedReadyDatePeriodIn, BuiltList<DateTime> estimatedReadyDatePeriodNotIn, String currencyUomPeriodContains, String currencyUomPeriodDoesNotContain, String currencyUomPeriodEquals, String currencyUomPeriodNotEquals, bool currencyUomPeriodSpecified, BuiltList<String> currencyUomPeriodIn, BuiltList<String> currencyUomPeriodNotIn, DateTime estimatedShipDatePeriodGreaterThan, DateTime estimatedShipDatePeriodLessThan, DateTime estimatedShipDatePeriodGreaterThanOrEqual, DateTime estimatedShipDatePeriodLessThanOrEqual, DateTime estimatedShipDatePeriodEquals, DateTime estimatedShipDatePeriodNotEquals, bool estimatedShipDatePeriodSpecified, BuiltList<DateTime> estimatedShipDatePeriodIn, BuiltList<DateTime> estimatedShipDatePeriodNotIn, String statusPeriodContains, String statusPeriodDoesNotContain, String statusPeriodEquals, String statusPeriodNotEquals, bool statusPeriodSpecified, BuiltList<String> statusPeriodIn, BuiltList<String> statusPeriodNotIn, String referenceNumberPeriodContains, String referenceNumberPeriodDoesNotContain, String referenceNumberPeriodEquals, String referenceNumberPeriodNotEquals, bool referenceNumberPeriodSpecified, BuiltList<String> referenceNumberPeriodIn, BuiltList<String> referenceNumberPeriodNotIn, int currencyTypeIdPeriodGreaterThan, int currencyTypeIdPeriodLessThan, int currencyTypeIdPeriodGreaterThanOrEqual, int currencyTypeIdPeriodLessThanOrEqual, int currencyTypeIdPeriodEquals, int currencyTypeIdPeriodNotEquals, bool currencyTypeIdPeriodSpecified, BuiltList<int> currencyTypeIdPeriodIn, BuiltList<int> currencyTypeIdPeriodNotIn, bool distinct }) async
    test('test countWayBills', () async {
      // TODO
    });

    //Future<WayBillDTO> createWayBill(WayBillDTO wayBillDTO) async
    test('test createWayBill', () async {
      // TODO
    });

    //Future deleteWayBill(int id) async
    test('test deleteWayBill', () async {
      // TODO
    });

    //Future<BuiltList<WayBillDTO>> getAllWayBills({ int idPeriodGreaterThan, int idPeriodLessThan, int idPeriodGreaterThanOrEqual, int idPeriodLessThanOrEqual, int idPeriodEquals, int idPeriodNotEquals, bool idPeriodSpecified, BuiltList<int> idPeriodIn, BuiltList<int> idPeriodNotIn, int boxLimitPeriodGreaterThan, int boxLimitPeriodLessThan, int boxLimitPeriodGreaterThanOrEqual, int boxLimitPeriodLessThanOrEqual, int boxLimitPeriodEquals, int boxLimitPeriodNotEquals, bool boxLimitPeriodSpecified, BuiltList<int> boxLimitPeriodIn, BuiltList<int> boxLimitPeriodNotIn, String shipmentTypePeriodContains, String shipmentTypePeriodDoesNotContain, String shipmentTypePeriodEquals, String shipmentTypePeriodNotEquals, bool shipmentTypePeriodSpecified, BuiltList<String> shipmentTypePeriodIn, BuiltList<String> shipmentTypePeriodNotIn, String opfacPeriodContains, String opfacPeriodDoesNotContain, String opfacPeriodEquals, String opfacPeriodNotEquals, bool opfacPeriodSpecified, BuiltList<String> opfacPeriodIn, BuiltList<String> opfacPeriodNotIn, String deliveryAgentPeriodContains, String deliveryAgentPeriodDoesNotContain, String deliveryAgentPeriodEquals, String deliveryAgentPeriodNotEquals, bool deliveryAgentPeriodSpecified, BuiltList<String> deliveryAgentPeriodIn, BuiltList<String> deliveryAgentPeriodNotIn, DateTime estimatedReadyDatePeriodGreaterThan, DateTime estimatedReadyDatePeriodLessThan, DateTime estimatedReadyDatePeriodGreaterThanOrEqual, DateTime estimatedReadyDatePeriodLessThanOrEqual, DateTime estimatedReadyDatePeriodEquals, DateTime estimatedReadyDatePeriodNotEquals, bool estimatedReadyDatePeriodSpecified, BuiltList<DateTime> estimatedReadyDatePeriodIn, BuiltList<DateTime> estimatedReadyDatePeriodNotIn, String currencyUomPeriodContains, String currencyUomPeriodDoesNotContain, String currencyUomPeriodEquals, String currencyUomPeriodNotEquals, bool currencyUomPeriodSpecified, BuiltList<String> currencyUomPeriodIn, BuiltList<String> currencyUomPeriodNotIn, DateTime estimatedShipDatePeriodGreaterThan, DateTime estimatedShipDatePeriodLessThan, DateTime estimatedShipDatePeriodGreaterThanOrEqual, DateTime estimatedShipDatePeriodLessThanOrEqual, DateTime estimatedShipDatePeriodEquals, DateTime estimatedShipDatePeriodNotEquals, bool estimatedShipDatePeriodSpecified, BuiltList<DateTime> estimatedShipDatePeriodIn, BuiltList<DateTime> estimatedShipDatePeriodNotIn, String statusPeriodContains, String statusPeriodDoesNotContain, String statusPeriodEquals, String statusPeriodNotEquals, bool statusPeriodSpecified, BuiltList<String> statusPeriodIn, BuiltList<String> statusPeriodNotIn, String referenceNumberPeriodContains, String referenceNumberPeriodDoesNotContain, String referenceNumberPeriodEquals, String referenceNumberPeriodNotEquals, bool referenceNumberPeriodSpecified, BuiltList<String> referenceNumberPeriodIn, BuiltList<String> referenceNumberPeriodNotIn, int currencyTypeIdPeriodGreaterThan, int currencyTypeIdPeriodLessThan, int currencyTypeIdPeriodGreaterThanOrEqual, int currencyTypeIdPeriodLessThanOrEqual, int currencyTypeIdPeriodEquals, int currencyTypeIdPeriodNotEquals, bool currencyTypeIdPeriodSpecified, BuiltList<int> currencyTypeIdPeriodIn, BuiltList<int> currencyTypeIdPeriodNotIn, bool distinct, int page, int size, BuiltList<String> sort }) async
    test('test getAllWayBills', () async {
      // TODO
    });

    //Future<WayBillDTO> getWayBill(int id) async
    test('test getWayBill', () async {
      // TODO
    });

    //Future<BuiltList<int>> getWayBillIdsByCurrency(String currency) async
    test('test getWayBillIdsByCurrency', () async {
      // TODO
    });

    //Future<BuiltList<int>> getWayBillIdsByCurrency1(int currencyId) async
    test('test getWayBillIdsByCurrency1', () async {
      // TODO
    });

    //Future<WayBillDTO> partialUpdateWayBill(int id, WayBillDTO wayBillDTO) async
    test('test partialUpdateWayBill', () async {
      // TODO
    });

    //Future<WayBillDTO> updateWayBill(int id, WayBillDTO wayBillDTO) async
    test('test updateWayBill', () async {
      // TODO
    });

  });
}
