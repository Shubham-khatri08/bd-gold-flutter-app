import 'package:fashionstore/configs/applocalizations.dart';
import 'package:fashionstore/configs/colors.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatelessWidget {
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
          title: Text(AppLocalizations.of(context).translate('change_password'), style: TextStyle(color: primaryColor, fontWeight: FontWeight.w700)),
        ),
        body: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0),
                    labelText: AppLocalizations.of(context).translate('current_password'),
                    labelStyle: TextStyle(fontWeight: FontWeight.w400, letterSpacing: 0.5, color: textLightColor),
                  ),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: primaryColor),
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0),
                    labelText: AppLocalizations.of(context).translate('new_password'),
                    labelStyle: TextStyle(fontWeight: FontWeight.w400, letterSpacing: 0.5, color: textLightColor),
                  ),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: primaryColor),
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0),
                    labelText: AppLocalizations.of(context).translate('confirm_password'),
                    labelStyle: TextStyle(fontWeight: FontWeight.w400, letterSpacing: 0.5, color: textLightColor),
                  ),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: primaryColor),
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                SizedBox(height: 50),
                RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 12,
                  color: primaryColor,
                  textColor: Colors.white,
                  child: Text(AppLocalizations.of(context).translate('btn_update_password'), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: 1, color: Colors.white)),
                  onPressed: () {},
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        )
    );
  }
}
