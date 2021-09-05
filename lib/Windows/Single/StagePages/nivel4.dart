import 'package:flutter/material.dart';
import 'package:fluttery_audio/fluttery_audio.dart';

import 'dart:async';
import 'package:o_marrao/Controllers/questionaryController.dart';
import 'package:o_marrao/Models/questionary.dart';
import 'package:o_marrao/Models/repository.dart';
import 'package:o_marrao/Models/tone.dart';
import 'package:o_marrao/Windows/Single/NiveisPointsPages/nivel2.dart';
import 'package:o_marrao/Windows/Single/NiveisPointsPages/nivel5.dart';
import 'package:o_marrao/Windows/Single/points.dart';
import 'package:flutter/foundation.dart';
import 'package:o_marrao/Windows/settings.dart';

class Nivel4 extends StatefulWidget {
  Nivel4({this.username, this.emailv});

  final String username, emailv;

  @override
  State createState() => new _SingleHomeState();
}

class _SingleHomeState extends State<Nivel4> {
  _SingleHomeState() {
    init();
  }

  Question _currentQuestion;
  QuestionList _quizQuestions = new QuestionList([
    new Question(
        "Qual é o nome verdadeiro do artista Mr. Bow?",
        "Salvador Pedro Maiaze",
        "Salvador António Maiaze",
        "João Valentim Tomás",
        "Mário João Maize",
        "A"),
    new Question(
        "Em que ano a timbíla chope foi proclamada Património Imaterial da Humanidade pela UNESCO?",
        "Em 2005",
        "Em 2008",
        "Em 1996",
        "Em 2001",
        "A"),
    new Question(
        "A que artista moçambicano pertence o álbum ″Kota de Família″?",
        "Tabazil",
        "Oliver Style",
        "Mr. Kuka",
        "Mr. Bow",
        "D"),
    new Question("Qual é o nome do primeiro álbum da cantora Neyma?", "Brigas",
        "Baila", "Renascer", "Mulher Moçambicana", "A"),
    new Question("O nome do monte mais alto de África é:", "Binga", "Dans Berg",
        "Everest", "Killimanjaro", "D"),
    new Question(
        "Xigubo é uma dança tradicional moçambicana que representa a resistência colonial do país, sobretudo na:",
        "Região Centro",
        "Região Sul",
        "Região Norte",
        "Todas estão corretas",
        "B"),
    new Question(
        "Marrabenta é uma forma de música-dança típica de que região de Moçambique?",
        "Zona Sul",
        "Zona Centro",
        "Zona Norte ",
        "Zona Sul e Centro ",
        "A"),
    new Question(
        "O nome Marrabenta deriva de que palavra da língua portuguesa?",
        "Quebrar",
        "Rebentar",
        "Balançar ",
        "Bailar",
        "B"),
    //new Question("A litosfera é:", "A parte líquida da terra", "A parte viva da terra", "A parte gasosa da terra", "Todas opções estão erradas", "D"),
    new Question("Lichinga é capital da província de:", "Gaza", "C. Delgado",
        "Manica", "Niassa", "D"),
    new Question("O dia mundial do combate ao SIDA comemora-se a:",
        "16 de Junho", "25 de Junho", "1 de Dezembro", "5 de Dezembro", "C"),
    new Question("Qual dos seguintes não é um Cabo africano", "Cabo delgado",
        "Cabo da boa esperança", "Cabo verde", "Cabo branco", "D"),
    new Question("Dos países que se seguem, aquele que faz parte da SADC é:",
        "R.D.Congo", "Camarões", "Seicheles", "Apenas A e C", "D"),
    new Question("Dos seguintes países, qual não faz fronteira com Moçambique:",
        "Zimbabwe", "Tanzânia", "Lesoto", "Malawi", "C"),
    new Question("Indique o país mais extenso de África", "África do Sul",
        "R.D. Congo", "Tunísia", "Argélia", "D"),
    new Question(
        "Como se chama a doênça causada pela fêmea do mosquito anopheles?",
        "Tuberculose",
        "SIDA",
        "Malária",
        "Zica",
        "C"),
    new Question("Qual dos seguintes países não é uma monarquia?", "Lesoto",
        "Marrocos", "Botswana", "Suazilândia", "C"),
    new Question(
        "Foi último presidente de Zimbabwe o seguinte:",
        "Djon Chibadura",
        "Robert Mugabe",
        "Morgan Chivangerai",
        "Dilma Russel",
        "B"),
    new Question("O primeiro presidente da FRELIMO foi?", "Samora Machel",
        "Joaquim Chissano", "Filipe Samuel", "Nenhuma correcta", "D"),
    new Question("Os portugueses chegaram pela primeira vez a Moçambique em?",
        "1497", "1947", "1794", "1749", "A"),
    //
    new Question(
        "Quando e onde foi fundada a FRELIMO?",
        "25 Junho 1964, Cabo Delgado",
        "25 Junho 1962, Dar es Salaam",
        "25 Julho 1962, Adis Abeba",
        "25 Junho 1964, Dar es Salaam",
        "B"),
    //new Question("Roma é capital de:", "França", "Vaticano", "AS Roma", "Italia", "D"),
    // new Question("Seleciona apenas a alternativa que representa um tipo de chuva", "Frontais", "Laterais", "Apenas A e B", "Nenhuma correcta", "A"),
    new Question("O relevo moçambicano apresenta-se sob a forma de:",
        "Cascátas", "Planícies", "Escadaria", "Planaltos", "C"),
    new Question("O monte binga situa-se na província de:", "Tete", "Sofala",
        "Manica", "Nampula", "C"),
    new Question(
        "O instrumento que serve para medir a pressão atmosférica chama-se:",
        "Multímetro",
        "Barómetro",
        "Voltímetro",
        "Amosferometro",
        "B"),
    //new Question("Um hectare equivale a:", "10 metros quadrados", "100 metros quadrados", "1000 metros quadrados", "10000 metros quadrados", "D"),
    //  new Question("Nao faz parte do G7:", "China", "Japao", "Brasil", "EUA", "C"),
    new Question("O maior lago africano é:", "O lago Niassa", "O lago Victória",
        "O lago Caspio", "O lago Baikal", "B"),
    new Question("Qual é a capital da província de Tete?", "Moatize",
        "Changara", "Tete", "Cahora Bassa", "C"),
    new Question("Dos seguintes não é distrito da província de Maputo", "Boane",
        "Namaacha", "Magude", "Chokwé", "D"),
    new Question("A zona sul de Moçambique possui...", "4 Províncias",
        "3 Províncias", "2 Províncias", "5 Províncias", "A"),
    new Question("O instrumento que mede a quantidade de chuva chama-se?",
        "Chuvimetro", "Aguaceiros", "Pluviómetro", "Chuvisco", "C"),
    new Question("O nosso sistema solar tem:", "Seis Planetas",
        "Cinco Planetas", "Nove Planetas", "Oito Planetas", "D"),
    new Question(
        "Quem tornou famosa a expressão ″Exaltemos a Pátria″ ?",
        "Joaquim Chissano",
        "Filipe Nyusi",
        "Filipe Paunde",
        "Armando Guebuza",
        "D"),
    //new Question("A revolução industrial iniciou:", "Nos EUA", "Na China", "Na Inglaterra", "Na França", "C"),
    new Question(
      "Que clube de futebol tem mais títulos no Moçambola?",
      " Ferroviário de Maputo",
      "Costa do sol",
      "Liga Moçambicana",
      "Maxaquene",
      "A",
    ),
    new Question(
      "Em que ano Moçambique participou pela primeira vez do Mundial de Basquetebol Femenino?",
      "2011",
      "2018",
      "2016",
      "2014",
      "B",
    ),
    new Question(
      "Em que modalidade desportiva Moçambique venceu por três vezes consecutivas o torneio mundial nos EUA?",
      " Natação",
      "Salto a corda",
      "Basquetebol",
      "Judo",
      "B",
    ),
    new Question(
      "Que outro desporto Lurdes Mutola praticou?",
      " Judo",
      "Futsal",
      "Natação",
      "Futebol",
      "D",
    ),
    new Question(
      "Qual destes judocas moçambicanos representou o país nos jogos olímpicos de Pequim ?",
      "Marlon Acácio",
      "Bruno Luzia",
      "Edson Madeira",
      "Neuso Sigaúque",
      "C",
    ),
    new Question(
      "Em que ano Moçambique participou pela primeira vez da competição mundial de futsal?",
      "2018",
      "2014",
      "2016",
      "2015",
      "C",
    ),
    new Question(
      "Que equipe eliminou Moçambique na competição mundial de futsal?",
      "Espanha",
      "Brasil",
      "Portugal",
      "Colombia",
      "B",
    ),
    new Question(
      "Em que ano Moçambique organizou os Jogos Pan-Africanos?",
      "2012",
      "2011",
      "2010",
      "2015",
      "B",
    ),
    new Question(
      "Em que ano a atleta moçambicana Lurdes Mutola venceu a medalha de ouro nos jogos olímpicos de Sidney?",
      " 2004",
      "1990",
      "1996",
      "2000",
      "D",
    ),

  ]);

