import 'package:exam_demo/dao/question_dao.dart';
import 'package:exam_demo/models/question.dart';
import 'dart:math';

class ExamController {
  final String subject;
  final List<Question> _allQuestions;
  final Random _random = Random();

  int _score = 0;          // 答對總數
  int _answeredCount = 0;  // 作答總數

  ExamController({required this.subject})
      : _allQuestions = QuestionDao.getQuestionsBySubject(subject);

  /// 取得下一題 (隨機)
  Question getRandomQuestion() {
    // 如果題庫為空，您可自行定義行為，這裡先簡單回傳一個空的
    if (_allQuestions.isEmpty) {
      return Question(
        id: '0',
        subject: subject,
        questionText: '目前沒有可用的題目',
        options: ['N/A'],
        correctIndex: 0,
      );
    }
    final index = _random.nextInt(_allQuestions.length);
    return _allQuestions[index];
  }

  /// 檢查答案是否正確
  /// 回傳 true=答對, false=答錯
  bool checkAnswer(Question question, int selectedIndex) {
    _answeredCount++;
    bool isCorrect = (selectedIndex == question.correctIndex);
    if (isCorrect) {
      _score++;
    }
    return isCorrect;
  }

  int get score => _score;
  int get answeredCount => _answeredCount;
}
