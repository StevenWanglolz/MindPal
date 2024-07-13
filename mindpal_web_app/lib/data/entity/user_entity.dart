import 'package:drift/drift.dart';

class UserEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().named("user_name")();
  TextColumn get email => text().named("user_email")();
  TextColumn get phone => text().named("user_phone")();
  TextColumn get emergencyContact => text().named("user_emergency_contact")();
  TextColumn get emergencyContactPhone =>
      text().named("user_emergency_contact_phone")();
  TextColumn get emergencyContactEmail =>
      text().named("user_emergency_contact_email")();
  IntColumn get gender => integer().named("user_gender")();
  DateTimeColumn get joinDate => dateTime().named("user_join_date")();
  BoolColumn get verified => boolean().named("user_verified")();
  RealColumn get emotionRate => real().named("user_emotion_rate")();
}
