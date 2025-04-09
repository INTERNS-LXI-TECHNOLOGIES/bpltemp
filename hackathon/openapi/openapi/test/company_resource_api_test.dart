import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for CompanyResourceApi
void main() {
  final instance = Openapi().getCompanyResourceApi();

  group(CompanyResourceApi, () {
    //Future<CompanyDTO> createCompany(CompanyDTO companyDTO) async
    test('test createCompany', () async {
      // TODO
    });

    //Future deleteCompany(int id) async
    test('test deleteCompany', () async {
      // TODO
    });

    //Future<BuiltList<CompanyDTO>> getAllCompanies({ int page, int size, BuiltList<String> sort }) async
    test('test getAllCompanies', () async {
      // TODO
    });

    //Future<CompanyDTO> getCompany(int id) async
    test('test getCompany', () async {
      // TODO
    });

    //Future<CompanyDTO> partialUpdateCompany(int id, CompanyDTO companyDTO) async
    test('test partialUpdateCompany', () async {
      // TODO
    });

    //Future<CompanyDTO> updateCompany(int id, CompanyDTO companyDTO) async
    test('test updateCompany', () async {
      // TODO
    });

  });
}
