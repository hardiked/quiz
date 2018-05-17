import 'package:quiz_app/utils/question.dart';

class Quiz{
  List<Question> _questions;
  int _currentIndex=-1;
  int _score=0;

  Quiz(this._questions){
    _questions.shuffle();
  }

  int get score => _score;
  List<Question> get questions => _questions;
  int get length => _questions.length;
  int get questionNumber => _currentIndex+1;

  Question get nextQuestion{
    _currentIndex++;
    if(_currentIndex >= length){
      return null;
    }
    return _questions[_currentIndex];
  }

  void answer(bool isCorrect){
    if(isCorrect){
      _score++;
    }
  }
}