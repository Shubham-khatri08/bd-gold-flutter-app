import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashionstore/configs/applocalizations.dart';
import 'package:fashionstore/configs/colors.dart';
import 'package:fashionstore/configs/models.dart';
import 'package:flutter/material.dart';

class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  int _current = 0;

  List<String> sliderArray = [
    "assets/images/image_item2.jpg",
    "assets/images/image_item3.jpg",
    "assets/images/image_item1.jpg",
    "assets/images/image_item4.jpg"
  ];

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
        title: Text('TM Slim Shirt', maxLines: 1,
            style: TextStyle(color: primaryColor, fontWeight: FontWeight.w700)),
      ),
      body: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                    autoPlay: true,
                    height: 300,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }
                ),
                items: sliderArray.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(3),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: 3,
                          child: Image.asset(item, fit: BoxFit.cover),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: sliderArray.map((url) {
                      int index = sliderArray.indexOf(url);
                      return Container(
                        width: 15,
                        height: 15,
                        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == index
                              ? Colors.white.withOpacity(0.4)
                              : Colors.transparent,
                        ),
                        child: Container(
                          margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('TM Slim Shirt',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, letterSpacing: 0.5, color: primaryColor)),
                    Text('\$439',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, letterSpacing: 0.5, color: primaryColor)),
                  ],
                ),
                SizedBox(height: 20),
                Text(AppLocalizations.of(context).translate('colors'),
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: primaryColor)),
                SizedBox(height: 10),
                ColorFilter(),
                SizedBox(height: 20),
                Text(AppLocalizations.of(context).translate('sizes'),
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: primaryColor)),
                SizedBox(height: 10),
                SizeFilter(),
                SizedBox(height: 30),
                FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: primaryColor, width: 1.5, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: Colors.white,
                  textColor: primaryColor,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.shopping_cart),
                      SizedBox(width: 10),
                      Text(AppLocalizations.of(context).translate('btn_add_to_cart'), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, letterSpacing: 1))
                    ],
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ColorFilter extends StatefulWidget {
  @override
  _ColorFilterState createState() => _ColorFilterState();
}

class _ColorFilterState extends State<ColorFilter> {
  int selectedColor = 2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          colorBox(ColorModel(0, "DFD0C3")),
          colorBox(ColorModel(1, "E1E1E1")),
          colorBox(ColorModel(2, "EEE4CE")),
          colorBox(ColorModel(3, "DFE6F1")),
          colorBox(ColorModel(4, "DEEaE4")),
          colorBox(ColorModel(5, "DFE6C1")),
          colorBox(ColorModel(6, "888888")),
        ],
      ),
    );
  }

  Widget colorBox(ColorModel colorModel) {
    return Center(
      child: SizedBox(
        width: 60, height: 60,
        child: Card(
          color: Color(int.parse("0xFF${colorModel.color}")),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(27),
              side: (selectedColor == colorModel.id) ?
              BorderSide(color: Colors.white, width: 5) : BorderSide.none
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: (selectedColor == colorModel.id) ? 4 : 1,
          child: InkWell(
            onTap: () {
              setState(() => selectedColor = colorModel.id);
            },
            child: (selectedColor == colorModel.id) ?
            Center(child: Icon(Icons.check, color: primaryColor)): SizedBox(),
          ),
        ),
      ),
    );
  }
}

class SizeFilter extends StatefulWidget {
  @override
  _SizeFilterState createState() => _SizeFilterState();
}

class _SizeFilterState extends State<SizeFilter> {
  int selectedSize = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        sizeBox(0, 'XS'),
        sizeBox(1, 'S'),
        sizeBox(2, 'M'),
        sizeBox(3, 'L'),
        sizeBox(4, 'XL'),
      ],
    );
  }

  Widget sizeBox(int index, String title) {
    return Expanded(
      child: Center(
        child: SizedBox(
          width: 60, height: 60,
          child: Card(
            color: (selectedSize == index) ? Color(0xFFEEEEEE) : backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(27),
                side: (selectedSize == index) ?
                BorderSide(color: Colors.white, width: 5) : BorderSide.none
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: (selectedSize == index) ? 4 : 1,
            child: InkWell(
              onTap: () {
                setState(() => selectedSize = index);
              },
              child: Center(
                child: Text(title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,
                        color: (selectedSize == index) ? primaryColor : textLightColor)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
