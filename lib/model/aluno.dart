class Aluno{
  String _id;
  String _nome;
  String _email;
  String _senha;

  Aluno(
    this._id,
    this._nome,
    this._email,
    this._senha);

  Aluno.map(dynamic obj){
    
    this._id = obj ['id'];
    this._nome = obj ['nome'];
    this._email = obj ['email'];
    this._senha = obj ['senha']; 
  }


  String get id => _id;
  String get nome => _nome;
  String get email => _email;
  String get senha => _senha;

  Map<String, dynamic> toMap(){
    var map = new Map<String, dynamic>();
    if (_id != null){
      map['id'] = _id;
    }

    map ['nome'] = _nome;
    map ['email'] = _email;
    map ['senha'] = _senha;

    return map;
  }

  Aluno.fromMap(Map<String, dynamic> map, String id){
    this._id = id ?? '';
    this._nome = map['nome'];
    this._email = map['email'];
    this._senha = map ['senha'];
  }
}