import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListPage(),
    );
  }
}

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Map<String, String>> users = [
    {"name": "Girish", "email": "girish@gmail.com"},
    {"name": "Rahul", "email": "rahul@gmail.com"},
    {"name": "Amit", "email": "amit@gmail.com"},
    {"name": "Sneha", "email": "sneha@gmail.com"},
    {"name": "Neel", "email": "neel@gmail.com"},
    {"name": "Yash", "email": "yash@gmail.com"},
    {"name": "Abhiram", "email": "abhiram@gmail.com"}
  ];

  List<Map<String, String>> filteredUsers = [];

  @override
  void initState() {
    super.initState();
    filteredUsers = users;
  }

  void searchUser(String query) {
    setState(() {
      filteredUsers = users
          .where((user) =>
          user["name"]!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void addUser(String name, String email) {
    setState(() {
      users.add({"name": name, "email": email});
      filteredUsers = users;
    });
  }

  void deleteUser(int index) {
    setState(() {
      users.removeAt(index);
      filteredUsers = users;
    });
  }

  void showAddDialog() {
    String name = "";
    String email = "";

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add User"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: "Name"),
                onChanged: (value) => name = value,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Email"),
                onChanged: (value) => email = value,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                addUser(name, email);
                Navigator.pop(context);
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User List"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: showAddDialog,
          )
        ],
      ),

      body: Column(
        children: [

          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search user...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: searchUser,
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {

                var user = filteredUsers[index];

                return Card(
                  margin: EdgeInsets.all(10),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(user["name"]![0]),
                    ),
                    title: Text(user["name"]!),
                    subtitle: Text(user["email"]!),

                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(user["name"]!),
                          content: Text(user["email"]!),
                        ),
                      );
                    },

                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => deleteUser(index),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}