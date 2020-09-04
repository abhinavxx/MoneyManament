import 'package:flutter/material.dart';
import 'package:moneyManager/Screens/add_money.dart';
import 'package:moneyManager/Screens/contactList.dart';
import 'package:moneyManager/Screens/transactionPage.dart';

//HomeScreen of App
class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        //At the top right we have transaction details page
        actions: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  icon: Icon(Icons.equalizer),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TransactionPage()));
                  })),
        ],
        title: Text(
          "Hello Abhinav!",
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
        ),
      ),

      //Stack is used for overlaying card
      body: new Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            child: Container(
              color: Colors.deepPurple,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .25,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .10,
            left: 15,
            right: 15,
            child: Container(
              child: Column(children: [
                Text(
                  "₹ 20,000",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                Text(
                  "Total Money",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                Card(
                  elevation: 8,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    width: MediaQuery.of(context).size.height * .90,
                    height: 160,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddMoney()));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.add,
                                  color: Colors.deepPurple,
                                  size: 45,
                                ),
                                Text("Add Money")
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 2,
                          color: Colors.deepPurple,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ContactList()));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.payment,
                                  color: Colors.deepPurple,
                                  size: 45,
                                ),
                                Text("PAYMENT")
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                //It shows recent two transaction
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 20, bottom: 14, left: 14),
                    child: Text(
                      "Recent Transaction",
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Card(
                  elevation: 8,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    width: MediaQuery.of(context).size.height * .90,
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "↓ ₹ 4,000",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.green),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 12, bottom: 0),
                                  child: Text(
                                    "Dated:04/08/2020",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.blueGrey),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 45,
                          width: 2,
                          color: Colors.deepPurple,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Deepak",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 8,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    width: MediaQuery.of(context).size.height * .90,
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "↑ ₹ 2,000",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.redAccent),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 12, bottom: 0),
                                  child: Text(
                                    "Dated:31/07/2020",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.blueGrey),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 45,
                          width: 2,
                          color: Colors.deepPurple,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Rahul Singh",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
