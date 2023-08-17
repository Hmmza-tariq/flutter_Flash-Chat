import 'package:flashchat/Components/Assessments.dart';
import 'package:flutter/material.dart';

class AssessmentWidget extends StatelessWidget {
  const AssessmentWidget({
    super.key,
  });

  Widget build(BuildContext context) {
    final Assessment assessment = Assessment();
    String type = assessment.isQuiz ? "Quiz" : "Assignment";
    return Card(
      child: Column(
        children: [
          Text('12'),
          Text('34'),
        ],
      ),
    );
  }
}
