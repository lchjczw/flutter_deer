import 'package:flutter/material.dart';
import 'package:flutter_deer/base/base.dart';
import 'package:flutter_deer/datas/viewmodels/user_provider.dart';
import 'package:flutter_deer/login/login_router.dart';
import 'package:flutter_deer/res/resources.dart';
import 'package:flutter_deer/routers/fluro_navigator.dart';
import 'package:flutter_deer/setting/setting_router.dart';
import 'package:flutter_deer/user/user_router.dart';
import 'package:flutter_deer/user/widgets/user_setting_menu.dart';
import 'package:flutter_deer/util/image_utils.dart';
import 'package:flutter_deer/util/theme_utils.dart';
import 'package:flutter_deer/widgets/load_image.dart';
import 'package:flutter_deer/widgets/sub_menu.dart';
import 'package:provider/provider.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({
    Key key,
    this.isAccessibilityTest: false,
  }) : super(key: key);

  final bool isAccessibilityTest;

  @override
  IndexPageState createState() => IndexPageState();
}

class IndexPageState extends State<IndexPage>
    with AutomaticKeepAliveClientMixin<IndexPage>
    implements BasePage {
  //  List<SubMenuData> _menus = [
  //    SubMenuData('账户流水', 'shop', 'zhls', AccountRouter.accountRecordListPage),
  //    SubMenuData('资金管理', 'shop', 'zjgl', AccountRouter.accountPage),
  //    SubMenuData('提现账号', 'shop', 'txzh', AccountRouter.withdrawalAccountPage),
  //  ];
  //  List<SubMenuData> _shopMenus = [
  //    SubMenuData('店铺设置', 'shop', 'dpsz', UserRouter.userSettingPage),
  //    SubMenuData('店铺审核', 'shop', 'dpsz', StoreRouter.auditPage),
  //    SubMenuData('订单', 'shop', 'dpsz', OrderRouter.orderPage),
  //    SubMenuData('商品', 'shop', 'dpsz', GoodsRouter.goodsPage),
  //    SubMenuData('统计', 'shop', 'dpsz', StatisticsRouter.orderStatisticsPage),
  //    SubMenuData('店铺', 'shop', 'dpsz', ShopRouter.shopPage),
  //  ];
  List<SubMenuData> _setMenus = [
    SubMenuData('夜间模式', 'shop', 'txzh', SettingRouter.themePage),
    SubMenuData('我的账号', 'shop', 'txzh', SettingRouter.accountManagerPage),
    SubMenuData('关于我们', 'shop', 'txzh', SettingRouter.aboutPage),
    SubMenuData('退出登录', 'shop', 'txzh', LoginRouter.loginPage),
  ];
  UserProvider provider = UserProvider();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initProvide();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final Color _iconColor = ThemeUtils.getIconColor(context);
    return ChangeNotifierProvider<UserProvider>(
      create: (_) => provider,
      child: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              IconButton(
                tooltip: '消息',
                onPressed: () {
                  NavigatorUtils.push(context, UserRouter.messagePage);
                },
                icon: LoadAssetImage(
                  'shop/message',
                  key: const Key('message'),
                  width: 24.0,
                  height: 24.0,
                  color: _iconColor,
                ),
              ),
              IconButton(
                tooltip: '设置',
                onPressed: () {
                  NavigatorUtils.push(context, SettingRouter.settingPage);
                },
                icon: LoadAssetImage(
                  'shop/setting',
                  key: const Key('setting'),
                  width: 24.0,
                  height: 24.0,
                  color: _iconColor,
                ),
              )
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Gaps.vGap12,
              Consumer<UserProvider>(
                builder: (_, provider, __) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: MergeSemantics(
                      child: Stack(
                        children: <Widget>[
                          const SizedBox(width: double.infinity, height: 56.0),
                          Text(
                            provider.user?.name == null
                                ? '大地的爱'
                                : provider.user.name,
                            style: TextStyles.textBold24,
                          ),
                          Positioned(
                              right: 0.0,
                              child: CircleAvatar(
                                  radius: 28.0,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: ImageUtils.getImageProvider(
                                      provider.user?.avatarUrl,
                                      holderImg: 'shop/tx'))),
                          Positioned(
                            top: 38.0,
                            left: 0.0,
                            child: Row(
                              children: <Widget>[
                                Gaps.hGap16,
                                Gaps.hGap8,
                                const Text('多名程序员祭天后，终于可以上线了',
                                    style: TextStyles.textSize12)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Gaps.vGap32,
              //              Container(
              //                height: 0.6,
              //                width: double.infinity,
              //                margin: const EdgeInsets.only(left: 16.0),
              //                child: Gaps.line,
              //              ),
              Gaps.vGap32,

              SubMenu(_setMenus),
              Gaps.vGap32,
              UserSettingMenu(),
            ],
          )),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  initProvide() {
    // 等待页面渲染完成,初始化provide
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.context = context;
    });
  }
}
