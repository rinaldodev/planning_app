import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'login.dart';

void main() {
  debugPaintSizeEnabled = true;
  runApp(MyApp());
}

var APP_NAME = 'Scrum Planning Poker';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      theme: ThemeData(primaryColor: Colors.lightBlueAccent),
      home: Cartas(),
    );
  }
}

class CartasState extends State<Cartas> {
  final _textFont = const TextStyle(fontSize: 20.0);
  final _biggerFont = const TextStyle(fontSize: 36.0);
  final _giantFont = const TextStyle(fontSize: 150.0);

  var _selecionada;

  var firebaseUser;

  @override
  void initState() {
    super.initState();
    googleLogin();
  }

  @override
  Widget build(BuildContext context) {
    firebaseUser = '';
    getLoggedUserName(this);

    return Scaffold(
      appBar: AppBar(
        title: Text(APP_NAME),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: _buildGridView(),
          ),
          Text(firebaseUser)
        ],
      ),
    );
  }

  Widget _buildGridView() {
    return GridView.extent(
      maxCrossAxisExtent: 120.0,
      shrinkWrap: true,
      padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
      children: _buildCards().toList(),
    );
  }

  Iterable<GestureDetector> _buildCards() {
    var listaDeCards = _cards.map((i) {
      return GestureDetector(
        onTap: () {
          _escolherCard(i);
        },
        child: Card(
            color: i == _selecionada ? Colors.red : null,
            child: Center(
              child: Text(
                i.toString(),
                style: _biggerFont,
              ),
            )),
      );
    });
    return listaDeCards;
  }

  _escolherCard(String i) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return GestureDetector(
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Minha Estimativa!'),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _buildCardDisplay(i),
                  _buildCardText(i),
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          );
        },
      ),
    );
  }

  _buildCardDisplay(String i) {
    if (i == COFFEE) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Image(
              image: AssetImage('graphics/coffee.png'),
            ),
            padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            i.toString(),
            style: _giantFont,
          ),
        ],
      );
    }
  }

  _buildCardTextMessage(String msg) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Text(
        msg,
        style: _textFont,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class Cartas extends StatefulWidget {
  @override
  State createState() => new CartasState();
}
