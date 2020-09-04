import 'package:flutter/material.dart';
import 'package:moneyManager/Screens/transactionChatPage.dart';

class ContactList extends StatefulWidget implements PreferredSizeWidget {
  @override
  _ContactListState createState() => _ContactListState();

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}

class _ContactListState extends State<ContactList> {
  //list of name for contact list
  List<String> raw = ["Abhinav", "Rahul", "Sakshi", "Akudo"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,

        title: GestureDetector(
          onTap: () {
            //this function helps in searchOption
            openSearch();
          },
          child: Text(
            "Search Contacts",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black), //add this line here
      ),
      body: Column(
        children: [
          Flexible(
              child: ListView.builder(
                  itemCount: raw.length,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TransactionChat(),
                                    settings:
                                        RouteSettings(arguments: raw[index])));
                          },
                          leading: CircleAvatar(child: Text(raw[index][0])),
                          title: Text(
                            raw[index],
                            style: TextStyle(color: Colors.black),
                          ),
                        ));
                  }))
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: Colors.blueAccent,
          icon: Icon(
            Icons.person_add,
            color: Colors.black,
          ),
          label: Text("ADD CONTACTS")),
    );
  }

  void openSearch() {
    setState(() {
      showSearch(context: context, delegate: DataSearch());
      print("work");
    });
  }
}

//Search Delegates

class DataSearch extends SearchDelegate<String> {
  final cities = ["Sakshi", "Abhinav", "Rahul", "Akudo"];
  final recentCities = ["Sakshi", "Rahul"];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(
          query[0],
        ),
      ),
      title: Text(query,
          style: TextStyle(
            color: Colors.black,
          )),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentCities
        : cities.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.location_city),
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey),
                ),
              ]),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}
