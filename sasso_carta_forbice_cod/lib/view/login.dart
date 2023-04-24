import 'package:sasso_carta_forbice_cod/models/users.dart';
import 'package:sasso_carta_forbice_cod/view/home.dart';
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
      title: Text(
        "Sasso Carta Forbice",
        style: TextStyle(
          color: Colors.blue[900],
        ),
      ),
    );
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
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: _usernameController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: "Username",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              controller: gameController,
              decoration: InputDecoration(
                hintText: "Numero parite",
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
// "https://www.iconspng.com/images/rockpaperscissors/rockpaperscissors.jpg" login rasm asosiy

