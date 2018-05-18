import 'package:flutter/material.dart';
import 'package:quiz_app/ui/answerButton.dart';
import 'package:quiz_app/ui/overlay.dart';
import 'package:quiz_app/ui/question_text.dart';
import 'package:quiz_app/utils/question.dart';
import 'package:quiz_app/utils/quiz.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => new _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("Narendra modi is PM of India", true),
    new Question("RCB is highest time champ", false),
    new Question("Swaminarayan born in UP", true)
  ]);
  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlay=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentQuestion=quiz.nextQuestion;
    questionText=currentQuestion.question;
    questionNumber=quiz.questionNumber;
  }

  void handleAnswer(bool answer){
    isCorrect=(currentQuestion.answer==answer);
    quiz.answer(isCorrect);
    this.setState((){
      overlay=true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new AnswerButton(true,()=>handleAnswer(true)),
            new QuestionText(questionText,questionNumber),
            new AnswerButton(false,()=>handleAnswer(false)),
          ],
        ),
        overlay == true ?  new CorrectWrongOverlay(
            isCorrect,
                (){
                  print("hello");
                  currentQuestion=quiz.nextQuestion;
                  this.setState((){
                    overlay=false;
                    questionText=currentQuestion.question;
                    questionNumber=quiz.questionNumber;
                  });
                }
            ) : new Container()
      ],
    );
  }
}
