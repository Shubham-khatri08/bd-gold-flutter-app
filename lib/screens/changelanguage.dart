import 'package:fashionstore/configs/applocalizations.dart';
import 'package:fashionstore/configs/colors.dart';
import 'package:flutter/material.dart';

class ChangeLanguage extends StatefulWidget {
  @override
  _ChangeLanguageState createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  String selectedCode = "en";

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
        title: Text(AppLocalizations.of(context).translate('change_language'), style: TextStyle(color: primaryColor, fontWeight: FontWeight.w700)),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          listItem('Arabic', 'ar'),
          listItem('German', 'de'),
          listItem('English', 'en'),
          listItem('French', 'fr'),
          listItem('Turkish', 'tr'),
          listItem('Urdu', 'ur')
        ],
      ),
    );
  }

  Widget listItem(String title, String countryCode) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 10)],
          borderRadius: BorderRadius.circular(12),
          color: Colors.white
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: () {
          setState(() => selectedCode = countryCode);
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: <Widget>[
              Icon(Icons.flag, size: 30, color: textMidColor),
              SizedBox(width: 15),
              Text(countryCode,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0.5, color: primaryColor)),
              SizedBox(width: 15),
              Text(title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0.5, color: primaryColor)),
              Expanded(child: SizedBox()),
              if (selectedCode == countryCode) ... [
                Icon(Icons.check, color: successColor)
              ]
            ],
          ),
        ),
      ),
    );
  }
}