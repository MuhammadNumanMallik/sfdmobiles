import 'package:flutter/material.dart';

import '../../../res/color.dart';


class New_Phone_Entry extends StatefulWidget {
  const New_Phone_Entry({Key? key}) : super(key: key);

  @override
  State<New_Phone_Entry> createState() => _New_Phone_EntryState();
}

class _New_Phone_EntryState extends State<New_Phone_Entry> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text('New Phones'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 10,left: 10),
          child: Column(

            children: [
              Image.asset(
                'assets/image/sfd_logo.png',
                height: 200,
              ),
              TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Mobile Name',
                    labelText: 'Mobile Name',
                  )),
              SizedBox(
                  height: height * .02
              ),
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
                  Expanded(child:   TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Ram',
                        labelText: 'Ram',
                      )),),
                  SizedBox(width: 10,),
                  Expanded(child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Rom',
                        labelText: 'Rom',
                      )),),
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
                  Expanded(
                      child: Image.asset('assets/image/sfd_logo.png')), Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: AppColors.image_chose,
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                        onPressed: (){}, child: Text('Select Image')),),
                  SizedBox(width: 20,),
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: AppColors.image_chose,
                            textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                        onPressed: (){}, child: Text('Submit')),)

                ],
              )

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Colors.green[300],
        child: const Icon(Icons.add),
      ),
    );
  }
}
