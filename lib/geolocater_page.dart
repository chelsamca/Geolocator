import 'package:flutter/Material.dart';
import 'package:geolocator/geolocator.dart';

class GeoLocator extends StatefulWidget {
  const GeoLocator({Key? key}) : super(key: key);

  @override
  State<GeoLocator> createState() => _GeoLocatorState();
}

class _GeoLocatorState extends State<GeoLocator> {
  Position? Currentposition;
  LocationPermission? permission;

  getCurrentPosition() async {
    permission = await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      Currentposition = position;
    });
    print(position);
    return position;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(width: 500,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
          Text(Currentposition.toString()),
          Text(''),
          ElevatedButton(onPressed: () async{await getCurrentPosition();}, child: Text('Get Location'))
        ]),
      ),
    );
  }
}