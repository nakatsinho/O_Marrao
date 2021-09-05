import 'package:flutter/material.dart';
//import 'package:o_marrao/Controllers/overlayController.dart';
import 'dart:async';
import 'package:o_marrao/Controllers/questionaryController.dart';
import 'package:o_marrao/Models/questionary.dart';
import 'package:o_marrao/Models/repository.dart';
import 'package:o_marrao/Controllers/questionaryController2.dart';
import 'package:o_marrao/Models/questionary2.dart';
import 'package:o_marrao/Models/repository2.dart';
import 'package:o_marrao/Windows/VS/scores.dart';
import 'package:flutter/foundation.dart';

class DoublePlay extends StatefulWidget
{
  @override
  State createState() => new _DoublePlayState() ;
}

class _DoublePlayState extends State<DoublePlay>{

  _DoublePlayState()
  {
    init();
  }
  Question _currentQuestion;
  Question2 _currentQuestion2;
  QuestionList _quizQuestions = new QuestionList([

     new Question("O primeiro ser vivo a fazer uma viagem a lua com sucesso foi?", "Catela Laica", "Nils Armstrong", "Um Chipanzé", "Apenas a alernativa A", "A"),
     new Question("Qual é o tropico que atravessa o nosso país?", "Tropico de Cancer", "Tropico de Capricornio", "Circo Polar Artico", "Circulo Polar Antartico", "B"),
     new Question("Qual o continente considerado perdido?", "Australia", "America", "Antartida", "Oceania", "D"),
     new Question("O Brasil foi oficialmente descoberto por?", "Cristovao Colombo", "Pedro Alvaro Cunha", "Tristao da Cunha", "Afonso de Albuquerque", "A"),
     new Question("A afirmaçao 'Na Natureza nada se perde, tudo se transforma', pertence a ?", "René Descartes", "Platão", "Lavoisier", "Aristóteles", "C"),
     new Question("Que zona do território nacional é considerado a segunda capital de Moçambique ?", "Nampula", "Ilha de Moçambique", "Beira", "Matola", "C"),
     new Question("A satélite natural da terra chama-se ?", "Terra-sat", "Mana-sat", "Dstv", "Lua", "D"),
     new Question("Qual é o nome do monte mais do alto do mundo", "Killimanjaro", "Dans Berg", "Everest", "Binga", "C"),
     new Question("O termo Geografia deriva da junçao de 2 palavras gregas 'geo e grafia' que significa respectivamente:", "Discriçao e terra", "Terra e discriçao", "Globo e mapa", "Mapa e globo", "B"),
     new Question("A seguir, sao ramos da geografia excepto?", "Geografia politica", "Geografia fisica", "Genecologia", "Oceanografia", "C"),
     new Question("As esferas que fazem parte da terra sao?", "Atmosfera, hidrosfera, biosfera e litosfera", "Atmosfera, protosfera, troposfera e biosfera", "Atmosfera, genosfera, litosfera e hidrosfera", "Biosfera, atmosfera, litosfera e dinamosfera", "A"),
     new Question("A litosfera é:", "A parte liquida da terra", "A parte viva da terra", "A parte gasosa da terra", "Todas opçoes estao erradas", "D"),
     new Question("Lichinga é capital da provincia de:", "Gaza", "C. Delgado", "Manica", "Niassa", "D"),
     new Question("O dia mundial do combate ao SIDA comemora-se a:", "16 de Junho", "25 de Junho", "1 de Dezembro", "5 de Dezembro", "C"),
     new Question("A seguir nao é um cabo Africano", "Cabo delgado", "Cabo da boa esperança", "Cabo frio", "Cabo branco", "B"),
     new Question("Dos paises que se seguem, aquele que faz parte da SADAC é:", "R. Democratica do Congo", "Camaroes", "Seicheles", "Apenas A e C", "A"),
     new Question("Dos seguintes paises, qual nao faz fronteira com Moçambique:", "Zimbabwe", "Tanzania", "Lesoto", "Malawi", "C"),
     new Question("Madrid é capital de:", "Portugal", "Argentina", "Espanha", "Brasil", "C"),
     new Question("Indique o país mais extenso do mundo", "Russia", "India", "China", "Argelia", "A"),
     new Question("Como se chama a doença causada pela femea do mosquito?", "Tuberculose", "Paludismo", "Malaria", "Zica", "C"),
     new Question("Qual dos seguintes paises nao é uma monarquia", "Espanha", "Inglaterra", "Belgica", "França", "B"),
     new Question("Foi ultimo presidente de Zimbabwe o seguinte?", "Djon Chibadura", "Morgan Chivangerai", "Dilma Russel", "Robert Mugabe", "D"),
     new Question("O primeiro presidente da FRELIMO foi?", "Samora Machel", "Joaquim Chissano", "Filipe Samuel", "Nenhuma correcta", "D"),
     new Question("Os portugueses chegaram pela primeira vez a Moçambique em?", "1497", "1947", "1794", "1749", "A"),
     new Question("Quando e onde foi fundada a FRELIMO?", "1962 na Tanzania", "1964 em Cabo Delgado", "1962 em Adis Abeba", "Nenhuma correcta", "A"),
     new Question("Roma é capital de:", "França", "Vaticano", "AS Roma", "Italia", "D"),
     new Question("Seleciona apenas a alternativa que representa um tipo de chuva", "Frontais", "Laterais", "Apenas A e B", "Nenhuma correcta", "A"),
     new Question("O relevo moçambicano apresenta-se sob a forma de:", "Cascatas", "Planicies", "Escadaria", "Planaltos", "C"),
     new Question("O monte binga situa-se na provincia de:", "Manica", "Sofala", "Tete", "Nampula", "A"),
     new Question("O instrumento que serve para medir a pressao atmosferica chama-se:", "Amosferometro", "Multimetro", "Barometro", "Voltimetro", "A"),
     new Question("Um hectare equivale a:", "10 metros quadrados", "100 metros quadrados", "1000 metros quadrados", "10000 metros quadrados", "B"),
     new Question("Nao faz parte do G7:", "China", "Japao", "Brasil", "EUA", "C"),
     new Question("O maior lago africano é:", "Niassa", "Victoria", "Caspio", "Baikal", "C"),
     new Question("Qual é a capital da provincia de Tete?", "Moatize", "Changara", "Tete", "Cahora Bassa", "C"),
     new Question("Dos seguintes nao é distrito da provincia de Maputo", "Boane", "Namaacha", "Magude", "Chokwé", "D"),
     new Question("A zona sul de Moçambique engloba?", "4 Provincias", "3 Provincias", "2 Provincias", "5 Provincias", "B"),
     new Question("O instrumento que mede a quantidade de chuva chama-se?", "Pluviometro", "Chuvimetro", "Aguaceiros", "Chuvisco", "A"),
     new Question("O nosso sistema solar tem:", "Seis Planetas", "Cinco Planetas", "Nove Planetas", "Oito Planetas", "D"),
     new Question("O maior Oceano do Mundo é:", "Indico", "Pacifico", "Atlantico", "Antartico", "B"),
     new Question("A revoluçao industrial iniciou:", "Nos EUA", "Na China", "Na Inglaterra", "Na França", "B"),

   ]);

