// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ContactDTO extends ContactDTO {
  @override
  final int? id;
  @override
  final String phoneNumber;
  @override
  final String countryCode;
  @override
  final String contactNumber;
  @override
  final String name;

  factory _$ContactDTO([void Function(ContactDTOBuilder)? updates]) =>
      (new ContactDTOBuilder()..update(updates))._build();

  _$ContactDTO._(
      {this.id,
      required this.phoneNumber,
      required this.countryCode,
      required this.contactNumber,
      required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        phoneNumber, r'ContactDTO', 'phoneNumber');
    BuiltValueNullFieldError.checkNotNull(
        countryCode, r'ContactDTO', 'countryCode');
    BuiltValueNullFieldError.checkNotNull(
        contactNumber, r'ContactDTO', 'contactNumber');
    BuiltValueNullFieldError.checkNotNull(name, r'ContactDTO', 'name');
  }

  @override
  ContactDTO rebuild(void Function(ContactDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContactDTOBuilder toBuilder() => new ContactDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContactDTO &&
        id == other.id &&
        phoneNumber == other.phoneNumber &&
        countryCode == other.countryCode &&
        contactNumber == other.contactNumber &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jc(_$hash, countryCode.hashCode);
    _$hash = $jc(_$hash, contactNumber.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ContactDTO')
          ..add('id', id)
          ..add('phoneNumber', phoneNumber)
          ..add('countryCode', countryCode)
          ..add('contactNumber', contactNumber)
          ..add('name', name))
        .toString();
  }
}

class ContactDTOBuilder implements Builder<ContactDTO, ContactDTOBuilder> {
  _$ContactDTO? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  String? _countryCode;
  String? get countryCode => _$this._countryCode;
  set countryCode(String? countryCode) => _$this._countryCode = countryCode;

  String? _contactNumber;
  String? get contactNumber => _$this._contactNumber;
  set contactNumber(String? contactNumber) =>
      _$this._contactNumber = contactNumber;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ContactDTOBuilder() {
    ContactDTO._defaults(this);
  }

  ContactDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _phoneNumber = $v.phoneNumber;
      _countryCode = $v.countryCode;
      _contactNumber = $v.contactNumber;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ContactDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ContactDTO;
  }

  @override
  void update(void Function(ContactDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ContactDTO build() => _build();

  _$ContactDTO _build() {
    final _$result = _$v ??
        new _$ContactDTO._(
          id: id,
          phoneNumber: BuiltValueNullFieldError.checkNotNull(
              phoneNumber, r'ContactDTO', 'phoneNumber'),
          countryCode: BuiltValueNullFieldError.checkNotNull(
              countryCode, r'ContactDTO', 'countryCode'),
          contactNumber: BuiltValueNullFieldError.checkNotNull(
              contactNumber, r'ContactDTO', 'contactNumber'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'ContactDTO', 'name'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
