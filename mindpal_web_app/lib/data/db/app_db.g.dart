// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $UserEntityTable extends UserEntity
    with TableInfo<$UserEntityTable, UserEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'user_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'user_email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'user_phone', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emergencyContactMeta =
      const VerificationMeta('emergencyContact');
  @override
  late final GeneratedColumn<String> emergencyContact = GeneratedColumn<String>(
      'user_emergency_contact', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emergencyContactPhoneMeta =
      const VerificationMeta('emergencyContactPhone');
  @override
  late final GeneratedColumn<String> emergencyContactPhone =
      GeneratedColumn<String>(
          'user_emergency_contact_phone', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emergencyContactEmailMeta =
      const VerificationMeta('emergencyContactEmail');
  @override
  late final GeneratedColumn<String> emergencyContactEmail =
      GeneratedColumn<String>(
          'user_emergency_contact_email', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<int> gender = GeneratedColumn<int>(
      'user_gender', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _joinDateMeta =
      const VerificationMeta('joinDate');
  @override
  late final GeneratedColumn<DateTime> joinDate = GeneratedColumn<DateTime>(
      'user_join_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _verifiedMeta =
      const VerificationMeta('verified');
  @override
  late final GeneratedColumn<bool> verified = GeneratedColumn<bool>(
      'user_verified', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("user_verified" IN (0, 1))'));
  static const VerificationMeta _emotionRateMeta =
      const VerificationMeta('emotionRate');
  @override
  late final GeneratedColumn<double> emotionRate = GeneratedColumn<double>(
      'user_emotion_rate', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        email,
        phone,
        emergencyContact,
        emergencyContactPhone,
        emergencyContactEmail,
        gender,
        joinDate,
        verified,
        emotionRate
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_entity';
  @override
  VerificationContext validateIntegrity(Insertable<UserEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['user_name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('user_email')) {
      context.handle(_emailMeta,
          email.isAcceptableOrUnknown(data['user_email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('user_phone')) {
      context.handle(_phoneMeta,
          phone.isAcceptableOrUnknown(data['user_phone']!, _phoneMeta));
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('user_emergency_contact')) {
      context.handle(
          _emergencyContactMeta,
          emergencyContact.isAcceptableOrUnknown(
              data['user_emergency_contact']!, _emergencyContactMeta));
    } else if (isInserting) {
      context.missing(_emergencyContactMeta);
    }
    if (data.containsKey('user_emergency_contact_phone')) {
      context.handle(
          _emergencyContactPhoneMeta,
          emergencyContactPhone.isAcceptableOrUnknown(
              data['user_emergency_contact_phone']!,
              _emergencyContactPhoneMeta));
    } else if (isInserting) {
      context.missing(_emergencyContactPhoneMeta);
    }
    if (data.containsKey('user_emergency_contact_email')) {
      context.handle(
          _emergencyContactEmailMeta,
          emergencyContactEmail.isAcceptableOrUnknown(
              data['user_emergency_contact_email']!,
              _emergencyContactEmailMeta));
    } else if (isInserting) {
      context.missing(_emergencyContactEmailMeta);
    }
    if (data.containsKey('user_gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['user_gender']!, _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('user_join_date')) {
      context.handle(
          _joinDateMeta,
          joinDate.isAcceptableOrUnknown(
              data['user_join_date']!, _joinDateMeta));
    } else if (isInserting) {
      context.missing(_joinDateMeta);
    }
    if (data.containsKey('user_verified')) {
      context.handle(
          _verifiedMeta,
          verified.isAcceptableOrUnknown(
              data['user_verified']!, _verifiedMeta));
    } else if (isInserting) {
      context.missing(_verifiedMeta);
    }
    if (data.containsKey('user_emotion_rate')) {
      context.handle(
          _emotionRateMeta,
          emotionRate.isAcceptableOrUnknown(
              data['user_emotion_rate']!, _emotionRateMeta));
    } else if (isInserting) {
      context.missing(_emotionRateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_email'])!,
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_phone'])!,
      emergencyContact: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}user_emergency_contact'])!,
      emergencyContactPhone: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}user_emergency_contact_phone'])!,
      emergencyContactEmail: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}user_emergency_contact_email'])!,
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_gender'])!,
      joinDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}user_join_date'])!,
      verified: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}user_verified'])!,
      emotionRate: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}user_emotion_rate'])!,
    );
  }

  @override
  $UserEntityTable createAlias(String alias) {
    return $UserEntityTable(attachedDatabase, alias);
  }
}

class UserEntityData extends DataClass implements Insertable<UserEntityData> {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String emergencyContact;
  final String emergencyContactPhone;
  final String emergencyContactEmail;
  final int gender;
  final DateTime joinDate;
  final bool verified;
  final double emotionRate;
  const UserEntityData(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.emergencyContact,
      required this.emergencyContactPhone,
      required this.emergencyContactEmail,
      required this.gender,
      required this.joinDate,
      required this.verified,
      required this.emotionRate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_name'] = Variable<String>(name);
    map['user_email'] = Variable<String>(email);
    map['user_phone'] = Variable<String>(phone);
    map['user_emergency_contact'] = Variable<String>(emergencyContact);
    map['user_emergency_contact_phone'] =
        Variable<String>(emergencyContactPhone);
    map['user_emergency_contact_email'] =
        Variable<String>(emergencyContactEmail);
    map['user_gender'] = Variable<int>(gender);
    map['user_join_date'] = Variable<DateTime>(joinDate);
    map['user_verified'] = Variable<bool>(verified);
    map['user_emotion_rate'] = Variable<double>(emotionRate);
    return map;
  }

  UserEntityCompanion toCompanion(bool nullToAbsent) {
    return UserEntityCompanion(
      id: Value(id),
      name: Value(name),
      email: Value(email),
      phone: Value(phone),
      emergencyContact: Value(emergencyContact),
      emergencyContactPhone: Value(emergencyContactPhone),
      emergencyContactEmail: Value(emergencyContactEmail),
      gender: Value(gender),
      joinDate: Value(joinDate),
      verified: Value(verified),
      emotionRate: Value(emotionRate),
    );
  }

  factory UserEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserEntityData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      phone: serializer.fromJson<String>(json['phone']),
      emergencyContact: serializer.fromJson<String>(json['emergencyContact']),
      emergencyContactPhone:
          serializer.fromJson<String>(json['emergencyContactPhone']),
      emergencyContactEmail:
          serializer.fromJson<String>(json['emergencyContactEmail']),
      gender: serializer.fromJson<int>(json['gender']),
      joinDate: serializer.fromJson<DateTime>(json['joinDate']),
      verified: serializer.fromJson<bool>(json['verified']),
      emotionRate: serializer.fromJson<double>(json['emotionRate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
      'phone': serializer.toJson<String>(phone),
      'emergencyContact': serializer.toJson<String>(emergencyContact),
      'emergencyContactPhone': serializer.toJson<String>(emergencyContactPhone),
      'emergencyContactEmail': serializer.toJson<String>(emergencyContactEmail),
      'gender': serializer.toJson<int>(gender),
      'joinDate': serializer.toJson<DateTime>(joinDate),
      'verified': serializer.toJson<bool>(verified),
      'emotionRate': serializer.toJson<double>(emotionRate),
    };
  }

  UserEntityData copyWith(
          {int? id,
          String? name,
          String? email,
          String? phone,
          String? emergencyContact,
          String? emergencyContactPhone,
          String? emergencyContactEmail,
          int? gender,
          DateTime? joinDate,
          bool? verified,
          double? emotionRate}) =>
      UserEntityData(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        emergencyContact: emergencyContact ?? this.emergencyContact,
        emergencyContactPhone:
            emergencyContactPhone ?? this.emergencyContactPhone,
        emergencyContactEmail:
            emergencyContactEmail ?? this.emergencyContactEmail,
        gender: gender ?? this.gender,
        joinDate: joinDate ?? this.joinDate,
        verified: verified ?? this.verified,
        emotionRate: emotionRate ?? this.emotionRate,
      );
  UserEntityData copyWithCompanion(UserEntityCompanion data) {
    return UserEntityData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
      phone: data.phone.present ? data.phone.value : this.phone,
      emergencyContact: data.emergencyContact.present
          ? data.emergencyContact.value
          : this.emergencyContact,
      emergencyContactPhone: data.emergencyContactPhone.present
          ? data.emergencyContactPhone.value
          : this.emergencyContactPhone,
      emergencyContactEmail: data.emergencyContactEmail.present
          ? data.emergencyContactEmail.value
          : this.emergencyContactEmail,
      gender: data.gender.present ? data.gender.value : this.gender,
      joinDate: data.joinDate.present ? data.joinDate.value : this.joinDate,
      verified: data.verified.present ? data.verified.value : this.verified,
      emotionRate:
          data.emotionRate.present ? data.emotionRate.value : this.emotionRate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserEntityData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('emergencyContact: $emergencyContact, ')
          ..write('emergencyContactPhone: $emergencyContactPhone, ')
          ..write('emergencyContactEmail: $emergencyContactEmail, ')
          ..write('gender: $gender, ')
          ..write('joinDate: $joinDate, ')
          ..write('verified: $verified, ')
          ..write('emotionRate: $emotionRate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      email,
      phone,
      emergencyContact,
      emergencyContactPhone,
      emergencyContactEmail,
      gender,
      joinDate,
      verified,
      emotionRate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserEntityData &&
          other.id == this.id &&
          other.name == this.name &&
          other.email == this.email &&
          other.phone == this.phone &&
          other.emergencyContact == this.emergencyContact &&
          other.emergencyContactPhone == this.emergencyContactPhone &&
          other.emergencyContactEmail == this.emergencyContactEmail &&
          other.gender == this.gender &&
          other.joinDate == this.joinDate &&
          other.verified == this.verified &&
          other.emotionRate == this.emotionRate);
}

class UserEntityCompanion extends UpdateCompanion<UserEntityData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> email;
  final Value<String> phone;
  final Value<String> emergencyContact;
  final Value<String> emergencyContactPhone;
  final Value<String> emergencyContactEmail;
  final Value<int> gender;
  final Value<DateTime> joinDate;
  final Value<bool> verified;
  final Value<double> emotionRate;
  const UserEntityCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.emergencyContact = const Value.absent(),
    this.emergencyContactPhone = const Value.absent(),
    this.emergencyContactEmail = const Value.absent(),
    this.gender = const Value.absent(),
    this.joinDate = const Value.absent(),
    this.verified = const Value.absent(),
    this.emotionRate = const Value.absent(),
  });
  UserEntityCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String email,
    required String phone,
    required String emergencyContact,
    required String emergencyContactPhone,
    required String emergencyContactEmail,
    required int gender,
    required DateTime joinDate,
    required bool verified,
    required double emotionRate,
  })  : name = Value(name),
        email = Value(email),
        phone = Value(phone),
        emergencyContact = Value(emergencyContact),
        emergencyContactPhone = Value(emergencyContactPhone),
        emergencyContactEmail = Value(emergencyContactEmail),
        gender = Value(gender),
        joinDate = Value(joinDate),
        verified = Value(verified),
        emotionRate = Value(emotionRate);
  static Insertable<UserEntityData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? phone,
    Expression<String>? emergencyContact,
    Expression<String>? emergencyContactPhone,
    Expression<String>? emergencyContactEmail,
    Expression<int>? gender,
    Expression<DateTime>? joinDate,
    Expression<bool>? verified,
    Expression<double>? emotionRate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'user_name': name,
      if (email != null) 'user_email': email,
      if (phone != null) 'user_phone': phone,
      if (emergencyContact != null) 'user_emergency_contact': emergencyContact,
      if (emergencyContactPhone != null)
        'user_emergency_contact_phone': emergencyContactPhone,
      if (emergencyContactEmail != null)
        'user_emergency_contact_email': emergencyContactEmail,
      if (gender != null) 'user_gender': gender,
      if (joinDate != null) 'user_join_date': joinDate,
      if (verified != null) 'user_verified': verified,
      if (emotionRate != null) 'user_emotion_rate': emotionRate,
    });
  }

  UserEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? email,
      Value<String>? phone,
      Value<String>? emergencyContact,
      Value<String>? emergencyContactPhone,
      Value<String>? emergencyContactEmail,
      Value<int>? gender,
      Value<DateTime>? joinDate,
      Value<bool>? verified,
      Value<double>? emotionRate}) {
    return UserEntityCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      emergencyContact: emergencyContact ?? this.emergencyContact,
      emergencyContactPhone:
          emergencyContactPhone ?? this.emergencyContactPhone,
      emergencyContactEmail:
          emergencyContactEmail ?? this.emergencyContactEmail,
      gender: gender ?? this.gender,
      joinDate: joinDate ?? this.joinDate,
      verified: verified ?? this.verified,
      emotionRate: emotionRate ?? this.emotionRate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['user_name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['user_email'] = Variable<String>(email.value);
    }
    if (phone.present) {
      map['user_phone'] = Variable<String>(phone.value);
    }
    if (emergencyContact.present) {
      map['user_emergency_contact'] = Variable<String>(emergencyContact.value);
    }
    if (emergencyContactPhone.present) {
      map['user_emergency_contact_phone'] =
          Variable<String>(emergencyContactPhone.value);
    }
    if (emergencyContactEmail.present) {
      map['user_emergency_contact_email'] =
          Variable<String>(emergencyContactEmail.value);
    }
    if (gender.present) {
      map['user_gender'] = Variable<int>(gender.value);
    }
    if (joinDate.present) {
      map['user_join_date'] = Variable<DateTime>(joinDate.value);
    }
    if (verified.present) {
      map['user_verified'] = Variable<bool>(verified.value);
    }
    if (emotionRate.present) {
      map['user_emotion_rate'] = Variable<double>(emotionRate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserEntityCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('emergencyContact: $emergencyContact, ')
          ..write('emergencyContactPhone: $emergencyContactPhone, ')
          ..write('emergencyContactEmail: $emergencyContactEmail, ')
          ..write('gender: $gender, ')
          ..write('joinDate: $joinDate, ')
          ..write('verified: $verified, ')
          ..write('emotionRate: $emotionRate')
          ..write(')'))
        .toString();
  }
}

