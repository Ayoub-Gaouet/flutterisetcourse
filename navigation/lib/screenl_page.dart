import 'package:flutter/material.dart';
import 'package:navigation/routes.dart';

class Screen1 extends StatefulWidget {
  @override
  Screen1State createState() => Screen1State();
}

class Screen1State extends State<Screen1> {
  @override
  Widget build (BuildContext context) {
    return Scaffold ( backgroundColor: Colors.greenAccent,
      body: GestureDetector ( behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.of (context).pushNamed (PageRoutes.screen2_page);
        },
        child: Column (
        mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
          Center (
            child: Text ( "Screen1",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
        ),
      ),
    );
  }
}