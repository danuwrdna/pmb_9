import 'package:flutter/material.dart';
import 'package:flutter_9/data/user.dart';
import 'package:flutter_9/data/user_builder.dart';
import 'package:numeral/numeral.dart';

class TransactionInput extends StatefulWidget {
  final String userid;
  const TransactionInput({required this.userid, Key? key}) : super(key: key);

  @override
  _TransactionInputState createState() => _TransactionInputState();
}

class _TransactionInputState extends State<TransactionInput> {
  User_Builder userdata = User_Builder();
  String userActive = '';

  int dewasaQty = 0;
  int anakQty = 0;
  int catQty = 0;
  int jenggotQty = 0;

  double totalPayment = 0;

  @override
  void initState() {
    List<User> userlist = userdata.userdata;
    userActive = userdata.getName(userlist, this.widget.userid);
    super.initState();
  }

  void counterAdd(int id) {
    setState(() {
      if (id == 1) {
        dewasaQty++;
        totalPayment = totalPayment + 35000;
      } else if (id == 2) {
        anakQty++;
        totalPayment = totalPayment + 25000;
      } else if (id == 3) {
        jenggotQty++;
        totalPayment = totalPayment + 20000;
      } else if (id == 4) {
        catQty++;
        totalPayment = totalPayment + 100000;
      }
    });
  }

  void counterMin(int id) {
    setState(() {
      if (id == 1) {
        if (dewasaQty == 0) {
          dewasaQty = 0;
          return;
        }
        dewasaQty--;
        totalPayment = totalPayment - 35000;
      } else if (id == 2) {
        if (anakQty == 0) {
          anakQty = 0;
          return;
        }
        anakQty--;
        totalPayment = totalPayment - 25000;
      } else if (id == 3) {
        if (jenggotQty == 0) {
          jenggotQty = 0;
          return;
        }
        jenggotQty--;
        totalPayment = totalPayment - 20000;
      } else if (id == 4) {
        if (catQty == 0) {
          catQty = 0;
          return;
        }
        catQty--;
        totalPayment = totalPayment - 100000;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Input Transaction'),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.deepOrange,
                  ),
                  Text(
                    '' + userActive,
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Card(
                color: Colors.blueGrey[50],
                child: Center(
                  child: Text(
                    'Total: ' + Numeral(totalPayment).value(),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ListView(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Card(
                            color: Colors.teal[50],
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'images/adult.png',
                                  scale: 4,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Dewasa',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        counterMin(1);
                                      },
                                      icon: Icon(
                                        Icons.remove_circle_outline,
                                        color: Colors.deepPurple,
                                        size: 30,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      child: Text(
                                        dewasaQty.toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        counterAdd(1);
                                      },
                                      icon: Icon(
                                        Icons.add_circle_outline,
                                        color: Colors.deepPurple,
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Card(
                            color: Colors.teal[50],
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'images/kids.png',
                                  scale: 4,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Anak - anak',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        counterMin(2);
                                      },
                                      icon: Icon(
                                        Icons.remove_circle_outline,
                                        color: Colors.deepPurple,
                                        size: 30,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      child: Text(
                                        dewasaQty.toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        counterAdd(2);
                                      },
                                      icon: Icon(
                                        Icons.add_circle_outline,
                                        color: Colors.deepPurple,
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Card(
                            color: Colors.teal[50],
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'images/beard.png',
                                  scale: 4,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Jenggot',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        counterMin(3);
                                      },
                                      icon: Icon(
                                        Icons.remove_circle_outline,
                                        color: Colors.deepPurple,
                                        size: 30,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      child: Text(
                                        dewasaQty.toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        counterAdd(3);
                                      },
                                      icon: Icon(
                                        Icons.add_circle_outline,
                                        color: Colors.deepPurple,
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Card(
                            color: Colors.teal[50],
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'images/coloring.png',
                                  scale: 4,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Cat Rambut',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        counterMin(4);
                                      },
                                      icon: Icon(
                                        Icons.remove_circle_outline,
                                        color: Colors.deepPurple,
                                        size: 30,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      child: Text(
                                        dewasaQty.toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        counterAdd(4);
                                      },
                                      icon: Icon(
                                        Icons.add_circle_outline,
                                        color: Colors.deepPurple,
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.save),
          label: Text('Save'),
          backgroundColor: Colors.deepOrange,
          onPressed: () {
            Navigator.pop(context);
          },
        ));
  }
}