class $TherapistEntityTable extends TherapistEntity
    with TableInfo<$TherapistEntityTable, TherapistEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TherapistEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'therapist_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'therapist_email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'therapist_phone', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<int> gender = GeneratedColumn<int>(
      'therapist_gender', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _joinDateMeta =
      const VerificationMeta('joinDate');
  @override
  late final GeneratedColumn<DateTime> joinDate = GeneratedColumn<DateTime>(
      'therapist_join_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _connectionAmountMeta =
      const VerificationMeta('connectionAmount');
  @override
  late final GeneratedColumn<int> connectionAmount = GeneratedColumn<int>(
      'therapist_connection_amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _infoMeta = const VerificationMeta('info');
  @override
  late final GeneratedColumn<String> info = GeneratedColumn<String>(
      'therapist_info', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _specialtyMeta =
      const VerificationMeta('specialty');
  @override
  late final GeneratedColumn<String> specialty = GeneratedColumn<String>(
      'therapist_specialty', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _verifiedCertMeta =
      const VerificationMeta('verifiedCert');
  @override
  late final GeneratedColumn<bool> verifiedCert = GeneratedColumn<bool>(
      'therapist_verified_cert', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("therapist_verified_cert" IN (0, 1))'));
  static const VerificationMeta _verifiedEmailMeta =
      const VerificationMeta('verifiedEmail');
  @override
  late final GeneratedColumn<bool> verifiedEmail = GeneratedColumn<bool>(
      'therapist_verified_email', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("therapist_verified_email" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        email,
        phone,
        gender,
        joinDate,
        connectionAmount,
        info,
        specialty,
        verifiedCert,
        verifiedEmail
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'therapist_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<TherapistEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('therapist_name')) {
      context.handle(_nameMeta,
          name.isAcceptableOrUnknown(data['therapist_name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('therapist_email')) {
      context.handle(_emailMeta,
          email.isAcceptableOrUnknown(data['therapist_email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('therapist_phone')) {
      context.handle(_phoneMeta,
          phone.isAcceptableOrUnknown(data['therapist_phone']!, _phoneMeta));
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('therapist_gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['therapist_gender']!, _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('therapist_join_date')) {
      context.handle(
          _joinDateMeta,
          joinDate.isAcceptableOrUnknown(
              data['therapist_join_date']!, _joinDateMeta));
    } else if (isInserting) {
      context.missing(_joinDateMeta);
    }
    if (data.containsKey('therapist_connection_amount')) {
      context.handle(
          _connectionAmountMeta,
          connectionAmount.isAcceptableOrUnknown(
              data['therapist_connection_amount']!, _connectionAmountMeta));
    } else if (isInserting) {
      context.missing(_connectionAmountMeta);
    }
    if (data.containsKey('therapist_info')) {
      context.handle(_infoMeta,
          info.isAcceptableOrUnknown(data['therapist_info']!, _infoMeta));
    } else if (isInserting) {
      context.missing(_infoMeta);
    }
    if (data.containsKey('therapist_specialty')) {
      context.handle(
          _specialtyMeta,
          specialty.isAcceptableOrUnknown(
              data['therapist_specialty']!, _specialtyMeta));
    } else if (isInserting) {
      context.missing(_specialtyMeta);
    }
    if (data.containsKey('therapist_verified_cert')) {
      context.handle(
          _verifiedCertMeta,
          verifiedCert.isAcceptableOrUnknown(
              data['therapist_verified_cert']!, _verifiedCertMeta));
    } else if (isInserting) {
      context.missing(_verifiedCertMeta);
    }
    if (data.containsKey('therapist_verified_email')) {
      context.handle(
          _verifiedEmailMeta,
          verifiedEmail.isAcceptableOrUnknown(
              data['therapist_verified_email']!, _verifiedEmailMeta));
    } else if (isInserting) {
      context.missing(_verifiedEmailMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TherapistEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TherapistEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}therapist_name'])!,
      email: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}therapist_email'])!,
      phone: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}therapist_phone'])!,
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}therapist_gender'])!,
      joinDate: attachedDatabase.typeMapping.read(DriftSqlType.dateTime,
          data['${effectivePrefix}therapist_join_date'])!,
      connectionAmount: attachedDatabase.typeMapping.read(DriftSqlType.int,
          data['${effectivePrefix}therapist_connection_amount'])!,
      info: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}therapist_info'])!,
      specialty: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}therapist_specialty'])!,
      verifiedCert: attachedDatabase.typeMapping.read(DriftSqlType.bool,
          data['${effectivePrefix}therapist_verified_cert'])!,
      verifiedEmail: attachedDatabase.typeMapping.read(DriftSqlType.bool,
          data['${effectivePrefix}therapist_verified_email'])!,
    );
  }

  @override
  $TherapistEntityTable createAlias(String alias) {
    return $TherapistEntityTable(attachedDatabase, alias);
  }
}

class TherapistEntityData extends DataClass
    implements Insertable<TherapistEntityData> {
  final int id;
  final String name;
  final String email;
  final String phone;
  final int gender;
  final DateTime joinDate;
  final int connectionAmount;
  final String info;
  final String specialty;
  final bool verifiedCert;
  final bool verifiedEmail;
  const TherapistEntityData(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.gender,
      required this.joinDate,
      required this.connectionAmount,
      required this.info,
      required this.specialty,
      required this.verifiedCert,
      required this.verifiedEmail});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['therapist_name'] = Variable<String>(name);
    map['therapist_email'] = Variable<String>(email);
    map['therapist_phone'] = Variable<String>(phone);
    map['therapist_gender'] = Variable<int>(gender);
    map['therapist_join_date'] = Variable<DateTime>(joinDate);
    map['therapist_connection_amount'] = Variable<int>(connectionAmount);
    map['therapist_info'] = Variable<String>(info);
    map['therapist_specialty'] = Variable<String>(specialty);
    map['therapist_verified_cert'] = Variable<bool>(verifiedCert);
    map['therapist_verified_email'] = Variable<bool>(verifiedEmail);
    return map;
  }

  TherapistEntityCompanion toCompanion(bool nullToAbsent) {
    return TherapistEntityCompanion(
      id: Value(id),
      name: Value(name),
      email: Value(email),
      phone: Value(phone),
      gender: Value(gender),
      joinDate: Value(joinDate),
      connectionAmount: Value(connectionAmount),
      info: Value(info),
      specialty: Value(specialty),
      verifiedCert: Value(verifiedCert),
      verifiedEmail: Value(verifiedEmail),
    );
  }

  factory TherapistEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TherapistEntityData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      phone: serializer.fromJson<String>(json['phone']),
      gender: serializer.fromJson<int>(json['gender']),
      joinDate: serializer.fromJson<DateTime>(json['joinDate']),
      connectionAmount: serializer.fromJson<int>(json['connectionAmount']),
      info: serializer.fromJson<String>(json['info']),
      specialty: serializer.fromJson<String>(json['specialty']),
      verifiedCert: serializer.fromJson<bool>(json['verifiedCert']),
      verifiedEmail: serializer.fromJson<bool>(json['verifiedEmail']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
      'phone': serializer.toJson<String>(phone),
      'gender': serializer.toJson<int>(gender),
      'joinDate': serializer.toJson<DateTime>(joinDate),
      'connectionAmount': serializer.toJson<int>(connectionAmount),
      'info': serializer.toJson<String>(info),
      'specialty': serializer.toJson<String>(specialty),
      'verifiedCert': serializer.toJson<bool>(verifiedCert),
      'verifiedEmail': serializer.toJson<bool>(verifiedEmail),
    };
  }

  TherapistEntityData copyWith(
          {int? id,
          String? name,
          String? email,
          String? phone,
          int? gender,
          DateTime? joinDate,
          int? connectionAmount,
          String? info,
          String? specialty,
          bool? verifiedCert,
          bool? verifiedEmail}) =>
      TherapistEntityData(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        gender: gender ?? this.gender,
        joinDate: joinDate ?? this.joinDate,
        connectionAmount: connectionAmount ?? this.connectionAmount,
        info: info ?? this.info,
        specialty: specialty ?? this.specialty,
        verifiedCert: verifiedCert ?? this.verifiedCert,
        verifiedEmail: verifiedEmail ?? this.verifiedEmail,
      );
  TherapistEntityData copyWithCompanion(TherapistEntityCompanion data) {
    return TherapistEntityData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
      phone: data.phone.present ? data.phone.value : this.phone,
      gender: data.gender.present ? data.gender.value : this.gender,
      joinDate: data.joinDate.present ? data.joinDate.value : this.joinDate,
      connectionAmount: data.connectionAmount.present
          ? data.connectionAmount.value
          : this.connectionAmount,
      info: data.info.present ? data.info.value : this.info,
      specialty: data.specialty.present ? data.specialty.value : this.specialty,
      verifiedCert: data.verifiedCert.present
          ? data.verifiedCert.value
          : this.verifiedCert,
      verifiedEmail: data.verifiedEmail.present
          ? data.verifiedEmail.value
          : this.verifiedEmail,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TherapistEntityData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('gender: $gender, ')
          ..write('joinDate: $joinDate, ')
          ..write('connectionAmount: $connectionAmount, ')
          ..write('info: $info, ')
          ..write('specialty: $specialty, ')
          ..write('verifiedCert: $verifiedCert, ')
          ..write('verifiedEmail: $verifiedEmail')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, email, phone, gender, joinDate,
      connectionAmount, info, specialty, verifiedCert, verifiedEmail);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TherapistEntityData &&
          other.id == this.id &&
          other.name == this.name &&
          other.email == this.email &&
          other.phone == this.phone &&
          other.gender == this.gender &&
          other.joinDate == this.joinDate &&
          other.connectionAmount == this.connectionAmount &&
          other.info == this.info &&
          other.specialty == this.specialty &&
          other.verifiedCert == this.verifiedCert &&
          other.verifiedEmail == this.verifiedEmail);
}

class TherapistEntityCompanion extends UpdateCompanion<TherapistEntityData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> email;
  final Value<String> phone;
  final Value<int> gender;
  final Value<DateTime> joinDate;
  final Value<int> connectionAmount;
  final Value<String> info;
  final Value<String> specialty;
  final Value<bool> verifiedCert;
  final Value<bool> verifiedEmail;
  const TherapistEntityCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.gender = const Value.absent(),
    this.joinDate = const Value.absent(),
    this.connectionAmount = const Value.absent(),
    this.info = const Value.absent(),
    this.specialty = const Value.absent(),
    this.verifiedCert = const Value.absent(),
    this.verifiedEmail = const Value.absent(),
  });
  TherapistEntityCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String email,
    required String phone,
    required int gender,
    required DateTime joinDate,
    required int connectionAmount,
    required String info,
    required String specialty,
    required bool verifiedCert,
    required bool verifiedEmail,
  })  : name = Value(name),
        email = Value(email),
        phone = Value(phone),
        gender = Value(gender),
        joinDate = Value(joinDate),
        connectionAmount = Value(connectionAmount),
        info = Value(info),
        specialty = Value(specialty),
        verifiedCert = Value(verifiedCert),
        verifiedEmail = Value(verifiedEmail);
  static Insertable<TherapistEntityData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? phone,
    Expression<int>? gender,
    Expression<DateTime>? joinDate,
    Expression<int>? connectionAmount,
    Expression<String>? info,
    Expression<String>? specialty,
    Expression<bool>? verifiedCert,
    Expression<bool>? verifiedEmail,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'therapist_name': name,
      if (email != null) 'therapist_email': email,
      if (phone != null) 'therapist_phone': phone,
      if (gender != null) 'therapist_gender': gender,
      if (joinDate != null) 'therapist_join_date': joinDate,
      if (connectionAmount != null)
        'therapist_connection_amount': connectionAmount,
      if (info != null) 'therapist_info': info,
      if (specialty != null) 'therapist_specialty': specialty,
      if (verifiedCert != null) 'therapist_verified_cert': verifiedCert,
      if (verifiedEmail != null) 'therapist_verified_email': verifiedEmail,
    });
  }

  TherapistEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? email,
      Value<String>? phone,
      Value<int>? gender,
      Value<DateTime>? joinDate,
      Value<int>? connectionAmount,
      Value<String>? info,
      Value<String>? specialty,
      Value<bool>? verifiedCert,
      Value<bool>? verifiedEmail}) {
    return TherapistEntityCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      joinDate: joinDate ?? this.joinDate,
      connectionAmount: connectionAmount ?? this.connectionAmount,
      info: info ?? this.info,
      specialty: specialty ?? this.specialty,
      verifiedCert: verifiedCert ?? this.verifiedCert,
      verifiedEmail: verifiedEmail ?? this.verifiedEmail,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['therapist_name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['therapist_email'] = Variable<String>(email.value);
    }
    if (phone.present) {
      map['therapist_phone'] = Variable<String>(phone.value);
    }
    if (gender.present) {
      map['therapist_gender'] = Variable<int>(gender.value);
    }
    if (joinDate.present) {
      map['therapist_join_date'] = Variable<DateTime>(joinDate.value);
    }
    if (connectionAmount.present) {
      map['therapist_connection_amount'] =
          Variable<int>(connectionAmount.value);
    }
    if (info.present) {
      map['therapist_info'] = Variable<String>(info.value);
    }
    if (specialty.present) {
      map['therapist_specialty'] = Variable<String>(specialty.value);
    }
    if (verifiedCert.present) {
      map['therapist_verified_cert'] = Variable<bool>(verifiedCert.value);
    }
    if (verifiedEmail.present) {
      map['therapist_verified_email'] = Variable<bool>(verifiedEmail.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TherapistEntityCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('gender: $gender, ')
          ..write('joinDate: $joinDate, ')
          ..write('connectionAmount: $connectionAmount, ')
          ..write('info: $info, ')
          ..write('specialty: $specialty, ')
          ..write('verifiedCert: $verifiedCert, ')
          ..write('verifiedEmail: $verifiedEmail')
          ..write(')'))
        .toString();
  }
}

