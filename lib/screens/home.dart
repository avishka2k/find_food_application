// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../widgets/nearest_card.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [                
                      const Text("Find Your\nFavorite Food",
                      style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,),
                      ),
                      
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          // ignore: prefer_const_literals_to_create_immutables
                          boxShadow: [
                            const BoxShadow(
                              blurRadius: 35,                              
                              offset: Offset(0,20),
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      child: IconButton(
                        onPressed: () {  }, 
                        icon: const Icon(Icons.notification_add_outlined),
                        iconSize: 30,
                        color:HexColor('#15BE77'),
                      ),
                      ),
                    ],
                  ),
                ), 
                const SizedBox(height: 60,),

           //head card     
                Container(
                  width: 330,
                  height: 160,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      HexColor('#53E88B'),
                      HexColor('#15BE77'),
                    ],),
                    image: const DecorationImage(
                      image: AssetImage("assets/image1.png",),
                      fit: BoxFit.fill,
                      ),
                   color: HexColor('#15BE77'),
                   borderRadius: BorderRadius.circular(20),
                  ),
                  
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Special Deal For \nOctober",
                            style: TextStyle(fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            ),
                            ),
                            const SizedBox(height: 15,),
                            Container(
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                primary: Colors.transparent, 
                                shadowColor: Colors.transparent
                                ),
                                child: Text("Buy Now",
                                style: TextStyle(fontSize: 15,
                                fontWeight: FontWeight.bold, 
                                color: HexColor('#15BE77'),
                                ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
           // nearest restaurant
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Nearest Restaurant",
                          // ignore: unnecessary_const
                          style: const TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold),
                          ),
                          Text("View More",
                          style: TextStyle(color: HexColor("#FF7C32")),),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          nearest_card(
                            vegiName: "Vegan Resto",
                            image: "assets/slid1.png",
                            time: 12,
                          ),
                          nearest_card(
                            vegiName: "Healthy Food", 
                            image: "assets/slid2.png",
                            time: 8,
                          ),
                          nearest_card(
                            vegiName: "Good Food", 
                            image: "assets/slid3.png",
                            time: 10,
                          ),
                          nearest_card(
                            vegiName: "Smart Resto", 
                            image: "assets/slid4.png",
                            time: 6,
                          ),
                          nearest_card(
                            vegiName: "Vegan Resto", 
                            image: "assets/slid5.png",
                            time: 14,
                          ),
                          nearest_card(
                            vegiName: "Health Food", 
                            image: "assets/slid6.png",
                            time: 10,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}