  QuestionList2 _quizQuestions2 = new QuestionList2([

   new Question2("O primeiro ser vivo a fazer uma viagem a lua com sucesso foi?", "Catela Laica", "Nils Armstrong", "Um Chipanzé", "Apenas a alernativa A", "A"),
   new Question2("Qual é o tropico que atravessa o nosso país?", "Tropico de Cancer", "Tropico de Capricornio", "Circo Polar Artico", "Circulo Polar Antartico", "B"),
   new Question2("Qual o continente considerado perdido?", "Australia", "America", "Antartida", "Oceania", "D"),
   new Question2("O Brasil foi oficialmente descoberto por?", "Cristovao Colombo", "Pedro Alvaro Cunha", "Tristao da Cunha", "Afonso de Albuquerque", "A"),
   new Question2("A afirmaçao 'Na Natureza nada se perde, tudo se transforma', pertence a ?", "René Descartes", "Platão", "Lavoisier", "Aristóteles", "C"),
   new Question2("Que zona do território nacional é considerado a segunda capital de Moçambique ?", "Nampula", "Ilha de Moçambique", "Beira", "Matola", "C"),
   new Question2("A satélite natural da terra chama-se ?", "Terra-sat", "Mana-sat", "Dstv", "Lua", "D"),
   new Question2("Qual é o nome do monte mais do alto do mundo", "Killimanjaro", "Dans Berg", "Everest", "Binga", "C"),
   new Question2("O termo Geografia deriva da junçao de 2 palavras gregas 'geo e grafia' que significa respectivamente:", "Discriçao e terra", "Terra e discriçao", "Globo e mapa", "Mapa e globo", "B"),
   new Question2("A seguir, sao ramos da geografia excepto?", "Geografia politica", "Geografia fisica", "Genecologia", "Oceanografia", "C"),
   new Question2("As esferas que fazem parte da terra sao?", "Atmosfera, hidrosfera, biosfera e litosfera", "Atmosfera, protosfera, troposfera e biosfera", "Atmosfera, genosfera, litosfera e hidrosfera", "Biosfera, atmosfera, litosfera e dinamosfera", "A"),
   new Question2("A litosfera é:", "A parte liquida da terra", "A parte viva da terra", "A parte gasosa da terra", "Todas opçoes estao erradas", "D"),
   new Question2("Lichinga é capital da provincia de:", "Gaza", "C. Delgado", "Manica", "Niassa", "D"),
   new Question2("O dia mundial do combate ao SIDA comemora-se a:", "16 de Junho", "25 de Junho", "1 de Dezembro", "5 de Dezembro", "C"),
   new Question2("A seguir nao é um cabo Africano", "Cabo delgado", "Cabo da boa esperança", "Cabo frio", "Cabo branco", "B"),
   new Question2("Dos paises que se seguem, aquele que faz parte da SADAC é:", "R. Democratica do Congo", "Camaroes", "Seicheles", "Apenas A e C", "A"),
   new Question2("Dos seguintes paises, qual nao faz fronteira com Moçambique:", "Zimbabwe", "Tanzania", "Lesoto", "Malawi", "C"),
   new Question2("Madrid é capital de:", "Portugal", "Argentina", "Espanha", "Brasil", "C"),
   new Question2("Indique o país mais extenso do mundo", "Russia", "India", "China", "Argelia", "A"),
   new Question2("Como se chama a doença causada pela femea do mosquito?", "Tuberculose", "Paludismo", "Malaria", "Zica", "C"),
   new Question2("Qual dos seguintes paises nao é uma monarquia", "Espanha", "Inglaterra", "Belgica", "França", "B"),
   new Question2("Foi ultimo presidente de Zimbabwe o seguinte?", "Djon Chibadura", "Morgan Chivangerai", "Dilma Russel", "Robert Mugabe", "D"),
   new Question2("O primeiro presidente da FRELIMO foi?", "Samora Machel", "Joaquim Chissano", "Filipe Samuel", "Nenhuma correcta", "D"),
   new Question2("Os portugueses chegaram pela primeira vez a Moçambique em?", "1497", "1947", "1794", "1749", "A"),
   new Question2("Quando e onde foi fundada a FRELIMO?", "1962 na Tanzania", "1964 em Cabo Delgado", "1962 em Adis Abeba", "Nenhuma correcta", "A"),
   new Question2("Roma é capital de:", "França", "Vaticano", "AS Roma", "Italia", "D"),
   new Question2("Seleciona apenas a alternativa que representa um tipo de chuva", "Frontais", "Laterais", "Apenas A e B", "Nenhuma correcta", "A"),
   new Question2("O relevo moçambicano apresenta-se sob a forma de:", "Cascatas", "Planicies", "Escadaria", "Planaltos", "C"),
   new Question2("O monte binga situa-se na provincia de:", "Manica", "Sofala", "Tete", "Nampula", "A"),
   new Question2("O instrumento que serve para medir a pressao atmosferica chama-se:", "Amosferometro", "Multimetro", "Barometro", "Voltimetro", "A"),
   new Question2("Um hectare equivale a:", "10 metros quadrados", "100 metros quadrados", "1000 metros quadrados", "10000 metros quadrados", "B"),
   new Question2("Nao faz parte do G7:", "China", "Japao", "Brasil", "EUA", "C"),
   new Question2("O maior lago africano é:", "Niassa", "Victoria", "Caspio", "Baikal", "C"),
   new Question2("Qual é a capital da provincia de Tete?", "Moatize", "Changara", "Tete", "Cahora Bassa", "C"),
   new Question2("Dos seguintes nao é distrito da provincia de Maputo", "Boane", "Namaacha", "Magude", "Chokwé", "D"),
   new Question2("A zona sul de Moçambique engloba?", "4 Provincias", "3 Provincias", "2 Provincias", "5 Provincias", "B"),
   new Question2("O instrumento que mede a quantidade de chuva chama-se?", "Pluviometro", "Chuvimetro", "Aguaceiros", "Chuvisco", "A"),
   new Question2("O nosso sistema solar tem:", "Seis Planetas", "Cinco Planetas", "Nove Planetas", "Oito Planetas", "D"),
   new Question2("O maior Oceano do Mundo é:", "Indico", "Pacifico", "Atlantico", "Antartico", "B"),
   new Question2("A revoluçao industrial iniciou:", "Nos EUA", "Na China", "Na Inglaterra", "Na França", "B"),

 ]);
  int _questionNumber = 0;
  int _questionNumber2 = 0;