class $ConnectionEntityTable extends ConnectionEntity
    with TableInfo<$ConnectionEntityTable, ConnectionEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConnectionEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
      'connection_status', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _sendTimeMeta =
      const VerificationMeta('sendTime');
  @override
  late final GeneratedColumn<DateTime> sendTime = GeneratedColumn<DateTime>(
      'connection_send_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _responseTimeMeta =
      const VerificationMeta('responseTime');
  @override
  late final GeneratedColumn<DateTime> responseTime = GeneratedColumn<DateTime>(
      'connection_response_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _disconnectTimeMeta =
      const VerificationMeta('disconnectTime');
  @override
  late final GeneratedColumn<DateTime> disconnectTime =
      GeneratedColumn<DateTime>(
          'connection_disconnect_time', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'connection_note', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, status, sendTime, responseTime, disconnectTime, note];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'connection_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<ConnectionEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('connection_status')) {
      context.handle(
          _statusMeta,
          status.isAcceptableOrUnknown(
              data['connection_status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('connection_send_time')) {
      context.handle(
          _sendTimeMeta,
          sendTime.isAcceptableOrUnknown(
              data['connection_send_time']!, _sendTimeMeta));
    } else if (isInserting) {
      context.missing(_sendTimeMeta);
    }
    if (data.containsKey('connection_response_time')) {
      context.handle(
          _responseTimeMeta,
          responseTime.isAcceptableOrUnknown(
              data['connection_response_time']!, _responseTimeMeta));
    } else if (isInserting) {
      context.missing(_responseTimeMeta);
    }
    if (data.containsKey('connection_disconnect_time')) {
      context.handle(
          _disconnectTimeMeta,
          disconnectTime.isAcceptableOrUnknown(
              data['connection_disconnect_time']!, _disconnectTimeMeta));
    } else if (isInserting) {
      context.missing(_disconnectTimeMeta);
    }
    if (data.containsKey('connection_note')) {
      context.handle(_noteMeta,
          note.isAcceptableOrUnknown(data['connection_note']!, _noteMeta));
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ConnectionEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ConnectionEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}connection_status'])!,
      sendTime: attachedDatabase.typeMapping.read(DriftSqlType.dateTime,
          data['${effectivePrefix}connection_send_time'])!,
      responseTime: attachedDatabase.typeMapping.read(DriftSqlType.dateTime,
          data['${effectivePrefix}connection_response_time'])!,
      disconnectTime: attachedDatabase.typeMapping.read(DriftSqlType.dateTime,
          data['${effectivePrefix}connection_disconnect_time'])!,
      note: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}connection_note'])!,
    );
  }

  @override
  $ConnectionEntityTable createAlias(String alias) {
    return $ConnectionEntityTable(attachedDatabase, alias);
  }
}

