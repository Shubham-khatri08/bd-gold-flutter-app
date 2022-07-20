import 'package:fashionstore/configs/applocalizations.dart';
import 'package:fashionstore/configs/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SelectTheme extends StatefulWidget {
  @override
  _SelectThemeState createState() => _SelectThemeState();
}

class _SelectThemeState extends State<SelectTheme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          brightness: Brightness.light,
          elevation: 0,
          iconTheme: IconThemeData(color: primaryColor),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(AppLocalizations.of(context).translate('select_theme'), textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, letterSpacing: 0.5, color: textMidColor),
                    ),
                    SizedBox(height: 30),
                    colorButton(Color(0xFF282A2E), 'Black'),
                    SizedBox(height: 20),
                    colorButton(Color(0xFF3490eb), 'Blue'),
                    SizedBox(height: 20),
                    colorButton(Color(0xFFdb4e44), 'Red'),
                    SizedBox(height: 20),
                    colorButton(Color(0xFFe08e28), 'Orange'),
                    SizedBox(height: 20),
                    colorButton(Color(0xFF5ab856), 'Green'),
                    SizedBox(height: 20),
                    colorButton(Color(0xFF603bd1), 'Purple'),
                    SizedBox(height: 30),
                  ],
                ),
              )
          ),
        )
    );
  }

  Widget colorButton(Color color, String title) {
    return RaisedButton(
      padding: EdgeInsets.symmetric(vertical: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      elevation: 12,
      color: color,
      textColor: Colors.white,
      child: Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: 1, color: Colors.white)),
      onPressed: () {
        primaryColor = color;
        Navigator.pushNamed(context, "/walkthrough");
      },
    );
  }
}
