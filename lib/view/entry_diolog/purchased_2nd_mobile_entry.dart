import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sfdmobile/res/color.dart';
import 'package:sfdmobile/utils/utils.dart';

class Purchasd2ndMobileEntry extends StatefulWidget {
  const Purchasd2ndMobileEntry({Key? key}) : super(key: key);

  @override
  State<Purchasd2ndMobileEntry> createState() => _Purchasd2ndMobileEntryState();
}

class _Purchasd2ndMobileEntryState extends State<Purchasd2ndMobileEntry> {
  File? _c_image;
  File? _F_CNIC;
  File? _B_CNIC;
  final picker = ImagePicker();

  TextEditingController mobilename = TextEditingController();

  Future customerImage() async {
    var pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _c_image = File(pickedImage!.path);
    });
  }

  Future front_cnic() async {
    var pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _F_CNIC = File(pickedImage!.path);
    });
  }

  Future back_cnic() async {
    var pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _B_CNIC = File(pickedImage!.path);
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
              title: Text('Purchased Second Hand Mobile Entry'),
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
                    hintText: 'Seller Name',
                    labelText: 'Seller Name',
                  )),
                  SizedBox(
                    height: height * .02,
                  ),
                  TextFormField(
                      decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Seller CNIC No',
                    labelText: 'Seller CNIC No',
                  )),
                  SizedBox(
                    height: height * .02,
                  ),
                  TextFormField(
                      decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Seller Cell No',
                    labelText: 'Seller Cell No',
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
                  TextFormField(
                      decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Yes/No',
                    labelText: 'Warranty Yes/No',
                  )),
                  SizedBox(
                    height: height * .02,
                  ),
                  TextFormField(
                      decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Yes/No',
                    labelText: 'Box Yes/No',
                  )),
                  SizedBox(
                    height: height * .02,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text('CNIC Fornt Side'),
                            InkWell(
                              onTap: () {
                                front_cnic();
                              },
                              child: _F_CNIC == null
                                  ? Image.asset(
                                      'assets/image/sfd_logo.png',
                                  height: 60,
                                  width: 150
                                    )
                                  : Image.file(_F_CNIC!, height: 60,
                                width: 150,),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text('CNIC Back Side'),
                            InkWell(
                                onTap: () {
                                  back_cnic();
                                },
                                child: _B_CNIC == null
                                    ? Image.asset(
                                        'assets/image/sfd_logo.png',
                                    height: 60,
                                    width: 150
                                      )
                                    : Image.file(_B_CNIC!, height: 60,
                                  width: 150,)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: InkWell(
                            onTap: (){
                              customerImage();
                            },
                              child: _c_image == null
                                  ? Image.asset('assets/image/sfd_logo.png',height: 60,
                                  width: 150)
                                  : Image.file(_c_image!, height: 60,
                                width: 150,))),
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
