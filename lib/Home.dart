import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerAlcool = new TextEditingController();
  TextEditingController _controllerGasolina = new TextEditingController();
  String _textoResultado = "";

  void _calcular(){
    //Necessario interrogacao no double para verificar se o resultado eh nulo ou nao
    //pois o _controller pode retornar nulo, mas double nao pode receber nulo
    double? precoAlcool = double.tryParse( _controllerAlcool.text );
    double? precoGasolina = double.tryParse( _controllerGasolina.text );

    if(precoAlcool == null || precoGasolina == null){

      setState(() {
        _textoResultado = ("Valores inválidos! Digite um valor maior que 0 e utilize ponto ( . )!");
      });


    }
    else{

      if((precoAlcool / precoGasolina) >= 0.7){
        setState(() {
          _textoResultado = ("Melhor utilizar gasolina!");
        });
      }
      else{
        setState(() {
          _textoResultado = ("Melhor utilizar alcool!");
        });
      }

    }
    //Limpa os campos
    //_limparCampos();

  }

  void _limparCampos (){
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alcool ou Gasolina?!"),
        backgroundColor: Colors.blueGrey,

      ),
      body: Container(

        //Define um scroll para a tela
        child: SingleChildScrollView(
          //Define uma borda para o conteudo da tela
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //Imagem logo
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("images/logo.png"),
              ),
              //Texto principal
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Alcool ou gasolina no seu carro? Descubra o melhor!",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              //Campo digitalvel preco alcool
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preço Alcool, ex: 5.29"
                ),
                style: TextStyle(
                    fontSize: 22
                ),
                controller: _controllerAlcool,
              ),
              //Campo digitável preco gasolina
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preço Gasolina, ex: 6.69"
                ),
                style: TextStyle(
                    fontSize: 22
                ),
                controller: _controllerGasolina,
              ),
              //Botao calcular
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: RaisedButton(
                  color: Colors.deepPurple,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text("Calcular",
                      style: TextStyle(
                          fontSize: 20
                      )
                  ),
                  onPressed: _calcular,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _textoResultado,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
