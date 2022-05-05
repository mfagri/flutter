

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
  home: FavoriteWidget(),

));
class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({Key? key}) : super(key: key);

  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}
class  _FavoriteWidgetState extends State< FavoriteWidget> {
  var age = 0;
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
      backgroundColor: Colors.blue,
    ),
    body: Center(

      /////////////////////////////////////////////
      child: RaisedButton.icon(
        onPressed:(){
          setState(() {
              age = age + 1;
          });
        },
        icon: Icon(
          Icons.favorite
        ),
        label: Text(age.toString()),
        color: Colors.blue,
      ),
    ///////////////////////////////////////////////
     // child: Container(
    //  )
    ),
    ///////////////////////////////////////////////
    // floatingActionButton: FloatingActionButton(
	  //   onPressed: (){
    //     setState(() {
    //       if(age == 100)
    //       {
    //         age = 0;
    //       }
    //       age= age+1;
    //     });
    //   },
	  //   child: Text('click'),
    //   backgroundColor: Colors.yellow[700],
    // ),
    // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  );
  }
}