import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_deer/res/resources.dart';
import 'package:flutter_deer/util/screen_utils.dart';
import 'package:flutter_deer/widgets/app_bar.dart';
import 'package:flutter_deer/widgets/load_image.dart';

/// design/8设置/index.html#artboard2
class AdToastPage extends StatefulWidget {
  @override
  _AdToastPageState createState() => _AdToastPageState();
}

class _AdToastPageState extends State<AdToastPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: MyAppBar(
              centerTitle: '消息',
//              actionName: '全部已读',
              onPressed: () {},
            ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: Screen.height(context) * 0.26),
            LoadAssetImage(
              'user/success',
              width: Screen.width(context) * 0.42,
              color: Colours.app_main,
            ),
            Gaps.vGap50,
            Text('恭喜你获得VIP免广告体验',style: TextStyle(fontSize: 26.0,color: Colours.app_main),),
          ],
        ),
      ),
    );
  }
}
