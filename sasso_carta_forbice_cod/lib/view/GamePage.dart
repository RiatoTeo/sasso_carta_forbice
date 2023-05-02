import 'dart:io';
import 'dart:math';
import 'package:shake/shake.dart';
import 'package:sasso_carta_forbice_cod/models/users.dart';
import 'package:sasso_carta_forbice_cod/view/scoreboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GamePage extends StatefulWidget {
  final User user;
  GamePage(this.user);

  @override
  _GamePageState createState() => _GamePageState(this.user);
}

class _GamePageState extends State<GamePage> {
  User user;
  _GamePageState(this.user);
  String? playerSelection = "Niente";
  String? gameResult = " ";
  String? computerSelection = "Niente";
  int playerWins = 0;
  int computerWins = 0;

  @override
  Widget build(BuildContext context) {
    print(_images['Sasso']);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _process(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              rockButton(context),
              paperButton(context),
              scissorsButton(context),
            ],
          )
        ],
      ),
    );
  }

  TextButton scoreBoard(BuildContext context) {
    return TextButton(
      child: Text("Punteggio"),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ScoreBoard(playerWins, computerWins)));
      },
    );
  }

  ElevatedButton scissorsButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.white,
          elevation: 0,
          fixedSize: Size(100, 100),
          padding: EdgeInsets.zero),
      onPressed: () {
        late final ShakeDetector detector;
        detector = ShakeDetector.waitForStart(onPhoneShake: (() {
          setState(() {
            computerSelection = computerMove();
            playerSelection = "Forbici";
            gameResult = whoWins("$playerSelection", "$computerSelection");
          });
          detector.stopListening();
        }));
        detector.startListening();

        if (playerWins + computerWins == user.gameLength) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ScoreBoard(playerWins, computerWins)));
        }
      },
      child: Image(
        image: AssetImage("assets/images/forbiceimg.png"),
        fit: BoxFit.cover,
      ),
    );
  }

  ElevatedButton paperButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.white,
          elevation: 0,
          fixedSize: Size(100, 100),
          padding: EdgeInsets.zero),
      onPressed: () {
        late final ShakeDetector detector;
        detector = ShakeDetector.waitForStart(onPhoneShake: (() {
          setState(() {
            computerSelection = computerMove();
            playerSelection = "Carta";
            gameResult = whoWins("$playerSelection", "$computerSelection");
          });
          detector.stopListening();
        }));
        detector.startListening();
        if (playerWins + computerWins == user.gameLength) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ScoreBoard(playerWins, computerWins)));
        }
      },
      child: Image(
        image: AssetImage("assets/images/cartaimg.png"),
        fit: BoxFit.cover,
      ),
    );
  }

  ElevatedButton rockButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.white,
          elevation: 0,
          fixedSize: Size(100, 100),
          padding: EdgeInsets.zero),
      onPressed: () {
        late final ShakeDetector detector;
        detector = ShakeDetector.waitForStart(onPhoneShake: (() {
          setState(() {
            computerSelection = computerMove();
            playerSelection = "Sasso";
            gameResult = whoWins("$playerSelection", "$computerSelection");
          });
          detector.stopListening();
        }));
        detector.startListening();
        if (playerWins + computerWins == user.gameLength) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ScoreBoard(playerWins, computerWins)));
        }
      },
      child: image("assets/images/sassoimg.png"),
    );
  }

  Image image(String imageAddress) {
    return Image(
      image: AssetImage(imageAddress),
      fit: BoxFit.cover,
    );
  }

  String computerMove() {
    Random rand = new Random();
    int move = rand.nextInt(3);
    String? computerSelection;

    switch (move) {
      case 0:
        debugPrint("Sasso");
        computerSelection = "Sasso";
        break;
      case 1:
        debugPrint("Carta");
        computerSelection = "Carta";
        break;
      case 2:
        debugPrint("Forbici");
        computerSelection = "Forbici";
        break;
      default:
        break;
    }
    return computerSelection!;
  }

  String whoWins(String playerMove, String computerMove) {
    if (playerMove == computerMove) {
      debugPrint("Pareggio");
      return "Pareggio";
    } else if (playerMove == "Sasso" && computerMove == "Forbici") {
      debugPrint("Hai vinto!");
      playerWins++;

      return "Hai vinto!";
    } else if (playerMove == "Forbici" && computerMove == "Carta") {
      debugPrint("Hai vinto!");
      playerWins++;

      return "Hai vinto!";
    } else if (playerMove == "Carta" && computerMove == "Sasso") {
      debugPrint("Hai vinto!");
      playerWins++;

      return "Hai vinto!";
    } else {
      debugPrint("Il Computer ha vinto!");
      computerWins++;
      return "Il Computer ha vinto!";
    }
  }

  String movePlayer(String? selection) {
    String? playerSelection;

    switch (selection) {
      case "S":
        debugPrint("Sasso");
        playerSelection = "Sasso";
        break;
      case "C":
        debugPrint("Carta");
        playerSelection = "Carta";

        break;
      case "F":
        debugPrint("Forbici");
        playerSelection = "Forbici";

        break;
      default:
        debugPrint("Abbandona");
        break;
    }
    return playerSelection!;
  }

  Column _process() {
    return Column(
      children: [
        Text(
          "Computer",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 14.0,
        ),
        _getImage(_images[computerSelection].toString()),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            "Player: $gameResult",
            style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
          ),
        ),
        RotatedBox(
            quarterTurns: 2,
            child: _getImage(_images[playerSelection].toString())),
        SizedBox(
          height: 16.0, // imposta il margine superiore a 16 punti
        ),
        Text(
          user.username!,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black, fontFamily: 'Roboto'),
        )
      ],
    );
  }

  Map<String, String> _images = {
    "Sasso": "assets/images/sassoimg.png",
    "Carta": "assets/images/cartaimg.png",
    "Forbici": "assets/images/forbiceimg.png",
    "Niente": "assets/images/semp.png",
  };

  Image _getImage(String image) => Image.asset(
        image,
        height: 100,
        width: 100,
      );
}
