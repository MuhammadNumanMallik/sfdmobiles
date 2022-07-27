import 'package:flutter/material.dart';

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
        title: Text('Sold New Phones'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Purchased_Sec_Hand(context);
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

Purchased_Sec_Hand(BuildContext context) {
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
                    Image.asset('assets/image/sfd_logo.png',height: 100,width: 100,),
                  ],
                ),
              ),

              Expanded(
                child: Column(
                  children: [
                    Text('CNIC Back Side'),
                    Image.asset('assets/image/sfd_logo.png',height: 100,width: 100,),
                  ],
                ),
              ),
            ],
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
