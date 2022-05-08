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
  debugShowCheckedModeBanner: false,
  home: Home(),

));

class Home extends StatefulWidget
{
  const Home({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}
class  _HomeWidgetState extends State< Home> {
  var age = 0;
  String icon1 = 'play_circle_filled';
  @override
  Widget build(BuildContext context)
  {
    return(Scaffold(
      body: Container(
        padding: EdgeInsets.all(70),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
            Colors.black,
            Colors.grey,
            //Colors.white,
            Colors.black,
            //Colors.grey,
            ])
        ),
        child: Column(
          children: [
            
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Container(
                //padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                height: 320,
                width: 320,
                //child :color: Colors.red,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(55),
                  //color: Colors.red,
                  //image: DecorationImage(image: NetworkImage('https://images.genius.com/109e5e1425790e8f1b776fea8a074a4d.1000x1000x1.jpg'),)
                  image: DecorationImage(image: NetworkImage('https://i.scdn.co/image/ab67616d0000b2739dadefab8425d1607ebe205a'),)
                ),
                ),
                  ],
                ),
              SizedBox(height: 20,),
                // Text('godzilla'),
                Text('Arabi'),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                /* Icon(Icons.play_arrow),
                icon to play music
                */
                 IconButton(onPressed: (){
                  setState(() {
                    print('a');
                  });
                }, icon: Icon(Icons.fast_rewind_rounded)),
                SizedBox(width: 20,),
                IconButton(onPressed: (){
                  setState(() {
                    print('p');
                  });
                }, icon: Icon(Icons.play_arrow_outlined)),
                // IconButton(onPressed: (){
                //   setState(() {
                //     print('a');
                //   });
                // }, icon: Icon(Icons.pause)),
                // Icon(Icons.play_circle_filled),
                SizedBox(width: 20,),
                // Container(
                //   padding: EdgeInsets.all(16),
                //   margin: EdgeInsets.all(10),
                //   height: 60,
                //   width: 60,
                //   child: Text('yes'),
                //   decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(15),
                //   color: Colors.green[500],
                // )
                // ),
                 IconButton(onPressed: (){
                  setState(() {
                    print('a');
                  });
                }, icon: Icon(Icons.fast_forward_rounded)),
                SizedBox(width: 20,),
                // Container(
                //   padding: EdgeInsets.all(16),
                //   margin: EdgeInsets.all(10),
                //   height: 60,
                //   width: 60,
                //   child: Text('no'),
                  
                //   decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(15),
                //   color: Colors.red[500],
                // )
                // )
                ],
                ),
          ],
        ),
      ),
    ));
  }
}