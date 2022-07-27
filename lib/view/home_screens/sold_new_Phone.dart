import 'package:flutter/material.dart';

import '../../res/color.dart';
import '../../utils/utils.dart';


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
          Sold_NewPhoneForm(context);
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

Sold_NewPhoneForm(BuildContext context) {
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
