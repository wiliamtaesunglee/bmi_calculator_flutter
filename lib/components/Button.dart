import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({Key? key, required this.label, required this.onPress}) : super(key: key);
  final String label;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Text(
          label,
          style: KButtonLabelTextStyle,
        ),
        color: KBottomContainerColor,
        margin: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 80,
      ),
    );
  }
}
