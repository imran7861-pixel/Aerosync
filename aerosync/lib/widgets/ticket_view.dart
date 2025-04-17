import 'dart:math';
import 'package:quickalert/quickalert.dart';
import 'package:aerosync/apis/api.dart';
import 'package:aerosync/models/test.dart';
import 'package:aerosync/spinner.dart';
import 'package:aerosync/utils/layouts.dart';
import 'package:aerosync/utils/styles.dart';
import 'package:aerosync/widgets/bottom_nav.dart';
import 'package:aerosync/widgets/buttons.dart';
import 'package:aerosync/widgets/flightdetails.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class TicketView extends StatefulWidget {
  final bool? isOrange;
  final String cityid;
  const TicketView({Key? key, this.isOrange, required this.cityid})
      : super(key: key);

  @override
  State<TicketView> createState() => _TicketViewState();
}

List<FlightData> flightsdata = [];

class _TicketViewState extends State<TicketView> {
  Future<List<FlightData>> flightdata() async {
    try {
      Map<String, String> reqid = {"cityId": widget.cityid};
      return flightcheck(reqid, "api/v1/flightsByCityId/:id");
    } catch (e) {
      // Handle errors
      print(e);
      rethrow;
    }
  }

  late Future<List<FlightData>> futureflight;
  @override
  void initState() {
    super.initState();
    futureflight = flightdata();
  }

