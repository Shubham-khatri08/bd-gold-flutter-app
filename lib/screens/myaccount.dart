import 'package:fashionstore/configs/applocalizations.dart';
import 'package:fashionstore/configs/colors.dart';
import 'package:flutter/material.dart';

class MyAccount extends StatelessWidget {
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
        title: Text(AppLocalizations.of(context).translate('my_account'), style: TextStyle(color: primaryColor, fontWeight: FontWeight.w700)),
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: TextEditingController(text: "Abeera"),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(0),
                          labelText: AppLocalizations.of(context).translate('first_name'),
                          labelStyle: TextStyle(fontWeight: FontWeight.w400, letterSpacing: 0.5, color: textLightColor),
                        ),
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: primaryColor),
                        textCapitalization: TextCapitalization.words
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                        controller: TextEditingController(text: "Ahmed"),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(0),
                          labelText: AppLocalizations.of(context).translate('last_name'),
                          labelStyle: TextStyle(fontWeight: FontWeight.w400, letterSpacing: 0.5, color: textLightColor),
                        ),
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: primaryColor),
                        textCapitalization: TextCapitalization.words
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextFormField(
                  controller: TextEditingController(text: "abeera202@fashionstore.com"),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0),
                    labelText: AppLocalizations.of(context).translate('email_address'),
                    labelStyle: TextStyle(fontWeight: FontWeight.w400, letterSpacing: 0.5, color: textLightColor),
                  ),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: primaryColor),
                  textCapitalization: TextCapitalization.words
              ),
              SizedBox(height: 20),
              TextFormField(
                  controller: TextEditingController(text: "+92-313-1234567"),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0),
                    labelText: AppLocalizations.of(context).translate('mobile'),
                    labelStyle: TextStyle(fontWeight: FontWeight.w400, letterSpacing: 0.5, color: textLightColor),
                  ),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: primaryColor),
                  textCapitalization: TextCapitalization.words
              ),
              SizedBox(height: 20),
              TextFormField(
                  controller: TextEditingController(text: "23-03-1993"),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0),
                    labelText: AppLocalizations.of(context).translate('date_of_birth'),
                    labelStyle: TextStyle(fontWeight: FontWeight.w400, letterSpacing: 0.5, color: textLightColor),
                  ),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: primaryColor),
                  textCapitalization: TextCapitalization.words
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
                child: Text(AppLocalizations.of(context).translate('btn_update'), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: 1, color: Colors.white)),
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
