import 'package:drift/drift.dart';
import 'package:mindpad_web_app/data/entity/chat_entity.dart';
import 'package:mindpad_web_app/data/entity/connection_entity.dart';
import 'package:mindpad_web_app/data/entity/diary_entity.dart';
import 'package:mindpad_web_app/data/entity/test_entity.dart';
import 'package:mindpad_web_app/data/entity/therapist_entity.dart';
import 'package:mindpad_web_app/data/entity/user_entity.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'dart:io';
import 'package:drift/native.dart';
import 'package:json_annotation/json_annotation.dart';
part 'app_db.g.dart';

@JsonSerializable()
class User {
  final String name;
  final int age;

  User(this.name, this.age);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'mindpal_db3.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [
  UserEntity,
  TherapistEntity,
  ConnectionEntity,
  ChatEntity,
  TestEntity,
  DiaryEntity
])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<UserEntityData>> getAllUsers() async {
    return await select(userEntity).get();
  }

  Future<UserEntityData> getUser(int id) async {
    return await (select(userEntity)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  Future<bool> updateUserEntity(UserEntityCompanion entity) async {
    return await update(userEntity).replace(entity);
  }

  Future<int> insertUserEntity(UserEntityCompanion entity) async {
    return await into(userEntity).insert(entity);
  }

  Future<int> deleteUserEntity(int id) async {
    return await (delete(userEntity)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<int> deleteAllUsers() async {
    return await (delete(userEntity)).go();
  }

  Future<List<TherapistEntityData>> getAllTherapists() async {
    return await select(therapistEntity).get();
  }

  Future<TherapistEntityData> getTherapist(int id) async {
    return await (select(therapistEntity)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  Future<bool> updateTherapistEntity(TherapistEntityCompanion entity) async {
    return await update(therapistEntity).replace(entity);
  }

  Future<int> insertTherapistEntity(TherapistEntityCompanion entity) async {
    return await into(therapistEntity).insert(entity);
  }

  Future<int> deleteTherapistEntity(int id) async {
    return await (delete(therapistEntity)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<int> deleteAllTherapists() async {
    return await (delete(therapistEntity)).go();
  }

  Future<List<ConnectionEntityData>> getAllConnections() async {
    return await select(connectionEntity).get();
  }

  Future<ConnectionEntityData> getConnection(int id) async {
    return await (select(connectionEntity)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  Future<bool> updateConnectionEntity(ConnectionEntityCompanion entity) async {
    return await update(connectionEntity).replace(entity);
  }

  Future<int> insertConnectionEntity(ConnectionEntityCompanion entity) async {
    return await into(connectionEntity).insert(entity);
  }

  Future<int> deleteConnectionEntity(int id) async {
    return await (delete(connectionEntity)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<ChatEntityData>> getAllChats() async {
    return await select(chatEntity).get();
  }

  Future<ChatEntityData> getChat(int id) async {
    return await (select(chatEntity)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  Future<ChatEntityData> getActiveChat() async {
    return await (select(chatEntity)
          ..where((tbl) => tbl.chatProcessing.equals(true)))
        .getSingle();
  }

  // get latest and no active chat
  Future<ChatEntityData> getLatestChat() async {
    return await (select(chatEntity)
          ..orderBy(
              [(t) => OrderingTerm(expression: t.id, mode: OrderingMode.desc)])
          ..where((tbl) => tbl.chatProcessing.equals(false)))
        .getSingle();
  }

  Future<bool> updateChatEntity(ChatEntityCompanion entity) async {
    return await update(chatEntity).replace(entity);
  }

  Future<int> insertChatEntity(ChatEntityCompanion entity) async {
    return await into(chatEntity).insert(entity);
  }

  Future<int> deleteChatEntity(int id) async {
    return await (delete(chatEntity)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<int> deleteAllChats() async {
    return await (delete(chatEntity)).go();
  }

  Future<List<TestEntityData>> getAllTests() async {
    return await select(testEntity).get();
  }

  Future<TestEntityData> getTest(int id) async {
    return await (select(testEntity)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  Future<bool> updateTestEntity(TestEntityCompanion entity) async {
    return await update(testEntity).replace(entity);
  }

  Future<int> insertTestEntity(TestEntityCompanion entity) async {
    return await into(testEntity).insert(entity);
  }

  Future<int> deleteTestEntity(int id) async {
    return await (delete(testEntity)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<List<DiaryEntityData>> getAllDiaries() async {
    return await select(diaryEntity).get();
  }

  Future<DiaryEntityData> getDiary(int id) async {
    return await (select(diaryEntity)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  Future<bool> updateDiaryEntity(DiaryEntityCompanion entity) async {
    return await update(diaryEntity).replace(entity);
  }

  Future<int> insertDiaryEntity(DiaryEntityCompanion entity) async {
    return await into(diaryEntity).insert(entity);
  }

  Future<int> deleteDiaryEntity(int id) async {
    return await (delete(diaryEntity)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<int> deleteAllDiaries() async {
    return await (delete(diaryEntity)).go();
  }
}
