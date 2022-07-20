import 'package:fashionstore/configs/colors.dart';
import 'package:fashionstore/widgets/dottedline.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StepsBar extends StatelessWidget {
  final int step;
  const StepsBar({this.step = 0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Icon(FontAwesomeIcons.mapMarkerAlt, color: (step > 0) ? primaryColor : textLightColor, size: 22),
          SizedBox(width: 20),
          Expanded(child: DottedLine(height: 4, dashWidth: 4, dashSpace: 4, color: (step > 1) ? primaryColor : textLightColor)),
          SizedBox(width: 20),
          Icon(FontAwesomeIcons.solidCreditCard, color: (step > 1) ? primaryColor : textLightColor, size: 22),
          SizedBox(width: 20),
          Expanded(child: DottedLine(height: 4, dashWidth: 4, dashSpace: 4, color: (step > 2) ? primaryColor : textLightColor)),
          SizedBox(width: 20),
          Icon(FontAwesomeIcons.solidCheckCircle, color: (step > 2) ? primaryColor : textLightColor, size: 22),
        ],
      ),
    );
  }
}
