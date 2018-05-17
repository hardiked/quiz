import 'package:flutter/material.dart';
import 'package:quiz_app/ui/answerButton.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => new _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Column(
          children: <Widget>[
            new AnswerButton(true),
            new AnswerButton(false),
          ],
        )
      ],
    );
  }
}
