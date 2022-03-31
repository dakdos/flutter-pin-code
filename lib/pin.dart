
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';



class Pin extends StatefulWidget {

  const Pin({Key? key}): super(key: key);

  @override
  _PinState createState() => _PinState();
}

class _PinState extends State<Pin> {

  TextEditingController controller = TextEditingController(text: "");
  String thisText = "";
  int pinLength = 4;
  bool hasError = false;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: const Text('Pin'),
     ), 
     body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          Align(
            child: PinCodeTextField(
              autofocus: false,
              controller: controller,
              hideCharacter: false,
              highlight: false,
              pinBoxBorderWidth: 1.0,
              highlightColor: Colors.red,
              defaultBorderColor: Colors.grey,
              hasTextBorderColor: Colors.grey,
              highlightPinBoxColor: Colors.white,
              maxLength: 4,
              hasError: hasError,
              onDone: (text) {},
              pinBoxWidth: 60,
              pinBoxHeight: 60,
              hasUnderline: false,
              wrapAlignment: WrapAlignment.spaceAround,
              pinBoxDecoration: ProvidedPinBoxDecoration.defaultPinBoxDecoration,
              pinTextStyle: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold, 
                color: Colors.black,
              ),
              pinTextAnimatedSwitcherTransition: ProvidedPinBoxTextAnimation.awesomeTransition,
              pinBoxColor : Colors.white,
              pinTextAnimatedSwitcherDuration: const Duration(milliseconds: 300),
              highlightAnimation: false,
              highlightAnimationBeginColor: Colors.black,
              highlightAnimationEndColor: Colors.white12,
              keyboardType: TextInputType.number,
            ),
          )
        ],
     ),
   );
  }
}