import 'package:flutter/material.dart';
import 'package:moneyManager/Screens/calculation.dart';

class TransactionChat extends StatefulWidget {
  @override
  _TransactionChatState createState() => _TransactionChatState();
}

class _TransactionChatState extends State<TransactionChat> {
  List<String> _messages;

  TextEditingController textEditingController;
  ScrollController scrollController;

  bool enableButton = false;

  @override
  void initState() {
    _messages = List<String>();
    //these are default message
    _messages.add("Hi! How are you?");
    _messages.add("I'm fine. thanks");

    textEditingController = TextEditingController();

    scrollController = ScrollController();

    super.initState();
  }

  void handleSendMessage() {
    var text = textEditingController.value.text;
    textEditingController.clear();
    setState(() {
      _messages.add(text);
      enableButton = false;
    });

    Future.delayed(Duration(milliseconds: 100), () {
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          curve: Curves.ease, duration: Duration(milliseconds: 500));
    });
  }

  @override
  Widget build(BuildContext context) {
    final String todo = ModalRoute.of(context).settings.arguments;
    //this is used to make messagetyping box
    var textInput = Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: TextField(
              onChanged: (text) {
                setState(() {
                  enableButton = text.isNotEmpty;
                });
              },
              decoration: InputDecoration.collapsed(
                hintText: "Type a message",
              ),
              controller: textEditingController,
            ),
          ),
        ),
        enableButton
            ? IconButton(
                color: Theme.of(context).primaryColor,
                icon: Icon(
                  Icons.send,
                ),
                disabledColor: Colors.grey,
                onPressed: handleSendMessage,
              )
            : IconButton(
                color: Colors.blue,
                icon: Icon(
                  Icons.send,
                ),
                disabledColor: Colors.grey,
                onPressed: null,
              )
      ],
    );
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5, left: 2),
              child: CircleAvatar(
                child: Text(todo[0]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(todo,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                      fontFamily: 'sans-serif-light',
                      color: Colors.black)),
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                bool reverse = false;

                if (index % 2 == 0) {
                  reverse = true;
                }

                var avatar = Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, bottom: 8.0, right: 8.0),
                  child: CircleAvatar(
                    child: Text(todo[0]),
                  ),
                );

                var triangle = CustomPaint(
                  painter: Triangle(),
                );

                var messagebody = DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(_messages[index]),
                    ),
                  ),
                );

                Widget message;

                if (reverse) {
                  message = Stack(
                    children: <Widget>[
                      messagebody,
                      Positioned(right: 0, bottom: 0, child: triangle),
                    ],
                  );
                } else {
                  message = Stack(
                    children: <Widget>[
                      Positioned(left: 0, bottom: 0, child: triangle),
                      messagebody,
                    ],
                  );
                }

                if (reverse) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: message,
                      ),
                      avatar,
                    ],
                  );
                } else {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      avatar,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: message,
                      ),
                    ],
                  );
                }
              },
            ),
          ),
          Divider(height: 2.0),
          textInput,
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),

                        //Button for Send
                        child: MaterialButton(
                          color: Colors.green,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MoneyCalculation()));
                          },
                          child: Text("SEND"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),

                        //Button for sale
                        child: MaterialButton(
                          color: Colors.redAccent,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MoneyCalculation()));
                          },
                          child: Text("RECEIVE"),
                        ),
                      ),
                    ],
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

//used for dialogbox design
class Triangle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = Colors.white;

    var path = Path();
    path.lineTo(10, 0);
    path.lineTo(0, -10);
    path.lineTo(-10, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
