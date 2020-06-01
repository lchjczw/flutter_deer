import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_deer/datas/base/base.dart';
import 'package:flutter_deer/datas/viewmodels/fingerprint_provider.dart';
import 'package:flutter_deer/res/resources.dart';
import 'package:flutter_deer/util/screen_utils.dart';
import 'package:flutter_deer/util/theme_utils.dart';
import 'package:flutter_deer/widgets/load_image.dart';
import 'package:gesture_recognition/gesture_view.dart';
import 'package:provider/provider.dart';

/// design/8设置/index.html#artboard2
class FingerprintPage extends StatefulWidget {
  @override
  FingerprintPageState createState() => FingerprintPageState();
}

class FingerprintPageState extends State<FingerprintPage>
    with
        AutomaticKeepAliveClientMixin<FingerprintPage>,
        SingleTickerProviderStateMixin
    implements BasePage {
  FingerprintProvider provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initProvide();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return ChangeNotifierProvider<FingerprintProvider>(
        create: (_) => provider,
        child: Consumer<FingerprintProvider>(builder: (_, provider, __) {
          return provider.list != null
              ? _toast(context)
              : Scaffold(
                  body: Center(
                    child: GestureView(
                      ringWidth: 2.0,
                      ringRadius: 20.0,
                      lineWidth: 2.0,
                      circleRadius: 12.0,
                      immediatelyClear: true,
                      size: Screen.width(context) * 0.9,
                      onPanUp: (List<int> items) {
                        provider.list = items;
                      },
                    ),
                  ),
                );
        }));
  }

  Widget _toast(BuildContext context) {
    final Color _iconColor = ThemeUtils.getIconColor(context);
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: Screen.height(context) * 0.26),
            LoadAssetImage(
              'user/success',
              width: Screen.width(context) * 0.42,
              //              color: _iconColor == null ? Colours.app_main : _iconColor,
              color: Colours.app_main,
            ),
            Gaps.vGap50,
            Text(
              '恭喜你获得VIP免广告体验',
              style: TextStyle(fontSize: 26.0, color: _iconColor),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  initProvide() {
    // 等待页面渲染完成,初始化provide
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider = FingerprintProvider(context);
    });
  }
}
