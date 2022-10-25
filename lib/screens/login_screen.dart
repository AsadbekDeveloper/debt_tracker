import 'package:flutter/material.dart';
import './registration_screen.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class MyLogin extends StatefulWidget {
  static final id = 'login';
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

final _auth = FirebaseAuth.instance;
final emailCont = TextEditingController();
final passCont = TextEditingController();
bool _saving = false;

class _MyLoginState extends State<MyLogin> {
  @override
  void signIn(email, password) async {
    setState(() {
      _saving = true;
    });
    try {
      var user =
          _auth.signInWithEmailAndPassword(email: email, password: password);
        Navigator.pushNamed(context, '/');
      setState(() {
        _saving = false;
      });
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Container(
        decoration: const BoxDecoration(
          color: mainBlue,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ModalProgressHUD(
            inAsyncCall: _saving,
            child: Stack(
              children: [
                Container(),
                Container(
                  padding: const EdgeInsets.only(left: 35, top: 130),
                  child: const Text(
                    'Welcome\nBack',
                    style: TextStyle(color: Colors.white, fontSize: 33),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 35, right: 35),
                          child: Column(
                            children: [
                              TextField(
                                controller: emailCont,
                                style: const TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: "Email",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              TextField(
                                controller: passCont,
                                style: const TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: "Password",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Sign in',
                                    style: TextStyle(
                                        fontSize: 27,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: const Color(0xff4c505b),
                                    child: IconButton(
                                        color: Colors.white,
                                        onPressed: (() => signIn(
                                            emailCont.text, passCont.text)),
                                        icon: const Icon(
                                          Icons.arrow_forward,
                                        )),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, MyRegister.id);
                                    },
                                    child: const Text(
                                      'Sign Up',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Color(0xff4c505b),
                                          fontSize: 18),
                                    ),
                                    style: const ButtonStyle(),
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Forgot Password',
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Color(0xff4c505b),
                                          fontSize: 18,
                                        ),
                                      )),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
