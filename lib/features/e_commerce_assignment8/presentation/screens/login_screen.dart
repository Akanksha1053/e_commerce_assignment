import 'package:e_commerce_assignment8/core/constants/color_constants.dart';

import 'package:flutter/material.dart';

import '../../../../core/constants/text_constants.dart';
import '../../../../core/constants/textstyle_constants.dart';
import '../widgets/login_screen_widgets/credential_formfield_widget.dart';
import '../widgets/login_screen_widgets/login_option_widget.dart';
import 'home_action_menu_screen.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});

  final _form = GlobalKey<FormState>();

  bool _saveForm() {
    final isValid = _form.currentState!.validate();
    if (isValid) {
      _form.currentState!.save();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: ColorConstants.appbarBackgroundColor,
        elevation: 0,
        leading: const IconButton(
          icon: Icon(
            Icons.arrow_back_sharp,
            color: ColorConstants.appbarIconColor,
            size: 30,
          ),
          onPressed: null,
        ),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Form(
          key: _form,
          child: Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 11,
                    child: Image.asset(
                      'assets/images/login_logo.png',
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    createAccountText,
                    style: createAccountTextStyle,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  CredentialFormField(
                      iconLeading: Icons.email_outlined, label: 'Email'),
                  SizedBox(height: MediaQuery.of(context).size.height / 30),
                  CredentialFormField(
                      iconLeading: Icons.lock,
                      label: 'Password',
                      suffixIcon: Icons.remove_red_eye_outlined),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: null,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        side: const BorderSide(
                            color: ColorConstants.checkBoxBorderColor,
                            width: 3),
                      ),
                      const Text(
                        rememberMeText,
                        style: rememberMeTextStyle,
                      )
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 60),
                  Container(
                    height: MediaQuery.of(context).size.height / 12,
                    margin: const EdgeInsets.only(left: 24, right: 24),
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 8, bottom: 8),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: ColorConstants.signUpButtonColor),
                    child: TextButton(
                        onPressed: () {
                          if (_saveForm()) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const HomeActionMenuScreen(),
                            ));
                          }
                        },
                        child: const Text(signUpText, style: signUpTextStyle)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 45),
                  Container(
                    margin: const EdgeInsets.only(left: 24, right: 24),
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 8, bottom: 8),
                    child: Row(children: const <Widget>[
                      Expanded(
                          child: Divider(
                        thickness: 2,
                      )),
                      SizedBox(
                        width: 2,
                      ),
                      Text(orContinueWithDividerText,
                          style: orContinueWithDividerTextStyle),
                      SizedBox(
                        width: 2,
                      ),
                      Expanded(
                          child: Divider(
                        thickness: 2,
                      )),
                    ]),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 15,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 28, right: 28),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: const <Widget>[
                        LoginOptionWidget(
                            icon: Icons.facebook_rounded,
                            color: ColorConstants.loginFacebookIconColor),
                        LoginOptionWidget(
                          icon: Icons.g_mobiledata_rounded,
                          color: ColorConstants.loginGoogleIconColor,
                        ),
                        LoginOptionWidget(
                          icon: Icons.apple_sharp,
                          color: ColorConstants.loginAppleIconColor,
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text(alreadyHaveAnAccountText,
                          style: alreadyHaveAnAccountTextStyle),
                      TextButton(
                          onPressed: null,
                          child: Text(
                            signinButtonText,
                            style: signinButtonTextStyle,
                          ))
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
