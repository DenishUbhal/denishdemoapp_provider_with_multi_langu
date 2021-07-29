import 'package:denishdemoapp/common/config.dart';
import 'package:denishdemoapp/common/constants/routes.dart';
import 'package:denishdemoapp/services/index.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    loadInitData();
    super.initState();
  }

  Future loadInitData() async {
    bool isFirstSeen = false;
    try {
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
        Navigator.pushNamed(context, RouteList.login);
      });
    } catch (e, trace) {
      print(e.toString());
      print(trace.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Container(
          child: Image.asset(
            'assets/logo.png',
            fit: BoxFit.contain,
          ), // Get animated value for color
        ),
      ),
    );
  }
}
