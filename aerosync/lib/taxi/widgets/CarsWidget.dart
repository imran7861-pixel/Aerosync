import 'package:aerosync/taxi/Model/featuredCarModel.dart';
import 'package:aerosync/taxi/widgets/featuredCarsWidget.dart';
import 'package:aerosync/utils/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CarsWidget extends StatelessWidget {
  const CarsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: Color(0xfff1f2f3),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 1.5.h,
          ),
          Container(
            height: 0.8.h,
            width: 18.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromARGB(255, 79, 79, 79),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: Row(
              children: [
                Text(
                  'Rent a car',
                  style: theme.headlineMedium!.copyWith(
                      color: Styles.textColor,
                      fontSize: 21.sp),
                ),
                const Spacer(),
                
              ],
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: Row(
              children: [
                Container(
                  height: 12.h,
                  width: 26.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromARGB(255, 56, 57, 58)),
                  child: Center(
                      child: Image.asset(
                    'assets/icons/logo1.png',
                    height: 7.h,
                  )),
                ),
                Container(
                  height: 12.h,
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  width: 26.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromARGB(255, 56, 57, 58)),
                  child: Center(
                      child: Image.asset(
                    'assets/icons/merc.png',
                    height: 7.h,
                  )),
                ),
                Container(
                  height: 12.h,
                  width: 26.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromARGB(255, 56, 57, 58)),
                  child: Center(
                      child: Image.asset(
                    'assets/icons/lambo.png',
                    height: 7.h,
                  )),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: Row(
              children: [
                Text(
                  'Featured',
                  style: theme.headline4!
                      .copyWith(color: Styles.textColor, fontSize: 21.sp),
                ),
              
              ],
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: SizedBox(
              height: 18.h,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: FeaturedCarsModel.featuredCarList.length,
                itemBuilder: (context, index) {
                  final items = FeaturedCarsModel.featuredCarList[index];
                  return FeaturedCarsWidget(
                    index: index,
                    items: items,
                  );
                },
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
