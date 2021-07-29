import 'package:denishdemoapp/common/constants.dart';
import 'package:denishdemoapp/generated/l10n.dart';
import 'package:denishdemoapp/model/app.dart';
import 'package:denishdemoapp/model/user/user_model.dart';
import 'package:denishdemoapp/route.dart';
import 'package:denishdemoapp/screen/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'app_init.dart';
import 'common/styles.dart';
import 'common/tools.dart';
import 'widgets/common/dialogs.dart';
import 'widgets/common/internet_connectivity.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  final _app = AppModel();
  final _user = UserModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 1),
      () {
        MyConnectivity.instance.initialise();
        MyConnectivity.instance.myStream.listen((onData) {
          print("[App] internet issue change: $onData");
          if (MyConnectivity.instance.isIssue(onData)) {
            if (MyConnectivity.instance.isShow == false) {
              MyConnectivity.instance.isShow = true;
              showDialogNotInternet(context).then((onValue) {
                MyConnectivity.instance.isShow = false;
                print("[showDialogNotInternet] dialog closed $onValue");
              });
            }
          } else {
            if (MyConnectivity.instance.isShow == true) {
              Navigator.of(context).pop();
              MyConnectivity.instance.isShow = false;
            }
          }
        });

        //firebase Config
        /*FirebaseCloudMessagagingWapper()
          ..init()
          ..delegate = this;*/

        // OneSignalWapper()..init();
        print("[AppState] register modules .. DONE");
      },
    );
  }

  ThemeData getTheme(context) {
    print("[AppState] build Theme");
    AppModel appModel = Provider.of<AppModel>(context);
    bool isDarkTheme = appModel.darkTheme ?? false;

    if (isDarkTheme) {
      return buildDarkTheme(appModel.locale).copyWith(
        primaryColor: kDarkBG,
      );
    }
    return buildLightTheme(appModel.locale).copyWith(
      primaryColor: kLightPrimary,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppModel>.value(
      value: _app,
      child: Consumer<AppModel>(
        builder: (context, value, child) {
          return MultiProvider(
            providers: [
              Provider<UserModel>.value(value: _user),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              locale: Locale(Provider.of<AppModel>(context).locale, ""),
              /*home: SplashScreen(),*/
              localizationsDelegates: [
                // 1
                S.delegate,
                // 2
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              home: Center(
                child: Scaffold(
                  body: AppInit(
                      //onNext: () => MainTabs(),
                      ),
                ),
              ),
              routes: Routes.getAll(),
              theme: getTheme(context),
            ),
          );
        },
      ),
    );
  }
}
