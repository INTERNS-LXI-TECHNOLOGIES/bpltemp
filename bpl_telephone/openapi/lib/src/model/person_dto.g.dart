// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PersonDTO extends PersonDTO {
  @override
  final int? id;
  @override
  final String name;
  @override
  final String? location;
  @override
  final String mailId;
  @override
  final ContactDTO? contact;

  factory _$PersonDTO([void Function(PersonDTOBuilder)? updates]) =>
      (new PersonDTOBuilder()..update(updates))._build();

  _$PersonDTO._(
      {this.id,
      required this.name,
      this.location,
      required this.mailId,
      this.contact})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'PersonDTO', 'name');
    BuiltValueNullFieldError.checkNotNull(mailId, r'PersonDTO', 'mailId');
  }

  @override
  PersonDTO rebuild(void Function(PersonDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PersonDTOBuilder toBuilder() => new PersonDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PersonDTO &&
        id == other.id &&
        name == other.name &&
        location == other.location &&
        mailId == other.mailId &&
        contact == other.contact;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, mailId.hashCode);
    _$hash = $jc(_$hash, contact.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PersonDTO')
          ..add('id', id)
          ..add('name', name)
          ..add('location', location)
          ..add('mailId', mailId)
          ..add('contact', contact))
        .toString();
  }
}

class PersonDTOBuilder implements Builder<PersonDTO, PersonDTOBuilder> {
  _$PersonDTO? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _location;
  String? get location => _$this._location;
  set location(String? location) => _$this._location = location;

  String? _mailId;
  String? get mailId => _$this._mailId;
  set mailId(String? mailId) => _$this._mailId = mailId;

  ContactDTOBuilder? _contact;
  ContactDTOBuilder get contact => _$this._contact ??= new ContactDTOBuilder();
  set contact(ContactDTOBuilder? contact) => _$this._contact = contact;

  PersonDTOBuilder() {
    PersonDTO._defaults(this);
  }

  PersonDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _location = $v.location;
      _mailId = $v.mailId;
      _contact = $v.contact?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PersonDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PersonDTO;
  }

  @override
  void update(void Function(PersonDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PersonDTO build() => _build();

  _$PersonDTO _build() {
    _$PersonDTO _$result;
    try {
      _$result = _$v ??
          new _$PersonDTO._(
            id: id,
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'PersonDTO', 'name'),
            location: location,
            mailId: BuiltValueNullFieldError.checkNotNull(
                mailId, r'PersonDTO', 'mailId'),
            contact: _contact?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'contact';
        _contact?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PersonDTO', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
