import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sfdmobile/model/get_all_new_mobile.dart';
import 'package:sfdmobile/res/app_url.dart';
import 'package:sfdmobile/view/entry_diolog/new_mobile_entry.dart';

class New_Phones extends StatefulWidget {
  const New_Phones({Key? key}) : super(key: key);

  @override
  State<New_Phones> createState() => _New_PhonesState();
}

class _New_PhonesState extends State<New_Phones> {
  int? id;
  List<GetAllNewMobile> list = [];
  var isLoaded = false;
  @override
  void initState() {
    super.initState();
    getAllNewMob();
  }

  Future<List<GetAllNewMobile>> getAllNewMob() async {
    var url = Uri.parse(
        'http://sfd.atwebpages.com/get_all_new_mob.php');
    var response = await http.get(url);
    var data = jsonDecode(response.body);
print(response);
    if (response.statusCode == 200) {
      for (Map i in data) {
        list.add(GetAllNewMobile.fromJson(i));

        setState(() {
          isLoaded = true;
        });

      }
      return list;
    } else {
      return list;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Phones'),
      ),
      body:Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Container(
                  child: Card(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(children: [
                                Text(
                                  '${list[index].newMobName}',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                                Container(child: Image.network(GET_NEW_MOB_IMG+
                                    '${list[index].newMobImg}',height: 78,fit: BoxFit.fill,),)

                              ],),
                            ),

                          ],
                        )
                    ),
                  ));
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext conttext) {
                return NewMobileEntry();
              });
        },
        backgroundColor: Colors.green[300],
        child: const Icon(Icons.add),
      ),
    );
  }
}
