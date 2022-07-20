import 'package:fashionstore/configs/applocalizations.dart';
import 'package:fashionstore/configs/colors.dart';
import 'package:fashionstore/configs/models.dart';
import 'package:fashionstore/screens/filter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SeeAll extends StatefulWidget {
  @override
  _SeeAllState createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {
  List<ItemModel> itemsList = [
    ItemModel(0, "TM Slim Shirt", "assets/images/image_item1.jpg", 45.23),
    ItemModel(1, "TM Slim Shirt", "assets/images/image_item2.jpg", 45.23),
    ItemModel(2, "TM Slim Shirt", "assets/images/image_item3.jpg", 45.23),
    ItemModel(3, "TM Slim Shirt", "assets/images/image_item4.jpg", 45.23),
    ItemModel(4, "TM Slim Shirt", "assets/images/image_item5.jpg", 45.23),
    ItemModel(5, "TM Slim Shirt", "assets/images/image_item6.jpg", 45.23),
    ItemModel(6, "TM Slim Shirt", "assets/images/image_explore1.jpg", 45.23),
  ];

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        elevation: 0,
        iconTheme: IconThemeData(color: primaryColor),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.slidersH, size: 22),
            onPressed: () {
              Navigator.of(context).push(new MaterialPageRoute<bool>(
                  builder: (BuildContext context) {
                    return FilterDialog();
                  },
                  fullscreenDialog: true));
            },
          ),
        ],
        centerTitle: true,
        title: Column(
          children: <Widget>[
            Text(AppLocalizations.of(context).translate('txt_summer_collection'),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, letterSpacing: 0.5, color: primaryColor)),
            Text('7 ${AppLocalizations.of(context).translate('items_found')}',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, letterSpacing: 0.5, color: textLightColor))
          ],
        ),
      ),
      body: GridView.builder(
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.all(8),
        itemCount: 7,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          return gridItem(itemsList[index]);
        },
      )
    );
  }

  Widget gridItem(ItemModel itemModel) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/additem");
      },
      child: Card(
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Image.asset(itemModel.image, fit: BoxFit.cover)
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(itemModel.title, maxLines: 1,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, letterSpacing: 0.5, color: primaryColor)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text('\$${itemModel.price}', maxLines: 1,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 0.5, color: textLightColor)),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
