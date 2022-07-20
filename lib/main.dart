import 'package:fashionstore/configs/applocalizations.dart';
import 'package:fashionstore/configs/colors.dart';
import 'package:fashionstore/screens/additem.dart';
import 'package:fashionstore/screens/changepassword.dart';
import 'package:fashionstore/screens/checkout_step1.dart';
import 'package:fashionstore/screens/checkout_step2.dart';
import 'package:fashionstore/screens/checkout_step3.dart';
import 'package:fashionstore/screens/forgot.dart';
import 'package:fashionstore/screens/home.dart';
import 'package:fashionstore/screens/login.dart';
import 'package:fashionstore/screens/myaccount.dart';
import 'package:fashionstore/screens/myaddress.dart';
import 'package:fashionstore/screens/mydevices.dart';
import 'package:fashionstore/screens/notifications.dart';
import 'package:fashionstore/screens/seeall.dart';
import 'package:fashionstore/screens/changelanguage.dart';
import 'package:fashionstore/screens/selectlanguage.dart';
import 'package:fashionstore/screens/selecttheme.dart';
import 'package:fashionstore/screens/signup.dart';
import 'package:fashionstore/screens/walkthrough.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLanguage appLanguage = AppLanguage();
  runApp(
      ChangeNotifierProvider<AppLanguage>(
          create: (context) => appLanguage,
      child: Consumer<AppLanguage>(builder: (context, model, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: model.appLocale,
          supportedLocales: appLanguage.supportedLanguages(),
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          title: 'Fashion Store',
          theme: ThemeData(
              primarySwatch: MaterialColor(0xFF282A2E, materialColorSet),
              splashColor: Color(0x44282A2E),
              fontFamily: "Opensans",
              pageTransitionsTheme: PageTransitionsTheme(
                  builders: {
                    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                  }
              )
          ),
          routes: {
            '/': (context) => SelectLanguage(),
            '/selecttheme': (context) => SelectTheme(),
            '/walkthrough': (context) => WalkThrough(),
            '/login': (context) => Login(),
            '/signup': (context) => SignUp(),
            '/forgotpassword': (context) => ForgotPassword(),
            '/home': (context) => Home(),
            '/checkout_step1': (context) => CheckoutStep1(),
            '/checkout_step2': (context) => CheckoutStep2(),
            '/checkout_step3': (context) => CheckoutStep3(),
            '/additem': (context) => AddItem(),
            '/seeall': (context) => SeeAll(),
            '/myaddress': (context) => MyAddress(),
            '/myaccount': (context) => MyAccount(),
            '/notifications': (context) => Notifications(),
            '/mydevices': (context) => MyDevices(),
            '/changepassword': (context) => ChangePassword(),
            '/selectlanguage': (context) => ChangeLanguage(),
          },
        );
      })
    )
  );
}