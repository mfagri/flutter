
import 'package:flutter/cupertino.dart';

class home_2 extends StatefulWidget {
  const home_2({ Key? key }) : super(key: key);

  @override
  _home_2State createState() => _home_2State();
}

class _home_2State extends State<home_2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: PageView.builder(
        itemCount: 6,
        itemBuilder: (context,position){
        return _buildPageItem(position);
      }
      ),
      
    );
  }
  Widget _buildPageItem(int index)
  {
    return Container(
      height: 200,
      margin: EdgeInsets.only(left:5,right: 5 ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: index.isEven?Color(0xFF69c5df):Color(0xFF9294cc),
      ),
    );
  }
  }