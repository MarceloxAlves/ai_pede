import 'package:ai_pede/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

enum FormType { login, registrar }

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  FormType _formType = FormType.login;
  FirebaseUser user;

  bool validar() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }

    return false;
  }

  Future submit() async {
    if (validar()) {
      try {
        if (_formType == FormType.login) {
          user = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: _email, password: _password);
          checkLogin();
        } else {
          user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: _email, password: _password);
          checkLogin();
        }
      } catch (e) {
        Scaffold.of(formKey.currentContext)
            .showSnackBar(SnackBar(content: Text('$e')));
      }
    }
  }

  void loginGoogle() async {
    final FirebaseAuth _fAuth = FirebaseAuth.instance;
    final GoogleSignIn _gSignIn = new GoogleSignIn();

    GoogleSignInAccount googleSignInAccount = await _gSignIn.signIn();
    GoogleSignInAuthentication authentication =
        await googleSignInAccount.authentication;

    user = await _fAuth.signInWithGoogle(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken);
    checkLogin();
  }

  void checkLogin() async {
    if (user == null) {
      user = await FirebaseAuth.instance.currentUser();
    }

    if (user != null) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomeSreen()));
    }
  }

  void moveToRegister() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.registrar;
    });
  }

  void moveToLogin() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  Widget buildInputs() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ListTile(
          trailing: Icon(Icons.email),
          title: TextFormField(
            decoration: new InputDecoration(labelText: 'Email'),
            validator: (value) =>
                value.isEmpty ? 'Email não pode estar  vazio!' : null,
            onSaved: (value) => _email = value,
          ),
        ),
        ListTile(
          trailing: Icon(Icons.lock),
          title: TextFormField(
            decoration: new InputDecoration(labelText: 'Password'),
            validator: (value) =>
                value.isEmpty ? 'Senha não pode estar vazio!' : null,
            obscureText: true,
            onSaved: (value) => _password = value,
          ),
        )
      ],
    );
  }

  Widget submitButtons() {
    if (_formType == FormType.login) {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            RaisedButton(
                color: Colors.orangeAccent,
                padding: EdgeInsets.all(16.0),
                child: new Text('Login',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    )),
                onPressed: submit),
            RaisedButton(
                color: Colors.green,
                onPressed: loginGoogle,
                padding: EdgeInsets.all(8),
                child: Text('Login com Google',
                    style: TextStyle(fontSize: 20, color: Colors.white))),
            FlatButton(
                onPressed: moveToRegister,
                padding: EdgeInsets.all(8),
                child: Text('Crie sua conta', style: TextStyle(fontSize: 20))),
          ]);
    } else {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            RaisedButton(
                color: Colors.orangeAccent,
                padding: EdgeInsets.all(16.0),
                child: new Text(
                  'Criar conta ',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: submit),
            FlatButton(
                onPressed: moveToLogin,
                padding: EdgeInsets.all(8),
                child: Text('Tem uma conta? Login',
                    style: TextStyle(fontSize: 20)))
          ]);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: FutureBuilder<FirebaseUser>(
          future: FirebaseAuth.instance.currentUser(),
          builder: (context, currentUser) {
            if (currentUser.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.deepOrange,
                ),
              );
            } else {
              return Container(
                padding: EdgeInsets.all(16.0),
                child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(child: buildInputs()),
                        submitButtons()
                      ],
                    )),
              );
            }
          },
        ));
  }
}