  @override
  Widget build(BuildContext context) {
    final size = Layouts.getSize(context);
    String formatDuration(DateTime departureTime, DateTime arrivalTime) {
      // Calculate the duration between departure and arrival times
      Duration flightDuration = arrivalTime.difference(departureTime);

      // Format the duration as "8H 30M"
      String formattedDuration =
          '${flightDuration.inHours}H ${flightDuration.inMinutes.remainder(60)}M';

      return formattedDuration;
    }

    return FutureBuilder<List<FlightData>>(
        future: futureflight,
        builder:
            (BuildContext context, AsyncSnapshot<List<FlightData>> snapshot) {
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
                                  FlightDetails(details: snapshot.data![i])));
                        },
                        child: SizedBox(
                          width: size.width * 0.85,
                          height: 220,
                          child: Container(
                            margin: const EdgeInsets.only(right: 15),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      color: widget.isOrange == null
                                          ? Colors.white
                                          : const Color(0xFFF37B67),
                                      boxShadow: widget.isOrange == true
                                          ? []
                                          : [
                                              BoxShadow(
                                                  color: Colors.grey.shade100,
                                                  blurRadius: 2,
                                                  spreadRadius: 2)
                                            ],
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(21),
                                          topRight: Radius.circular(21))),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Text(
                                              currentData.departureCityName
                                                  .toString(),
                                              style: widget.isOrange == null
                                                  ? Styles.headline3Style
                                                  : Styles.headline3Style
                                                      .copyWith(
                                                          color: Colors.white)),
                                          const Spacer(),
                                          Container(
                                            padding: const EdgeInsets.all(3),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: widget.isOrange == null
                                                      ? const Color(0xFF8ACCF7)
                                                      : Colors.white,
                                                  width: 2.5),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Stack(
                                                children: <Widget>[
                                                  SizedBox(
                                                    height: 24,
                                                    child: LayoutBuilder(
                                                      builder: (context,
                                                          constraints) {
                                                        return Flex(
                                                          children:
                                                              List.generate(
                                                                  (constraints.constrainWidth() /
                                                                          6)
                                                                      .floor(),
                                                                  (index) =>
                                                                      SizedBox(
                                                                        height:
                                                                            1,
                                                                        width:
                                                                            3,
                                                                        child:
                                                                            DecoratedBox(
                                                                          decoration:
                                                                              BoxDecoration(color: widget.isOrange == true ? Colors.white : Colors.grey.shade300),
                                                                        ),
                                                                      )),
                                                          direction:
                                                              Axis.horizontal,
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Center(
                                                      child: Transform.rotate(
                                                    angle: 1.5,
                                                    child: Icon(
                                                      Icons
                                                          .local_airport_rounded,
                                                      color: widget.isOrange ==
                                                              null
                                                          ? const Color(
                                                              0xFF8ACCF7)
                                                          : Colors.white,
                                                      size: 24,
                                                    ),
                                                  ))
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(3),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: widget.isOrange == null
                                                      ? widget.isOrange == null
                                                          ? const Color(
                                                              0xFF8ACCF7)
                                                          : Colors.white
                                                      : Colors.white,
                                                  width: 2.5),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                              currentData.arrivalCityName
                                                  .toString(),
                                              style: widget.isOrange == null
                                                  ? Styles.headline3Style
                                                  : Styles.headline3Style
                                                      .copyWith(
                                                          color: Colors.white)),
                                        ],
                                      ),
                                      const Gap(1),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            '${formatDuration(DateTime.parse(currentData.departureTime.toString()), DateTime.parse(currentData.arrivalTime.toString()))}',
                                            style: widget.isOrange == null
                                                ? Styles.headline3Style
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold)
                                                : Styles.subtitle1Style
                                                    .copyWith(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                          ),
                                          ElevatedButton(
                                            child: Text('Book Flight',
                                                style: Styles.subtitle1Style
                                                    .copyWith(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          FlightDetails(
                                                              details:
                                                                  currentData)));
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: widget.isOrange == null
                                      ? Colors.white
                                      : const Color(0xFFF37B67),
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 20,
                                        width: 10,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10)),
                                            color: widget.isOrange == true
                                                ? Colors.white
                                                : Colors.grey.shade200,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: LayoutBuilder(
                                            builder: (context, constraints) {
                                              return Flex(
                                                children: List.generate(
                                                    (constraints.constrainWidth() /
                                                            15)
                                                        .floor(),
                                                    (index) => SizedBox(
                                                          height: 1,
                                                          width: 5,
                                                          child: DecoratedBox(
                                                            decoration: BoxDecoration(
                                                                color: widget
                                                                            .isOrange ==
                                                                        true
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .grey
                                                                        .shade300),
                                                          ),
                                                        )),
                                                direction: Axis.horizontal,
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                        width: 10,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    bottomLeft:
                                                        Radius.circular(10)),
                                            color: widget.isOrange == true
                                                ? Colors.white
                                                : Colors.grey.shade200,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 10, 16, 16),
                                  decoration: BoxDecoration(
                                      color: widget.isOrange == null
                                          ? Colors.white
                                          : const Color(0xFFF37B67),
                                      boxShadow: widget.isOrange == true
                                          ? []
                                          : [
                                              BoxShadow(
                                                color: Colors.grey.shade200,
                                                offset: const Offset(0, 2),
                                                blurRadius: 2,
                                                spreadRadius: 0,
                                              )
                                            ],
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(21),
                                          bottomRight: Radius.circular(21))),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  DateFormat('d MMM').format(
                                                      DateTime.parse(currentData
                                                          .departureTime
                                                          .toString())),
                                                  style: widget.isOrange == null
                                                      ? Styles.headline3Style
                                                      : Styles.headline3Style
                                                          .copyWith(
                                                              color: Colors
                                                                  .white)),
                                              const Gap(5),
                                              Text('Date',
                                                  style: widget.isOrange == null
                                                      ? Styles.subtitle1Style
                                                      : Styles.subtitle1Style
                                                          .copyWith(
                                                              color: Colors
                                                                  .white)),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                  DateFormat('hh:mm a').format(
                                                      DateTime.parse(currentData
                                                          .departureTime
                                                          .toString())),
                                                  style: widget.isOrange == null
                                                      ? Styles.headline3Style
                                                      : Styles.headline3Style
                                                          .copyWith(
                                                              color: Colors
                                                                  .white)),
                                              const Gap(5),
                                              Text('Departure time',
                                                  style: widget.isOrange == null
                                                      ? Styles.subtitle1Style
                                                      : Styles.subtitle1Style
                                                          .copyWith(
                                                              color: Colors
                                                                  .white)),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                  "${Random().nextInt(100) + 1}",
                                                  style: widget.isOrange == null
                                                      ? Styles.headline3Style
                                                      : Styles.headline3Style
                                                          .copyWith(
                                                              color: Colors
                                                                  .white)),
                                              const Gap(5),
                                              Text('Number',
                                                  style: widget.isOrange == null
                                                      ? Styles.subtitle1Style
                                                      : Styles.subtitle1Style
                                                          .copyWith(
                                                              color: Colors
                                                                  .white)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ));
                  })),
            );
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
                          flightdata();
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
