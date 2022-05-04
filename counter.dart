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
  int age = 0;
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

      /////////////////////////////////////////////
      child: Text(
        age.toString(),
         style: TextStyle(
         //backgroundColor: Colors.white,
         //letterSpacing: 2.0,
         fontSize: 20.0,
         fontWeight: FontWeight.bold,
         color: Colors.black
        ),
      ),
      //////////////////////////////////////////
      //////Tmage///////////
      // child: Image(
      //   image: NetworkImage('https://cdna.artstation.com/p/assets/images/images/005/533/550/large/vincent-voet-galaxy-s6-edge-background1.jpg?1491765803'),
      //  // image: AssetImage('imges/marigold6.png'),
      // ),
      /////////////////////////////////////////
    ),
    // floatingActionButton: FloatingActionButton(
    //   child: Text('Action'),
    // ),
    floatingActionButton: FloatingActionButton(
	    onPressed: (){
       // print('yo click');
        setState(() {
          if(age == 100)
          {
            age = 0;
          }
          age= age+1;
        });
      },
	    child: Text('click'),
      backgroundColor: Colors.yellow[700],
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  );
  }
}