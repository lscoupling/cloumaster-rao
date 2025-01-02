// lib/screens/exam_selection_screen.dart

import 'package:flutter/material.dart';
import 'package:exam_demo/screens/login_screen.dart';
import 'package:exam_demo/screens/question_screen.dart';

class ExamSelectionScreen extends StatelessWidget {
  const ExamSelectionScreen({Key? key}) : super(key: key);

  void _navigateToExam(BuildContext context, String subject) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => QuestionScreen(subject: subject),
      ),
    );
  }

  // 登出：導回 LoginScreen 並清除路由
  void _logout(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('考科選擇'),
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

      // ★ 將登出按鈕放在最下方 (bottomNavigationBar) ★
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.exit_to_app),
              label: const Text('登出'),
              onPressed: () => _logout(context),
            ),
          ],
        ),
      ),
    );
  }
}
