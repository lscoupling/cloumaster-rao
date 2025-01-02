import 'package:flutter/material.dart';
import 'package:exam_demo/controllers/exam_controller.dart';
import 'package:exam_demo/models/question.dart';
import 'package:exam_demo/components/question_widget.dart';
import 'package:exam_demo/screens/stats_screen.dart';

class QuestionScreen extends StatefulWidget {
  final String subject;
  const QuestionScreen({Key? key, required this.subject}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late ExamController _examController;
  late Question _currentQuestion;

  bool _answered = false;     
  bool _isCorrect = false;    
  int? _selectedIndex;        

  @override
  void initState() {
    super.initState();
    _examController = ExamController(subject: widget.subject);
    _drawNewQuestion();
  }

  void _drawNewQuestion() {
    _currentQuestion = _examController.getRandomQuestion();
    _answered = false;
    _isCorrect = false;
    _selectedIndex = null;
  }

  void _onOptionSelected(int selectedIndex) {
    if (_answered) return;
    setState(() {
      _selectedIndex = selectedIndex;
      _isCorrect = _examController.checkAnswer(_currentQuestion, selectedIndex);
      _answered = true;
    });
  }

  void _onNextQuestion() {
    setState(() {
      _drawNewQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.subject} 考試'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple, 
        onPressed: () {
          // 前往統計頁面
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => StatsScreen(examController: _examController),
            ),
          );
        },
        // ★ 關鍵：用 Column 讓「統計」文字在 Icon 上方 ★
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '統計',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2), // 稍微留點空隙
            const Icon(
              Icons.bar_chart,
              size: 20,
              color: Colors.white,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            QuestionWidget(
              question: _currentQuestion,
              questionNumber: 0, // 若您不需要題號，可忽略
              isSingleChoice: true,
              onOptionSelected: _onOptionSelected,
            ),
            if (_answered) _buildAnswerSection(),
          ],
        ),
      ),
      bottomNavigationBar: _answered
          ? Container(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: _onNextQuestion,
                child: const Text('下一題'),
              ),
            )
          : null,
    );
  }

  Widget _buildAnswerSection() {
    final correctIndex = _currentQuestion.correctIndex;
    final userAnswer = _selectedIndex;

    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _isCorrect ? Colors.green[50] : Colors.red[50],
        border: Border.all(
          color: _isCorrect ? Colors.green : Colors.red,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _isCorrect ? '你答對了！' : '你答錯了！',
            style: TextStyle(
              color: _isCorrect ? Colors.green : Colors.red,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text('你選的答案：${_optionLabel(userAnswer ?? -1)}'),
          Text('正確答案：${_optionLabel(correctIndex)}'),
        ],
      ),
    );
  }

  String _optionLabel(int index) {
    if (index < 0) return '無';
    return String.fromCharCode(65 + index); // 0->A, 1->B, 2->C, 3->D...
  }
}
