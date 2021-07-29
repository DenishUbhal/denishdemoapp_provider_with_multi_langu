
import 'package:app_settings/app_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Future<dynamic> showDialogNotInternet(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Center(
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.warning,
                ),
                Text("No internet connection"),
              ],
            ),
          ),
          content: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text("No internet connection"),
          ),
          actions: <Widget>[
            MaterialButton(
              onPressed: AppSettings.openWIFISettings,
              child: Text("Settings"),
            )
          ],
        );
      });
}
