import 'package:drift/drift.dart';

class TherapistEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().named("therapist_name")();
  TextColumn get email => text().named("therapist_email")();
  TextColumn get phone => text().named("therapist_phone")();
  IntColumn get gender => integer().named("therapist_gender")();
  DateTimeColumn get joinDate => dateTime().named("therapist_join_date")();
  IntColumn get connectionAmount =>
      integer().named("therapist_connection_amount")();
  TextColumn get info => text().named("therapist_info")();
  TextColumn get specialty => text().named("therapist_specialty")();
  BoolColumn get verifiedCert => boolean().named("therapist_verified_cert")();
  BoolColumn get verifiedEmail => boolean().named("therapist_verified_email")();
}
