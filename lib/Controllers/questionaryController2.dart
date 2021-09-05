import 'package:o_marrao/Models/questionary2.dart';

class QuestionList2
{
  final List<Question2> _quizQuestionList;
  int _currentQuestionIndex = -1;

  QuestionList2(this._quizQuestionList)
  {
    _quizQuestionList.shuffle();
  }

  int get length => _quizQuestionList.length;
  int get questionNumber => _currentQuestionIndex + 1;

  Question2 get nextQuestion{
    _currentQuestionIndex++;

    if(_currentQuestionIndex > length)
    {
      return null;
    }
    return _quizQuestionList[_currentQuestionIndex];
  }
}