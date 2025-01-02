import 'package:flutter/material.dart';
import 'package:exam_demo/services/auth_service.dart';
import 'package:exam_demo/screens/exam_selection_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? errorMessage;

  void _login() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    final success = AuthService.login(username, password);
    if (success) {
      // 登入成功，前往考科選擇頁面
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const ExamSelectionScreen()),
      );
    } else {
      setState(() {
        errorMessage = '帳號或密碼錯誤，請重新輸入。';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('雲端大師用戶登入'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (errorMessage != null) ...[
              Text(
                errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
              const SizedBox(height: 8),
            ],
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: '使用者名稱'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: '密碼'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: const Text('登入'),
            ),
          ],
        ),
      ),
    );
  }
}
