import 'package:fashionstore/configs/applocalizations.dart';
import 'package:fashionstore/configs/colors.dart';
import 'package:flutter/material.dart';

class MyDevices extends StatelessWidget {
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
        title: Text(AppLocalizations.of(context).translate('my_devices'), style: TextStyle(color: primaryColor, fontWeight: FontWeight.w700)),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          listItem('Redmi Note 9S'),
          listItem('Infinix X652A'),
          listItem('Iphone X Max'),
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
        child: Row(
          children: <Widget>[
            Icon(Icons.phone_iphone, size: 30, color: textMidColor),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(title,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0.5, color: primaryColor)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
