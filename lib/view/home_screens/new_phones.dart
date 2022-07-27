import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sfdmobile/res/color.dart';
import 'package:sfdmobile/utils/utils.dart';
import 'package:sfdmobile/view/home_screens/form/new_phone_form.dart';

class New_Phones extends StatefulWidget {
  const New_Phones({Key? key}) : super(key: key);

  @override
  State<New_Phones> createState() => _New_PhonesState();
}

class _New_PhonesState extends State<New_Phones> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text('New Phones'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          New_Mobile_Entry_Form(context);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => New_Phone_Entry()),
          // );
        },
        backgroundColor: Colors.green[300],
        child: const Icon(Icons.add),
      ),
    );
  }
}

New_Mobile_Entry_Form(BuildContext context) {
  final height = MediaQuery.of(context).size.height * 1;

  TextEditingController mobilename = TextEditingController();

  AlertDialog alert = AlertDialog(
    content: SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            'assets/image/sfd_logo.png',
            height: 200,
          ),
          TextFormField(
              controller: mobilename,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Mobile Name',
                labelText: 'Mobile Name',
              )),
          SizedBox(height: height * .02),
          TextFormField(
              decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Mobile Model',
            labelText: 'Mobile Model',
          )),
          SizedBox(
            height: height * .02,
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                    decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Ram',
                  labelText: 'Ram',
                )),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextFormField(
                    decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Rom',
                  labelText: 'Rom',
                )),
              ),
            ],
          ),
          SizedBox(
            height: height * .02,
          ),
          TextFormField(
              decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Price',
            labelText: 'Price',
          )),
          SizedBox(
            height: height * .02,
          ),
          TextFormField(
              decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Yes/No',
            labelText: 'PTA Approved Yes/No',
          )),
          SizedBox(
            height: height * .02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: Image.asset('assets/image/sfd_logo.png')),
              Expanded(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: AppColors.image_chose,
                        textStyle: TextStyle(fontWeight: FontWeight.bold)),
                    onPressed: () {},
                    child: Text('Select Image')),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: AppColors.image_chose,
                        textStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      if (mobilename.text.isEmpty) {
                        Utils.flushBarErrorMessage(
                            'Please Enter Mobile Name', context);
                      }
                    },
                    child: Text('Submit')),
              )
            ],
          )
        ],
      ),
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
