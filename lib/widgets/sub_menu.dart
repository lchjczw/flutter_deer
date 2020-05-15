import 'package:flutter/material.dart';
import 'package:flutter_deer/res/gaps.dart';
import 'package:flutter_deer/res/styles.dart';
import 'package:flutter_deer/routers/fluro_navigator.dart';
import 'package:flutter_deer/util/theme_utils.dart';
import 'package:flutter_deer/widgets/load_image.dart';

/// img为本地图片时，图片路径组成：dir+themeKey+img
/// img 和 router 是网址的时候，作为网址直接访问
class SubMenuData {
  String title;
  String img;
  String router;
  String dir;

  SubMenuData(this.title, this.dir, this.img, this.router);

  String image(BuildContext context) {
    if (img.startsWith('http')) {
      return img;
    }

    String dark = dir + '/' + (ThemeUtils.isDark(context) ? 'dark_' : '');
    return dark + img;
  }
}

class SubMenu extends StatelessWidget {
  final List<SubMenuData> menus;
  final int num;
  final double imgWidth;

  SubMenu(this.menus, {this.num = 4, this.imgWidth = 32.0});

  @override
  Widget build(BuildContext context) {
    if (menus == null) {
      return Flexible();
    }

    return Flexible(
      child: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 12.0),
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: num, childAspectRatio: 1.18),
        itemCount: menus.length,
        itemBuilder: (_, index) {
          return InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LoadImage(menus[index].image(context), width: imgWidth),
                Gaps.vGap4,
                Text(
                  menus[index].title,
                  style: TextStyles.textSize12,
                )
              ],
            ),
            onTap: () {
              if (menus[index].router.startsWith('http')) {
                NavigatorUtils.goWebViewPage(
                    context, menus[index].title, menus[index].router);
                return;
              }
              NavigatorUtils.push(context, menus[index].router);
            },
          );
        },
      ),
    );
  }
}
