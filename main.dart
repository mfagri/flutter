import 'dart:html';

import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(drawerScrimColor:Colors.black ,
//     body: Text("home",style: TextStyle(color: Colors.blue,fontWeight:FontWeight.bold, fontSize: 25 ) ,),
//       appBar: AppBar(backgroundColor: Colors.black,),
//       drawer: Drawer(child: Text("mfagri",style: TextStyle(color: Colors.blue,fontWeight:FontWeight.bold, fontSize: 25 ),),),)
//   ));
// }
void main()
{
  runApp(MaterialApp
  (
    home: Scaffold
    (
      appBar: AppBar(),
      drawer: Drawer(),
      body: Text("mfagri"),
    ),
  )
  );
}