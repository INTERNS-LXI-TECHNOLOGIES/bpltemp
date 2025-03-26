import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for OrganisationResourceApi
void main() {
  final instance = Openapi().getOrganisationResourceApi();

  group(OrganisationResourceApi, () {
    //Future<int> countOrganisations({ int idPeriodGreaterThan, int idPeriodLessThan, int idPeriodGreaterThanOrEqual, int idPeriodLessThanOrEqual, int idPeriodEquals, int idPeriodNotEquals, bool idPeriodSpecified, BuiltList<int> idPeriodIn, BuiltList<int> idPeriodNotIn, String namePeriodContains, String namePeriodDoesNotContain, String namePeriodEquals, String namePeriodNotEquals, bool namePeriodSpecified, BuiltList<String> namePeriodIn, BuiltList<String> namePeriodNotIn, int agentTypeIdPeriodGreaterThan, int agentTypeIdPeriodLessThan, int agentTypeIdPeriodGreaterThanOrEqual, int agentTypeIdPeriodLessThanOrEqual, int agentTypeIdPeriodEquals, int agentTypeIdPeriodNotEquals, bool agentTypeIdPeriodSpecified, BuiltList<int> agentTypeIdPeriodIn, BuiltList<int> agentTypeIdPeriodNotIn, bool distinct }) async
    test('test countOrganisations', () async {
      // TODO
    });

    //Future<OrganisationDTO> createOrganisation(OrganisationDTO organisationDTO) async
    test('test createOrganisation', () async {
      // TODO
    });

    //Future deleteOrganisation(int id) async
    test('test deleteOrganisation', () async {
      // TODO
    });

    //Future<BuiltList<OrganisationDTO>> getAllOrganisations({ int idPeriodGreaterThan, int idPeriodLessThan, int idPeriodGreaterThanOrEqual, int idPeriodLessThanOrEqual, int idPeriodEquals, int idPeriodNotEquals, bool idPeriodSpecified, BuiltList<int> idPeriodIn, BuiltList<int> idPeriodNotIn, String namePeriodContains, String namePeriodDoesNotContain, String namePeriodEquals, String namePeriodNotEquals, bool namePeriodSpecified, BuiltList<String> namePeriodIn, BuiltList<String> namePeriodNotIn, int agentTypeIdPeriodGreaterThan, int agentTypeIdPeriodLessThan, int agentTypeIdPeriodGreaterThanOrEqual, int agentTypeIdPeriodLessThanOrEqual, int agentTypeIdPeriodEquals, int agentTypeIdPeriodNotEquals, bool agentTypeIdPeriodSpecified, BuiltList<int> agentTypeIdPeriodIn, BuiltList<int> agentTypeIdPeriodNotIn, bool distinct, int page, int size, BuiltList<String> sort }) async
    test('test getAllOrganisations', () async {
      // TODO
    });

    //Future<OrganisationDTO> getOrganisation(int id) async
    test('test getOrganisation', () async {
      // TODO
    });

    //Future<OrganisationDTO> partialUpdateOrganisation(int id, OrganisationDTO organisationDTO) async
    test('test partialUpdateOrganisation', () async {
      // TODO
    });

    //Future<OrganisationDTO> updateOrganisation(int id, OrganisationDTO organisationDTO) async
    test('test updateOrganisation', () async {
      // TODO
    });

  });
}
