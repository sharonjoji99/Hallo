import 'package:flutter/material.dart';
import 'package:hallo/components/hallo_text_field.dart';
import 'package:hallo/services/auth.dart';
import 'package:hallo/shared/loading.dart';

class SignIn extends StatefulWidget {

  String id = '/signin';

  final Function toggleView;

  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading =false ;
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() :Scaffold(
        backgroundColor: Theme
            .of(context)
            .primaryColor,
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .accentColor,
          elevation: 0.0,
          title: Text("Sign in to Hallo",
              style: TextStyle(fontWeight: FontWeight.bold,)
          ),
        ),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
            child: Form(
              key: _formkey,
              child: Container(

                child: ListView(

                  children: <Widget>[

                    Container(
                      //margin: const EdgeInsets.fromLTRB(0, 0, 0, 100.0),
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            'images/hallo.png',
                            scale: 5,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'HALLO',
                            style: TextStyle(
                              //fontFamily: 'Pacifico',
                              color: Colors.white70,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    ),
//end of logo and name

// form start       TextField(String text,String mail,String hint),
                    HalloTextField(
                      text: "Enter email",
                      hint: 'Email',
                      onChangedText: (val) {
                        setState(() {
                          email = val; //String mail
                        });
                      },
                      isPassword: false,
                    ),
//end of mail id field
                    SizedBox(
                      height: 10,
                    ),
                    HalloTextField(
                      text: "Enter password that is atleaat 6 characters long",
                      hint: 'Password',
                      onChangedText: (val) {
                        setState(() {
                          password = val; //String mail
                        });
                      },
                      isPassword: true,
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 12, horizontal: 50),

                      color: Theme
                          .of(context)
                          .cardColor,
                      child: Text(
                        "Sign in",
                        style: Theme
                            .of(context)
                            .textTheme
                            .button,
                      ),

                      onPressed: () async {
                        print("Email:$email");
                        print("password:$password");

                        if (_formkey.currentState.validate()) {
                          setState(() {
                            loading=true;
                          });
                          dynamic result = await _auth
                              .signInWithEmailAndPassword(email, password);
                          if (result == null) {

                            setState(() {
                              error = 'Could Not Sign in with Credentials';
                              loading=false;
                            });
                          }
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 12, horizontal: 50),
                      color: Theme
                          .of(context)
                          .cardColor,
                      child: Text(
                        "Register",
                        style: Theme
                            .of(context)
                            .textTheme
                            .button,
                      ),
                      onPressed: () {
                        widget.toggleView();
                      },
                    ),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    )
                  ],
                ),
              ),
            )));
  }
}
