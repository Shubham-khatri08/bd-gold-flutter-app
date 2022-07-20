import 'package:fashionstore/configs/colors.dart';
import 'package:flutter/material.dart';

class NumberButton extends StatefulWidget {
  final int value;
  final int maxValue;
  NumberButton({this.value = 0, this.maxValue = 15});
  @override
  _NumberButtonState createState() => _NumberButtonState();
}

class _NumberButtonState extends State<NumberButton> {
  int value;

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: backgroundColor
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  child: Icon(Icons.remove, color: primaryColor, size: 20),
                  onPressed: () {
                    if (value > 0)
                      setState(() => value--);
                  },
                ),
              ),
              Expanded(
                  child: Center(
                      child: Text(value.toString(),
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, letterSpacing: 0.5, color: primaryColor))
                  )
              ),
              Expanded(
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  child: Icon(Icons.add, color: primaryColor, size: 20),
                  onPressed: () {
                    if (value < widget.maxValue)
                      setState(() => value++);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}