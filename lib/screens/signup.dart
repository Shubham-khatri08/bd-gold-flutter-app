import 'package:fashionstore/configs/applocalizations.dart';
import 'package:fashionstore/configs/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                    Text(AppLocalizations.of(context).translate('create_your_account'),
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, letterSpacing: 0.5, color: primaryColor),
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(0),
                          labelText: AppLocalizations.of(context).translate('your_name'),
                          labelStyle: TextStyle(fontWeight: FontWeight.w400, letterSpacing: 0.5, color: textLightColor),
                        ),
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: primaryColor),
                        textCapitalization: TextCapitalization.words
                    ),
                    SizedBox(height: 20),
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
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(0),
                        labelText: AppLocalizations.of(context).translate('password'),
                        labelStyle: TextStyle(fontWeight: FontWeight.w400, letterSpacing: 0.5, color: textLightColor),
                      ),
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: primaryColor),
                      textCapitalization: TextCapitalization.words,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
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
                      child: Text(AppLocalizations.of(context).translate('btn_signup'), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: 1, color: Colors.white)),
                      onPressed: () {
                      },
                    ),
                    SizedBox(height: 20),
                    Text(AppLocalizations.of(context).translate('or_signup_with_social_account'), textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.5, color: textMidColor),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: FlatButton(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            color: facebookColor,
                            textColor: Colors.white,
                            child: Image.asset("assets/images/icon_facebook.png", width: 24, height: 24),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: FlatButton(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            color: twitterColor,
                            textColor: Colors.white,
                            child: Image.asset("assets/images/icon_twitter.png", width: 24, height: 24),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: 0.5, color: textMidColor),
                            text: AppLocalizations.of(context).translate('already_have_account'),
                          ),
                          TextSpan(text: ' '),
                          TextSpan(
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, letterSpacing: 0.5, color: primaryColor),
                            text: AppLocalizations.of(context).translate('btn_login'),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pop(context);
                              },
                          ),
                        ],
                      ),
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
