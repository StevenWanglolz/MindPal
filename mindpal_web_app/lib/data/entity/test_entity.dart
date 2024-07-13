import 'package:drift/drift.dart';

class TestEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get score => integer().named("test_score")();
  DateTimeColumn get date => dateTime().named("test_date")();
}
