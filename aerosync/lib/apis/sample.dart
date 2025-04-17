import 'dart:convert';
import 'dart:developer';

import 'package:aerosync/apis/api.dart';
import 'package:aerosync/models/cities.dart';
import 'package:aerosync/models/taxibycity.dart';
import 'package:aerosync/pages/home.dart';
import 'package:aerosync/spinner.dart';
import 'package:aerosync/utils/styles.dart';
import 'package:aerosync/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class Sample extends StatefulWidget {
  const Sample({super.key});

  @override
  State<Sample> createState() => _SampleState();
}

List<Data> city = [];

class _SampleState extends State<Sample> {
  Future<List<Data>> pay() async {
    try {
      return citycheck('', "api/v1/cities");
    } catch (e) {
      // Handle errors
      print(e);
      throw e;
    }
  }

  late Future<List<Data>> futureCity;

  @override
  void initState() {
    super.initState();
    futureCity = pay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.primaryColor,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'city',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Data>>(
          future: futureCity,
          builder: (BuildContext context, AsyncSnapshot<List<Data>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    // final data = snapshot.data![index];
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
                      child: Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 16,
                          runSpacing: 16,
                          children: List.generate(snapshot.data!.length, (i) {
                            final currentData = snapshot.data![i];
                            return ActionChip(
                              avatar: Icon(Icons.location_city_rounded),
                              label: Text(currentData.name.toString()),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => BottomNav(
                                        cityid: currentData.id.toString())));
                              },
                            );
                          })),
                    );
                  });
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '🥺',
                      style: TextStyle(fontSize: 24),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text("No Data Available "),
                    const SizedBox(
                      width: 20,
                    ),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            futureCity = pay();
                          });
                        },
                        child: const Text('Refresh'))
                  ],
                ),
              );
            }
          }),
    );
  }
}