class ConnectionEntityData extends DataClass
    implements Insertable<ConnectionEntityData> {
  final int id;
  final int status;
  final DateTime sendTime;
  final DateTime responseTime;
  final DateTime disconnectTime;
  final String note;
  const ConnectionEntityData(
      {required this.id,
      required this.status,
      required this.sendTime,
      required this.responseTime,
      required this.disconnectTime,
      required this.note});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['connection_status'] = Variable<int>(status);
    map['connection_send_time'] = Variable<DateTime>(sendTime);
    map['connection_response_time'] = Variable<DateTime>(responseTime);
    map['connection_disconnect_time'] = Variable<DateTime>(disconnectTime);
    map['connection_note'] = Variable<String>(note);
    return map;
  }

  ConnectionEntityCompanion toCompanion(bool nullToAbsent) {
    return ConnectionEntityCompanion(
      id: Value(id),
      status: Value(status),
      sendTime: Value(sendTime),
      responseTime: Value(responseTime),
      disconnectTime: Value(disconnectTime),
      note: Value(note),
    );
  }

  factory ConnectionEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ConnectionEntityData(
      id: serializer.fromJson<int>(json['id']),
      status: serializer.fromJson<int>(json['status']),
      sendTime: serializer.fromJson<DateTime>(json['sendTime']),
      responseTime: serializer.fromJson<DateTime>(json['responseTime']),
      disconnectTime: serializer.fromJson<DateTime>(json['disconnectTime']),
      note: serializer.fromJson<String>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'status': serializer.toJson<int>(status),
      'sendTime': serializer.toJson<DateTime>(sendTime),
      'responseTime': serializer.toJson<DateTime>(responseTime),
      'disconnectTime': serializer.toJson<DateTime>(disconnectTime),
      'note': serializer.toJson<String>(note),
    };
  }

  ConnectionEntityData copyWith(
          {int? id,
          int? status,
          DateTime? sendTime,
          DateTime? responseTime,
          DateTime? disconnectTime,
          String? note}) =>
      ConnectionEntityData(
        id: id ?? this.id,
        status: status ?? this.status,
        sendTime: sendTime ?? this.sendTime,
        responseTime: responseTime ?? this.responseTime,
        disconnectTime: disconnectTime ?? this.disconnectTime,
        note: note ?? this.note,
      );
  ConnectionEntityData copyWithCompanion(ConnectionEntityCompanion data) {
    return ConnectionEntityData(
      id: data.id.present ? data.id.value : this.id,
      status: data.status.present ? data.status.value : this.status,
      sendTime: data.sendTime.present ? data.sendTime.value : this.sendTime,
      responseTime: data.responseTime.present
          ? data.responseTime.value
          : this.responseTime,
      disconnectTime: data.disconnectTime.present
          ? data.disconnectTime.value
          : this.disconnectTime,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ConnectionEntityData(')
          ..write('id: $id, ')
          ..write('status: $status, ')
          ..write('sendTime: $sendTime, ')
          ..write('responseTime: $responseTime, ')
          ..write('disconnectTime: $disconnectTime, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, status, sendTime, responseTime, disconnectTime, note);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ConnectionEntityData &&
          other.id == this.id &&
          other.status == this.status &&
          other.sendTime == this.sendTime &&
          other.responseTime == this.responseTime &&
          other.disconnectTime == this.disconnectTime &&
          other.note == this.note);
}

class ConnectionEntityCompanion extends UpdateCompanion<ConnectionEntityData> {
  final Value<int> id;
  final Value<int> status;
  final Value<DateTime> sendTime;
  final Value<DateTime> responseTime;
  final Value<DateTime> disconnectTime;
  final Value<String> note;
  const ConnectionEntityCompanion({
    this.id = const Value.absent(),
    this.status = const Value.absent(),
    this.sendTime = const Value.absent(),
    this.responseTime = const Value.absent(),
    this.disconnectTime = const Value.absent(),
    this.note = const Value.absent(),
  });
  ConnectionEntityCompanion.insert({
    this.id = const Value.absent(),
    required int status,
    required DateTime sendTime,
    required DateTime responseTime,
    required DateTime disconnectTime,
    required String note,
  })  : status = Value(status),
        sendTime = Value(sendTime),
        responseTime = Value(responseTime),
        disconnectTime = Value(disconnectTime),
        note = Value(note);
  static Insertable<ConnectionEntityData> custom({
    Expression<int>? id,
    Expression<int>? status,
    Expression<DateTime>? sendTime,
    Expression<DateTime>? responseTime,
    Expression<DateTime>? disconnectTime,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (status != null) 'connection_status': status,
      if (sendTime != null) 'connection_send_time': sendTime,
      if (responseTime != null) 'connection_response_time': responseTime,
      if (disconnectTime != null) 'connection_disconnect_time': disconnectTime,
      if (note != null) 'connection_note': note,
    });
  }

  ConnectionEntityCompanion copyWith(
      {Value<int>? id,
      Value<int>? status,
      Value<DateTime>? sendTime,
      Value<DateTime>? responseTime,
      Value<DateTime>? disconnectTime,
      Value<String>? note}) {
    return ConnectionEntityCompanion(
      id: id ?? this.id,
      status: status ?? this.status,
      sendTime: sendTime ?? this.sendTime,
      responseTime: responseTime ?? this.responseTime,
      disconnectTime: disconnectTime ?? this.disconnectTime,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (status.present) {
      map['connection_status'] = Variable<int>(status.value);
    }
    if (sendTime.present) {
      map['connection_send_time'] = Variable<DateTime>(sendTime.value);
    }
    if (responseTime.present) {
      map['connection_response_time'] = Variable<DateTime>(responseTime.value);
    }
    if (disconnectTime.present) {
      map['connection_disconnect_time'] =
          Variable<DateTime>(disconnectTime.value);
    }
    if (note.present) {
      map['connection_note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConnectionEntityCompanion(')
          ..write('id: $id, ')
          ..write('status: $status, ')
          ..write('sendTime: $sendTime, ')
          ..write('responseTime: $responseTime, ')
          ..write('disconnectTime: $disconnectTime, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $ChatEntityTable extends ChatEntity
    with TableInfo<$ChatEntityTable, ChatEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChatEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _chatStartDateMeta =
      const VerificationMeta('chatStartDate');
  @override
  late final GeneratedColumn<DateTime> chatStartDate =
      GeneratedColumn<DateTime>('chat_start_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _chatEndDateMeta =
      const VerificationMeta('chatEndDate');
  @override
  late final GeneratedColumn<DateTime> chatEndDate = GeneratedColumn<DateTime>(
      'chat_end_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _chatContentMeta =
      const VerificationMeta('chatContent');
  @override
  late final GeneratedColumn<String> chatContent = GeneratedColumn<String>(
      'chat_content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _chatSummaryMeta =
      const VerificationMeta('chatSummary');
  @override
  late final GeneratedColumn<String> chatSummary = GeneratedColumn<String>(
      'chat_summary', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _chatProcessingMeta =
      const VerificationMeta('chatProcessing');
  @override
  late final GeneratedColumn<bool> chatProcessing = GeneratedColumn<bool>(
      'chat_processing', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("chat_processing" IN (0, 1))'));
  static const VerificationMeta _chatTokenMeta =
      const VerificationMeta('chatToken');
  @override
  late final GeneratedColumn<String> chatToken = GeneratedColumn<String>(
      'chat_token', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        chatStartDate,
        chatEndDate,
        chatContent,
        chatSummary,
        chatProcessing,
        chatToken
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chat_entity';
  @override
  VerificationContext validateIntegrity(Insertable<ChatEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('chat_start_date')) {
      context.handle(
          _chatStartDateMeta,
          chatStartDate.isAcceptableOrUnknown(
              data['chat_start_date']!, _chatStartDateMeta));
    } else if (isInserting) {
      context.missing(_chatStartDateMeta);
    }
    if (data.containsKey('chat_end_date')) {
      context.handle(
          _chatEndDateMeta,
          chatEndDate.isAcceptableOrUnknown(
              data['chat_end_date']!, _chatEndDateMeta));
    }
    if (data.containsKey('chat_content')) {
      context.handle(
          _chatContentMeta,
          chatContent.isAcceptableOrUnknown(
              data['chat_content']!, _chatContentMeta));
    } else if (isInserting) {
      context.missing(_chatContentMeta);
    }
    if (data.containsKey('chat_summary')) {
      context.handle(
          _chatSummaryMeta,
          chatSummary.isAcceptableOrUnknown(
              data['chat_summary']!, _chatSummaryMeta));
    } else if (isInserting) {
      context.missing(_chatSummaryMeta);
    }
    if (data.containsKey('chat_processing')) {
      context.handle(
          _chatProcessingMeta,
          chatProcessing.isAcceptableOrUnknown(
              data['chat_processing']!, _chatProcessingMeta));
    } else if (isInserting) {
      context.missing(_chatProcessingMeta);
    }
    if (data.containsKey('chat_token')) {
      context.handle(_chatTokenMeta,
          chatToken.isAcceptableOrUnknown(data['chat_token']!, _chatTokenMeta));
    } else if (isInserting) {
      context.missing(_chatTokenMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChatEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChatEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      chatStartDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}chat_start_date'])!,
      chatEndDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}chat_end_date']),
      chatContent: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}chat_content'])!,
      chatSummary: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}chat_summary'])!,
      chatProcessing: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}chat_processing'])!,
      chatToken: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}chat_token'])!,
    );
  }

  @override
  $ChatEntityTable createAlias(String alias) {
    return $ChatEntityTable(attachedDatabase, alias);
  }
}

class ChatEntityData extends DataClass implements Insertable<ChatEntityData> {
  final int id;
  final DateTime chatStartDate;
  final DateTime? chatEndDate;
  final String chatContent;
  final String chatSummary;
  final bool chatProcessing;
  final String chatToken;
  const ChatEntityData(
      {required this.id,
      required this.chatStartDate,
      this.chatEndDate,
      required this.chatContent,
      required this.chatSummary,
      required this.chatProcessing,
      required this.chatToken});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['chat_start_date'] = Variable<DateTime>(chatStartDate);
    if (!nullToAbsent || chatEndDate != null) {
      map['chat_end_date'] = Variable<DateTime>(chatEndDate);
    }
    map['chat_content'] = Variable<String>(chatContent);
    map['chat_summary'] = Variable<String>(chatSummary);
    map['chat_processing'] = Variable<bool>(chatProcessing);
    map['chat_token'] = Variable<String>(chatToken);
    return map;
  }

  ChatEntityCompanion toCompanion(bool nullToAbsent) {
    return ChatEntityCompanion(
      id: Value(id),
      chatStartDate: Value(chatStartDate),
      chatEndDate: chatEndDate == null && nullToAbsent
          ? const Value.absent()
          : Value(chatEndDate),
      chatContent: Value(chatContent),
      chatSummary: Value(chatSummary),
      chatProcessing: Value(chatProcessing),
      chatToken: Value(chatToken),
    );
  }

  factory ChatEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChatEntityData(
      id: serializer.fromJson<int>(json['id']),
      chatStartDate: serializer.fromJson<DateTime>(json['chatStartDate']),
      chatEndDate: serializer.fromJson<DateTime?>(json['chatEndDate']),
      chatContent: serializer.fromJson<String>(json['chatContent']),
      chatSummary: serializer.fromJson<String>(json['chatSummary']),
      chatProcessing: serializer.fromJson<bool>(json['chatProcessing']),
      chatToken: serializer.fromJson<String>(json['chatToken']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'chatStartDate': serializer.toJson<DateTime>(chatStartDate),
      'chatEndDate': serializer.toJson<DateTime?>(chatEndDate),
      'chatContent': serializer.toJson<String>(chatContent),
      'chatSummary': serializer.toJson<String>(chatSummary),
      'chatProcessing': serializer.toJson<bool>(chatProcessing),
      'chatToken': serializer.toJson<String>(chatToken),
    };
  }

  ChatEntityData copyWith(
          {int? id,
          DateTime? chatStartDate,
          Value<DateTime?> chatEndDate = const Value.absent(),
          String? chatContent,
          String? chatSummary,
          bool? chatProcessing,
          String? chatToken}) =>
      ChatEntityData(
        id: id ?? this.id,
        chatStartDate: chatStartDate ?? this.chatStartDate,
        chatEndDate: chatEndDate.present ? chatEndDate.value : this.chatEndDate,
        chatContent: chatContent ?? this.chatContent,
        chatSummary: chatSummary ?? this.chatSummary,
        chatProcessing: chatProcessing ?? this.chatProcessing,
        chatToken: chatToken ?? this.chatToken,
      );
  ChatEntityData copyWithCompanion(ChatEntityCompanion data) {
    return ChatEntityData(
      id: data.id.present ? data.id.value : this.id,
      chatStartDate: data.chatStartDate.present
          ? data.chatStartDate.value
          : this.chatStartDate,
      chatEndDate:
          data.chatEndDate.present ? data.chatEndDate.value : this.chatEndDate,
      chatContent:
          data.chatContent.present ? data.chatContent.value : this.chatContent,
      chatSummary:
          data.chatSummary.present ? data.chatSummary.value : this.chatSummary,
      chatProcessing: data.chatProcessing.present
          ? data.chatProcessing.value
          : this.chatProcessing,
      chatToken: data.chatToken.present ? data.chatToken.value : this.chatToken,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChatEntityData(')
          ..write('id: $id, ')
          ..write('chatStartDate: $chatStartDate, ')
          ..write('chatEndDate: $chatEndDate, ')
          ..write('chatContent: $chatContent, ')
          ..write('chatSummary: $chatSummary, ')
          ..write('chatProcessing: $chatProcessing, ')
          ..write('chatToken: $chatToken')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, chatStartDate, chatEndDate, chatContent,
      chatSummary, chatProcessing, chatToken);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChatEntityData &&
          other.id == this.id &&
          other.chatStartDate == this.chatStartDate &&
          other.chatEndDate == this.chatEndDate &&
          other.chatContent == this.chatContent &&
          other.chatSummary == this.chatSummary &&
          other.chatProcessing == this.chatProcessing &&
          other.chatToken == this.chatToken);
}

class ChatEntityCompanion extends UpdateCompanion<ChatEntityData> {
  final Value<int> id;
  final Value<DateTime> chatStartDate;
  final Value<DateTime?> chatEndDate;
  final Value<String> chatContent;
  final Value<String> chatSummary;
  final Value<bool> chatProcessing;
  final Value<String> chatToken;
  const ChatEntityCompanion({
    this.id = const Value.absent(),
    this.chatStartDate = const Value.absent(),
    this.chatEndDate = const Value.absent(),
    this.chatContent = const Value.absent(),
    this.chatSummary = const Value.absent(),
    this.chatProcessing = const Value.absent(),
    this.chatToken = const Value.absent(),
  });
  ChatEntityCompanion.insert({
    this.id = const Value.absent(),
    required DateTime chatStartDate,
    this.chatEndDate = const Value.absent(),
    required String chatContent,
    required String chatSummary,
    required bool chatProcessing,
    required String chatToken,
  })  : chatStartDate = Value(chatStartDate),
        chatContent = Value(chatContent),
        chatSummary = Value(chatSummary),
        chatProcessing = Value(chatProcessing),
        chatToken = Value(chatToken);
  static Insertable<ChatEntityData> custom({
    Expression<int>? id,
    Expression<DateTime>? chatStartDate,
    Expression<DateTime>? chatEndDate,
    Expression<String>? chatContent,
    Expression<String>? chatSummary,
    Expression<bool>? chatProcessing,
    Expression<String>? chatToken,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (chatStartDate != null) 'chat_start_date': chatStartDate,
      if (chatEndDate != null) 'chat_end_date': chatEndDate,
      if (chatContent != null) 'chat_content': chatContent,
      if (chatSummary != null) 'chat_summary': chatSummary,
      if (chatProcessing != null) 'chat_processing': chatProcessing,
      if (chatToken != null) 'chat_token': chatToken,
    });
  }

  ChatEntityCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? chatStartDate,
      Value<DateTime?>? chatEndDate,
      Value<String>? chatContent,
      Value<String>? chatSummary,
      Value<bool>? chatProcessing,
      Value<String>? chatToken}) {
    return ChatEntityCompanion(
      id: id ?? this.id,
      chatStartDate: chatStartDate ?? this.chatStartDate,
      chatEndDate: chatEndDate ?? this.chatEndDate,
      chatContent: chatContent ?? this.chatContent,
      chatSummary: chatSummary ?? this.chatSummary,
      chatProcessing: chatProcessing ?? this.chatProcessing,
      chatToken: chatToken ?? this.chatToken,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (chatStartDate.present) {
      map['chat_start_date'] = Variable<DateTime>(chatStartDate.value);
    }
    if (chatEndDate.present) {
      map['chat_end_date'] = Variable<DateTime>(chatEndDate.value);
    }
    if (chatContent.present) {
      map['chat_content'] = Variable<String>(chatContent.value);
    }
    if (chatSummary.present) {
      map['chat_summary'] = Variable<String>(chatSummary.value);
    }
    if (chatProcessing.present) {
      map['chat_processing'] = Variable<bool>(chatProcessing.value);
    }
    if (chatToken.present) {
      map['chat_token'] = Variable<String>(chatToken.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChatEntityCompanion(')
          ..write('id: $id, ')
          ..write('chatStartDate: $chatStartDate, ')
          ..write('chatEndDate: $chatEndDate, ')
          ..write('chatContent: $chatContent, ')
          ..write('chatSummary: $chatSummary, ')
          ..write('chatProcessing: $chatProcessing, ')
          ..write('chatToken: $chatToken')
          ..write(')'))
        .toString();
  }
}

class $TestEntityTable extends TestEntity
    with TableInfo<$TestEntityTable, TestEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TestEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<int> score = GeneratedColumn<int>(
      'test_score', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'test_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, score, date];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'test_entity';
  @override
  VerificationContext validateIntegrity(Insertable<TestEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('test_score')) {
      context.handle(_scoreMeta,
          score.isAcceptableOrUnknown(data['test_score']!, _scoreMeta));
    } else if (isInserting) {
      context.missing(_scoreMeta);
    }
    if (data.containsKey('test_date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['test_date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TestEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TestEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      score: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}test_score'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}test_date'])!,
    );
  }

  @override
  $TestEntityTable createAlias(String alias) {
    return $TestEntityTable(attachedDatabase, alias);
  }
}

class TestEntityData extends DataClass implements Insertable<TestEntityData> {
  final int id;
  final int score;
  final DateTime date;
  const TestEntityData(
      {required this.id, required this.score, required this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['test_score'] = Variable<int>(score);
    map['test_date'] = Variable<DateTime>(date);
    return map;
  }

  TestEntityCompanion toCompanion(bool nullToAbsent) {
    return TestEntityCompanion(
      id: Value(id),
      score: Value(score),
      date: Value(date),
    );
  }

  factory TestEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TestEntityData(
      id: serializer.fromJson<int>(json['id']),
      score: serializer.fromJson<int>(json['score']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'score': serializer.toJson<int>(score),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  TestEntityData copyWith({int? id, int? score, DateTime? date}) =>
      TestEntityData(
        id: id ?? this.id,
        score: score ?? this.score,
        date: date ?? this.date,
      );
  TestEntityData copyWithCompanion(TestEntityCompanion data) {
    return TestEntityData(
      id: data.id.present ? data.id.value : this.id,
      score: data.score.present ? data.score.value : this.score,
      date: data.date.present ? data.date.value : this.date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TestEntityData(')
          ..write('id: $id, ')
          ..write('score: $score, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, score, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TestEntityData &&
          other.id == this.id &&
          other.score == this.score &&
          other.date == this.date);
}

class TestEntityCompanion extends UpdateCompanion<TestEntityData> {
  final Value<int> id;
  final Value<int> score;
  final Value<DateTime> date;
  const TestEntityCompanion({
    this.id = const Value.absent(),
    this.score = const Value.absent(),
    this.date = const Value.absent(),
  });
  TestEntityCompanion.insert({
    this.id = const Value.absent(),
    required int score,
    required DateTime date,
  })  : score = Value(score),
        date = Value(date);
  static Insertable<TestEntityData> custom({
    Expression<int>? id,
    Expression<int>? score,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (score != null) 'test_score': score,
      if (date != null) 'test_date': date,
    });
  }

  TestEntityCompanion copyWith(
      {Value<int>? id, Value<int>? score, Value<DateTime>? date}) {
    return TestEntityCompanion(
      id: id ?? this.id,
      score: score ?? this.score,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (score.present) {
      map['test_score'] = Variable<int>(score.value);
    }
    if (date.present) {
      map['test_date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TestEntityCompanion(')
          ..write('id: $id, ')
          ..write('score: $score, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $DiaryEntityTable extends DiaryEntity
    with TableInfo<$DiaryEntityTable, DiaryEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DiaryEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _moodMeta = const VerificationMeta('mood');
  @override
  late final GeneratedColumn<int> mood = GeneratedColumn<int>(
      'diary_mood', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _eventMeta = const VerificationMeta('event');
  @override
  late final GeneratedColumn<String> event = GeneratedColumn<String>(
      'diary_event', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'diary_content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createTimeMeta =
      const VerificationMeta('createTime');
  @override
  late final GeneratedColumn<DateTime> createTime = GeneratedColumn<DateTime>(
      'diary_create_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _lastChangeTimeMeta =
      const VerificationMeta('lastChangeTime');
  @override
  late final GeneratedColumn<DateTime> lastChangeTime =
      GeneratedColumn<DateTime>('diary_last_change_time', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, mood, event, content, createTime, lastChangeTime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'diary_entity';
  @override
  VerificationContext validateIntegrity(Insertable<DiaryEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('diary_mood')) {
      context.handle(_moodMeta,
          mood.isAcceptableOrUnknown(data['diary_mood']!, _moodMeta));
    } else if (isInserting) {
      context.missing(_moodMeta);
    }
    if (data.containsKey('diary_event')) {
      context.handle(_eventMeta,
          event.isAcceptableOrUnknown(data['diary_event']!, _eventMeta));
    } else if (isInserting) {
      context.missing(_eventMeta);
    }
    if (data.containsKey('diary_content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['diary_content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('diary_create_time')) {
      context.handle(
          _createTimeMeta,
          createTime.isAcceptableOrUnknown(
              data['diary_create_time']!, _createTimeMeta));
    } else if (isInserting) {
      context.missing(_createTimeMeta);
    }
    if (data.containsKey('diary_last_change_time')) {
      context.handle(
          _lastChangeTimeMeta,
          lastChangeTime.isAcceptableOrUnknown(
              data['diary_last_change_time']!, _lastChangeTimeMeta));
    } else if (isInserting) {
      context.missing(_lastChangeTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DiaryEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DiaryEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      mood: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}diary_mood'])!,
      event: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}diary_event'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}diary_content'])!,
      createTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}diary_create_time'])!,
      lastChangeTime: attachedDatabase.typeMapping.read(DriftSqlType.dateTime,
          data['${effectivePrefix}diary_last_change_time'])!,
    );
  }

  @override
  $DiaryEntityTable createAlias(String alias) {
    return $DiaryEntityTable(attachedDatabase, alias);
  }
}

class DiaryEntityData extends DataClass implements Insertable<DiaryEntityData> {
  final int id;
  final int mood;
  final String event;
  final String content;
  final DateTime createTime;
  final DateTime lastChangeTime;
  const DiaryEntityData(
      {required this.id,
      required this.mood,
      required this.event,
      required this.content,
      required this.createTime,
      required this.lastChangeTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['diary_mood'] = Variable<int>(mood);
    map['diary_event'] = Variable<String>(event);
    map['diary_content'] = Variable<String>(content);
    map['diary_create_time'] = Variable<DateTime>(createTime);
    map['diary_last_change_time'] = Variable<DateTime>(lastChangeTime);
    return map;
  }

  DiaryEntityCompanion toCompanion(bool nullToAbsent) {
    return DiaryEntityCompanion(
      id: Value(id),
      mood: Value(mood),
      event: Value(event),
      content: Value(content),
      createTime: Value(createTime),
      lastChangeTime: Value(lastChangeTime),
    );
  }

  factory DiaryEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DiaryEntityData(
      id: serializer.fromJson<int>(json['id']),
      mood: serializer.fromJson<int>(json['mood']),
      event: serializer.fromJson<String>(json['event']),
      content: serializer.fromJson<String>(json['content']),
      createTime: serializer.fromJson<DateTime>(json['createTime']),
      lastChangeTime: serializer.fromJson<DateTime>(json['lastChangeTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'mood': serializer.toJson<int>(mood),
      'event': serializer.toJson<String>(event),
      'content': serializer.toJson<String>(content),
      'createTime': serializer.toJson<DateTime>(createTime),
      'lastChangeTime': serializer.toJson<DateTime>(lastChangeTime),
    };
  }

  DiaryEntityData copyWith(
          {int? id,
          int? mood,
          String? event,
          String? content,
          DateTime? createTime,
          DateTime? lastChangeTime}) =>
      DiaryEntityData(
        id: id ?? this.id,
        mood: mood ?? this.mood,
        event: event ?? this.event,
        content: content ?? this.content,
        createTime: createTime ?? this.createTime,
        lastChangeTime: lastChangeTime ?? this.lastChangeTime,
      );
  DiaryEntityData copyWithCompanion(DiaryEntityCompanion data) {
    return DiaryEntityData(
      id: data.id.present ? data.id.value : this.id,
      mood: data.mood.present ? data.mood.value : this.mood,
      event: data.event.present ? data.event.value : this.event,
      content: data.content.present ? data.content.value : this.content,
      createTime:
          data.createTime.present ? data.createTime.value : this.createTime,
      lastChangeTime: data.lastChangeTime.present
          ? data.lastChangeTime.value
          : this.lastChangeTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DiaryEntityData(')
          ..write('id: $id, ')
          ..write('mood: $mood, ')
          ..write('event: $event, ')
          ..write('content: $content, ')
          ..write('createTime: $createTime, ')
          ..write('lastChangeTime: $lastChangeTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, mood, event, content, createTime, lastChangeTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DiaryEntityData &&
          other.id == this.id &&
          other.mood == this.mood &&
          other.event == this.event &&
          other.content == this.content &&
          other.createTime == this.createTime &&
          other.lastChangeTime == this.lastChangeTime);
}

class DiaryEntityCompanion extends UpdateCompanion<DiaryEntityData> {
  final Value<int> id;
  final Value<int> mood;
  final Value<String> event;
  final Value<String> content;
  final Value<DateTime> createTime;
  final Value<DateTime> lastChangeTime;
  const DiaryEntityCompanion({
    this.id = const Value.absent(),
    this.mood = const Value.absent(),
    this.event = const Value.absent(),
    this.content = const Value.absent(),
    this.createTime = const Value.absent(),
    this.lastChangeTime = const Value.absent(),
  });
  DiaryEntityCompanion.insert({
    this.id = const Value.absent(),
    required int mood,
    required String event,
    required String content,
    required DateTime createTime,
    required DateTime lastChangeTime,
  })  : mood = Value(mood),
        event = Value(event),
        content = Value(content),
        createTime = Value(createTime),
        lastChangeTime = Value(lastChangeTime);
  static Insertable<DiaryEntityData> custom({
    Expression<int>? id,
    Expression<int>? mood,
    Expression<String>? event,
    Expression<String>? content,
    Expression<DateTime>? createTime,
    Expression<DateTime>? lastChangeTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mood != null) 'diary_mood': mood,
      if (event != null) 'diary_event': event,
      if (content != null) 'diary_content': content,
      if (createTime != null) 'diary_create_time': createTime,
      if (lastChangeTime != null) 'diary_last_change_time': lastChangeTime,
    });
  }

  DiaryEntityCompanion copyWith(
      {Value<int>? id,
      Value<int>? mood,
      Value<String>? event,
      Value<String>? content,
      Value<DateTime>? createTime,
      Value<DateTime>? lastChangeTime}) {
    return DiaryEntityCompanion(
      id: id ?? this.id,
      mood: mood ?? this.mood,
      event: event ?? this.event,
      content: content ?? this.content,
      createTime: createTime ?? this.createTime,
      lastChangeTime: lastChangeTime ?? this.lastChangeTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (mood.present) {
      map['diary_mood'] = Variable<int>(mood.value);
    }
    if (event.present) {
      map['diary_event'] = Variable<String>(event.value);
    }
    if (content.present) {
      map['diary_content'] = Variable<String>(content.value);
    }
    if (createTime.present) {
      map['diary_create_time'] = Variable<DateTime>(createTime.value);
    }
    if (lastChangeTime.present) {
      map['diary_last_change_time'] = Variable<DateTime>(lastChangeTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DiaryEntityCompanion(')
          ..write('id: $id, ')
          ..write('mood: $mood, ')
          ..write('event: $event, ')
          ..write('content: $content, ')
          ..write('createTime: $createTime, ')
          ..write('lastChangeTime: $lastChangeTime')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  $AppDbManager get managers => $AppDbManager(this);
  late final $UserEntityTable userEntity = $UserEntityTable(this);
  late final $TherapistEntityTable therapistEntity =
      $TherapistEntityTable(this);
  late final $ConnectionEntityTable connectionEntity =
      $ConnectionEntityTable(this);
  late final $ChatEntityTable chatEntity = $ChatEntityTable(this);
  late final $TestEntityTable testEntity = $TestEntityTable(this);
  late final $DiaryEntityTable diaryEntity = $DiaryEntityTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        userEntity,
        therapistEntity,
        connectionEntity,
        chatEntity,
        testEntity,
        diaryEntity
      ];
}

typedef $$UserEntityTableCreateCompanionBuilder = UserEntityCompanion Function({
  Value<int> id,
  required String name,
  required String email,
  required String phone,
  required String emergencyContact,
  required String emergencyContactPhone,
  required String emergencyContactEmail,
  required int gender,
  required DateTime joinDate,
  required bool verified,
  required double emotionRate,
});
typedef $$UserEntityTableUpdateCompanionBuilder = UserEntityCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> email,
  Value<String> phone,
  Value<String> emergencyContact,
  Value<String> emergencyContactPhone,
  Value<String> emergencyContactEmail,
  Value<int> gender,
  Value<DateTime> joinDate,
  Value<bool> verified,
  Value<double> emotionRate,
});

class $$UserEntityTableTableManager extends RootTableManager<
    _$AppDb,
    $UserEntityTable,
    UserEntityData,
    $$UserEntityTableFilterComposer,
    $$UserEntityTableOrderingComposer,
    $$UserEntityTableCreateCompanionBuilder,
    $$UserEntityTableUpdateCompanionBuilder> {
  $$UserEntityTableTableManager(_$AppDb db, $UserEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$UserEntityTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$UserEntityTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> phone = const Value.absent(),
            Value<String> emergencyContact = const Value.absent(),
            Value<String> emergencyContactPhone = const Value.absent(),
            Value<String> emergencyContactEmail = const Value.absent(),
            Value<int> gender = const Value.absent(),
            Value<DateTime> joinDate = const Value.absent(),
            Value<bool> verified = const Value.absent(),
            Value<double> emotionRate = const Value.absent(),
          }) =>
              UserEntityCompanion(
            id: id,
            name: name,
            email: email,
            phone: phone,
            emergencyContact: emergencyContact,
            emergencyContactPhone: emergencyContactPhone,
            emergencyContactEmail: emergencyContactEmail,
            gender: gender,
            joinDate: joinDate,
            verified: verified,
            emotionRate: emotionRate,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String email,
            required String phone,
            required String emergencyContact,
            required String emergencyContactPhone,
            required String emergencyContactEmail,
            required int gender,
            required DateTime joinDate,
            required bool verified,
            required double emotionRate,
          }) =>
              UserEntityCompanion.insert(
            id: id,
            name: name,
            email: email,
            phone: phone,
            emergencyContact: emergencyContact,
            emergencyContactPhone: emergencyContactPhone,
            emergencyContactEmail: emergencyContactEmail,
            gender: gender,
            joinDate: joinDate,
            verified: verified,
            emotionRate: emotionRate,
          ),
        ));
}

class $$UserEntityTableFilterComposer
    extends FilterComposer<_$AppDb, $UserEntityTable> {
  $$UserEntityTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get email => $state.composableBuilder(
      column: $state.table.email,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get phone => $state.composableBuilder(
      column: $state.table.phone,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get emergencyContact => $state.composableBuilder(
      column: $state.table.emergencyContact,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get emergencyContactPhone => $state.composableBuilder(
      column: $state.table.emergencyContactPhone,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get emergencyContactEmail => $state.composableBuilder(
      column: $state.table.emergencyContactEmail,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get gender => $state.composableBuilder(
      column: $state.table.gender,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get joinDate => $state.composableBuilder(
      column: $state.table.joinDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get verified => $state.composableBuilder(
      column: $state.table.verified,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get emotionRate => $state.composableBuilder(
      column: $state.table.emotionRate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$UserEntityTableOrderingComposer
    extends OrderingComposer<_$AppDb, $UserEntityTable> {
  $$UserEntityTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get email => $state.composableBuilder(
      column: $state.table.email,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get phone => $state.composableBuilder(
      column: $state.table.phone,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get emergencyContact => $state.composableBuilder(
      column: $state.table.emergencyContact,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get emergencyContactPhone => $state.composableBuilder(
      column: $state.table.emergencyContactPhone,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get emergencyContactEmail => $state.composableBuilder(
      column: $state.table.emergencyContactEmail,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get gender => $state.composableBuilder(
      column: $state.table.gender,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get joinDate => $state.composableBuilder(
      column: $state.table.joinDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get verified => $state.composableBuilder(
      column: $state.table.verified,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get emotionRate => $state.composableBuilder(
      column: $state.table.emotionRate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$TherapistEntityTableCreateCompanionBuilder = TherapistEntityCompanion
    Function({
  Value<int> id,
  required String name,
  required String email,
  required String phone,
  required int gender,
  required DateTime joinDate,
  required int connectionAmount,
  required String info,
  required String specialty,
  required bool verifiedCert,
  required bool verifiedEmail,
});
typedef $$TherapistEntityTableUpdateCompanionBuilder = TherapistEntityCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String> email,
  Value<String> phone,
  Value<int> gender,
  Value<DateTime> joinDate,
  Value<int> connectionAmount,
  Value<String> info,
  Value<String> specialty,
  Value<bool> verifiedCert,
  Value<bool> verifiedEmail,
});

class $$TherapistEntityTableTableManager extends RootTableManager<
    _$AppDb,
    $TherapistEntityTable,
    TherapistEntityData,
    $$TherapistEntityTableFilterComposer,
    $$TherapistEntityTableOrderingComposer,
    $$TherapistEntityTableCreateCompanionBuilder,
    $$TherapistEntityTableUpdateCompanionBuilder> {
  $$TherapistEntityTableTableManager(_$AppDb db, $TherapistEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TherapistEntityTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TherapistEntityTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> phone = const Value.absent(),
            Value<int> gender = const Value.absent(),
            Value<DateTime> joinDate = const Value.absent(),
            Value<int> connectionAmount = const Value.absent(),
            Value<String> info = const Value.absent(),
            Value<String> specialty = const Value.absent(),
            Value<bool> verifiedCert = const Value.absent(),
            Value<bool> verifiedEmail = const Value.absent(),
          }) =>
              TherapistEntityCompanion(
            id: id,
            name: name,
            email: email,
            phone: phone,
            gender: gender,
            joinDate: joinDate,
            connectionAmount: connectionAmount,
            info: info,
            specialty: specialty,
            verifiedCert: verifiedCert,
            verifiedEmail: verifiedEmail,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String email,
            required String phone,
            required int gender,
            required DateTime joinDate,
            required int connectionAmount,
            required String info,
            required String specialty,
            required bool verifiedCert,
            required bool verifiedEmail,
          }) =>
              TherapistEntityCompanion.insert(
            id: id,
            name: name,
            email: email,
            phone: phone,
            gender: gender,
            joinDate: joinDate,
            connectionAmount: connectionAmount,
            info: info,
            specialty: specialty,
            verifiedCert: verifiedCert,
            verifiedEmail: verifiedEmail,
          ),
        ));
}

class $$TherapistEntityTableFilterComposer
    extends FilterComposer<_$AppDb, $TherapistEntityTable> {
  $$TherapistEntityTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get email => $state.composableBuilder(
      column: $state.table.email,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get phone => $state.composableBuilder(
      column: $state.table.phone,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get gender => $state.composableBuilder(
      column: $state.table.gender,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get joinDate => $state.composableBuilder(
      column: $state.table.joinDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get connectionAmount => $state.composableBuilder(
      column: $state.table.connectionAmount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get info => $state.composableBuilder(
      column: $state.table.info,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get specialty => $state.composableBuilder(
      column: $state.table.specialty,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get verifiedCert => $state.composableBuilder(
      column: $state.table.verifiedCert,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get verifiedEmail => $state.composableBuilder(
      column: $state.table.verifiedEmail,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TherapistEntityTableOrderingComposer
    extends OrderingComposer<_$AppDb, $TherapistEntityTable> {
  $$TherapistEntityTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get email => $state.composableBuilder(
      column: $state.table.email,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get phone => $state.composableBuilder(
      column: $state.table.phone,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get gender => $state.composableBuilder(
      column: $state.table.gender,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get joinDate => $state.composableBuilder(
      column: $state.table.joinDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get connectionAmount => $state.composableBuilder(
      column: $state.table.connectionAmount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get info => $state.composableBuilder(
      column: $state.table.info,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get specialty => $state.composableBuilder(
      column: $state.table.specialty,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get verifiedCert => $state.composableBuilder(
      column: $state.table.verifiedCert,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get verifiedEmail => $state.composableBuilder(
      column: $state.table.verifiedEmail,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$ConnectionEntityTableCreateCompanionBuilder
    = ConnectionEntityCompanion Function({
  Value<int> id,
  required int status,
  required DateTime sendTime,
  required DateTime responseTime,
  required DateTime disconnectTime,
  required String note,
});
typedef $$ConnectionEntityTableUpdateCompanionBuilder
    = ConnectionEntityCompanion Function({
  Value<int> id,
  Value<int> status,
  Value<DateTime> sendTime,
  Value<DateTime> responseTime,
  Value<DateTime> disconnectTime,
  Value<String> note,
});

class $$ConnectionEntityTableTableManager extends RootTableManager<
    _$AppDb,
    $ConnectionEntityTable,
    ConnectionEntityData,
    $$ConnectionEntityTableFilterComposer,
    $$ConnectionEntityTableOrderingComposer,
    $$ConnectionEntityTableCreateCompanionBuilder,
    $$ConnectionEntityTableUpdateCompanionBuilder> {
  $$ConnectionEntityTableTableManager(_$AppDb db, $ConnectionEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ConnectionEntityTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ConnectionEntityTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> status = const Value.absent(),
            Value<DateTime> sendTime = const Value.absent(),
            Value<DateTime> responseTime = const Value.absent(),
            Value<DateTime> disconnectTime = const Value.absent(),
            Value<String> note = const Value.absent(),
          }) =>
              ConnectionEntityCompanion(
            id: id,
            status: status,
            sendTime: sendTime,
            responseTime: responseTime,
            disconnectTime: disconnectTime,
            note: note,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int status,
            required DateTime sendTime,
            required DateTime responseTime,
            required DateTime disconnectTime,
            required String note,
          }) =>
              ConnectionEntityCompanion.insert(
            id: id,
            status: status,
            sendTime: sendTime,
            responseTime: responseTime,
            disconnectTime: disconnectTime,
            note: note,
          ),
        ));
}

class $$ConnectionEntityTableFilterComposer
    extends FilterComposer<_$AppDb, $ConnectionEntityTable> {
  $$ConnectionEntityTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get status => $state.composableBuilder(
      column: $state.table.status,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get sendTime => $state.composableBuilder(
      column: $state.table.sendTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get responseTime => $state.composableBuilder(
      column: $state.table.responseTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get disconnectTime => $state.composableBuilder(
      column: $state.table.disconnectTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get note => $state.composableBuilder(
      column: $state.table.note,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ConnectionEntityTableOrderingComposer
    extends OrderingComposer<_$AppDb, $ConnectionEntityTable> {
  $$ConnectionEntityTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get status => $state.composableBuilder(
      column: $state.table.status,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get sendTime => $state.composableBuilder(
      column: $state.table.sendTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get responseTime => $state.composableBuilder(
      column: $state.table.responseTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get disconnectTime => $state.composableBuilder(
      column: $state.table.disconnectTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get note => $state.composableBuilder(
      column: $state.table.note,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$ChatEntityTableCreateCompanionBuilder = ChatEntityCompanion Function({
  Value<int> id,
  required DateTime chatStartDate,
  Value<DateTime?> chatEndDate,
  required String chatContent,
  required String chatSummary,
  required bool chatProcessing,
  required String chatToken,
});
typedef $$ChatEntityTableUpdateCompanionBuilder = ChatEntityCompanion Function({
  Value<int> id,
  Value<DateTime> chatStartDate,
  Value<DateTime?> chatEndDate,
  Value<String> chatContent,
  Value<String> chatSummary,
  Value<bool> chatProcessing,
  Value<String> chatToken,
});

class $$ChatEntityTableTableManager extends RootTableManager<
    _$AppDb,
    $ChatEntityTable,
    ChatEntityData,
    $$ChatEntityTableFilterComposer,
    $$ChatEntityTableOrderingComposer,
    $$ChatEntityTableCreateCompanionBuilder,
    $$ChatEntityTableUpdateCompanionBuilder> {
  $$ChatEntityTableTableManager(_$AppDb db, $ChatEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ChatEntityTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ChatEntityTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> chatStartDate = const Value.absent(),
            Value<DateTime?> chatEndDate = const Value.absent(),
            Value<String> chatContent = const Value.absent(),
            Value<String> chatSummary = const Value.absent(),
            Value<bool> chatProcessing = const Value.absent(),
            Value<String> chatToken = const Value.absent(),
          }) =>
              ChatEntityCompanion(
            id: id,
            chatStartDate: chatStartDate,
            chatEndDate: chatEndDate,
            chatContent: chatContent,
            chatSummary: chatSummary,
            chatProcessing: chatProcessing,
            chatToken: chatToken,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime chatStartDate,
            Value<DateTime?> chatEndDate = const Value.absent(),
            required String chatContent,
            required String chatSummary,
            required bool chatProcessing,
            required String chatToken,
          }) =>
              ChatEntityCompanion.insert(
            id: id,
            chatStartDate: chatStartDate,
            chatEndDate: chatEndDate,
            chatContent: chatContent,
            chatSummary: chatSummary,
            chatProcessing: chatProcessing,
            chatToken: chatToken,
          ),
        ));
}

class $$ChatEntityTableFilterComposer
    extends FilterComposer<_$AppDb, $ChatEntityTable> {
  $$ChatEntityTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get chatStartDate => $state.composableBuilder(
      column: $state.table.chatStartDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get chatEndDate => $state.composableBuilder(
      column: $state.table.chatEndDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get chatContent => $state.composableBuilder(
      column: $state.table.chatContent,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get chatSummary => $state.composableBuilder(
      column: $state.table.chatSummary,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get chatProcessing => $state.composableBuilder(
      column: $state.table.chatProcessing,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get chatToken => $state.composableBuilder(
      column: $state.table.chatToken,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ChatEntityTableOrderingComposer
    extends OrderingComposer<_$AppDb, $ChatEntityTable> {
  $$ChatEntityTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get chatStartDate => $state.composableBuilder(
      column: $state.table.chatStartDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get chatEndDate => $state.composableBuilder(
      column: $state.table.chatEndDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get chatContent => $state.composableBuilder(
      column: $state.table.chatContent,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get chatSummary => $state.composableBuilder(
      column: $state.table.chatSummary,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get chatProcessing => $state.composableBuilder(
      column: $state.table.chatProcessing,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get chatToken => $state.composableBuilder(
      column: $state.table.chatToken,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$TestEntityTableCreateCompanionBuilder = TestEntityCompanion Function({
  Value<int> id,
  required int score,
  required DateTime date,
});
typedef $$TestEntityTableUpdateCompanionBuilder = TestEntityCompanion Function({
  Value<int> id,
  Value<int> score,
  Value<DateTime> date,
});

class $$TestEntityTableTableManager extends RootTableManager<
    _$AppDb,
    $TestEntityTable,
    TestEntityData,
    $$TestEntityTableFilterComposer,
    $$TestEntityTableOrderingComposer,
    $$TestEntityTableCreateCompanionBuilder,
    $$TestEntityTableUpdateCompanionBuilder> {
  $$TestEntityTableTableManager(_$AppDb db, $TestEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TestEntityTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TestEntityTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> score = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
          }) =>
              TestEntityCompanion(
            id: id,
            score: score,
            date: date,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int score,
            required DateTime date,
          }) =>
              TestEntityCompanion.insert(
            id: id,
            score: score,
            date: date,
          ),
        ));
}

class $$TestEntityTableFilterComposer
    extends FilterComposer<_$AppDb, $TestEntityTable> {
  $$TestEntityTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get score => $state.composableBuilder(
      column: $state.table.score,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TestEntityTableOrderingComposer
    extends OrderingComposer<_$AppDb, $TestEntityTable> {
  $$TestEntityTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get score => $state.composableBuilder(
      column: $state.table.score,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$DiaryEntityTableCreateCompanionBuilder = DiaryEntityCompanion
    Function({
  Value<int> id,
  required int mood,
  required String event,
  required String content,
  required DateTime createTime,
  required DateTime lastChangeTime,
});
typedef $$DiaryEntityTableUpdateCompanionBuilder = DiaryEntityCompanion
    Function({
  Value<int> id,
  Value<int> mood,
  Value<String> event,
  Value<String> content,
  Value<DateTime> createTime,
  Value<DateTime> lastChangeTime,
});

class $$DiaryEntityTableTableManager extends RootTableManager<
    _$AppDb,
    $DiaryEntityTable,
    DiaryEntityData,
    $$DiaryEntityTableFilterComposer,
    $$DiaryEntityTableOrderingComposer,
    $$DiaryEntityTableCreateCompanionBuilder,
    $$DiaryEntityTableUpdateCompanionBuilder> {
  $$DiaryEntityTableTableManager(_$AppDb db, $DiaryEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$DiaryEntityTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$DiaryEntityTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> mood = const Value.absent(),
            Value<String> event = const Value.absent(),
            Value<String> content = const Value.absent(),
            Value<DateTime> createTime = const Value.absent(),
            Value<DateTime> lastChangeTime = const Value.absent(),
          }) =>
              DiaryEntityCompanion(
            id: id,
            mood: mood,
            event: event,
            content: content,
            createTime: createTime,
            lastChangeTime: lastChangeTime,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int mood,
            required String event,
            required String content,
            required DateTime createTime,
            required DateTime lastChangeTime,
          }) =>
              DiaryEntityCompanion.insert(
            id: id,
            mood: mood,
            event: event,
            content: content,
            createTime: createTime,
            lastChangeTime: lastChangeTime,
          ),
        ));
}

class $$DiaryEntityTableFilterComposer
    extends FilterComposer<_$AppDb, $DiaryEntityTable> {
  $$DiaryEntityTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get mood => $state.composableBuilder(
      column: $state.table.mood,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get event => $state.composableBuilder(
      column: $state.table.event,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createTime => $state.composableBuilder(
      column: $state.table.createTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get lastChangeTime => $state.composableBuilder(
      column: $state.table.lastChangeTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$DiaryEntityTableOrderingComposer
    extends OrderingComposer<_$AppDb, $DiaryEntityTable> {
  $$DiaryEntityTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get mood => $state.composableBuilder(
      column: $state.table.mood,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get event => $state.composableBuilder(
      column: $state.table.event,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createTime => $state.composableBuilder(
      column: $state.table.createTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get lastChangeTime => $state.composableBuilder(
      column: $state.table.lastChangeTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDbManager {
  final _$AppDb _db;
  $AppDbManager(this._db);
  $$UserEntityTableTableManager get userEntity =>
      $$UserEntityTableTableManager(_db, _db.userEntity);
  $$TherapistEntityTableTableManager get therapistEntity =>
      $$TherapistEntityTableTableManager(_db, _db.therapistEntity);
  $$ConnectionEntityTableTableManager get connectionEntity =>
      $$ConnectionEntityTableTableManager(_db, _db.connectionEntity);
  $$ChatEntityTableTableManager get chatEntity =>
      $$ChatEntityTableTableManager(_db, _db.chatEntity);
  $$TestEntityTableTableManager get testEntity =>
      $$TestEntityTableTableManager(_db, _db.testEntity);
  $$DiaryEntityTableTableManager get diaryEntity =>
      $$DiaryEntityTableTableManager(_db, _db.diaryEntity);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['name'] as String,
      (json['age'] as num).toInt(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
    };
