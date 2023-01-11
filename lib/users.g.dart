// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Users> _$usersSerializer = new _$UsersSerializer();

class _$UsersSerializer implements StructuredSerializer<Users> {
  @override
  final Iterable<Type> types = const [Users, _$Users];
  @override
  final String wireName = 'Users';

  @override
  Iterable<Object?> serialize(Serializers serializers, Users object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'age',
      serializers.serialize(object.age, specifiedType: const FullType(int)),
      'gender',
      serializers.serialize(object.gender,
          specifiedType: const FullType(String)),
      'mail',
      serializers.serialize(object.mail, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Users deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'age':
          result.age = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'mail':
          result.mail = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Users extends Users {
  @override
  final int age;
  @override
  final String gender;
  @override
  final String mail;

  factory _$Users([void Function(UsersBuilder)? updates]) =>
      (new UsersBuilder()..update(updates))._build();

  _$Users._({required this.age, required this.gender, required this.mail})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(age, r'Users', 'age');
    BuiltValueNullFieldError.checkNotNull(gender, r'Users', 'gender');
    BuiltValueNullFieldError.checkNotNull(mail, r'Users', 'mail');
  }

  @override
  Users rebuild(void Function(UsersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersBuilder toBuilder() => new UsersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Users &&
        age == other.age &&
        gender == other.gender &&
        mail == other.mail;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, age.hashCode), gender.hashCode), mail.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Users')
          ..add('age', age)
          ..add('gender', gender)
          ..add('mail', mail))
        .toString();
  }
}

class UsersBuilder implements Builder<Users, UsersBuilder> {
  _$Users? _$v;

  int? _age;
  int? get age => _$this._age;
  set age(int? age) => _$this._age = age;

  String? _gender;
  String? get gender => _$this._gender;
  set gender(String? gender) => _$this._gender = gender;

  String? _mail;
  String? get mail => _$this._mail;
  set mail(String? mail) => _$this._mail = mail;

  UsersBuilder();

  UsersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _age = $v.age;
      _gender = $v.gender;
      _mail = $v.mail;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Users other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Users;
  }

  @override
  void update(void Function(UsersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Users build() => _build();

  _$Users _build() {
    final _$result = _$v ??
        new _$Users._(
            age: BuiltValueNullFieldError.checkNotNull(age, r'Users', 'age'),
            gender: BuiltValueNullFieldError.checkNotNull(
                gender, r'Users', 'gender'),
            mail:
                BuiltValueNullFieldError.checkNotNull(mail, r'Users', 'mail'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
