import 'dart:async';
import 'package:fashionstore/configs/applocalizations.dart';
import 'package:fashionstore/configs/colors.dart';
import 'package:fashionstore/tabs/cart.dart';
import 'package:fashionstore/tabs/explore.dart';
import 'package:fashionstore/tabs/profile.dart';
import 'package:fashionstore/tabs/shop.dart';
import 'package:fashionstore/widgets/offerdialog.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedPage = 0;

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      showOfferDialog(context,
          AppLocalizations.of(context).translate('txt_spring_collection'),
          AppLocalizations.of(context).translate('txt_up_to_20_off')
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: currentTab(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          buildTab(0, "nav_shop", AppLocalizations.of(context).translate('tab_shop')),
          buildTab(1, "nav_explore", AppLocalizations.of(context).translate('tab_explore')),
          buildTab(2, "nav_cart", AppLocalizations.of(context).translate('tab_cart'), badgeCount: 2),
          buildTab(3, "nav_profile", AppLocalizations.of(context).translate('tab_profile')),
        ],
        currentIndex: _selectedPage,
        backgroundColor: Colors.white,
        unselectedItemColor: textLightColor,
        selectedItemColor: primaryColor,
        type: BottomNavigationBarType.shifting,
        elevation: 12,
        onTap: _onItemTapped,
      ),
    );
  }

  BottomNavigationBarItem buildTab(int index, String icon, String title, {badgeCount = 0}) {
    return BottomNavigationBarItem(
      icon: Stack(
        children: [
          Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Image.asset("assets/images/$icon.png", width: 22, height: 22,
                    color: (_selectedPage == index) ? primaryColor : textLightColor),
              )
          ),
          Align(
              alignment: AlignmentDirectional.topCenter,
              child: Visibility(
                visible: (badgeCount > 0) ? true : false,
                child: Container(
                    margin: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                    padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
                    constraints: BoxConstraints(
                      minWidth: 20,
                      minHeight: 20,
                    ),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: errorColor),
                    child: Text(badgeCount.toString(), textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white))
                ),
              )
          )
        ],
      ),
      title: Text(title),
    );
  }

  Widget currentTab() {
    switch(_selectedPage) {
      case 0:
        return ShopTab();
        break;
      case 1:
        return ExploreTab();
        break;
      case 2:
        return CartTab();
        break;
      case 3:
        return ProfileTab();
        break;
      default:
        return Container();
        break;
    }
  }

  void _onItemTapped(int index) {
    setState(() => _selectedPage = index);
  }
}