  int _questionNumber = 0;
  int _score = 0;
  int _life = 3;
  int _pontos = 0;
  String _level ="";
  bool _isCorrect;
  bool _overlayVisible;
  Color _btnColor;
  Color _btnColor1;
  Color _btnColor2;
  Color _btnColor3;
  MaterialButton o;
  String _nivel = "Esperto";
  Icon _icon = Icon(Icons.star_border);

  double _value = 0.0;

  void init() {
    _btnColor = Colors.white;
    _btnColor1 = Colors.white;
    _btnColor2 = Colors.white;
    _btnColor3 = Colors.white;
    _overlayVisible = false;
    _currentQuestion = _quizQuestions.nextQuestion;
    _questionNumber = _quizQuestions.questionNumber;
  }

  void _onChange(double value) {
    setState(() {
      _value = value;
    });
  }

  void choiceHandler(String opt) {
    //BLOCO RESPONSAVEL POR FAZER O PUSH DE JANELAS DE NIVEIS
//    if (_questionNumber == _quizQuestions.length) {
//      Timer(
//          Duration(seconds: 2),
//              () => this.setState(() {
//            Navigator.of(context).push(new MaterialPageRoute(
//                builder: (BuildContext context) =>
//                new PointsPage(_score, _quizQuestions.length)));
//          }));
//    }

    this.setState(() {
      _overlayVisible = true;
    });

    _isCorrect = (opt == _currentQuestion.correctAnswer);
    _score = (_isCorrect) ? _score + 1 : _score;
    _life = (_isCorrect) ? _life : _life - 1;

    _value = (_isCorrect) ? _value + 5 : _value;

    if (_score == 0) {
      _level = "Mau";
    }
    if (_score >= 1 && _score <=3) {
      _level = "Muito Mau";
    }
    if (_score >= 4 && _score <=9) {
      _level = "Insuficiente";
    }
    if (_score >= 10 && _score <=15) {
      _level = "Suficiente";
    }
    if (_score >= 16 && _score <=18) {
      _level = "Bom";
    }
    if (_score >= 19 && _score <=20) {
      _level = "Muito Bom";
    }

    if (_questionNumber == _quizQuestions.length) {
      Timer(
          Duration(seconds: 2),
          () => this.setState(() {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new NivelP5(_score, _quizQuestions.length,_level)));
              }));
      _value = 0.0;
    }

    //BLOCO RESPONSAVEL POR EMITIR POPUPS & ZERAR SPLASH DE NIVEIS

    if (_score == 35) {
      _alertNivel1();
    }

    //POPUPS & SPLASH DE NIVEIS CLOSE

    //BLOCO RESPONSAVEL POR VISUALIZAR OS NIVEIS


    //NIVEIS CLOSE

    //BLOCO SOMADOR DE PONTOS
    if (_score >= 5) {
      _pontos = _pontos + 5;
    }
    //SOMADOR DE PONTOS CLOSE

    if (_isCorrect = (opt == _currentQuestion.correctAnswer)) {
      if (opt == "A") {
        _btnColor = Colors.green;
        _btnColor1 = Colors.white70;
        _btnColor2 = Colors.white70;
        _btnColor3 = Colors.white70;
      } else if (opt == "B") {
        _btnColor = Colors.white70;
        _btnColor1 = Colors.green;
        _btnColor2 = Colors.white70;
        _btnColor3 = Colors.white70;
      } else if (opt == "C") {
        _btnColor = Colors.white70;
        _btnColor1 = Colors.white70;
        _btnColor2 = Colors.green;
        _btnColor3 = Colors.white70;
      } else if (opt == "D") {
        _btnColor = Colors.white70;
        _btnColor1 = Colors.white70;
        _btnColor2 = Colors.white70;
        _btnColor3 = Colors.green;
      }
    } else if (_isCorrect = (opt != _currentQuestion.correctAnswer)) {
      if (opt == "A") {
        _btnColor = Colors.red;
        _btnColor1 = Colors.white70;
        _btnColor2 = Colors.white70;
        _btnColor3 = Colors.white70;
      }
      if (opt == "B") {
        _btnColor = Colors.white70;
        _btnColor1 = Colors.red;
        _btnColor2 = Colors.white70;
        _btnColor3 = Colors.white70;
      }
      if (opt == "C") {
        _btnColor = Colors.white70;
        _btnColor1 = Colors.white70;
        _btnColor2 = Colors.red;
        _btnColor3 = Colors.white70;
      }
      if (opt == "D") {
        _btnColor = Colors.white70;
        _btnColor1 = Colors.white70;
        _btnColor2 = Colors.white70;
        _btnColor3 = Colors.red;
      }
    }

    if (_life == 0) {
      Timer(
          Duration(seconds: 3),
          () => this.setState(() {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new PointsPage(_score, _quizQuestions.length,_level)));
              }));
    }

    //

    Timer(
        Duration(seconds: 1),
        () => this.setState(() {
              init();
            }));
  }

  Column createTableAnswer(Question obj) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            new Repository(
              _btnColor,
              "A",
              obj.option1,
              () {
                choiceHandler("A");
              },
            ),
          ],
        ),
        Row(
          children: <Widget>[
            new Repository(
              _btnColor1,
              "B",
              obj.option2,
              () {
                choiceHandler("B");
              },
            ),
          ],
        ),
        Row(
          children: <Widget>[
            new Repository(
              _btnColor2,
              "C",
              obj.option3,
              () {
                choiceHandler("C");
              },
            ),
          ],
        ),
        Row(
          children: <Widget>[
            new Repository(
              _btnColor3,
              "D",
              obj.option4,
              () {
                choiceHandler("D");
              },
            ),
          ],
        )
      ],
    );
  }

  String img1 =
      "https://i.amz.mshcdn.com/h9L3aQ3E8Yf6aeoVdTySccCQmmc=/fit-in/1200x9600/https%3A%2F%2Fblueprint-api-production.s3.amazonaws.com%2Fuploads%2Fcard%2Fimage%2F339018%2Fcf616a1b-9ff6-4444-a449-5f9e3ad327fa.jpg";
  String nome1 = "username";
  String emai = "emailv";
  String backup, backup2, backup3;

  void userProfile() {
    this.setState(() {
      backup = nome1;
      nome1 = backup;

      backup2 = img1;
      img1 = backup2;

      backup3 = emai;
      emai = backup3;
    });
  }

  void _alertNivel1() {
    AlertDialog alertsnivel1 = new AlertDialog(
      title: new Text(
        "Wow... Subiu de nivel " + _nivel + "!",
        style: TextStyle(color: Colors.red),
        textAlign: TextAlign.center,
      ),
      content: new Text(
        "Vamos a isso " + _nivel + " voce consegue!",
        style: TextStyle(color: Colors.orange),
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        new RaisedButton(
            color: Colors.orange,
            child: new Text("OK",
                overflow: TextOverflow.fade,
                style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.pop(context);
            })
      ],
    );

    showDialog(
      context: context,
      child: Row(
        children: <Widget>[
          alertsnivel1,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Audio(
      audioUrl: demoPlayList.songs[0].audioUrl,
      playbackState: PlaybackState.paused,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: new AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(178, 26, 4, -0.1),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  new Text(
                    "Stage: " +
                        _questionNumber.toString() +
                        "/" +
                        _quizQuestions.length.toString(),
                    style: TextStyle(
                        fontSize: 20.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Mono Social Icons',
                        color: Colors.black),
                  ),
                ],
              ),
              new CircleAvatar(
                radius: 70.0,
                backgroundColor: Colors.transparent,
                child: Image.asset(
                  "assets/marrao/logo2.png",
                ),
              ),
            ],
          ),
          elevation:
              defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
          bottom: PreferredSize(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Slider(
                      activeColor: Colors.orange,
                      min: 0.0,
                      max: 100.0,
                      value: _value,
                      onChanged: (double value) {
                        _onChange(value);
                      }),
                  new Text(
                    "Nível: " + _nivel.toString(),
                    style: TextStyle(
                        fontSize: 20.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Mono Social Icons',
                        color: Colors.black),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "" + _life.toString(),
                          style: TextStyle(
                              fontSize: 20.0,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Mono Social Icons',
                              color: Colors.orange),
                        ),
                        new Icon(
                          Icons.favorite_border,
                          color: Colors.orange,
                        )
                      ]),
                ],
              ),
              preferredSize: Size(1.0, 22.0)),
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
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new Profile(
                            //img: img1,
                            //nome: nome1,
                            )));
                  },
                  child: new CircleAvatar(
                    radius: 28.0,
                    backgroundColor: Colors.red,
                    child: Image.asset("assets/marrao/logo.png"),
                    //backgroundImage: AssetImage(),
                  ),
                ),
                accountName: new Text(
                  "O Marrão - Conta de Suporte",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Mono Social Icons',
                      color: Colors.white),
                ),
                accountEmail: new Text(
                  "omarraojogo@gmail.com",
                  style: TextStyle(
                      fontSize: 13.0,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Mono Social Icons',
                      color: Colors.black),
                ),
              ),
              new ListTile(
                title: new Text(
                  "Contacto: +258 848767975",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Mono Social Icons',
                  ),
                ),
              ),
              new Divider(),
              new ListTile(
                title: new Text(
                  "Recordes",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Mono Social Icons',
                  ),
                ),
                trailing: new Icon(Icons.score),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed("/Position");
                },
              ),
              new ListTile(
                title: new Text(
                  "Definições",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Mono Social Icons',
                  ),
                ),
                trailing: new Icon(Icons.settings),
              ),
              new Divider(),
              new ListTile(
                  title: new Text(
                    "Reiniciar Jogo",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Mono Social Icons',
                    ),
                  ),
                  trailing: new Icon(Icons.refresh),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed("/SingleHome");
                  }),
              new Divider(),
              new ListTile(
                title: new Text(
                  "Fechar",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Mono Social Icons',
                  ),
                ),
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
                  title: new Text(
                    "Sair do Jogo",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Mono Social Icons',
                    ),
                  ),
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
                image: DecorationImage(
                    image: AssetImage('assets/marrao/red.png'),
                    fit: BoxFit.fill),
              ),
            ),
            new Column(
              children: <Widget>[
                //new Image.network(demoPlayList.songs[0].albumArtUrl),
                Padding(
                  padding: EdgeInsets.only(top: 3.0),
                ),
                /*new Center(
                  child: Container(
                    //color: Colors.black54,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/marrao/grelha.png'),fit: BoxFit.fill),
                    ),
                    width: double.infinity,
                    padding: new EdgeInsets.all(34.0),
                    child: Container(
                      alignment: Alignment.centerRight,
                      //child:
                      ),
                    ),
                  ),*/
                Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      decoration: new BoxDecoration(
                        color: Colors.white,
                      ),
                      padding: new EdgeInsets.only(
                          top: 15.0, left: 20.0, right: 5.0, bottom: 30.0),
                      child: new Center(
                        child: Text(
                          _currentQuestion.questionText,
                          style: TextStyle(
                              fontSize: 25.0,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Mono Social Icons',
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.0),
                ),
                createTableAnswer(_currentQuestion),
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
                ),
                /*new LinearProgressIndicator(
                  backgroundColor: Colors.orange,
                  value: _value*2,
                  ),*/
                //_overlayVisible ? CustomizeOverlay (_isCorrect): new Container(),
              ],
            )
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                children: <Widget>[
                  AudioComponent(
                      updateMe: [
                        WatchableAudioProperties.audioPlayerState,
                      ],
                      playerBuilder: (BuildContext context, AudioPlayer player,
                          Widget child) {
                        IconData icon = Icons.music_note;
                        Color buttonColor = Colors.orange;
                        Function onPressed;

                        if (player.state == AudioPlayerState.playing) {
                          print("Paused");
                          icon = Icons.pause;
                          onPressed = player.pause;
                          buttonColor = Colors.orange;
                        } else if (player.state == AudioPlayerState.paused ||
                            player.state == AudioPlayerState.completed) {
                          print("played");
                          icon = Icons.play_arrow;
                          onPressed = player.play;
                          buttonColor = Colors.orange;
                        }
                        return IconButton(
                            icon: Icon(
                              icon,
                              color: buttonColor,
                              size: 30.0,
                            ),
                            onPressed: onPressed);
                      }),
                  IconButton(
                      icon: Icon(
                        Icons.timer,
                        color: Colors.orange,
                        size: 30.0,
                      ),
                      onPressed: null),
                  IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.orange,
                        size: 30.0,
                      ),
                      onPressed: null),
                  IconButton(
                    icon: Icon(
                      Icons.refresh,
                      color: Colors.orange,
                      size: 30.0,
                    ),
                    onPressed: () =>
                        Navigator.of(context).pushNamed("/SingleHome"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
