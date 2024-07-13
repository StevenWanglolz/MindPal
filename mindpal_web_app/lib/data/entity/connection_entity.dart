import 'package:drift/drift.dart';

class ConnectionEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get status => integer().named("connection_status")();
  DateTimeColumn get sendTime => dateTime().named("connection_send_time")();
  DateTimeColumn get responseTime =>
      dateTime().named("connection_response_time")();
  DateTimeColumn get disconnectTime =>
      dateTime().named("connection_disconnect_time")();
  TextColumn get note => text().named("connection_note")();
}
