class Question {
  final String _option1;
  final String _option2;
  final String _option3;
  final String _option4;
  final String _questionText;
  final String _correctAnswer;

  Question(this._questionText,this._option1,this._option2,this._option3,this._option4,this._correctAnswer);

  String get option1 => _option1;
  String get option2 => _option2;
  String get option3 => _option3;
  String get option4 => _option4;
  String get questionText => _questionText;
  String get correctAnswer => _correctAnswer;

}