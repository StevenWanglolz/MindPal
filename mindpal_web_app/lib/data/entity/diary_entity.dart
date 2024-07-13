import 'package:drift/drift.dart';

class DiaryEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get mood => integer().named("diary_mood")();
  TextColumn get event => text().named("diary_event")();
  TextColumn get content => text().named("diary_content")();
  DateTimeColumn get createTime => dateTime().named("diary_create_time")();
  DateTimeColumn get lastChangeTime =>
      dateTime().named("diary_last_change_time")();
}
