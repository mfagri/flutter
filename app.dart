import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(drawerScrimColor:Colors.black ,
//     body: Text("home",style: TextStyle(color: Colors.blue,fontWeight:FontWeight.bold, fontSize: 25 ) ,),
//       appBar: AppBar(backgroundColor: Colors.black,),
//       drawer: Drawer(child: Text("mfagri",style: TextStyle(color: Colors.blue,fontWeight:FontWeight.bold, fontSize: 25 ),),),)
//   ));
// }

void main() => runApp(MaterialApp(
  home: Home(),
  // home: Scaffold(
  //   appBar: AppBar(
  //     title: Text(
  //       'mfagri',
  //        style: TextStyle(
  //        //backgroundColor: Colors.white,
  //        fontSize: 20.0,
  //        fontWeight: FontWeight.bold,
  //        color: Colors.black
  //       ),
  //       ),
  //     centerTitle: true,
  //     backgroundColor: Colors.yellow[700],
  //   ),
  //   body: Center(
  //     child: Text(
  //       'home',
  //        style: TextStyle(
  //        //backgroundColor: Colors.white,
  //        //letterSpacing: 2.0,
  //        fontSize: 20.0,
  //        fontWeight: FontWeight.bold,
  //        color: Colors.black
  //       ),
  //     ),
  //   ),
  //   // floatingActionButton: FloatingActionButton(
  //   //   child: Text('Action'),
  //   // ),
  //   floatingActionButton: FloatingActionButton(
	//     onPressed: null,
	//     child: Text('Action'),
  //     backgroundColor: Colors.black,
  //   ),
  // ),
));
// add class and buttom in center
class  Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text(
        'mfagri',
         style: TextStyle(
         //backgroundColor: Colors.white,
         fontSize: 20.0,
         fontWeight: FontWeight.bold,
         color: Colors.black
        ),
        ),
      centerTitle: true,
      backgroundColor: Colors.yellow[700],
    ),
    body: Center(
      child: Text(
        'home',
         style: TextStyle(
         //backgroundColor: Colors.white,
         //letterSpacing: 2.0,
         fontSize: 20.0,
         fontWeight: FontWeight.bold,
         color: Colors.black
        ),
      ),
    ),
    // floatingActionButton: FloatingActionButton(
    //   child: Text('Action'),
    // ),
    floatingActionButton: FloatingActionButton(
	    onPressed: null,
	    child: Text('click'),
      backgroundColor: Colors.black,
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  );
  }
}