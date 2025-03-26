import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for ParentTypeResourceApi
void main() {
  final instance = Openapi().getParentTypeResourceApi();

  group(ParentTypeResourceApi, () {
    //Future<ParentType> createParentType(ParentType parentType) async
    test('test createParentType', () async {
      // TODO
    });

    //Future deleteParentType(int id) async
    test('test deleteParentType', () async {
      // TODO
    });

    //Future<BuiltList<ParentType>> getAllParentTypes({ int page, int size, BuiltList<String> sort }) async
    test('test getAllParentTypes', () async {
      // TODO
    });

    //Future<ParentType> getParentType(int id) async
    test('test getParentType', () async {
      // TODO
    });

    //Future<ParentType> partialUpdateParentType(int id, ParentType parentType) async
    test('test partialUpdateParentType', () async {
      // TODO
    });

    //Future<ParentType> updateParentType(int id, ParentType parentType) async
    test('test updateParentType', () async {
      // TODO
    });

  });
}
