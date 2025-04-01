import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for ContactResourceApi
void main() {
  final instance = Openapi().getContactResourceApi();

  group(ContactResourceApi, () {
    //Future<ContactDTO> createContact(ContactDTO contactDTO) async
    test('test createContact', () async {
      // TODO
    });

    //Future deleteContact(int id) async
    test('test deleteContact', () async {
      // TODO
    });

    //Future<BuiltList<ContactDTO>> getAllContacts({ int page, int size, BuiltList<String> sort }) async
    test('test getAllContacts', () async {
      // TODO
    });

    //Future<ContactDTO> getContact(int id) async
    test('test getContact', () async {
      // TODO
    });

    //Future<ContactDTO> partialUpdateContact(int id, ContactDTO contactDTO) async
    test('test partialUpdateContact', () async {
      // TODO
    });

    //Future<ContactDTO> updateContact(int id, ContactDTO contactDTO) async
    test('test updateContact', () async {
      // TODO
    });

  });
}
