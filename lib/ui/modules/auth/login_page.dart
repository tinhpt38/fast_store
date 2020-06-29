import 'package:fast_store/ui/base/base_page.dart';
import 'package:fast_store/ui/common/app_color.dart';
import 'package:fast_store/ui/common/loading.dart';
import 'package:fast_store/ui/common/text_field.dart';
import 'package:fast_store/ui/modules/auth/login_model.dart';
import 'package:fast_store/ui/modules/root/root_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController;
  TextEditingController passwordController;
  LoginMode _loginMode;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _loginMode.setBusy(true);
      await _loginMode.readLogin();
      _loginMode.setBusy(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return PageBase<LoginMode>(
      model: LoginMode(),
      builder: (context, model, child) {
        _loginMode = model;
        Future.delayed(Duration.zero, () {
          if (model.isLoginSuccess) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => RootPage(false)));
          }
        });

        return Scaffold(
          backgroundColor: Color(0xfff1f2f3f4),
          body: Stack(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Container(
                      width: size.width * 1 / 2,
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Image.asset("assets/logo.png"),
                      ),
                    ),
                    Divider(
                      color: AppColor.primary,
                      height: 12,
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            child: AppField(
                              controller: emailController,
                              icon: Icons.email,
                              hinText: "Email",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            child: AppField(
                              controller: passwordController,
                              icon: Icons.security,
                              type: TextInputType.visiblePassword,
                              obscureText: true,
                              hinText: "Password",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(24),
                            child: RaisedButton(
                              highlightColor: AppColor.subPrimary,
                              splashColor: AppColor.subPrimary,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              onPressed: () async {
                                await model.login(emailController.text,
                                    passwordController.text);
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(90))),
                              color: AppColor.second,
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Visibility(
                visible: model.busy,
                child: Center(
                  child: Loading(
                    landingMessage: "Đang đăng nhập vào hệ thống",
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
