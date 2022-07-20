import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashionstore/configs/applocalizations.dart';
import 'package:fashionstore/configs/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WalkThrough extends StatefulWidget {
  @override
  _WalkThroughState createState() => _WalkThroughState();
}

class _WalkThroughState extends State<WalkThrough> {
  int _current = 0;

  List<String> sliderArray = [
    "assets/images/image_slider1.jpg",
    "assets/images/image_slider2.jpg",
    "assets/images/image_slider3.jpg",
    "assets/images/image_slider4.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(AppLocalizations.of(context).translate('swipe_to_browse'),
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, letterSpacing: 0.5, color: primaryColor),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      AppLocalizations.of(context).translate('discover_products'), textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.5, color: textMidColor),
                    ),
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 1.1,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }
                    ),
                    items: sliderArray.map((slider) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), offset: Offset(0, 10), blurRadius: 12)],
                                  borderRadius: BorderRadius.circular(12)
                              ),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                elevation: 0,
                                child: Image.asset(slider, fit: BoxFit.cover),
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: sliderArray.map((url) {
                      int index = sliderArray.indexOf(url);
                      return Container(
                        width: 15,
                        height: 15,
                        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == index
                              ? Colors.grey[400]
                              : Colors.transparent,
                        ),
                        child: Container(
                          margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == index
                                ? Color.fromRGBO(0, 0, 0, 0.9)
                                : Color.fromRGBO(0, 0, 0, 0.4),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: FlatButton(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      color: primaryColor,
                      textColor: Colors.white,
                      child: Text(AppLocalizations.of(context).translate('btn_start_shopping'), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: 1, color: Colors.white)),
                      onPressed: () {
                        Navigator.pushNamed(context, "/home");
                      },
                    ),
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
                              Navigator.pushNamed(context, "/login");
                            },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}