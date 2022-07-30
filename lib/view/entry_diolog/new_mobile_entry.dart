import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sfdmobile/res/app_url.dart';
import 'package:sfdmobile/res/color.dart';
import 'package:sfdmobile/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NewMobileEntry extends StatefulWidget {
  const NewMobileEntry({Key? key}) : super(key: key);

  @override
  State<NewMobileEntry> createState() => _NewMobileEntryState();
}

class _NewMobileEntryState extends State<NewMobileEntry> {
  int? id;
  File? _image;
  final picker = ImagePicker();
  TextEditingController mobilename = TextEditingController();
  TextEditingController mobileModel = TextEditingController();
  TextEditingController mobileRam = TextEditingController();
  TextEditingController mobileRom = TextEditingController();
  TextEditingController mobilePrice = TextEditingController();
  TextEditingController mobilePta = TextEditingController();

  Future choiseImage() async {
    var pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedImage!.path);
    });
  }

  clearimage() {
    setState(() {
      _image = null;
    });
  }

  Future AddNewMobile() async {

    var request= http.MultipartRequest('POST',Uri.parse(NEW_MOB_ADD));
    request.fields['sh_id']=id.toString();
    request.fields['new_mob_name']=mobilename.text;
    request.fields['new_mob_mod']=mobileModel.text;
    request.fields['new_mob_ram']=mobileRam.text;
    request.fields['new_mob_rom']=mobileRom.text;
    request.fields['new_mob_price']=mobilePrice.text;
    request.fields['new_mobile_pta']=mobilePta.text;
    var pic=await http.MultipartFile.fromPath('new_mob_img', _image!.path);
    request.files.add(pic);
    var response=await request.send();


    // var response = await http.post(Uri.parse(NEW_MOB_ADD), body: {
    //   "sh_id": id.toString(),
    //   "new_mob_name": mobilename.text,
    //   "new_mob_mod": mobileModel.text,
    //   "new_mob_ram": mobileRam.text,
    //   "new_mob_rom": mobileRom.text,
    //   "new_mob_price": mobilePrice.text,
    //   "new_mobile_pta": mobilePta.text,
    // });
    if(response.statusCode==200){
      mobilename.clear();
      mobileModel.clear();
      mobileRam.clear();
      mobileRom.clear();
      mobilePrice.clear();
      mobilePta.clear();
      clearimage();
      Utils.flushBarErrorMessage('Updated', context);
    }else{
      Utils.flushBarErrorMessage('SomeThing Wrong', context);
    }
    setState(() {
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _loadCounter();
    super.initState();
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      id = (prefs.getInt('id')?? 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Dialog(

      child: SingleChildScrollView(
        child: Stack(
         children: [
           Column(
             children: [
               AppBar(
                 elevation: 1,
                 backgroundColor: Colors.white60,
                 iconTheme: IconThemeData(color: Colors.black),
                 title: Text('New Mobile Entry'),
               ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Column(
                   children: [
                     Image.asset(
                       'assets/image/sfd_logo.png',
                       height: 200,
                     ),
                     TextFormField(
                         autofocus: true,
                         keyboardType: TextInputType.text,
                         controller: mobilename,
                         decoration: const InputDecoration(
                           border: OutlineInputBorder(),
                           hintText: 'Mobile Name',
                           labelText: 'Mobile Name',
                         )),
                     SizedBox(height: height * .02),
                     TextFormField(
                         controller: mobileModel,
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
                               controller: mobileRam,
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
                               controller: mobileRom,
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
                         controller: mobilePrice,
                         decoration: const InputDecoration(
                           border: OutlineInputBorder(),
                           hintText: 'Price',
                           labelText: 'Price',
                         )),
                     SizedBox(
                       height: height * .02,
                     ),
                     TextFormField(
                         controller: mobilePta,
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
                             child: InkWell(
                                 onTap: () {
                                   choiseImage();
                                 },
                                 child: _image == null
                                     ? Image.asset('assets/image/sfd_logo.png')
                                     : Image.file(
                                   _image!,
                                   height: 80,
                                   width: 100,
                                 ))),
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
                                 } else if (mobileModel.text.isEmpty) {
                                   Utils.flushBarErrorMessage(
                                       'Please Enter Mobile Model', context);
                                 } else if (mobileRam.text.isEmpty) {
                                   Utils.flushBarErrorMessage(
                                       'Please Enter Mobile Ram', context);
                                 } else if (mobileRom.text.isEmpty) {
                                   Utils.flushBarErrorMessage(
                                       'Please Enter Mobile Rom', context);
                                 } else if (mobilePrice.text.isEmpty) {
                                   Utils.flushBarErrorMessage(
                                       'Please Enter Mobile Price', context);
                                 } else if (mobilePta.text.isEmpty) {
                                   Utils.flushBarErrorMessage(
                                       'Please Enter Mobile Price', context);
                                 } else {
                                   AddNewMobile();
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
         ],
        ),
      ),
    );
  }
}
