class Question {
  final String id;
  final String subject; 
  final String questionText;
  final List<String> options;
  final int correctIndex;

  Question({
    required this.id,
    required this.subject,
    required this.questionText,
    required this.options,
    required this.correctIndex,
  });
}
