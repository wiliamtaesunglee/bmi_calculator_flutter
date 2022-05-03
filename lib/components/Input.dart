
import 'package:flutter/material.dart';

class ReusableCard extends StatefulWidget {
  const ReusableCard({Key? key, required this.color, required this.inputChildren}) : super(key: key);
  final Color color;
  final Widget inputChildren;
  @override
  State<ReusableCard> createState() => _ReusableCardState();
}

class _ReusableCardState extends State<ReusableCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
          child: widget.inputChildren,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.all(7.5),
          decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(10.0),
          ),
        );
  }
}
