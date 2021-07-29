import 'dart:async';
import 'package:denishdemoapp/screen/login.dart';
import 'package:denishdemoapp/services/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'common/config.dart';
import 'common/constants.dart';
import 'model/app.dart';
import 'widgets/common/animated_splash.dart';

class AppInit extends StatefulWidget {
  final Function onNext;

  AppInit({this.onNext});

  @override
  _AppInitState createState() => _AppInitState();
}

class _AppInitState extends State<AppInit> {
  final StreamController<bool> _streamInit = StreamController<bool>();

  bool isLoggedIn = false;
  Map appConfig = {};

  /// check if the screen is already seen At the first time
  Future<bool> checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = prefs.getBool('seen') ?? false;
    return _seen;
  }

  /// Check if the App is Login
  Future checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('loggedIn') ?? false;
  }

  Future loadInitData() async {
    bool isFirstSeen = false;
    try {
      printLog("[AppState] Inital Data");
      isFirstSeen = await checkFirstSeen();
      isLoggedIn = await checkLogin();

      /// Load App model config
      Services().setAppConfig(serverConfig);
      /*appConfig =
          await Provider.of<AppModel>(context, listen: false).loadAppConfig();*/

      Future.delayed(Duration.zero, () {
        /// Load more Category/Blog/Attribute Model beforehand
        /*if (mounted) {
          Provider.of<CategoryModel>(context, listen: false).getCategories(
            lang: Provider.of<AppModel>(context, listen: false).locale,
            cats: Provider.of<AppModel>(context, listen: false).categories,
          );

          //denish change blog api call
          //Provider.of<BlogModel>(context, listen: false).getBlogs();

          Provider.of<FilterTagModel>(context, listen: false).getFilterTags();

          Provider.of<FilterAttributeModel>(context, listen: false)
              .getFilterAttributes();
        }*/
      });

      printLog("[AppState] Init Data Finish");
    } catch (e, trace) {
      print(e.toString());
      print(trace.toString());
    }
    if (!_streamInit.isClosed) {
      _streamInit.add(false);
    }
  }

  Widget onNextScreen(bool isFirstSeen) {
    /*if (!isFirstSeen && !kIsWeb && appConfig != null) {
      if (onBoardingData.isNotEmpty) return OnBoardScreen(appConfig);
    }*/

    /*if (kLoginSetting['IsRequiredLogin'] && !isLoggedIn) {
      return LoginScreen(
        onLoginSuccess: (context) async {
          await Navigator.pushNamed(context, RouteList.home);
        },
      );
    }*/
    return Login(
      onLoginSuccess: (context) async {
        await Navigator.pushNamed(context, RouteList.home);
      },
    );
    return widget.onNext();
  }

  @override
  void initState() {
    loadInitData();
    super.initState();
  }

  @override
  void dispose() {
    _streamInit?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: _streamInit.stream,
      builder: (context, snapshot) {
        var _isPushNext = snapshot.data != null;
        var _iFirstSeen = snapshot.data ?? false;

        return AnimatedSplash(
          imagePath: kSplashScreen,
          home: onNextScreen(_iFirstSeen),
          duration: 2000,
          type: AnimatedSplashType.StaticDuration,
          isPushNext: _isPushNext,
        );
      },
    );
  }
}
