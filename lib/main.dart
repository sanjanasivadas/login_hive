 import 'package:flutter/material.dart';
 import 'package:get/get_navigation/src/root/get_material_app.dart';
 import 'package:hive/hive.dart';
 import 'package:hive_flutter/adapters.dart';
 import 'package:login_hive/screens/login.dart';
 import 'models/user_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>('user');

  runApp(const MyApp());

}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: LoginScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[200]),
    );
  }
}