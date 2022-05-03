
import 'package:bmi_calculator/components/Input.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'package:flutter/cupertino.dart';

class GenderInput extends StatefulWidget {
  const GenderInput({
    Key? key,
    required this.gender,
    required this.onPress,
    required this.color
  }) : super(key: key);
  final String gender;
  final Function onPress;
  final Color color;
  @override
  State<StatefulWidget> createState() => _GenderInput();
}

class _GenderInput extends State<GenderInput> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPress();
      },
      child: ReusableCard(
        inputChildren: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.gender == 'FEMALE' ? FontAwesomeIcons.venus : FontAwesomeIcons.mars,
              size: 80.0,
            ),
            const SizedBox(
              height: 15.0,
            ),
            Text(
                widget.gender,
                style: KLabelTextStyle
            ),
          ],
        ), color: widget.color,
      ),
    );
  }
}
