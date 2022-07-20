import 'package:fashionstore/configs/applocalizations.dart';
import 'package:fashionstore/configs/colors.dart';
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
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
        title: Text(AppLocalizations.of(context).translate('notifications'), style: TextStyle(color: primaryColor, fontWeight: FontWeight.w700)),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          listItem('Account Creation', "Thanks for creating Fashion Store account.", "23 Jun, 2020"),
          listItem('Order Success', "Your order has been placed successfully.", "02 Jul, 2020"),
          listItem('Order Delivered', "Your order has been delivered at your doorstep. For any issue contact us", "14 Jul, 2020"),
        ],
      ),
    );
  }

  Widget listItem(String title, String description, String datetime) {
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
            Icon(Icons.notifications, size: 30, color: textMidColor),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(title,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0.5, color: primaryColor)),
                  SizedBox(height: 5),
                  Text(description,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 0.5, color: textMidColor)),
                  SizedBox(height: 5),
                  Text(datetime, textAlign: TextAlign.end,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.5, color: textMidColor)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
