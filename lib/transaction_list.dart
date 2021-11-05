import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_9/data/pos_builder.dart';
import 'package:flutter_9/data/user.dart';
import 'package:flutter_9/data/user_builder.dart';
import 'package:flutter_9/transaction_input.dart';

class TransactionList extends StatefulWidget {
  final String userid;
  const TransactionList({required this.userid, Key? key}) : super(key: key);

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  Pos_Builder posdata = Pos_Builder();
  User_Builder userdata = User_Builder();
  String userActive = '';

  @override
  void initState() {
    List<User> userlist = userdata.userdata;
    userActive = userdata.getName(userlist, this.widget.userid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Transaksi',
        ),
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
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Card(
                  color: Colors.teal[50],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.receipt_long,
                            size: 30,
                            color: Colors.indigo,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              posdata.getTotalItems(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo,
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.account_balance_wallet,
                            size: 30,
                            color: Colors.indigo,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              posdata.getTotalTransaksi(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
          Expanded(
            flex: 5,
            child: ListView.builder(
              physics: ScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: posdata.pos_list.length,
              itemBuilder: (BuildContext, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Card(
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Icon(
                          Icons.receipt_long,
                          color: Colors.teal,
                        ),
                      ),
                      title: Text(
                        posdata.getItems(index) + 'Items',
                      ),
                      subtitle: Text(
                        posdata.getTanggal(index),
                      ),
                      trailing: Text(
                        posdata.getTotal(index),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TransactionInput(
                userid: this.widget.userid,
              ),
            ),
          );
        },
        label: Text('Add Transaction'),
        icon: Icon(Icons.add_circle_outline),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}
