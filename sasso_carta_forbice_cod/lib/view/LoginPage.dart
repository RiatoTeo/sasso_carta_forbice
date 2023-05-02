import 'package:sasso_carta_forbice_cod/models/users.dart';
import 'package:sasso_carta_forbice_cod/view/GamePage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController gameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Stack(
            children: <Widget>[
              Positioned(
                child: Text(
                  "Sasso Carta Forbice",
                  style: TextStyle(
                    fontSize: 30,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 6
                      ..color = Colors.blue[900]!,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              Text(
                "Sasso Carta Forbice",
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontFamily: 'Pacifico',
                  fontSize: 30.0,
                  shadows: [
                    Shadow(
                      blurRadius: 5.0,
                      color: Color.fromRGBO(0, 0, 0, 0.7),
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget _getBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image(
            image: AssetImage("assets/images/morra.jpg"),
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: TextFormField(
              controller: _usernameController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: "Nome del giocatore",
                labelStyle: TextStyle(color: Colors.blue),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                hintStyle: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
            child: TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              controller: gameController,
              decoration: InputDecoration(
                hintText: "Numero partite",
                labelStyle: TextStyle(color: Colors.blue),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                hintStyle: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          SizedBox(height: 24.0),
          SizedBox(
            height: 65,
          ),
          FloatingActionButton(
            backgroundColor: Colors.red[900],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            onPressed: () {
              String username = _usernameController.text;
              int gameLength = int.parse(gameController.text);
              if (username.isEmpty) {
                return;
              }

              if (gameController.text.isEmpty) {
                return;
              }

              User user = User(username, gameLength);
              sendData(user);
            },
            child: Text("GIOCA"),
          ),
        ],
      ),
    );
  }

  void sendData(User user) {
    int gameLength = int.parse(gameController.text);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => GamePage(user)));
  }
}


