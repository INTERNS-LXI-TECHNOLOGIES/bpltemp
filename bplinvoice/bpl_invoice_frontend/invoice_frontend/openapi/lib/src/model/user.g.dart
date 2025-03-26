// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$User extends User {
  @override
  final String? createdBy;
  @override
  final DateTime? createdDate;
  @override
  final String? lastModifiedBy;
  @override
  final DateTime? lastModifiedDate;
  @override
  final int? id;
  @override
  final String login;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? email;
  @override
  final bool activated;
  @override
  final String? langKey;
  @override
  final String? imageUrl;
  @override
  final DateTime? resetDate;

  factory _$User([void Function(UserBuilder)? updates]) =>
      (new UserBuilder()..update(updates))._build();

  _$User._(
      {this.createdBy,
      this.createdDate,
      this.lastModifiedBy,
      this.lastModifiedDate,
      this.id,
      required this.login,
      this.firstName,
      this.lastName,
      this.email,
      required this.activated,
      this.langKey,
      this.imageUrl,
      this.resetDate})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(login, r'User', 'login');
    BuiltValueNullFieldError.checkNotNull(activated, r'User', 'activated');
  }

  @override
  User rebuild(void Function(UserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBuilder toBuilder() => new UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        createdBy == other.createdBy &&
        createdDate == other.createdDate &&
        lastModifiedBy == other.lastModifiedBy &&
        lastModifiedDate == other.lastModifiedDate &&
        id == other.id &&
        login == other.login &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        email == other.email &&
        activated == other.activated &&
        langKey == other.langKey &&
        imageUrl == other.imageUrl &&
        resetDate == other.resetDate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, createdBy.hashCode);
    _$hash = $jc(_$hash, createdDate.hashCode);
    _$hash = $jc(_$hash, lastModifiedBy.hashCode);
    _$hash = $jc(_$hash, lastModifiedDate.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, login.hashCode);
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, activated.hashCode);
    _$hash = $jc(_$hash, langKey.hashCode);
    _$hash = $jc(_$hash, imageUrl.hashCode);
    _$hash = $jc(_$hash, resetDate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'User')
          ..add('createdBy', createdBy)
          ..add('createdDate', createdDate)
          ..add('lastModifiedBy', lastModifiedBy)
          ..add('lastModifiedDate', lastModifiedDate)
          ..add('id', id)
          ..add('login', login)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('email', email)
          ..add('activated', activated)
          ..add('langKey', langKey)
          ..add('imageUrl', imageUrl)
          ..add('resetDate', resetDate))
        .toString();
  }
}

class UserBuilder implements Builder<User, UserBuilder> {
  _$User? _$v;

  String? _createdBy;
  String? get createdBy => _$this._createdBy;
  set createdBy(String? createdBy) => _$this._createdBy = createdBy;

  DateTime? _createdDate;
  DateTime? get createdDate => _$this._createdDate;
  set createdDate(DateTime? createdDate) => _$this._createdDate = createdDate;

  String? _lastModifiedBy;
  String? get lastModifiedBy => _$this._lastModifiedBy;
  set lastModifiedBy(String? lastModifiedBy) =>
      _$this._lastModifiedBy = lastModifiedBy;

  DateTime? _lastModifiedDate;
  DateTime? get lastModifiedDate => _$this._lastModifiedDate;
  set lastModifiedDate(DateTime? lastModifiedDate) =>
      _$this._lastModifiedDate = lastModifiedDate;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _login;
  String? get login => _$this._login;
  set login(String? login) => _$this._login = login;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  bool? _activated;
  bool? get activated => _$this._activated;
  set activated(bool? activated) => _$this._activated = activated;

  String? _langKey;
  String? get langKey => _$this._langKey;
  set langKey(String? langKey) => _$this._langKey = langKey;

  String? _imageUrl;
  String? get imageUrl => _$this._imageUrl;
  set imageUrl(String? imageUrl) => _$this._imageUrl = imageUrl;

  DateTime? _resetDate;
  DateTime? get resetDate => _$this._resetDate;
  set resetDate(DateTime? resetDate) => _$this._resetDate = resetDate;

  UserBuilder() {
    User._defaults(this);
  }

  UserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdBy = $v.createdBy;
      _createdDate = $v.createdDate;
      _lastModifiedBy = $v.lastModifiedBy;
      _lastModifiedDate = $v.lastModifiedDate;
      _id = $v.id;
      _login = $v.login;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _email = $v.email;
      _activated = $v.activated;
      _langKey = $v.langKey;
      _imageUrl = $v.imageUrl;
      _resetDate = $v.resetDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(User other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$User;
  }

  @override
  void update(void Function(UserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  User build() => _build();

  _$User _build() {
    final _$result = _$v ??
        new _$User._(
          createdBy: createdBy,
          createdDate: createdDate,
          lastModifiedBy: lastModifiedBy,
          lastModifiedDate: lastModifiedDate,
          id: id,
          login: BuiltValueNullFieldError.checkNotNull(login, r'User', 'login'),
          firstName: firstName,
          lastName: lastName,
          email: email,
          activated: BuiltValueNullFieldError.checkNotNull(
              activated, r'User', 'activated'),
          langKey: langKey,
          imageUrl: imageUrl,
          resetDate: resetDate,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
