import 'package:flutter/material.dart';
import 'package:exam_demo/controllers/exam_controller.dart';

class StatsScreen extends StatelessWidget {
  final ExamController examController;
  const StatsScreen({Key? key, required this.examController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final answered = examController.answeredCount;
    final score = examController.score;

    return Scaffold(
      appBar: AppBar(title: const Text('統計')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '已作答：$answered 題',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 12),
            Text(
              '答對：$score 題',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 12),
            Text(
              '正確率：${answered == 0 ? 0 : (score / answered * 100).toStringAsFixed(1)}%',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('返回繼續答題'),
            ),
          ],
        ),
      ),
    );
  }
}
