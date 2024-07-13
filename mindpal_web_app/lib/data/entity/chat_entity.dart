import 'package:drift/drift.dart';

class ChatEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get chatStartDate => dateTime().named("chat_start_date")();
  DateTimeColumn get chatEndDate =>
      dateTime().nullable().named("chat_end_date")();
  TextColumn get chatContent => text().named("chat_content")();
  TextColumn get chatSummary => text().named("chat_summary")();
  BoolColumn get chatProcessing => boolean().named("chat_processing")();
  TextColumn get chatToken => text().named("chat_token")();
}
