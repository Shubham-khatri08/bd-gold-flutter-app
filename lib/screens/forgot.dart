import 'package:fashionstore/configs/applocalizations.dart';
import 'package:fashionstore/configs/colors.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
                    Text(AppLocalizations.of(context).translate('forgot_password'),
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, letterSpacing: 0.5, color: primaryColor),
                    ),
                    SizedBox(height: 10),
                    Text(AppLocalizations.of(context).translate('password_reset_description'),
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.5, color: textMidColor)),
                    SizedBox(height: 30),
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(0),
                        labelText: AppLocalizations.of(context).translate('email'),
                        labelStyle: TextStyle(fontWeight: FontWeight.w400, letterSpacing: 0.5, color: textLightColor),
                      ),
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: primaryColor),
                      textCapitalization: TextCapitalization.words,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 30),
                    RaisedButton(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 12,
                      color: primaryColor,
                      textColor: Colors.white,
                      child: Text(AppLocalizations.of(context).translate('btn_send'), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: 1, color: Colors.white)),
                      onPressed: () {
                      },
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              )
          ),
        )
    );
  }
}
