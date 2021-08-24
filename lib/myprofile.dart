import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.yellow[100],
        appBar: AppBar(
          title: Center(child: Text('Ansh Profile')),
          backgroundColor: Colors.deepOrange,
        ),
        body: SafeArea(
            child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              CircleAvatar(
                radius: 50,
                foregroundImage: AssetImage('images/Ansh.jpeg'),
              ),
              SizedBox(height: 10),
              Text("Ansh Agrawal",
                  style: TextStyle(
                      fontSize: 45,
                      fontFamily: 'SourceSansPro',
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Text("FOUNDER, REALTALK",
                  style: TextStyle(fontSize: 25, fontFamily: 'SourceSansPro')),
              SizedBox(
                height: 25,
                child: Divider(color: Colors.black, thickness: 7, indent: 40, endIndent: 40)
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(5.0),
                    topRight: const Radius.circular(5.0),
                    bottomLeft: const Radius.circular(5.0),
                    bottomRight: const Radius.circular(5.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.phone, color: Colors.black, size: 35),
                    SizedBox(width: 25),
                    Text(
                      '+91 9319244052',
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(5.0),
                    topRight: const Radius.circular(5.0),
                    bottomLeft: const Radius.circular(5.0),
                    bottomRight: const Radius.circular(5.0),
                  ),
                ),
                child: ListTile(
                  leading: Icon(Icons.email, color: Colors.black, size: 35),
                  title: Text(
                    'ansh.agrawal@joinrealtalk.co',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
