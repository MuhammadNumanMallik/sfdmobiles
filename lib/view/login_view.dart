import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sfdmobile/model/Login_User_Model.dart';
import 'package:sfdmobile/res/components/round_button.dart';
import 'package:sfdmobile/utils/utils.dart';

import '../res/app_url.dart';
import '../shared_pref/shard_pref.dart';
import 'home_screen.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginUserModel? loginUserModel;

  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  TextEditingController _phNoController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode phNoFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _phNoController.dispose();
    _passwordController.dispose();

    phNoFocusNode.dispose();
    passwordFocusNode.dispose();

    _obsecurePassword.dispose();
  }

  Future userLogin() async {
    Map<String, String> headers = {
      // 'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8'
    };

    http.post(Uri.parse(LOGIN_URL), headers: headers);
    try{
      // var url = Uri.parse(LOGIN_URL);
      var response = await http.post(Uri.parse(LOGIN_URL), headers: headers, body: {
        "ph_no": _phNoController.text.toString(),
        "pass_word": _passwordController.text.toString(),
      });
      var data = jsonDecode(response.body);
      LoginUserModel userModel = LoginUserModel.fromJson(data);
      setState(() {
        loginUserModel = userModel;
      });
      if (loginUserModel!.error == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        ).then((value) {
          _phNoController.clear();
          _passwordController.clear();
        });
        Shard_Pref().saveUser(loginUserModel!.user!.sId!.toInt(), loginUserModel!.user!.shpName.toString());
      } else {
        Utils.flushBarErrorMessage('${loginUserModel!.message}', context);
      }

    } catch (e){
      print(e);
    }
    }



  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image/sfd_logo.png',
              height: 200,
            ),
            TextFormField(
              controller: _phNoController,
              keyboardType: TextInputType.number,
              focusNode: phNoFocusNode,
              decoration: const InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.alternate_email)),
              onFieldSubmitted: (valu) {
                Utils.fieldFocusChange(
                    context, phNoFocusNode, passwordFocusNode);
              },
            ),
            ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _passwordController,
                    obscureText: _obsecurePassword.value,
                    focusNode: passwordFocusNode,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock_open_rounded),
                      suffixIcon: InkWell(
                          onTap: () {
                            _obsecurePassword.value = !_obsecurePassword.value;
                          },
                          child: Icon(_obsecurePassword.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility)),
                    ),
                  );
                }),
            SizedBox(
              height: height * .085,
            ),
            RoundButton(
              title: 'Login',
              onPress: () {
                if (_phNoController.text.isEmpty) {
                  Utils.flushBarErrorMessage('Please enter email', context);
                } else if (_passwordController.text.isEmpty) {
                  Utils.flushBarErrorMessage('Please enter password', context);
                } else if (_passwordController.text.length < 6) {
                  Utils.flushBarErrorMessage(
                      'Please enter 6 digit password', context);
                } else {
                  userLogin();
                  print('Clicked');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

