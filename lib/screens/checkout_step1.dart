import 'package:fashionstore/configs/applocalizations.dart';
import 'package:fashionstore/configs/colors.dart';
import 'package:fashionstore/widgets/stepiconsbar.dart';
import 'package:flutter/material.dart';

class CheckoutStep1 extends StatelessWidget {
  final List<String> countryList = ['Argentina', 'Canada', 'Korea', 'United States'];
  final List<String> shippingList = ['Delay Shipping (Free)', 'Standard Shipping (+\$5.00)', 'Urgent Shipping (+\$15.00)'];

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
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StepsBar(step: 1),
            Text(AppLocalizations.of(context).translate('step_1'),
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, letterSpacing: 0.5, color: textMidColor)),
            Text(AppLocalizations.of(context).translate('shipping'),
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, letterSpacing: 0.5, color: primaryColor)),
            SizedBox(height: 20),
            TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(0),
                  labelText: AppLocalizations.of(context).translate('full_name'),
                  labelStyle: TextStyle(fontWeight: FontWeight.w400, letterSpacing: 0.5, color: textLightColor),
                ),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: primaryColor),
                textCapitalization: TextCapitalization.words
            ),
            SizedBox(height: 20),
            TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(0),
                  labelText: AppLocalizations.of(context).translate('address'),
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
                        labelText: AppLocalizations.of(context).translate('city'),
                        labelStyle: TextStyle(fontWeight: FontWeight.w400, letterSpacing: 0.5, color: textLightColor),
                      ),
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: primaryColor),
                      textCapitalization: TextCapitalization.words
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(0),
                        labelText: AppLocalizations.of(context).translate('zip_code'),
                        labelStyle: TextStyle(fontWeight: FontWeight.w400, letterSpacing: 0.5, color: textLightColor),
                      ),
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: primaryColor),
                      textCapitalization: TextCapitalization.words
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            DropDown(countryList, AppLocalizations.of(context).translate('select_country')),
            SizedBox(height: 20),
            DropDown(shippingList, AppLocalizations.of(context).translate('shipping_method')),
            CheckBox(),
            SizedBox(height: 30),
            RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 12,
              color: primaryColor,
              textColor: Colors.white,
              child: Text(AppLocalizations.of(context).translate('btn_continue_to_payment'), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: 1, color: Colors.white)),
              onPressed: () {
                Navigator.pushNamed(context, "/checkout_step2");
              },
            ),
            SizedBox(height: 30),
          ],
        )
      ),
    );
  }
}

class CheckBox extends StatefulWidget {
  @override
  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool checkedValue = true;

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      contentPadding: EdgeInsets.zero,
      child: CheckboxListTile(
        title: Text(AppLocalizations.of(context).translate('save_for_faster_checkout'),
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: textLightColor)),
        value: checkedValue,
        activeColor: primaryColor,
        onChanged: (newValue) {
          setState(() {
            checkedValue = newValue;
          });
        },
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}

class DropDown extends StatefulWidget {
  final List<String> itemList;
  final String hint;
  DropDown(this.itemList, this.hint);
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String _dropDownValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      itemHeight: 55,
      underline: Divider(height: 1, thickness: 1, color: textLightColor),
      hint: _dropDownValue == null ? Text(widget.hint) :
      Text(_dropDownValue, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: primaryColor)),
      isExpanded: true,
      icon: Icon(Icons.keyboard_arrow_down, size: 22, color: textMidColor),
      iconSize: 30.0,
      style: TextStyle(color: primaryColor),
      items: widget.itemList.map(
            (val) {
          return DropdownMenuItem<String>(
            value: val,
            child: Text(val, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: primaryColor)),
          );
        },
      ).toList(),
      onChanged: (val) {
        setState(
              () {
            _dropDownValue = val;
          },
        );
      },
    );
  }
}
