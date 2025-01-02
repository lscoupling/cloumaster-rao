import 'package:flutter/material.dart';
import 'package:exam_demo/screens/login_screen.dart';
import 'package:exam_demo/screens/question_screen.dart';

class ExamSelectionScreen extends StatelessWidget {
  const ExamSelectionScreen({Key? key}) : super(key: key);

  /// 讓使用者登出，回到登入畫面
  void _logout(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (route) => false, // 移除所有先前的路由
    );
  }

  void _navigateToExam(BuildContext context, String subject) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => QuestionScreen(subject: subject),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('考科選擇'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => _logout(context),
            tooltip: '登出',
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _navigateToExam(context, 'SAA'),
              child: const Text('SAA'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _navigateToExam(context, 'GCP'),
              child: const Text('GCP'),
            ),
          ],
        ),
      ),
    );
  }
}
