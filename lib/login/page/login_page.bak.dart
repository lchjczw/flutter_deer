import 'package:flustars/flustars.dart' as FlutterStars;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_deer/common/common.dart';
import 'package:flutter_deer/login/presenter/login_presenter.dart';
import 'package:flutter_deer/mvp/base_page_state.dart';
import 'package:flutter_deer/res/resources.dart';
import 'package:flutter_deer/routers/fluro_navigator.dart';
import 'package:flutter_deer/routers/routers.dart';
import 'package:flutter_deer/util/utils.dart';
import 'package:flutter_deer/widgets/app_bar.dart';
import 'package:flutter_deer/widgets/my_button.dart';
import 'package:flutter_deer/widgets/my_scroll_view.dart';
import 'package:flutter_deer/widgets/text_field.dart';

import '../login_router.dart';

/// design/1注册登录/index.html
class LoginPage extends StatefulWidget {
  const LoginPage({
    Key key,
  }) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends BasePageState<LoginPage, LoginPresenter> {
  //定义一个controller
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  bool _clickable = false;

  @override
  void initState() {
    super.initState();
    //监听输入改变
    nameController.addListener(_verify);
    passwordController.addListener(_verify);
    nameController.text = FlutterStars.SpUtil.getString(Constant.phone);
  }

  void _verify() {
    String name = nameController.text;
    String password = passwordController.text;
    bool clickable = true;
    if (name.isEmpty || name.length < 11) {
      clickable = false;
    }
    if (password.isEmpty || password.length < 6) {
      clickable = false;
    }

    /// 状态不一样在刷新，避免重复不必要的setState
    if (clickable != _clickable) {
      setState(() {
        _clickable = clickable;
      });
    }
  }

  void _login() {
    presenter.login1((ok) {
      if (ok) {
        print('登录成功');
        NavigatorUtils.push(context, Routes.home);
      } else {
        print('登录失败');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        isBack: false,
        actionName: '验证码登录',
        onPressed: () {
          NavigatorUtils.push(context, LoginRouter.smsLoginPage);
        },
      ),
      body: MyScrollView(
        keyboardConfig:
            Utils.getKeyboardActionsConfig(context, [_nodeText1, _nodeText2]),
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
        children: _buildBody,
      ),
    );
  }

  get _buildBody => [
        const Text(
          '密码登录',
          style: TextStyles.textBold26,
        ),
        Gaps.vGap16,
        MyTextField(
          key: const Key('phone'),
          focusNode: _nodeText1,
          controller: nameController,
          maxLength: 11,
          keyboardType: TextInputType.phone,
          hintText: '请输入账号',
        ),
        MyTextField(
          key: const Key('password'),
          keyName: 'password',
          focusNode: _nodeText2,
          isInputPwd: true,
          controller: passwordController,
          keyboardType: TextInputType.visiblePassword,
          maxLength: 16,
          hintText: '请输入密码',
        ),
        Gaps.vGap24,
        MyButton(
          key: const Key('login'),
          onPressed: _clickable ? _login : null,
          text: '登录',
        ),
        Container(
          height: 40.0,
          alignment: Alignment.centerRight,
          child: GestureDetector(
            child: Text(
              '忘记密码',
              style: Theme.of(context).textTheme.subtitle,
            ),
            onTap: () =>
                NavigatorUtils.push(context, LoginRouter.resetPasswordPage),
          ),
        ),
        Gaps.vGap16,
        Container(
            alignment: Alignment.center,
            child: GestureDetector(
              child: Text(
                '还没账号？快去注册',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              onTap: () =>
                  NavigatorUtils.push(context, LoginRouter.registerPage),
            ))
      ];

  @override
  LoginPresenter createPresenter() {
    return LoginPresenter();
  }
}
