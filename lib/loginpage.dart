import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => new _LoginPageState();


}

class _LoginPageState extends State<LoginPage>{

  final formkey = new GlobalKey<FormState>();

  String _email;
  String _password;

  bool validateandsave(){

    final form = formkey.currentState;
    if(form.validate()){
      form.save();
      return true;
       
    }
    
      return false;
    

  }


void login() async {
  if (validateandsave()){
    try {
AuthResult user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
    print("Signin user: ${user.user.uid}");
    }catch(e){

      print("error:$e");

    }
    
  }
}

void register(){
  
}
  
  @override
  Widget build(BuildContext context) {
 
    return new Scaffold(
      appBar: new AppBar(
        title :new Text('Flutter login'),
      ),
      body: new Container(
          child: new Form(
            key: formkey,


            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new TextFormField(
                  decoration: new InputDecoration(labelText: 'Email'),

                  validator: (value) => value.isEmpty ? 'Email can\'t be empty':null,
                  onSaved: (value) => _email=value
                ),
                new TextFormField(
                  decoration: new InputDecoration(labelText: 'Password' ),
                  validator: (value) => value.isEmpty ? 'Password can\'t be empty':null,
                  obscureText: true,
                  onSaved: (value) => _password=value
                ),
                new RaisedButton(
                  
                  child: new Text('Login',style: new TextStyle( fontSize: 20.0 )),
                  onPressed: login
                  
                  ),
                  new FlatButton(onPressed: resgister,
                  child: new Text("Create an account", style: new TextStyle( fontSize: 20.0),)
                  )


              ]
            )
            
            ),

          )
        
        
    );
  }

}


// made some change




