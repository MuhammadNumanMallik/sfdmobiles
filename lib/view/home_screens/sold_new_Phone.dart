import 'package:flutter/material.dart';
import 'package:sfdmobile/view/entry_diolog/sold_new_mobile_entry.dart';

class SoldNewPhone extends StatefulWidget {
  const SoldNewPhone({Key? key}) : super(key: key);

  @override
  State<SoldNewPhone> createState() => _SoldNewPhoneState();
}

class _SoldNewPhoneState extends State<SoldNewPhone> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text('Sold New Phones'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              barrierDismissible: false,
              context: context, builder: (BuildContext conttext){
            return SoldNewMobileEntry();
          });
        },
        backgroundColor: Colors.green[300],
        child: const Icon(Icons.add),
      ),
    );
  }
}


