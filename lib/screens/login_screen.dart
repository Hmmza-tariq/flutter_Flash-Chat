import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:cool_alert/cool_alert.dart';
import '../Components/RoundedButton.dart';
import '../constants.dart';
import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static String id = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: "logo",
                  child: SizedBox(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your email '),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password '),
              ),
              const SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                  title: 'Log in',
                  color: Colors.lightBlueAccent,
                  onPRESS: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    } catch (e) {
                      String errorMessage = "";
                      if (e.toString().contains("The email address is badly formatted.")) {
                        errorMessage = "The email address is badly formatted.";
                      } else if (e.toString().contains("empty")) {
                        errorMessage = "Blank email or password";
                      } else if (e.toString().contains("The password is invalid or the user does not have a password.")) {
                        errorMessage ="Invalid Password.";
                      }else if (e.toString().contains("A network error (such as timeout, interrupted connection or unreachable host) has occurred.")) {
                        errorMessage ="No Internet connection.";
                      } else if (e.toString().contains("The email address is already in use by another account.")) {
                        errorMessage ="Email already registered.";
                      } else {
                        errorMessage = "Unknown Error Occurred";
                      }

                      CoolAlert.show(
                        context: context,
                        type: CoolAlertType.error,
                        text: errorMessage,
                      );
                      setState(() {
                        showSpinner = false;
                      });
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
