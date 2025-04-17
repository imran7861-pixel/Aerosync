import 'package:aerosync/apis/api.dart';
import 'package:aerosync/apis/sample.dart';
import 'package:aerosync/models/hotelbycity.dart';
import 'package:aerosync/models/test.dart';
import 'package:aerosync/taxi/widgets/calender&TimeWidget.dart';
import 'package:animate_do/animate_do.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HotelDetails extends StatefulWidget {
  const HotelDetails({super.key, required this.details});
  final HotelData details;
  @override
  State<HotelDetails> createState() => _HotelDetailsState();
}

class _HotelDetailsState extends State<HotelDetails> {
  
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
                // top: 2.h,
                child: Container(
                  height: 38.h,
                  width: 100.w,
                  decoration:  BoxDecoration(
                    image:DecorationImage(
                                          image: NetworkImage(faker.image.image(
                                              random: true,
                                              keywords: ['hotel', 'rooms'])),
                                          fit: BoxFit.cover),
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
                              color: Colors.white,
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
                                    'Hotel Details',
                                    style: theme.headlineMedium!.copyWith(
                                      letterSpacing: 1.5,
                                      fontSize: 19.5.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    widget.details.actualPrice.toString(),
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
                                      'Hotel Name',
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
                                      '${widget.details.hotelName}',
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
                                      'Hotel Location',
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
                                      '${widget.details.location}',
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
                                  calender: 'Booking-Date',
                                  time: 'Booking Time'),
                              // SizedBox(
                              //   height: 2.h,
                              // ),
                              // SizedBox(
                              //   height: 1.h,
                              // ),
                              // const CalenderandTimeWidget(
                              //     calender: 'Drop off Date',
                              //     time: 'Drop off Time'),
                              SizedBox(
                                height: 4.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 9.h),
                                child: FadeInLeft(
                                  delay: Duration(milliseconds: 500),
                                  child: GestureDetector(
                                    onTap: () async{
                                   
                          
                                      QuickAlert.show(
                                          onConfirmBtnTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Sample()));
                                          },
                                          context: context,
                                          type: QuickAlertType.success);
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
                                            'Book Hotel',
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
