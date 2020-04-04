// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'auth.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget{
   LoginPage({this.auth});
   final BaseAuth auth;
  @override
  State<StatefulWidget> createState() => new _LoginPageState();

}

enum Formtype{
  login,
  register
}

class _LoginPageState extends State<LoginPage>{

  final formkey = new GlobalKey<FormState>();

  // num = List(5);
  // num[0]= 1;



   

  String _email;
  String _password;
  String _name;
  Formtype _formtype = Formtype.login;


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

      if (_formtype == Formtype.login){

        String userid = await widget.auth.signinwithe_p(_email, _password);

      
// AuthResult user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
    print("Signin user: $userid");
    }else{
       String userid = await widget.auth.createide_p(_email, _password);
      // AuthResult newuser = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
print("Signin user: $userid");
    }
    }catch(e){

      print("error:$e");

    }
    
  }
}

void loginback(){
  formkey.currentState.reset();
    setState(() {
    _formtype = Formtype.login;
  });
}
void register(){
  formkey.currentState.reset();
  setState(() {
    _formtype = Formtype.register;
  });

}
  
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
    backgroundColor: Colors.white,
      appBar: new AppBar(
        title :Center(child: new Text('Charcha')),
      ),
      body: Column(
        children : <Widget>[
          SizedBox(height: 35.0,),
          Icon(
            Icons.account_circle,
            size: 60.0,
            color: Colors.lightBlue,
          ),
          //SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0,0.0,20.0,5.0),
              child: Form(
              key: formkey,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: forms(),
              ),
              ),
            ),
          Text("developers:"),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: _launchURLAd,
                child : Image.asset('assets/imgad.png',
                  width: 125,
                  height:200,
                  fit:BoxFit.fill,
              ),
              ),
              GestureDetector(
                onTap: _launchURLVk,
                child : Image.asset('assets/imgvk.png',
                  width: 125,
                  height:200,
                  fit:BoxFit.fill,
                ),
              ),
            ],
          ),
        ],

      ),
    );
  }

  List<Widget> forms(){

    if (_formtype ==  Formtype.login){
      return [

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
        SizedBox(height:25.0),
        new RaisedButton(
                  child: new Text('Login',style: new TextStyle( fontSize: 20.0 )),
                  onPressed: login,
               color: Colors.lightBlue,
                  
                  ),
        new FlatButton(onPressed: register,
                  child: new Text("Create an account", style: new TextStyle( fontSize: 20.0),)
                  ),

      ];

    }else{
      return [

        new TextFormField(decoration: new InputDecoration( labelText: "Name"),
        validator: (value) => value.isEmpty ? 'Name can\'t be empty':null,
        onSaved: (value) => _name,
        ),
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
                  
                  child: new Text('Create Account!',style: new TextStyle( fontSize: 20.0 )),
                  onPressed: login
                  
                  ),
        new FlatButton(onPressed: loginback,
                  child: new Text("Already have an account? Login", style: new TextStyle( fontSize: 20.0),)
                  )


      ];

    }

  }

}


// made some change

_launchURLAd() async {
  const url = 'https://github.com/ideallyadarsh';
  if (await canLaunch("https://github.com/ideallyadarsh")) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
_launchURLVk() async {
  const url = 'https://github.com/96vksingh';
  if (await canLaunch("https://github.com/96vksingh")) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


