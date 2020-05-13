import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailPage extends StatelessWidget {
  final String title;

  DetailPage(this.title);

  //创建一个给native的channel (类似iOS的通知）
  static const methodChannel = const MethodChannel('wg/native_get');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(primaryColor: Colors.purple),
      home: Material(
        child: Scaffold(
          body: Center(
            child: Column(
              children: [
                Expanded(child: Container()),
                Text('实22333时:$title'),
                Container(
                  color: Colors.green,
                  child: RaisedButton(
                    onPressed: () {
                      methodChannel.invokeMethod('backToViewController');
                    },
                    child: Icon(
                      Icons.arrow_back,
//              color: Colors.white,
                    ),
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
