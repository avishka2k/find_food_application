import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';



class Homepage extends StatefulWidget {
    const Homepage({Key? key}) : super(key: key);

    @override
    _HomepageState createState() => _HomepageState();
}   

class _HomepageState extends State {

    String location ='Null, Press Button';
    String Address = 'search';

    Future _getGeoLocationPosition() async {
        bool serviceEnabled;
        LocationPermission permission;

        // Test if location services are enabled.
        serviceEnabled = await Geolocator.isLocationServiceEnabled();
        if (!serviceEnabled) {
            await Geolocator.openLocationSettings();
            return Future.error('Location services are disabled.');
        }

        permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
            permission = await Geolocator.requestPermission();
            if (permission == LocationPermission.denied) {
                return Future.error('Location permissions are denied');
            }
        }

        if (permission == LocationPermission.deniedForever) {

            return Future.error('Location permissions are permanently denied, we cannot request permissions.');
        }
        return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    }

    Future GetAddressFromLatLong(Position position)async {
        List placemarks = await placemarkFromCoordinates(7.15761360699212, 80.11620280972714);
        print(placemarks);
        Placemark place = placemarks[0];
        Address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
        setState(()  {
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Get Current Address'),
            ),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Text('Coordinates Points',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Text(location,style: TextStyle(color: Colors.black,fontSize: 16),),
                        SizedBox(height: 10,),
                        Text('Current Address',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Text('${Address}'),
                        ElevatedButton(onPressed: () async{
                            Position position = await _getGeoLocationPosition();
                            location ='Latitude: ${position.latitude} , Longitude: ${position.longitude}';
                            GetAddressFromLatLong(position);
                        }, child: Text('Get Current Location'))
                    ],
                ),
            ),
        );
    }}