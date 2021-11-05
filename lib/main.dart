import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_9/data/user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_9/data/user_builder.dart';
import 'package:flutter_9/shared/function.dart';
import 'package:flutter_9/transaction_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        scaffoldBackgroundColor: Colors.amber[100],
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController txtuserid = TextEditingController();
  TextEditingController txtpassword = TextEditingController();
  User_Builder user = User_Builder();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: screenHeight / 3,
          ),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: SizedBox(
                    height: 70,
                    child: Image.asset("images/logo.png"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 40),
                  child: Text("Barbershop bang nunu",
                      style: GoogleFonts.lobster(
                        fontSize: 25,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, bottom: 15, top: 5),
                  child: TextField(
                    controller: txtuserid,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "User id",
                        hintText: "User id"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, bottom: 15, top: 5),
                  child: TextField(
                    controller: txtpassword,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Password",
                        hintText: "Password"),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (txtuserid.text == '' || txtpassword.text == '') {
                      showInfo('Data user id dan passwordnya ga ada bro');
                      return;
                    }

                    bool isLoginValid = user.cekLogin(
                        txtuserid.text.toString(), txtpassword.text.toString());

                    if (isLoginValid) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TransactionList(
                            userid: txtuserid.text.toString(),
                          ),
                        ),
                      );
                    } else {
                      showInfo(
                          'Gagal login bro user id dan passwordnya salah bro');
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 40, right: 40, top: 12, bottom: 12),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.deepOrange),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
