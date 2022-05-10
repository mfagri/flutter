import 'package:flutter/material.dart';
import 'package:my_app/home_test.dart';

void main()
{
  runApp(home_app());
}

class  home_app extends StatelessWidget {
  const home_app({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:  Container(
           padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          //   colors: [
          //   Colors.white,
          //   Colors.blue,
          //   ])
          color: Colors.white
        ),
          child: Column(
            children: [
              Container(
      child: Container(
          margin: EdgeInsets.only(top: 45,bottom: 45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                        Center(
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blueGrey
                      ) ,
                    ),
                  )
                    ],
                  ),
                  Center(
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blueGrey
                      ) ,
                    ),
                  )
                ],
              ),
      ),
    ),
    home_2(),
            ],
          ),
        ),
      ),
    );
  }
}