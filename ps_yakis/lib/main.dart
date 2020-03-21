import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Yakis' Black Stories",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: "Yakis' Black Stories"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String directory;
  String imagemMostrada;
  bool frenteExposta = true;
  int randomNumber = 1;

  List<String> pathsFrente = [
    'lib/images/Frente/F1.jpg',
    'lib/images/Frente/F2.jpg',
    'lib/images/Frente/F3.jpg',
    'lib/images/Frente/F4.jpg',
    'lib/images/Frente/F5.jpg',
    'lib/images/Frente/F6.jpg',
  ];

  List<String> pathsVerso = [
    'lib/images/Verso/V1.jpg',
    'lib/images/Verso/V2.jpg',
    'lib/images/Verso/V3.jpg',
    'lib/images/Verso/V4.jpg',
    'lib/images/Verso/V5.jpg',
    'lib/images/Verso/V6.jpg',
  ];

  _mudarImagem(int randomNumber) {
    if (frenteExposta) {
      imagemMostrada = pathsVerso[randomNumber];
      frenteExposta = false;
      setState(() {});
    } else {
      imagemMostrada = pathsFrente[randomNumber];
      frenteExposta = true;
      setState(() {});
    }
  }

  _gerarNovaImagem() {
    var rng = new Random();
    randomNumber = rng.nextInt(5); // Selecionando o número randomico
    print(randomNumber);

    imagemMostrada = pathsFrente[randomNumber];

    setState(() {});

    print(pathsFrente[randomNumber]);
    print(pathsVerso[randomNumber]);
  }

  @override
  void initState() {
    super.initState();
    imagemMostrada = pathsFrente[randomNumber];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () => _mudarImagem(randomNumber),
          child: Image.asset(
            imagemMostrada,
            width: MediaQuery.of(context).size.width / 1.25,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('gerando nova imagem');
          _gerarNovaImagem();
        },
        tooltip: 'Gerar nova estória',
        child: Icon(
          Icons.compare_arrows,
          size: 50,
        ),
      ),
    );
  }
}
