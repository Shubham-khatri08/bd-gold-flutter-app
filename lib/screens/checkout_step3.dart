import 'package:fashionstore/configs/applocalizations.dart';
import 'package:fashionstore/configs/colors.dart';
import 'package:fashionstore/widgets/stepiconsbar.dart';
import 'package:flutter/material.dart';

class CheckoutStep3 extends StatelessWidget {
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
        centerTitle: true,
        title: Text(AppLocalizations.of(context).translate('checkout'), style: TextStyle(color: primaryColor, fontWeight: FontWeight.w700)),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                StepsBar(step: 3),
                SizedBox(height: 30),
                Align(
                  alignment: AlignmentDirectional.center,
                  child: Container(
                    width: 180, height: 180,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: Center(child: Image.asset("assets/images/icon_gift.png", width: 70, height: 70)),
                  ),
                ),
                SizedBox(height: 20),
                Text(AppLocalizations.of(context).translate('congrats'), textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, letterSpacing: 0.5, color: primaryColor)),
                SizedBox(height: 20),
                Text(AppLocalizations.of(context).translate('thank_you_for_purchasing'), textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.5, color: textMidColor)),
                SizedBox(height: 30),
                RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 12,
                  color: primaryColor,
                  textColor: Colors.white,
                  child: Text(AppLocalizations.of(context).translate('btn_continue_shopping'), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: 1, color: Colors.white)),
                  onPressed: () {},
                ),
                SizedBox(height: 30),
              ],
            )
        ),
      ),
    );
  }
}