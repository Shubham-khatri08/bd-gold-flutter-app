import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashionstore/configs/applocalizations.dart';
import 'package:fashionstore/configs/colors.dart';
import 'package:fashionstore/configs/models.dart';
import 'package:flutter/material.dart';

class ShopTab extends StatefulWidget {
  @override
  _ShopTabState createState() => _ShopTabState();
}

class _ShopTabState extends State<ShopTab> {
  int _current = 0;

  List<String> sliderArray = [
    "assets/images/image_explore4.jpg",
    "assets/images/image_explore2.jpg",
    "assets/images/image_explore3.jpg",
    "assets/images/image_explore1.jpg"
  ];

  List<ItemModel> itemsArray = [
    ItemModel(0, 'TM Slim Shirt', 'assets/images/image_item1.jpg', 75.00),
    ItemModel(1, 'TM Trouser & Shirt', 'assets/images/image_item2.jpg', 90.00),
    ItemModel(2, 'TM Dress Pent', 'assets/images/image_item3.jpg', 110.00),
    ItemModel(3, 'Gens Pent', 'assets/images/image_item4.jpg', 80.00),
    ItemModel(4, 'Slim Suit', 'assets/images/image_item5.jpg', 120.00),
    ItemModel(5, 'Slim Shirt', 'assets/images/image_item6.jpg', 70.00),
  ];

  List<ItemModel> trendsArray = [
    ItemModel(2, 'TM Dress Pent', 'assets/images/image_item3.jpg', 110.00),
    ItemModel(4, 'Slim Suit', 'assets/images/image_item5.jpg', 120.00),
    ItemModel(3, 'Gens Pent', 'assets/images/image_item4.jpg', 80.00),
    ItemModel(1, 'TM Trouser & Shirt', 'assets/images/image_item2.jpg', 90.00),
    ItemModel(0, 'TM Slim Shirt', 'assets/images/image_item1.jpg', 75.00),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                    autoPlay: true,
                    height: 200,
                    enableInfiniteScroll: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }
                ),
                items: sliderArray.map((item) => Container(
                    child: Stack(
                      children: [
                        Image.asset(item, fit: BoxFit.cover, width: MediaQuery.of(context).size.width),
                        Positioned.fill(child: Container(color: Colors.black.withOpacity(0.2),)),
                        Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(AppLocalizations.of(context).translate('txt_20_off'),
                                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700, letterSpacing: 0.5, color: Colors.white.withOpacity(0.9)),
                              ),
                              Text(AppLocalizations.of(context).translate('txt_spring_collection'),
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 0.5, color: Colors.white),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                )).toList(),
              ),
              Align(
                alignment: AlignmentDirectional.bottomStart,
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
          Flexible(
            child: ListView(
              physics: BouncingScrollPhysics(),
              padding: const EdgeInsets.all(20),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppLocalizations.of(context).translate('txt_summer_collection'),
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, letterSpacing: 0.5, color: primaryColor)),
                        FlatButton(
                          color: Colors.transparent,
                          child: Text(AppLocalizations.of(context).translate('btn_show_all'), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: textMidColor)),
                          onPressed: () {
                            Navigator.pushNamed(context, "/seeall");
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 210,
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: itemsArray.length,
                        itemBuilder: (context, index) {
                          return listItem(itemsArray[index]);
                        },
                        separatorBuilder: (context, index) {
                          return separator();
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppLocalizations.of(context).translate('txt_top_trends'),
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, letterSpacing: 0.5, color: primaryColor)),
                        FlatButton(
                          color: Colors.transparent,
                          child: Text(AppLocalizations.of(context).translate('btn_show_all'), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: textMidColor)),
                          onPressed: () {
                            Navigator.pushNamed(context, "/seeall");
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 210,
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: trendsArray.length,
                        itemBuilder: (context, index) {
                          return listItem(trendsArray[index]);
                        },
                        separatorBuilder: (context, index) {
                          return separator();
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppLocalizations.of(context).translate('txt_spring_collection'),
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, letterSpacing: 0.5, color: primaryColor)),
                        FlatButton(
                          color: Colors.transparent,
                          child: Text(AppLocalizations.of(context).translate('btn_show_all'), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: textMidColor)),
                          onPressed: () {
                            Navigator.pushNamed(context, "/seeall");
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 210,
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: itemsArray.length,
                        itemBuilder: (context, index) {
                          return listItem(itemsArray[index]);
                        },
                        separatorBuilder: (context, index) {
                          return separator();
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppLocalizations.of(context).translate('txt_winter_collection'),
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, letterSpacing: 0.5, color: primaryColor)),
                        FlatButton(
                          color: Colors.transparent,
                          child: Text(AppLocalizations.of(context).translate('btn_show_all'), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: textMidColor)),
                          onPressed: () {
                            Navigator.pushNamed(context, "/seeall");
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 210,
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: trendsArray.length,
                        itemBuilder: (context, index) {
                          return listItem(trendsArray[index]);
                        },
                        separatorBuilder: (context, index) {
                          return separator();
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget listItem(ItemModel itemModel) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/additem");
      },
      child: SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(itemModel.image, width: 150, height: 150, fit: BoxFit.cover)
            ),
            SizedBox(height: 5),
            Text(itemModel.title, maxLines: 1, overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 0.5, color: primaryColor)),
            Text('\$${itemModel.price}', maxLines: 1,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 0.5, color: textLightColor)),
          ],
        ),
      ),
    );
  }

  Widget separator() {
    return SizedBox(width: 10);
  }
}