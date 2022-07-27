
import 'package:flutter/cupertino.dart';
import 'package:sfdmobile/model/Login_User_Model.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Shard_Pref with ChangeNotifier{

  Future saveUser(int id,String sh_name)async{

    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt('id', id);
    sp.setString('sh_name', sh_name);
    notifyListeners();
  }

  // Future<UserModel> getUser()async{
  //
  //   final SharedPreferences sp = await SharedPreferences.getInstance();
  //   final String? token = sp.getString('token');
  //
  //   return UserModel(
  //     token: token.toString()
  //   );
  // }
  //
  // Future<bool> remove()async{
  //
  //   final SharedPreferences sp = await SharedPreferences.getInstance();
  //   sp.remove('token');
  //   return true;
  //
  // }
}