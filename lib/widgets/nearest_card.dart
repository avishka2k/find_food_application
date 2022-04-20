import 'package:flutter/material.dart';

class nearest_card extends StatelessWidget {

  final image;
  final String vegiName;
  final int time;

  nearest_card({this.image,required this.vegiName, required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15,),
      child: Container(
        
        height: 370,
        width: 170,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(image),),
            Text(vegiName,
            style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),
            ),
            Text("$time Min"),
          ],
        ),
      ),
    );
  }
}
