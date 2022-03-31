
import 'package:flutter/material.dart';
class Sound extends StatefulWidget {
  const Sound({Key? key}):super(key: key);
  @override 
  _SoundState createState() => _SoundState();
}

class _SoundState extends State<Sound> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar( 
       title: const Text('Sound'),
     ),
    );
  }
}