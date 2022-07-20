import 'package:fashionstore/configs/applocalizations.dart';
import 'package:fashionstore/configs/colors.dart';
import 'package:fashionstore/configs/models.dart';
import 'package:flutter/material.dart';

class ExploreTab extends StatefulWidget {
  @override
  _ExploreTabState createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> {
  List<ExploreItemModel> exploreItems = List();

  @override
  void initState() {
    super.initState();
    exploreItems.add(ExploreItemModel('assets/images/image_explore2.jpg', 'Winter Collection', 'UP TO 20% OFF'));
    exploreItems.add(ExploreItemModel('assets/images/image_explore1.jpg', 'Summer Collection', 'UP TO 50% OFF'));
    exploreItems.add(ExploreItemModel('assets/images/image_explore3.jpg', 'Spring\'s Suit', 'UP TO 70% OFF'));
    exploreItems.add(ExploreItemModel('assets/images/image_explore4.jpg', 'Women\'s Collection', 'UP TO 20% OFF'));
    exploreItems.add(ExploreItemModel('assets/images/image_explore5.jpg', 'Winter Collection', 'UP TO 20% OFF'));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 10),
            Text(AppLocalizations.of(context).translate('explore'),
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, letterSpacing: 0.5, color: primaryColor),
            ),
            SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFEEEEEE)),
                  borderRadius: BorderRadius.circular(12),
                  color: backgroundColor
              ),
              child: TextField(
                decoration: InputDecoration.collapsed(
                  hintText: AppLocalizations.of(context).translate('search'),
                  hintStyle: TextStyle(fontWeight: FontWeight.w400, letterSpacing: 0.5, color: textLightColor),
                  border: InputBorder.none,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: primaryColor),
                keyboardType: TextInputType.text,
              ),
            ),
            SizedBox(height: 15),
            Flexible(
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemCount: exploreItems.length,
                    itemBuilder: (context, index) {
                      return listItem(exploreItems[index]);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 15);
                    }
                )
            )
          ],
        ),
      ),
    );
  }

  Widget listItem(ExploreItemModel exploreItem) {
    return Container(
      height: MediaQuery.of(context).size.width - 30,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            Positioned.fill(child: Image.asset(exploreItem.url, fit: BoxFit.cover,)),
            Positioned.fill(child: Container(color: Colors.black.withOpacity(0.2),)),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(exploreItem.title,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, letterSpacing: 0.5, color: Colors.white),
                  ),
                  Text(exploreItem.description,
                    style: TextStyle(fontSize: 16, letterSpacing: 0.5, color: Colors.white),
                  ),
                ],
              ),
            ),
            Positioned.fill(child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/seeall");
                },
              ),
            ))
          ],
        ),
      ),
    );
  }
}
