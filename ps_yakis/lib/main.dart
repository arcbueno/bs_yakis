import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ps_yakis/listAssets.dart';

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
  int randomNumber = 0;

  var pathsVerso = AssetsList.pathsVerso;
  var pathsFrente = AssetsList.pathsFrente;

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
    randomNumber = rng.nextInt(50); // Selecionando o número randomico
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
      floatingActionButton: Container(
        height: 70,
        width: 70,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              print('gerando nova imagem');
              _gerarNovaImagem();
            },
            tooltip: 'Gerar nova estória',
            backgroundColor: Colors.transparent,
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.transparent,
              child: Image.asset('lib/images/yakizinho_transparent.png'),
            ),
          ),
        ),
      ),
    );
  }
}
