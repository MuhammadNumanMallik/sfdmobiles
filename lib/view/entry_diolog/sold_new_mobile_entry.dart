import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sfdmobile/res/color.dart';
import 'package:sfdmobile/utils/utils.dart';

class SoldNewMobileEntry extends StatefulWidget {
  const SoldNewMobileEntry({Key? key}) : super(key: key);

  @override
  State<SoldNewMobileEntry> createState() => _SoldNewMobileEntryState();
}

class _SoldNewMobileEntryState extends State<SoldNewMobileEntry> {
  File? _image;
  File? _F_CNIC;
  File? _B_CNIC;
  final picker = ImagePicker();

  TextEditingController mobilename = TextEditingController();

  Future choiseImage() async {
    var pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedImage!.path);
    });
  }



  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Dialog(
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              elevation: 1,
              backgroundColor: Colors.white60,
              iconTheme: IconThemeData(color: Colors.black),
              title: Text('Sold New Mobile Entry'),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
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
                    hintText: 'IMEI No ',
                    labelText: 'IMEI No ',
                  )),
                  SizedBox(
                    height: height * .02,
                  ),
                  TextFormField(
                      decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'IMEI No (optional)',
                    labelText: 'IMEI No (optional)',
                  )),
                  SizedBox(
                    height: height * .02,
                  ),
                  TextFormField(
                      decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Buyer Name',
                    labelText: 'Buyer Name',
                  )),
                  SizedBox(
                    height: height * .02,
                  ),
                  TextFormField(
                      decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Buyer CNIC No',
                    labelText: 'Buyer CNIC No',
                  )),
                  SizedBox(
                    height: height * .02,
                  ),
                  TextFormField(
                      decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Buyer Cell No',
                    labelText: 'Buyer Cell No',
                  )),
                  SizedBox(
                    height: height * .02,
                  ),
                  TextFormField(
                      decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Mobile Color',
                    labelText: 'Mobile Color',
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
                      Expanded(
                          child: _image == null
                              ? Image.asset('assets/image/sfd_logo.png')
                              : Image.file(
                                  _image!,
                                  height: 80,
                                  width: 100,
                                )),
                      Expanded(
                        child: NeumorphicButton(
                          onPressed: () {
                            choiseImage();
                          },
                          style: NeumorphicStyle(
                              color: Theme.of(context).primaryColor),
                          child: Text('Select Image'),
                        ),
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
          ],
        ),
      ),
    );
  }
}
