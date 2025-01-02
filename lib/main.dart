import 'package:flutter/material.dart';
import 'package:exam_demo/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, // 隱藏 debug 標籤
      home: const LoginScreen(), // 設定初始頁面為登入頁面
    );
  }
}
