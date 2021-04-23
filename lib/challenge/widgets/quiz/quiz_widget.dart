import 'package:DevQuiz/challenge/widgets/awnser/awnser_widget.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelected;

  const QuizWidget({
    required this.question,
    required this.onSelected,
  });

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;
  @override
  Widget build(BuildContext context) {
    var awnsers = widget.question.awnsers;
    return Container(
      child: Column(
        children: [
          SizedBox(height: 36),
          Text(
            widget.question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(height: 24),
          for (var awnser in awnsers)
            AwnserWidget(
              isRight: awnser.isRight,
              title: awnser.title,
              disabled: indexSelected != -1,
              isSelected: indexSelected == awnsers.indexOf(awnser),
              onTap: () {
                indexSelected = awnsers.indexOf(awnser);
                setState(() {});
                Future.delayed(
                  Duration(milliseconds: 250),
                ).then(
                  (_) => widget.onSelected(awnser.isRight),
                );
              },
            ),
        ],
      ),
    );
  }
}
