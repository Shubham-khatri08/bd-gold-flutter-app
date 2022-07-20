import 'package:fashionstore/configs/applocalizations.dart';
import 'package:fashionstore/configs/colors.dart';
import 'package:flutter/material.dart';

showOfferDialog(BuildContext context, String title, String description) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 300,
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(child: Image.asset('assets/images/image_explore3.jpg', fit: BoxFit.cover)),
                        Positioned.fill(child: Container(color: Colors.black.withOpacity(0.2))),
                        Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(title, textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700, letterSpacing: 0.5, color: Colors.white),
                              ),
                              SizedBox(height: 20),
                              Text(description, textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0.5, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.topEnd,
                          child: IconButton(
                            icon: Icon(Icons.cancel, color: Colors.white, size: 25),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    child: FlatButton(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      color: primaryColor,
                      textColor: Colors.white,
                      child: Text(AppLocalizations.of(context).translate('btn_shop_now'), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: 1, color: Colors.white)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            )
        );
      });
}