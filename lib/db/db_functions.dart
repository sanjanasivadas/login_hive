
import 'package:hive/hive.dart';
import 'package:login_hive/models/user_model.dart';

class DBFunctions {
  //singleton - factory constructor
  DBFunctions._internal();

  static DBFunctions instance = DBFunctions._internal();

  factory DBFunctions() {
    return instance;
  }

//Add user
  Future<void> userSignup(UserModel user) async {
    final db = await Hive.openBox<UserModel>('user');
    db.put(user.id, user);
  }

//getUser
  Future<List<UserModel>> getUsers() async {
    final db = await Hive.openBox<UserModel>('user');

    return db.values.toList();
  }
}