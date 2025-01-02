import 'package:flutter/material.dart';
import 'package:exam_demo/models/question.dart';

class QuestionWidget extends StatefulWidget {
  final Question question;
  final void Function(int) onOptionSelected;

  // 額外參數：題目編號、題型
  final int questionNumber;  
  final bool isSingleChoice;

  const QuestionWidget({
    Key? key,
    required this.question,
    required this.onOptionSelected,
    required this.questionNumber,
    this.isSingleChoice = true,
  }) : super(key: key);

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  bool _isExpanded = false; // 控制題目是否「顯示完整」

  @override
  Widget build(BuildContext context) {
    // 若題目字數過長，可自行指定截斷長度
    const int maxPreviewLength = 100;
    final String questionText = widget.question.questionText;
    final bool isLongText = questionText.length > maxPreviewLength;

    // 依照 _isExpanded 狀態，決定要顯示全部內容還是截斷
    final String displayedText = (_isExpanded || !isLongText)
        ? questionText
        : questionText.substring(0, maxPreviewLength) + '...';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 上方卡片：含 題目編號 + 題型 + 題目敘述 + 「顯示完整」按鈕
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 題號 + 題型
              Row(
                children: [
                  Text(
                    '題目 ${widget.questionNumber}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  // 題型標籤 (單選/複選)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      widget.isSingleChoice ? '單選題' : '複選題',
                      style: TextStyle(
                        color: Colors.blue[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // 題目敘述（可截斷/展開）
              Text(
                displayedText,
                style: const TextStyle(fontSize: 16),
              ),
              // 「顯示完整 / 收合」按鈕
              if (isLongText)
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                    child: Text(_isExpanded ? '收合' : '顯示完整'),
                  ),
                ),
            ],
          ),
        ),

        // 下方：選項卡片列表 (A, B, C, D...)
        for (int i = 0; i < widget.question.options.length; i++)
          _buildOptionItem(i, widget.question.options[i]),
      ],
    );
  }

  // 生成單個選項卡片
  Widget _buildOptionItem(int index, String optionText) {
    // 自動算出 A, B, C, D...
    final String optionLabel = String.fromCharCode(65 + index);

    return GestureDetector(
      onTap: () {
        // 點擊後呼叫外部傳入的 onOptionSelected
        widget.onOptionSelected(index);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            // 左側顯示 A, B, C, D
            Text(
              '$optionLabel  ',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            // 選項內容
            Expanded(
              child: Text(
                optionText,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
