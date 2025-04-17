import 'package:aerosync/apis/api.dart';
import 'package:aerosync/models/hotelbycity.dart';
import 'package:aerosync/spinner.dart';
import 'package:aerosync/utils/layouts.dart';
import 'package:aerosync/utils/styles.dart';
import 'package:aerosync/widgets/hoteldetails.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HotelView extends StatefulWidget {
  final String cityid;
  const HotelView({Key? key, required this.cityid}) : super(key: key);

  @override
  State<HotelView> createState() => _HotelViewState();
}

class _HotelViewState extends State<HotelView> {
  Future<List<HotelData>> hoteldata() async {
    try {
      Map<String, String> reqid = {"idOfCity": widget.cityid};
      return hotelcheck(reqid, "api/v1/hotelsByCity/:id");
    } catch (e) {
      // Handle errors
      print(e);
      rethrow;
    }
  }

  late Future<List<HotelData>> hotelsdata;
  @override
  void initState() {
    super.initState();
    hotelsdata = hoteldata();
  }

  @override
  Widget build(BuildContext context) {
    final size = Layouts.getSize(context);

    return FutureBuilder<List<HotelData>>(
        future: hotelsdata,
        builder:
            (BuildContext context, AsyncSnapshot<List<HotelData>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Spinner();
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return Padding(
                padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
                child: Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.spaceEvenly,
                    spacing: 16,
                    runSpacing: 16,
                    children: List.generate(snapshot.data!.length, (i) {
                      final currentData = snapshot.data![i];
                      return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    HotelDetails(details: snapshot.data![i])));
                          },
                          child: Container(
                            width: size.width * 0.6,
                            height: 250,
                            margin: const EdgeInsets.only(right: 17, top: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade200,
                                    blurRadius: 2,
                                    spreadRadius: 1)
                              ],
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 17),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 120,
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                      color: Styles.primaryColor,
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                          image: NetworkImage(faker.image.image(
                                              random: true,
                                              keywords: ['hotel', 'rooms'])),
                                          fit: BoxFit.cover)),
                                ),
                                const Gap(10),
                                Text(
                                  " ${currentData.hotelName}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Styles.headline2Style
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                                const Gap(5),
                                Text(" ${currentData.flat}",
                                    style: Styles.subtitle1Style),
                                const Gap(8),
                                Text(
                                  " \₹ ${currentData.actualPrice} per stay",
                                  style: Styles.headline1Style.copyWith(),
                                ),
                              ],
                            ),
                          ));
                    })));
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
                          hoteldata();
                        });
                      },
                      child: const Text('Refresh'))
                ],
              ),
            );
          }
        });
  }
}
