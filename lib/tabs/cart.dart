import 'package:fashionstore/configs/applocalizations.dart';
import 'package:fashionstore/configs/colors.dart';
import 'package:fashionstore/widgets/numberbutton.dart';
import 'package:flutter/material.dart';

class CartTab extends StatefulWidget {
  @override
  _CartTabState createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 10),
            Text(AppLocalizations.of(context).translate('cart'),
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, letterSpacing: 0.5, color: primaryColor),
            ),
            SizedBox(height: 10),
            Flexible(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    cartItem('assets/images/image_item1.jpg', 'TM Slim Shirt', '\$75.00', 'Small', 'Grey', 1),
                    separator(),
                    cartItem('assets/images/image_item3.jpg', 'TM Trouser & Shirt', '\$145.00', 'Large', 'Red', 2),
                    separator(),
                    cartItem('assets/images/image_item4.jpg', 'TM Dress Pent', '\$99.00', 'Small', 'Black', 5),
                    separator(),
                    footer()
                  ],
                )
            )
          ],
        ),
      ),
    );
  }

  Widget cartItem(String url, String title, String price, String size, String color, int quantity) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(url, width: 60, height: 60, fit: BoxFit.cover),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(title, maxLines: 1,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 0.5, color: primaryColor)),
                Text(price, maxLines: 1,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, letterSpacing: 0.5, color: primaryColor)),
                SizedBox(height: 5),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text('${AppLocalizations.of(context).translate('size')}:', style: TextStyle(fontSize: 14, color: textMidColor)),
                    SizedBox(width: 5),
                    Text(size, style: TextStyle(fontSize: 14, color: textMidColor)),
                    SizedBox(width: 5),
                    Text('|', style: TextStyle(fontSize: 14, color: textMidColor)),
                    SizedBox(width: 5),
                    Text('${AppLocalizations.of(context).translate('color')}:', style: TextStyle(fontSize: 14, color: textMidColor)),
                    SizedBox(width: 5),
                    Text(color, style: TextStyle(fontSize: 14, color: textMidColor)),
                  ],
                )
              ],
            ),
          ),
          NumberButton(value: quantity, maxValue: 15)
        ],
      ),
    );
  }

  Widget footer() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Text(AppLocalizations.of(context).translate('promo_code'),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 0.5, color: textLightColor)),
                Expanded(child: SizedBox()),
                Text('springsale',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 0.5, color: primaryColor)),
                IconButton(
                  color: textMidColor,
                  icon: Icon(Icons.cancel),
                  onPressed: () {},
                )
              ],
            ),
          ),
          separator(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalizations.of(context).translate('total_amount'),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 0.5, color: textLightColor)),
                Text('\$439',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, letterSpacing: 0.5, color: primaryColor)),
              ],
            ),
          ),
          SizedBox(height: 20),
          RaisedButton(
            padding: EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 12,
            color: primaryColor,
            textColor: Colors.white,
            child: Text(AppLocalizations.of(context).translate('btn_continue'), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: 1, color: Colors.white)),
            onPressed: () {
              Navigator.pushNamed(context, "/checkout_step1");
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget separator() {
    return Divider(height: 1, thickness: 1, color: lineColor);
  }
}