import 'package:fashionstore/configs/applocalizations.dart';
import 'package:fashionstore/configs/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SelectLanguage extends StatefulWidget {
  @override
  _SelectLanguageState createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {

  AppLanguage appLanguage;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (appLanguage == null) {
      appLanguage = Provider.of<AppLanguage>(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark
      ),
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 10),
              Text(AppLocalizations.of(context).translate('select_language'), textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, letterSpacing: 0.5, color: textMidColor),
              ),
              SizedBox(height: 15),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFEEEEEE)),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white
                ),
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: 'Search',
                    hintStyle: TextStyle(fontWeight: FontWeight.w400, letterSpacing: 0.5, color: textLightColor),
                    border: InputBorder.none,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: primaryColor),
                  keyboardType: TextInputType.text,
                ),
              ),
              Flexible(
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    children: <Widget>[
                      listItem('Arabic', 'ar'),
                      listItem('German', 'de'),
                      listItem('English', 'en'),
                      listItem('French', 'fr'),
                      listItem('Turkish', 'tr'),
                      listItem('Urdu', 'ur')
                    ],
                  )
              )
            ],
          ),
        ),
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
        onTap: () async {
          await appLanguage.changeLanguage(Locale(countryCode));
          Navigator.pushNamed(context, "/selecttheme");
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: <Widget>[
              Icon(Icons.flag, size: 30, color: textMidColor),
              SizedBox(width: 20),
              Text(countryCode,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0.5, color: Colors.black)),
              SizedBox(width: 20),
              Expanded(
                child: Text(title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0.5, color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}