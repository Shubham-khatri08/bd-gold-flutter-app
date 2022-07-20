import 'package:fashionstore/configs/applocalizations.dart';
import 'package:fashionstore/configs/colors.dart';
import 'package:flutter/material.dart';

class MyAddress extends StatefulWidget {
  @override
  _MyAddressState createState() => _MyAddressState();
}

class _MyAddressState extends State<MyAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        elevation: 0,
        iconTheme: IconThemeData(color: primaryColor),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(AppLocalizations.of(context).translate('my_address'), style: TextStyle(color: primaryColor, fontWeight: FontWeight.w700)),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          listItem(AppLocalizations.of(context).translate('my_home_address')),
          listItem(AppLocalizations.of(context).translate('office_address'))
        ],
      ),
    );
  }

  Widget listItem(String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 10)],
          borderRadius: BorderRadius.circular(12),
          color: Colors.white
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0.5, color: primaryColor)),
            lineSeparator(),
            Text('House No 103C Martha Street Whipoorwill, AZ 87300',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 0.5, color: textMidColor)),
            SizedBox(height: 20),
            lineSeparator(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(AppLocalizations.of(context).translate('shipping'),
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: 0.5, color: textMidColor)),
                Text('Standard Shipping',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: 0.5, color: textMidColor)),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(AppLocalizations.of(context).translate('identification_no'),
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: 0.5, color: textMidColor)),
                Text('54003294834',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: 0.5, color: textMidColor)),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget lineSeparator() {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: SizedBox(
          width: 80,
          child: Divider(height: 20, thickness: 2, color: lineColor.withOpacity(0.5))
      ),
    );
  }
}
