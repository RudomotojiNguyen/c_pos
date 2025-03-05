import 'package:isar/isar.dart';

import '../../../presentation/utils/utils.dart';
import '../local_db/table/user_table.dart';

part 'impl/user_storage_impl.dart';

abstract class UserStorage<T> {
  // init user local db
  Future<void> initUserLocalDb();
  // lưu user vào local db
  Future<void> saveUser(T user);
  // xóa user khỏi local db
  Future<void> deleteUser(T user);
  // cập nhật user trong local db
  Future<void> updateUser(T user);
  // lấy user từ local db
  Future<UserTable?> getUser();
}
