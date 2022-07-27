
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sfdmobile/utils/utils.dart';
import 'package:sfdmobile/view/home_screens/new_phones.dart';
import 'package:sfdmobile/view/home_screens/purchased_2nd_hand_Phone.dart';
import 'package:sfdmobile/view/home_screens/sold_new_Phone.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var id;
  var sh_name;

  var card_text = TextStyle(fontSize: 15, fontWeight: FontWeight.bold);
  var cardRadious = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
  );

  @override
  void initState() {
    // TODO: implement initState
    _loadCounter();
    super.initState();
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      id = (prefs.get('id') ?? '');
      sh_name = prefs.getString('sh_name');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(title: Text('$sh_name',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: OrientationBuilder(builder: (context, orientation) {
            return GridView.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 15,
              crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
              children: [
                InkWell(
                  onTap:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => New_Phones()),
                    );
                  },
                  child: Card(
                    shape: cardRadious,
                    child: Container(
                        color: Colors.white60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icon/new_phone.png',
                              height: 80,
                              width: 80,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text('New Phone', style: card_text)
                          ],
                        )),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SoldNewPhone()),
                    );
                  },
                  child: Card(
                    shape: cardRadious,
                    child: Container(
                        color: Colors.white60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icon/new_phone.png',
                              height: 80,
                              width: 80,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Align(

                              child: Text(
                                  'Sold New Phone ',style: card_text,

                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Purchased_Sec_Hand_Phone()),
                    );
                  },
                  child: Card(
                    shape: cardRadious,
                    child: Container(
                        color: Colors.white60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icon/new_phone.png',
                              height: 80,
                              width: 80,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text('Purchased 2nd Hand Phone', style: card_text)
                          ],
                        )),
                  ),
                ),
                Card(
                  shape: cardRadious,
                  child: Container(
                      color: Colors.white60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icon/new_phone.png',
                            height: 80,
                            width: 80,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text('2nd Hand Phone', style: card_text)
                        ],
                      )),
                ),
                Card(
                  shape: cardRadious,
                  child: Container(
                      color: Colors.white60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icon/new_phone.png',
                            height: 80,
                            width: 80,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text('Sold 2nd Hand Phone', style: card_text)
                        ],
                      )),
                ),
                Card(
                  shape: cardRadious,
                  child: Container(
                      color: Colors.white60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icon/new_phone.png',
                            height: 80,
                            width: 80,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text('Mobile Accessories', style: card_text)
                        ],
                      )),
                ),
              ],
            );
          }),
        ));
  }
}
// Scaffold(
// appBar: AppBar(
// title: Text('$sh_name'),
// ),
// body: CustomScrollView(
// primary: false,
// slivers: <Widget>[
// SliverPadding(
// padding: const EdgeInsets.all(20),
// sliver: SliverGrid.count(
// crossAxisSpacing: 10,
// mainAxisSpacing: 10,
// crossAxisCount: 2,
// children: <Widget>[
// Card(
// shape: cardRadious,
// child:Container(
// padding: const EdgeInsets.all(8),
// color: Colors.white60,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Image.asset('assets/icon/new_phone.png',height: 80,width: 80,),
// SizedBox(height: 15,),
// Text('New Phone',style:card_text )
// ],)
// ),),
//
// Card(
// shape: cardRadious,
// child:Container(
// padding: const EdgeInsets.all(8),
// color: Colors.white60,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Image.asset('assets/icon/new_phone.png',height: 80,width: 80,),
// SizedBox(height: 15,),
// Text('New Phone',style:card_text )
// ],)
// ),),
// Card(
// shape: cardRadious,
// child:Container(
// padding: const EdgeInsets.all(8),
// color: Colors.white60,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Image.asset('assets/icon/new_phone.png',height: 80,width: 80,),
// SizedBox(height: 15,),
// Text('New Phone',style:card_text )
// ],)
// ),),
// Card(
// shape: cardRadious,
// child:Container(
// padding: const EdgeInsets.all(8),
// color: Colors.white60,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Image.asset('assets/icon/new_phone.png',height: 80,width: 80,),
// SizedBox(height: 15,),
// Text('New Phone',style:card_text )
// ],)
// ),),
// Card(
// shape: cardRadious,
// child:Container(
// padding: const EdgeInsets.all(8),
// color: Colors.white60,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Image.asset('assets/icon/new_phone.png',height: 80,width: 80,),
// SizedBox(height: 15,),
// Text('New Phone',style:card_text )
// ],)
// ),),
// Card(
// shape: cardRadious,
// child:Container(
// padding: const EdgeInsets.all(8),
// color: Colors.white60,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Image.asset('assets/icon/new_phone.png',height: 80,width: 80,),
// SizedBox(height: 15,),
// Text('New Phone',style:card_text )
// ],)
// ),),
//
// ],
// ),
// ),
// ],
// )
// );
