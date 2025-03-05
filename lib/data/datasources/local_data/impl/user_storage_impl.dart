part of '../user_storage.dart';

class UserStorageImpl extends UserStorage {
  late Isar isar;
  @override
  Future<void> initUserLocalDb() async {
    final dir = await Utils.getAppDocumentDirectory();
    isar = await Isar.open(
      [UserTableSchema],
      directory: dir,
    );
  }

  @override
  Future<void> deleteUser(user) async {
    return isar.writeTxn(() async {
      await isar.userTables.delete(user.id);
    });
  }

  @override
  Future<UserTable?> getUser() async {
    return await isar.userTables.where().findFirst();
  }

  @override
  Future<void> saveUser(user) async {
    return isar.writeTxn(() async {
      await isar.userTables.put(user);
    });
  }

  @override
  Future<void> updateUser(user) async {
    return isar.writeTxn(() async {
      await isar.userTables.put(user);
    });
  }
}
