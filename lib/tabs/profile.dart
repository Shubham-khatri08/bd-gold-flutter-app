import 'package:fashionstore/configs/applocalizations.dart';
import 'package:fashionstore/configs/colors.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/image_explore2.jpg", fit: BoxFit.cover, width: double.infinity, height: 300),
        Container(color: Colors.black.withOpacity(0.3), height: 300),
        SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 30),
                  Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/image_explore2.jpg'),
                      maxRadius: 45,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('Abeera Ahmed', textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, letterSpacing: 0.5, color: Colors.white)),
                  SizedBox(height: 10),
                  Text('Work hard in silence. Let your\nsuccess be the noise', textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                  SizedBox(height: 30),
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 12)],
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 0,
                        child: Column(
                          children: [
                            profileItem(Icons.location_on, AppLocalizations.of(context).translate('my_address'), action: goToMyAddress),
                            separator(),
                            profileItem(Icons.person, AppLocalizations.of(context).translate('account'), action: goToMyAccount)
                          ],
                        )
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 12)],
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 0,
                        child: Column(
                          children: [
                            profileItem(Icons.notifications, AppLocalizations.of(context).translate('notifications'), action: goToNotifications),
                            separator(),
                            profileItem(Icons.phone_iphone, AppLocalizations.of(context).translate('devices'), action: goToMyDevices),
                            separator(),
                            profileItem(Icons.vpn_key, AppLocalizations.of(context).translate('password'), action: goToPassword),
                            separator(),
                            profileItem(Icons.flag, AppLocalizations.of(context).translate('language'), action: goToLanguage)
                          ],
                        )
                    ),
                  ),
                ],
              ),
            )
        )
      ],
    );
  }

  goToMyAddress() {
    Navigator.pushNamed(context, "/myaddress");
  }

  goToMyAccount() {
    Navigator.pushNamed(context, "/myaccount");
  }

  goToNotifications() {
    Navigator.pushNamed(context, "/notifications");
  }

  goToMyDevices() {
    Navigator.pushNamed(context, "/mydevices");
  }

  goToPassword() {
    Navigator.pushNamed(context, "/changepassword");
  }

  goToLanguage() {
    Navigator.pushNamed(context, "/selectlanguage");
  }

  Widget profileItem(IconData icon, String title, {Function action}) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(icon, color: textLightColor, size: 26),
            SizedBox(width: 15),
            Expanded(
                child: Text(title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 0.5, color: primaryColor))
            ),
            SizedBox(width: 15),
            Icon(Icons.navigate_next, color: textLightColor, size: 26),
          ],
        ),
      ),
      onTap: () => action(),
    );
  }

  Widget separator() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Divider(height: 0.6, thickness: 0.6, color: lineColor),
    );
  }
}
