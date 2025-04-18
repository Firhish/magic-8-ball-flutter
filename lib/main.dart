import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(EightBallPage());

// allows to rebuild upon hot reload
class EightBallPage extends StatelessWidget {
  const EightBallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Ask me anything',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: EightBall(),
        backgroundColor: Colors.blueGrey[800],
      ),
    );
  }
}

// allows to rebuild upon setState() triggeres
class EightBall extends StatefulWidget {
  const EightBall({super.key});
  @override
  State<EightBall> createState() => _EightBallState();
}

class _EightBallState extends State<EightBall> {
  int imageNumber = 0;
  void updateImageNumber() {
    setState(() {
      imageNumber = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: double.infinity),
        if (imageNumber <= 0)
          ElevatedButton(
            onPressed: () => updateImageNumber(),
            child: Text('Tap here to start'),
          ),
        if (imageNumber > 0)
          TextButton(
            onPressed: () => updateImageNumber(),
            child: Image.asset('images/ball$imageNumber.png'),
          )
      ],
    ));
  }
}
