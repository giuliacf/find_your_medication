import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:find_your_medication/screens/search_drugs_screen.dart';
import 'package:find_your_medication/stores/login_store.dart';
import 'package:find_your_medication/widgets/connection.dart';
import 'package:find_your_medication/widgets/custom_fields.dart';
import 'package:find_your_medication/widgets/custom_icons_buttons.dart';
import 'package:find_your_medication/widgets/custom_texts.dart';
import 'package:find_your_medication/widgets/toats.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  LoginStore loginStore;
  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    loginStore = Provider.of<LoginStore>(context);
    disposer = reaction((_) => loginStore.loggedIn, (loggedIn) {
      if (loginStore.loggedIn) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => SearchDrugsScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTexts(
                  size: 28,
                  text: "Find your medication",
                  fontWeight: FontWeight.bold,
                  textColor: lightBlue,
                ),
                const SizedBox(
                  height: 22,
                ),
                Image.asset('images/lightIcon.png', width: 150),
                const SizedBox(
                  height: 70,
                ),
                Observer(
                  builder: (_) {
                    return CustomFields(
                      hint: 'E-mail',
                      prefix: Icon(Icons.account_circle, color: lightGreen),
                      textInputType: TextInputType.emailAddress,
                      onChanged: loginStore.setEmail,
                      enabled: !loginStore.loading,
                    );
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                Observer(
                  builder: (_) {
                    return CustomFields(
                      hint: 'Password',
                      prefix: Icon(
                        Icons.lock,
                        color: lightGreen,
                      ),
                      obscure: !loginStore.passwordVisibility,
                      onChanged: loginStore.setPasword,
                      enabled: !loginStore.loading,
                      suffix: CustomIconsButtons(
                        radius: 32,
                        iconData: loginStore.passwordVisibility
                            ? Icons.visibility
                            : Icons.visibility_off,
                        onTap: loginStore.showPassword,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                Observer(
                  builder: (_) {
                    return SizedBox(
                      height: 44,
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: loginStore.loading
                              ? CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(whiteColor),
                                )
                              : Text('Login'),
                          color: lightGreen,
                          textColor: Colors.white,
                          onPressed: () async {
                            if (await Connection.verifiyUserConnection()) {
                              loginStore.email.isEmpty ||
                                      loginStore.password.isEmpty
                                  ? Toats.messages(
                                      "Fill out all the fields to continue")
                                  : loginStore.loadingLogin();
                            } else {
                              Toats.messages(
                                  "Check your connection to sign in");
                            }
                          }),
                    );
                  },
                )
              ],
            )),
      )),
    );
  }
}
