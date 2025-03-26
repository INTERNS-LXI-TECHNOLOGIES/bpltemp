import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for AgentTypeResourceApi
void main() {
  final instance = Openapi().getAgentTypeResourceApi();

  group(AgentTypeResourceApi, () {
    //Future<int> countAgentTypes({ int idPeriodGreaterThan, int idPeriodLessThan, int idPeriodGreaterThanOrEqual, int idPeriodLessThanOrEqual, int idPeriodEquals, int idPeriodNotEquals, bool idPeriodSpecified, BuiltList<int> idPeriodIn, BuiltList<int> idPeriodNotIn, String namePeriodContains, String namePeriodDoesNotContain, String namePeriodEquals, String namePeriodNotEquals, bool namePeriodSpecified, BuiltList<String> namePeriodIn, BuiltList<String> namePeriodNotIn, String descriptionPeriodContains, String descriptionPeriodDoesNotContain, String descriptionPeriodEquals, String descriptionPeriodNotEquals, bool descriptionPeriodSpecified, BuiltList<String> descriptionPeriodIn, BuiltList<String> descriptionPeriodNotIn, int organisationIdPeriodGreaterThan, int organisationIdPeriodLessThan, int organisationIdPeriodGreaterThanOrEqual, int organisationIdPeriodLessThanOrEqual, int organisationIdPeriodEquals, int organisationIdPeriodNotEquals, bool organisationIdPeriodSpecified, BuiltList<int> organisationIdPeriodIn, BuiltList<int> organisationIdPeriodNotIn, bool distinct }) async
    test('test countAgentTypes', () async {
      // TODO
    });

    //Future<AgentTypeDTO> createAgentType(AgentTypeDTO agentTypeDTO) async
    test('test createAgentType', () async {
      // TODO
    });

    //Future deleteAgentType(int id) async
    test('test deleteAgentType', () async {
      // TODO
    });

    //Future<AgentTypeDTO> getAgentType(int id) async
    test('test getAgentType', () async {
      // TODO
    });

    //Future<BuiltList<AgentTypeDTO>> getAllAgentTypes({ int idPeriodGreaterThan, int idPeriodLessThan, int idPeriodGreaterThanOrEqual, int idPeriodLessThanOrEqual, int idPeriodEquals, int idPeriodNotEquals, bool idPeriodSpecified, BuiltList<int> idPeriodIn, BuiltList<int> idPeriodNotIn, String namePeriodContains, String namePeriodDoesNotContain, String namePeriodEquals, String namePeriodNotEquals, bool namePeriodSpecified, BuiltList<String> namePeriodIn, BuiltList<String> namePeriodNotIn, String descriptionPeriodContains, String descriptionPeriodDoesNotContain, String descriptionPeriodEquals, String descriptionPeriodNotEquals, bool descriptionPeriodSpecified, BuiltList<String> descriptionPeriodIn, BuiltList<String> descriptionPeriodNotIn, int organisationIdPeriodGreaterThan, int organisationIdPeriodLessThan, int organisationIdPeriodGreaterThanOrEqual, int organisationIdPeriodLessThanOrEqual, int organisationIdPeriodEquals, int organisationIdPeriodNotEquals, bool organisationIdPeriodSpecified, BuiltList<int> organisationIdPeriodIn, BuiltList<int> organisationIdPeriodNotIn, bool distinct, int page, int size, BuiltList<String> sort }) async
    test('test getAllAgentTypes', () async {
      // TODO
    });

    //Future<AgentTypeDTO> partialUpdateAgentType(int id, AgentTypeDTO agentTypeDTO) async
    test('test partialUpdateAgentType', () async {
      // TODO
    });

    //Future<AgentTypeDTO> updateAgentType(int id, AgentTypeDTO agentTypeDTO) async
    test('test updateAgentType', () async {
      // TODO
    });

  });
}
