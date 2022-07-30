import 'package:flutter/material.dart';
import 'package:sfdmobile/view/entry_diolog/purchased_2nd_mobile_entry.dart';

import '../../res/color.dart';
import '../../utils/utils.dart';


class Purchased_Sec_Hand_Phone extends StatefulWidget {
  const Purchased_Sec_Hand_Phone({Key? key}) : super(key: key);

  @override
  State<Purchased_Sec_Hand_Phone> createState() => _Purchased_Sec_Hand_PhoneState();
}

class _Purchased_Sec_Hand_PhoneState extends State<Purchased_Sec_Hand_Phone> {

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text('Purchased Second Hand Phones'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          showDialog(
              barrierDismissible: false,
              context: context, builder: (BuildContext conttext){
            return Purchasd2ndMobileEntry();
          });
        },
        backgroundColor: Colors.green[300],
        child: const Icon(Icons.add),
      ),
    );
  }
}