  int _score=0;
  int _life = 3;
  int _score2=0;
  int _life2 = 3;

  bool _isCorrect;
  bool _isCorrect2;

  int _time = 10;
  int _timer = 15;
  bool _overlayVisible;
  Color _btnColor;
  Color _btnColor1;
  Color _btnColor2;
  Color _btnColor3;

  Color _btnColor4;
  Color _btnColor5;
  Color _btnColor6;
  Color _btnColor7;
  MaterialButton _iconAnswer;

  void init ()
  {
    _btnColor = Colors.lightGreen;
    _btnColor1 = Colors.lightGreen;
    _btnColor2 = Colors.lightGreen;
    _btnColor3 = Colors.lightGreen;

    _btnColor4 = Colors.lightGreen;
    _btnColor5 = Colors.lightGreen;
    _btnColor6 = Colors.lightGreen;
    _btnColor7 = Colors.lightGreen;

    _overlayVisible = false;

    _currentQuestion = _quizQuestions.nextQuestion;
    _questionNumber = _quizQuestions.questionNumber;

    _currentQuestion2 = _quizQuestions2.nextQuestion;
    _questionNumber2 = _quizQuestions2.questionNumber;

  }

  //HANDLER OF TOP BUTTONS

  void choiceHandler (String opt)
  {
    if (_questionNumber == _quizQuestions.length)
    {
      Timer (Duration(seconds: 3), ()=> this.setState((){
        Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> new ScoresPage(_score, _quizQuestions.length,_score2, _quizQuestions2.length)));}));
    }

    _isCorrect = (opt == _currentQuestion.correctAnswer);
    _score = (_isCorrect)? _score+1 : _score;
    _life = (_isCorrect)? _life : _life-1;

    if(_isCorrect = (opt == _currentQuestion.correctAnswer))
    {
      if(opt=="A" )
      {
        _btnColor = Colors.green;
        _btnColor1 = Colors.lightGreen;
        _btnColor2 = Colors.lightGreen;
        _btnColor3 = Colors.lightGreen;
      }
      else if(opt=="B")
      {
        _btnColor = Colors.lightGreen;
        _btnColor1 = Colors.green;
        _btnColor2 = Colors.lightGreen;
        _btnColor3 = Colors.lightGreen;
      }
      else if(opt=="C")
      {
        _btnColor = Colors.lightGreen;
        _btnColor1 = Colors.lightGreen;
        _btnColor2 = Colors.green;
        _btnColor3 = Colors.lightGreen;
      }
      else if(opt=="D")
      {
        _btnColor = Colors.lightGreen;
        _btnColor1 = Colors.lightGreen;
        _btnColor2 = Colors.lightGreen;
        _btnColor3 = Colors.green;
      }
    }

    else if(_isCorrect = (opt != _currentQuestion.correctAnswer))
    {
      if(opt=="A")
      {
        _btnColor = Colors.red;
        _btnColor1 = Colors.lightGreen;
        _btnColor2 = Colors.lightGreen;
        _btnColor3 = Colors.lightGreen;
      }
      if(opt=="B")
      {
        _btnColor = Colors.lightGreen;
        _btnColor1 = Colors.red;
        _btnColor2 = Colors.lightGreen;
        _btnColor3 = Colors.lightGreen;
      }
      if(opt=="C")
      {
        _btnColor = Colors.lightGreen;
        _btnColor1 = Colors.lightGreen;
        _btnColor2 = Colors.red;
        _btnColor3 = Colors.lightGreen;
      }
      if(opt=="D")
      {
        _btnColor = Colors.lightGreen;
        _btnColor1 = Colors.lightGreen;
        _btnColor2 = Colors.lightGreen;
        _btnColor3 = Colors.red;
      }
    }

    if (_life == 0)
    {
      Timer (Duration(seconds: 3), ()=> this.setState((){
        Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> new ScoresPage(_score, _quizQuestions.length,_score2, _quizQuestions2.length)));}));
    }

    this.setState((){_overlayVisible = true;});

    Timer(Duration(seconds: 3), ()=>this.setState((){
      init();
    })
          );
  }

  //HANDLER OF BOTTOM BUTTONS

  void choiceHandler2 (String opt)
  {
    if (_questionNumber2 == _quizQuestions2.length)
    {
      Timer (Duration(seconds: 3), ()=> this.setState((){
        Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> new ScoresPage(_score2, _quizQuestions2.length,_score, _quizQuestions.length)));}));
    }

    _isCorrect2 = (opt == _currentQuestion2.correctAnswer2);
    _score2 = (_isCorrect2)? _score2+1 : _score2;
    _life2 = (_isCorrect2)? _life2 : _life2-1;

    if(_isCorrect2 = (opt == _currentQuestion2.correctAnswer2))
    {
      if(opt=="A" )
      {
        _btnColor4 = Colors.green;
        _btnColor5 = Colors.lightGreen;
        _btnColor6 = Colors.lightGreen;
        _btnColor7 = Colors.lightGreen;
      }
      else if(opt=="B")
      {
        _btnColor4 = Colors.lightGreen;
        _btnColor5 = Colors.green;
        _btnColor6 = Colors.lightGreen;
        _btnColor7 = Colors.lightGreen;
      }
      else if(opt=="C")
      {
        _btnColor4 = Colors.lightGreen;
        _btnColor5 = Colors.lightGreen;
        _btnColor6 = Colors.green;
        _btnColor7 = Colors.lightGreen;
      }
      else if(opt=="D")
      {
        _btnColor4 = Colors.lightGreen;
        _btnColor5 = Colors.lightGreen;
        _btnColor6 = Colors.lightGreen;
        _btnColor7 = Colors.green;
      }
    }

    else if(_isCorrect2 = (opt != _currentQuestion2.correctAnswer2))
    {
      if(opt=="A")
      {
        _btnColor4 = Colors.red;
        _btnColor5 = Colors.lightGreen;
        _btnColor6 = Colors.lightGreen;
        _btnColor7 = Colors.lightGreen;
      }
      if(opt=="B")
      {
        _btnColor4 = Colors.lightGreen;
        _btnColor5 = Colors.red;
        _btnColor6 = Colors.lightGreen;
        _btnColor7 = Colors.lightGreen;
      }
      if(opt=="C")
      {
        _btnColor4 = Colors.lightGreen;
        _btnColor5 = Colors.lightGreen;
        _btnColor6 = Colors.red;
        _btnColor7 = Colors.lightGreen;
      }
      if(opt=="D")
      {
        _btnColor4 = Colors.lightGreen;
        _btnColor5 = Colors.lightGreen;
        _btnColor6 = Colors.lightGreen;
        _btnColor7 = Colors.red;
      }
    }

    if (_life2 == 0)
    {
      Timer (Duration(seconds: 3), ()=> this.setState((){
        Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> new ScoresPage(_score2, _quizQuestions2.length,_score, _quizQuestions.length)));}));
    }

    this.setState((){_overlayVisible = true;});

    Timer(Duration(seconds: 3), ()=>this.setState((){
      init();
    })
          );
  }

  Column createTableAnswer (Question obj)
  {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            new Repository(_btnColor, "A", obj.option1, (){choiceHandler("A");},),
            new Repository(_btnColor1, "B", obj.option2, (){choiceHandler("B");},),
          ],
          ),
        Row(
          children: <Widget>[
            new Repository(_btnColor2, "C", obj.option3, (){choiceHandler("C");},),
            new Repository(_btnColor3, "D", obj.option4, (){choiceHandler("D");},),
          ],
          )
      ],
      );
  }
  Column createTableAnswer2 (Question2 obj)
  {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            new Repository2(_btnColor5, "A", obj.option6, (){choiceHandler2("B");}),
            new Repository2(_btnColor6, "B", obj.option7, (){choiceHandler2("C");}),
          ],
          ),
        Row(
          children: <Widget>[
            new Repository2(_btnColor7, "C", obj.option8, (){choiceHandler2("D");}),
            new Repository2(_btnColor4, "D", obj.option5, (){choiceHandler2("A");}),
          ],
          )
      ],
      );
  }

  @override

  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          backgroundColor: Color.fromRGBO(178, 26, 4, -0.1),
          title: new Text("",style: TextStyle(
              fontSize: 30.0
              ),),
          elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,

          actions: <Widget>[
            //new Icon(Icons.more_vert),
            new Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              )
          ],
          ),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                currentAccountPicture: new GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: new CircleAvatar(
                    radius: 28.0,
                    backgroundColor: Colors.white70,
                    backgroundImage: AssetImage(""),
                    ),
                  ),
                accountName: new Text("Kelton Cumbe",
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.white,
                                              decorationColor: Colors.teal)),
                accountEmail: new Text(
                  "opcional@gmail.com",
                  style: TextStyle(fontSize: 12.0, color: Colors.black),
                  ),
                ),
              new ListTile(
                title: new Text("O Marrao"),
                ),
              new Divider(),
              new ListTile(
                title: new Text("Recordes"),
                trailing: new Icon(Icons.perm_identity),
                ),
              new ListTile(
                title: new Text("Definiçoes"),
                trailing: new Icon(Icons.settings),
                ),
              new Divider(),
              new ListTile(
                  title: new Text("Reeiniciar Jogo"),
                  trailing: new Icon(Icons.refresh),
                  onTap:()
                  {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed("/SingleHome");
                  }
                  ),
              new Divider(),
              new ListTile(
                title: new Text("Fechar"),
                trailing: new Icon(Icons.close),
                onTap: () => Navigator.of(context).pop(),
                ),
              new ListTile(
                //Waiting of any ideia of me
                ),
              new Divider(),
              new Card(
                color: Colors.red,
                child: new ListTile(
                  title: new Text("Sair do Jogo",
                                      style: TextStyle(
                                        color: Colors.black,
                                        )),
                  trailing: new Icon(
                    Icons.keyboard_backspace,
                    color: Colors.black,
                    size: 24.0,
                    ),
                  onTap: () => Navigator.of(context).pushNamed("/Login"),
                  ),
                ),
              new Divider(
                height: 20.0,
                ),
            ],
            ),
          ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Container(
              decoration: BoxDecoration(
                image:
                DecorationImage(image: AssetImage('assets/marrao/red.png'),fit: BoxFit.fill),
                ),
              ),
            new Column(
              children: <Widget>[
                new Center(
                  child: Container(
                    color: new Color(0x476879ff),
                    width: double.infinity,
                    padding: new EdgeInsets.all(5.0),
                    child: Container(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Row(
                              children: <Widget>[
                                Text(_life.toString(),style: new TextStyle(color: Colors.teal, fontSize: 25.0),),
                                Icon(Icons.favorite, color: Colors.red,size: 30.0,),
                              ],),
                            new Text("Jogador 1: "+_questionNumber.toString()+"/"+_quizQuestions.length.toString(), style: new TextStyle(color: Colors.teal, fontSize: 20.0),),
                            new Text("Pontos: "+_score.toString(), style: new TextStyle(color: Colors.teal, fontSize: 20.0),),
                          ],
                          )
                        ),
                    ),
                  ),
                createTableAnswer(_currentQuestion),
                Center(
                  child: Container(
                    //transform: Matrix4.diagonal3Values(1.0, 1.0, 3.0),
                    width: double.infinity,
                    decoration: new BoxDecoration(color: Colors.teal),
                    padding: new EdgeInsets.only(top: 10.0,left: 10.0,right: 10.0,bottom: 10.0),
                    child: new Center(
                      child: Text(_currentQuestion.questionText, style: new TextStyle(
                        color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold,
                        ),),
                      ),
                    ),
                  ),

                Divider(color: Colors.teal,),
                Center(
                  child: Container(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Row(
                            children: <Widget>[
                              Icon(Icons.timer, color: Colors.green,size: 20.0,),
                              Text(":"+_timer.toString(),style: new TextStyle(color: Colors.teal, fontSize: 20.0),),
                            ],),
                          ],
                        )
                      ),
                ),

                Divider(color: Colors.teal,),

                Center(
                  child: Container(
                    width: double.infinity,
                    decoration: new BoxDecoration(color: Colors.teal),
                    padding: new EdgeInsets.only(top: 10.0,left: 10.0,right: 10.0,bottom: 10.0),
                    child: new Center(
                      child: Text(_currentQuestion2.questionText2, style: new TextStyle(
                        color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold,
                        ),),
                      ),
                    ),
                  ),
                createTableAnswer2(_currentQuestion2),
                /*Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  ),*/
                //_overlayVisible ? CustomizeOverlay (_isCorrect): new Container(),
                new Center(
                  child: Container(
                    color: new Color(0x476879ff),
                    width: double.infinity,
                    padding: new EdgeInsets.all(5.0),
                    child: Container(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Row(
                              children: <Widget>[
                                Text(_life2.toString(),style: new TextStyle(color: Colors.teal, fontSize: 25.0),),
                                Icon(Icons.favorite, color: Colors.red,size: 30.0,),
                              ],),
                            /*new Row(
                              children: <Widget>[
                                Icon(Icons.timer, color: Colors.green,size: 20.0,),
                                Text(":"+_timer.toString(),style: new TextStyle(color: Colors.teal, fontSize: 20.0),),
                              ],),*/
                            new Text("Jogador 2: "+_questionNumber2.toString()+"/"+_quizQuestions2.length.toString(), style: new TextStyle(color: Colors.teal, fontSize: 20.0),),
                            new Text("Pontos: "+_score2.toString(), style: new TextStyle(color: Colors.teal, fontSize: 20.0),),
                          ],
                          )
                        ),
                    ),
                  ),
              ],
              )
          ],
          )
        );
  }
}