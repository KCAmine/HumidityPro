import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff131e38),
      body: Center(
        child: ElevatedButton(
          child: Text("Crée un diagnostic"),
          onPressed: (){},
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(20.0),
            fixedSize: Size(290, 75),
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            backgroundColor: const Color.fromARGB(255, 184, 218, 164),
            foregroundColor: Colors.black,
            elevation: 10

          ),
        ),
      ),
    );
  }


}

