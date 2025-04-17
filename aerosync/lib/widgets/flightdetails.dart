import 'package:aerosync/apis/api.dart';
import 'package:aerosync/apis/sample.dart';
import 'package:aerosync/models/test.dart';
import 'package:aerosync/taxi/widgets/calender&TimeWidget.dart';
import 'package:aerosync/widgets/payment.dart';
import 'package:animate_do/animate_do.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FlightDetails extends StatefulWidget {
  const FlightDetails({super.key, required this.details});
  final FlightData details;
  @override
  State<FlightDetails> createState() => _FlightDetailsState();
}

class _FlightDetailsState extends State<FlightDetails> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    DateTime? _selectedDate = DateTime.now();
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 100.h,
          child: Stack(
            children: [
              Positioned(
                top: 2.h,
                child: Container(
                  height: 35.h,
                  width: 100.w,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/img/next bg.png'),
                        fit: BoxFit.fill),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 0.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 2.w,
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              size: 24.sp,
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 70.w,
                          ),
                          Container(
                            height: 8.h,
                            width: 17.w,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 109, 109, 109),
                                  width: 1.2),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(faker.image.image(
                                      random: true, keywords: ['flight'])),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 35.h,
                child: SlideInUp(
                  child: Container(
                    height: 70.h,
                    width: 100.w,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(45)),
                      color: Color.fromARGB(255, 22, 21, 21),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(left: 5.w, right: 5.w),
                        child: SlideInUp(
                          duration: Duration(milliseconds: 1800),
                          delay: Duration(milliseconds: 100),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 8.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Flight Details',
                                    style: theme.headlineMedium!.copyWith(
                                      letterSpacing: 1.5,
                                      fontSize: 19.5.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    widget.details.price.toString(),
                                    style: theme.headline4!.copyWith(
                                      letterSpacing: 1.5,
                                      fontSize: 19.5.sp,
                                      color: const Color.fromARGB(
                                          255, 255, 196, 0),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Container(
                                height: 10.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color:
                                        const Color.fromARGB(255, 37, 53, 61)),
                                child: ListTile(
                                  leading: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      'assets/icons/location.png',
                                      height: 3.h,
                                      color: Colors.amber,
                                    ),
                                  ),
                                  title: Padding(
                                    padding: EdgeInsets.only(
                                        left: 4.w, bottom: 0.5.h),
                                    child: Text(
                                      'Departure Airport',
                                      style: theme.headline6!.copyWith(
                                          color: Color.fromARGB(
                                              255, 214, 214, 214),
                                          fontSize: 17.5.sp,
                                          fontWeight: FontWeight.w900,
                                          letterSpacing: 1),
                                    ),
                                  ),
                                  subtitle: Padding(
                                    padding: EdgeInsets.only(left: 4.w),
                                    child: Text(
                                      '${widget.details.departureAirportName}',
                                      style: theme.displayLarge!.copyWith(
                                          color: Colors.white,
                                          fontSize: 17.5.sp,
                                          letterSpacing: 0.5),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Container(
                                height: 10.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color:
                                        const Color.fromARGB(255, 37, 53, 61)),
                                child: ListTile(
                                  leading: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      'assets/icons/location.png',
                                      height: 3.h,
                                      color: Colors.amber,
                                    ),
                                  ),
                                  title: Padding(
                                    padding: EdgeInsets.only(
                                        left: 4.w, bottom: 0.5.h),
                                    child: Text(
                                      'Arrival Airport',
                                      style: theme.headline6!.copyWith(
                                          color: Color.fromARGB(
                                              255, 214, 214, 214),
                                          fontSize: 17.5.sp,
                                          fontWeight: FontWeight.w900,
                                          letterSpacing: 1),
                                    ),
                                  ),
                                  subtitle: Padding(
                                    padding: EdgeInsets.only(left: 4.w),
                                    child: Text(
                                      '${widget.details.arrivalAirportName}',
                                      style: theme.headline1!.copyWith(
                                          color: Colors.white,
                                          fontSize: 17.5.sp,
                                          letterSpacing: 0.5),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              const CalenderandTimeWidget(
                                  calender: 'Start-Date', time: 'Start Time'),
                              SizedBox(
                                height: 2.h,
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              const CalenderandTimeWidget(
                                  calender: 'End Date', time: 'End Time'),
                              SizedBox(
                                height: 8.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 9.h),
                                child: FadeInLeft(
                                  delay: Duration(milliseconds: 500),
                                  child: GestureDetector(
                                    onTap: () async {
                                      String apiurl = 'api/v1/Booking';
                                      Map data = {
                                        "flightId": widget.details.id,
                                        "userId": 19,
                                        "noOfSeats": 2,
                                        "totalCost": widget.details.price,
                                      };
                                      dynamic response =
                                          await bookingcheck(data, apiurl);
                                      print(response.statusCode.toString());
                                      if (response.statusCode == 200) {
                                        dynamic data = response.body;
                                        makePayment(context);
                                        // QuickAlert.show(
                                        //     onConfirmBtnTap: () {
                                        //       Navigator.of(context).push(
                                        //           MaterialPageRoute(
                                        //               builder: (context) =>
                                        //                   Sample()));
                                        //     },
                                        //     context: context,
                                        //     type: QuickAlertType.success);
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.orange,
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(17.0),
                                          child: Text(
                                            'Book Flight',
                                            style:
                                                theme.headlineMedium!.copyWith(
                                              fontSize: 18.sp,
                                              color: const Color.fromARGB(
                                                  255, 53, 53, 53),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
