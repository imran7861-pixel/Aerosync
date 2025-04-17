import 'dart:ui';
import 'package:aerosync/json/hotel_list.dart';
import 'package:aerosync/taxi/widgets/CarsWidget.dart';
import 'package:aerosync/utils/styles.dart';
import 'package:aerosync/widgets/hotel_view.dart';
import 'package:aerosync/widgets/ticket_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Home extends StatefulWidget {
  Home({super.key, required this.cityid});
  final String cityid;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>{
  // PageController? controller, controller2;
  // late AnimationController animationcontroller;
  // late Animation<double> animation;

  int currentpage = 0, currentpage2 = 0;
  // Future taxidata() async {
  //   try {
  //     Map reqid = {"idOfCity": widget.cityid};
  //     return taxicheck(reqid, "api/v1/taxiByCity/:id");
  //   } catch (e) {
  //     // Handle errors
  //     print(e);
  //     rethrow;
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // controller = PageController(
    //   initialPage: currentpage,
    //   keepPage: false,
    //   viewportFraction: 0.8,
    // );
    // controller2 = PageController(
    //   initialPage: currentpage2,
    //   keepPage: false,
    //   viewportFraction: 0.4,
    // );
    // animationcontroller = AnimationController(
    //     duration: const Duration(milliseconds: 1000), vsync: this);
    // animation = Tween(begin: 1.0, end: 1.0).animate(animationcontroller);
    // // taxidata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Dashboard",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Styles.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
           
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Upcoming Flights',
                          style: Styles.headline2Style,
                        ),
                        InkWell(
                          child: Text(
                            '',
                            style: Styles.textStyle
                                .copyWith(color: Styles.primaryColor),
                          ),
                        )
                      ],
                    ),
                    const Gap(15),
                  ],
                )),
            SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(left: 20),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TicketView(
                      isOrange: true,
                      cityid: widget.cityid,
                    ),
                    // TicketView(
                    //   isOrange: true,
                    //   cityid: widget.cityid,
                    // ),
                  ],
                )),
          
            const Gap(15),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hotels',
                      style: Styles.headline2Style,
                    ),
                    InkWell(
                      child: Text(
                        '',
                        style:
                            Styles.textStyle.copyWith(color: Styles.primaryColor),
                      ),
                    )
                  ],
                )),
            const Gap(15),
            SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(left: 20),
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Row(
                      children: [HotelView(cityid:widget.cityid)] )
                          ),
                ),
                
            // Container(
            //   height: 300,
            //   width: MediaQuery.of(context).size.width,
            //   margin: EdgeInsets.only(top: 20),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: <Widget>[
            //       Container(
            //         height: 300,
            //         width: MediaQuery.of(context).size.width,
            //         child: Stack(
            //           children: <Widget>[
            //             Opacity(
            //                 opacity: 0.8,
            //                 child: FadeTransition(
            //                   opacity: animation,
            //                   child: Container(
            //                     decoration: BoxDecoration(
            //                       image: DecorationImage(
            //                           image: ExactAssetImage(
            //                               '${hotelList[currentpage2]['image']}'),
            //                           fit: BoxFit.cover),
            //                     ),
            //                     child: BackdropFilter(
            //                       filter:
            //                           ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
            //                       child: Container(
            //                         decoration: BoxDecoration(
            //                             color: Colors.grey.withOpacity(0.0)),
            //                       ),
            //                     ),
            //                   ),
            //                 )),
            //             Column(
            //               children: <Widget>[
            //                 Padding(
            //                   padding: const EdgeInsets.only(
            //                       left: 10, right: 10, top: 10, bottom: 4),
            //                   child: Row(
            //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                     children: const <Widget>[
            //                       Text(
            //                         'Exclusive Hotels',
            //                         style: TextStyle(
            //                             color: Colors.white, fontSize: 24),
            //                       ),
            //                       Text(
            //                         '',
            //                         style: TextStyle(color: Colors.white),
            //                       )
            //                     ],
            //                   ),
            //                 ),
            //                 Padding(
            //                   padding: const EdgeInsets.only(left: 10, right: 10),
            //                   child: Text(
            //                     'Whatever your travel style, we have got the finest hotels to match it.',
            //                     style: TextStyle(color: Colors.white),
            //                   ),
            //                 ),
            //                 Expanded(
            //                   child: Padding(
            //                     padding:
            //                         const EdgeInsets.only(bottom: 10, top: 15),
            //                     child: PageView.builder(
            //                       controller: controller2,
            //                       itemCount: 2,
            //                       dragStartBehavior: DragStartBehavior.down,
            //                       pageSnapping: false,
            //                       onPageChanged: (value) {
            //                         setState(() {
            //                           currentpage2 = value;
            //                           animationcontroller.repeat();
            //                         });
            //                       },
            //                       scrollDirection: Axis.horizontal,
            //                       itemBuilder: (context, index) {
            //                         return collectionList(index);
            //                       },
            //                     ),
            //                   ),
            //                 ),
                            
            //               ],
            //             ),
            //           ],
            //         ),
            //       ),
                             
            //     ],
            //   ),
            // ),
            Gap(20),
            SizedBox(height: 500,
              child: CarsWidget()),
            Gap(20),
          ],
        ),
      ),
    );
  }

  collectionList(int index) {
    return Container(
      height: 170,
      margin: EdgeInsets.only(left: 10, top: 10),
      width: MediaQuery.of(context).size.width / 3,
      child: Stack(
        children: <Widget>[
          Container(
            height: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  hotelList[index]['image'],
                  width: MediaQuery.of(context).size.width / 3,
                  height: 170,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50, left: 5, right: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    hotelList[index]['place'],
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    '40 PROPERTIES',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                    textAlign: TextAlign.left,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
