import 'package:denishdemoapp/common/tools.dart';
import 'package:denishdemoapp/generated/l10n.dart';
import 'package:denishdemoapp/model/app.dart';
import 'package:denishdemoapp/model/user/user_model.dart';
import 'package:denishdemoapp/widgets/common/login_animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  final bool fromCart;
  final Function onLoginSuccess;

  Login({this.fromCart = false, this.onLoginSuccess});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  AnimationController _loginButtonController;

  @override
  void initState() {
    super.initState();
    _loginButtonController = AnimationController(
        duration: Duration(milliseconds: 3000), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    UserModel userModel = Provider.of(context, listen: false);
    AppModel appModel = Provider.of(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        leading: Navigator.of(context).canPop()
            ? IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                })
            : Container(),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        child: SafeArea(
          child: Builder(
            builder: (context) => GestureDetector(
              onTap: () => Utils.hideKeyboard(context),
              child: Stack(
                children: [
                  ListenableProvider.value(
                    value: Provider.of<UserModel>(context),
                    child:
                        Consumer<UserModel>(builder: (context, model, child) {
                      return SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Container(
                          alignment: Alignment.center,
                          width: screenSize.width /
                              (2 / (screenSize.height / screenSize.width)),
                          constraints: BoxConstraints(maxWidth: 700),
                          child: Column(
                            children: <Widget>[
                              const SizedBox(height: 80.0),
                              Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                          height: 40.0,
                                          child: Image.asset(
                                            'assets/logo.png',
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 80.0),
                              //" ${S.of(context).signup}",
                              TextField(
                                  controller: userModel.txtMobileNo,
                                  decoration: InputDecoration(
                                    labelText: S.of(context).mobNo,
                                  )),
                              const SizedBox(height: 12.0),
                              SizedBox(
                                height: 50.0,
                              ),
                              StaggerAnimation(
                                titleButton: S.of(context).signIn,
                                buttonController: _loginButtonController.view,
                                onTap: () {
                                  /* if (userModel.loading==false) {
                                    userModel.login(
                                      context: context,
                                      fail: (){

                                      },
                                      success: (user){
                                        print(user.name);
                                      },
                                    );
                                  }*/
                                  userModel.login(
                                    context: context,
                                    fail: (value) {
                                      var snackBar =
                                          SnackBar(content: Text(value));
                                      Scaffold.of(context)
                                          .showSnackBar(snackBar);
                                    },
                                    success: (user) {
                                      print(user.name);
                                    },
                                  );
                                },
                              ),
                              SizedBox(
                                height: 30.0,
                              ),

                              SizedBox(
                                height: 50.0,
                              ),

                              Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        /*Provider.of<AppModel>(context, listen: false)
                                            .changeLanguage("hi", context);*/
                                        appModel.changeLanguage("hi", context);
                                      },
                                      child: Container(
                                        color: Colors.indigo,
                                        margin:
                                            EdgeInsets.only(left: 5, right: 5),
                                        padding: EdgeInsets.all(10),
                                        child: Center(
                                            child: Text(
                                          "Hindi",
                                          style: TextStyle(color: Colors.white),
                                        )),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        appModel.changeLanguage("en", context);
                                      },
                                      child: Container(
                                        color: Colors.red,
                                        margin:
                                            EdgeInsets.only(left: 5, right: 5),
                                        padding: EdgeInsets.all(10),
                                        child: Center(
                                            child: Text(
                                          "English",
                                          style: TextStyle(color: Colors.white),
                                        )),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        appModel.changeLanguage("gu", context);
                                      },
                                      child: Container(
                                        color: Colors.indigo,
                                        margin:
                                            EdgeInsets.only(left: 5, right: 5),
                                        padding: EdgeInsets.all(10),
                                        child: Center(
                                            child: Text(
                                          "Gujarati",
                                          style: TextStyle(color: Colors.white),
                                        )),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
