import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for PersonResourceApi
void main() {
  final instance = Openapi().getPersonResourceApi();

  group(PersonResourceApi, () {
    //Future<PersonDTO> createPerson(PersonDTO personDTO) async
    test('test createPerson', () async {
      // TODO
    });

    //Future deletePerson(int id) async
    test('test deletePerson', () async {
      // TODO
    });

    //Future<BuiltList<PersonDTO>> getAllPeople({ int page, int size, BuiltList<String> sort }) async
    test('test getAllPeople', () async {
      // TODO
    });

    //Future<PersonDTO> getPerson(int id) async
    test('test getPerson', () async {
      // TODO
    });

    //Future<PersonDTO> partialUpdatePerson(int id, PersonDTO personDTO) async
    test('test partialUpdatePerson', () async {
      // TODO
    });

    //Future<PersonDTO> updatePerson(int id, PersonDTO personDTO) async
    test('test updatePerson', () async {
      // TODO
    });

  });
}
