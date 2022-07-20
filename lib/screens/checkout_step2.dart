import 'package:fashionstore/configs/applocalizations.dart';
import 'package:fashionstore/configs/colors.dart';
import 'package:fashionstore/widgets/stepiconsbar.dart';
import 'package:flutter/material.dart';

class CheckoutStep2 extends StatelessWidget {
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
                StepsBar(step: 2),
                Text(AppLocalizations.of(context).translate('step_2'),
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, letterSpacing: 0.5, color: textMidColor)),
                Text(AppLocalizations.of(context).translate('payment'),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, letterSpacing: 0.5, color: primaryColor)),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0),
                    labelText: AppLocalizations.of(context).translate('card_number'),
                    labelStyle: TextStyle(fontWeight: FontWeight.w400, letterSpacing: 0.5, color: textLightColor),
                  ),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: primaryColor),
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0),
                      labelText: AppLocalizations.of(context).translate('card_holder_name'),
                      labelStyle: TextStyle(fontWeight: FontWeight.w400, letterSpacing: 0.5, color: textLightColor),
                    ),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: primaryColor),
                    textCapitalization: TextCapitalization.words
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(0),
                          labelText: 'MM/YY',
                          labelStyle: TextStyle(fontWeight: FontWeight.w400, letterSpacing: 0.5, color: textLightColor),
                        ),
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: primaryColor),
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(0),
                          labelText: 'CVC',
                          labelStyle: TextStyle(fontWeight: FontWeight.w400, letterSpacing: 0.5, color: textLightColor),
                        ),
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: primaryColor),
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
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
                  child: Text('${AppLocalizations.of(context).translate('btn_pay')} \$439', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: 1, color: Colors.white)),
                  onPressed: () {
                    Navigator.pushNamed(context, "/checkout_step3");
                  },
                ),
                SizedBox(height: 20),
                Text(AppLocalizations.of(context).translate('or_checkout_with'), textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.5, color: textMidColor),
                ),
                SizedBox(height: 20),
                FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: textLightColor, width: 1, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: Colors.white,
                  textColor: Colors.white,
                  child: Image.asset("assets/images/icon_paypal.png", height: 24),
                  onPressed: () {},
                ),
                SizedBox(height: 20),
                FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: textLightColor, width: 1, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: Colors.white,
                  textColor: Colors.white,
                  child: Image.asset("assets/images/icon_applepay.png", height: 24),
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