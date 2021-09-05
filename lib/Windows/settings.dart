import 'dart:async';
import 'dart:io';

import 'package:async/async.dart';
import "package:path/path.dart";
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:o_marrao/Windows/edit_settings.dart';

class Profile extends StatefulWidget {
  @override
  State createState() => new _ProfileState();
}

class _ProfileState extends State<Profile> {
  String nome;
  String img;

  File _image;

  Future getImageGallery() async {
    var imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = imageFile;
    });
  }

  Future getImageCamera() async {
    var imageFile = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = imageFile;
    });
  }

  Future upload(File imageFile) async {
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var uri = Uri.parse("http://marrao.com/marrao/upload.php");

    var request = new http.MultipartRequest("POST", uri);

    var multipartFile = new http.MultipartFile("image", stream, length,
        filename: basename(imageFile.path));

    request.files.add(multipartFile);

    var response = await request.send();

    if (response.statusCode == 200) {
      print("Image Uploaded");
    } else {
      print("Upload Failed...");
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Perfil de $nome",style: TextStyle(
          fontSize: 20.0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          fontFamily: 'Mono Social Icons',
          ),),
        backgroundColor: Colors.red,
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: "Editar Perfil",
          backgroundColor: Colors.blueGrey,
          child: Icon(
            Icons.edit,
            color: Colors.lightGreen,
          ),
          onPressed: () {
            debugPrint("FAB Pressed");
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return EditProf();
            }));
          }),
      body: new Container(
        child: new Center(
            child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 15.0)),
            new CircleAvatar(
              radius: 100.0,
              backgroundColor: Colors.orange,
              child: _image == null
                  ? new Text("Nenhuma foto \n\  selecionada")
                  : new Image.file(_image),
            ),
            Padding(padding: EdgeInsets.only(top: 30.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Material(
                  borderRadius: BorderRadius.circular(12.0),
                  //shadowColor: Colors.lightBlueAccent.shade700,
                  elevation: 5.0,
                  child: MaterialButton(
                    minWidth: 70.0,
                    height: 42.0,
                    onPressed: () {
                      getImageGallery();
                    },
                    color: Colors.orange,
                    child: Icon(
                      Icons.panorama,
                      color: Colors.white,
                    ),
                  ),
                ),
                new Material(
                  borderRadius: BorderRadius.circular(12.0),
                  //shadowColor: Colors.lightBlueAccent.shade700,
                  elevation: 5.0,
                  child: MaterialButton(
                    minWidth: 70.0,
                    height: 42.0,
                    onPressed: () {
                      getImageCamera();
                    },
                    color: Colors.orange,
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                  ),
                ),
                new Material(
                  borderRadius: BorderRadius.circular(12.0),
                  //shadowColor: Colors.lightBlueAccent.shade700,
                  elevation: 5.0,
                  child: MaterialButton(
                    minWidth: 80.0,
                    height: 42.0,
                    onPressed: () {
                      //upload(_image);
                    },
                    color: Colors.orange,
                    child: Icon(
                      Icons.cloud_upload,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 15.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 15.0)),
                    new Text(
                      "Nivel: Matreco",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Mono Social Icons',
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 15.0)),
                    new Text(
                      "Pontos: 49",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Mono Social Icons',
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 15.0)),
                    new Text(
                      "Perguntas: 840",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Mono Social Icons',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 15.0)),
                Text("Nome Completo: Kelton Mauro Cumbe",style: TextStyle(
                  fontSize: 16.0,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Mono Social Icons',
                  ),),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                Text("Username:",style: TextStyle(
                  fontSize: 16.0,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Mono Social Icons',
                  ),),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                Text("Email: ",style: TextStyle(
                  fontSize: 16.0,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Mono Social Icons',
                  ),),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                Text("Nascimento:",style: TextStyle(
                  fontSize: 16.0,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Mono Social Icons',
                  ),),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                Text("Contacto:",style: TextStyle(
                  fontSize: 16.0,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Segoe Boot Semilight',
                  ),),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
