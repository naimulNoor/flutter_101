import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class PleaceDetails extends StatelessWidget{
  Color text_color = HexColor("c8c8c8");
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Pleace Details"),
          ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[     

               //load image
                Image.network("https://skmahdi.files.wordpress.com/2014/01/nafakum-03-mohammad-roohul-kaiser.jpg?w=720&h=450&crop=1"),
                //Place Detais Title
                Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Nafakum Waterfalls",style: TextStyle(fontWeight: FontWeight.bold,fontSize:18.0,),),
                          Text("Nafakhum - Rimakri Trail",style: TextStyle(fontWeight: FontWeight.bold,fontSize:15.0,color: text_color),)

                      ],),
                      Row(
                          children: <Widget>[
                            Icon(Icons.star,color: Colors.red,),
                            Text("41",style: TextStyle(fontWeight:FontWeight.bold))
                          ],
                        )
                      ],
                    ),

                ),
                //Info Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(Icons.call,color: Colors.blue,),
                        SizedBox(height: 10),
                        Text('CALL',style: TextStyle(color: Colors.blue),)
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.navigation,color: Colors.blue,),
                        SizedBox(height: 10),
                        Text('ROUTE',style: TextStyle(color: Colors.blue),)
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.share,color: Colors.blue,),
                        SizedBox(height: 10),
                        Text('SHARE',style: TextStyle(color: Colors.blue),)
                      ],
                    )
                  ],
                ),
                SizedBox(height: 10),
                //Description Head
                Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                    child: Text("Description :",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),)),
                //Description Details
                Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                    child: Text("Nafa-khum is a waterfall in Bangladesh on the Remaikree River, a tributary of the Sangu river. It is among the largest waterfalls in the country by volume of water falling. The wild hilly Remaikree river suddenly falls down here about 25–30 feet."))
              ],
            )

        )
      );
  }




}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
//