import 'package:admin_aerosync/addcity.dart';
import 'package:admin_aerosync/addhotel.dart';
import 'package:admin_aerosync/styles.dart';
import 'package:flutter/material.dart';

class Sample extends StatefulWidget {
  const Sample({super.key});

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 300,
              height: 300,
            ),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Styles.primaryColor,
                          foregroundColor: Colors.white),
                      icon: const Icon(Icons.location_city_outlined),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AddCity()));
                      },
                      label: const Text('Add city')),
                )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Styles.primaryColor,
                      ),
                      icon: const Icon(Icons.hotel_class_outlined),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AddHotel()));
                      },
                      label: const Text('Add hotel')),
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
