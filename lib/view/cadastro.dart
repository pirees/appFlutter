import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trabalhounifacear/model/aluno.dart';

class cadastroAluno extends StatefulWidget {

  final Aluno aluno;

  const cadastroAluno({Key key, this.aluno}) : super(key: key);
  
  @override
  _cadastroAlunoState createState() => _cadastroAlunoState();
}

class _cadastroAlunoState extends State<cadastroAluno> {

  //CONEXAO FIREBASE
  final db = Firestore.instance;

  //CONTROLLERS PARA PEGAR AS INFOS
  TextEditingController _nomeController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _senhaController = new TextEditingController();

  

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.lightBlueAccent,
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Text(
              "Cadastre-se",
              style: TextStyle(
              color: Colors.white,
              fontSize: 50,
              ),
              textAlign: TextAlign.center,            
             ),
             SizedBox(
              height: 80,
            ),
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: "NOME",
                labelStyle: TextStyle(
                  color: Colors.white
                ),
              ),
              style: TextStyle(
                fontSize: 20,
                color: Colors.white
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "EMAIL",
                labelStyle: TextStyle(
                  color: Colors.white
                ),  
              ),
              style: TextStyle(
                fontSize: 20,
                color: Colors.white
              ),
            ),
             SizedBox(
              height: 30,
            ),
            TextField(
              controller: _senhaController,
              decoration: InputDecoration(labelText: "SENHA",
                labelStyle: TextStyle(
                  color: Colors.white
                ),
              ),
              obscureText: true,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white
              ),
            ),
            SizedBox(
              height: 100,
            ),
            FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.white)
              ),
              child: Text('Enviar',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white
                ),
              ), 
              onPressed: () {
                  db.collection("alunos").add({
                    "nome": _nomeController.text,
                    "email": _emailController.text,
                    "senha": _senhaController.text,
                  });
              },
            )]  
        ),
      ),
    );
  }
}