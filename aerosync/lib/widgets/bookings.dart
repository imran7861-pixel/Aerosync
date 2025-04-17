import 'package:aerosync/pages/tickets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bookings extends StatefulWidget {
  const Bookings({super.key});

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      CupertinoSegmentedControl<int>(
        children: {
          0: GestureDetector(
            onTap: () {},
            child: const Text(
              'Pending',
            ),
          ),
          //  buildpending(data, context, isLastElement),

          1: const Text(
            'Completed',
          ),
          2: const Text(
            'Cancelled',
          ),
        },
        groupValue: _selectedIndex,
        onValueChanged: (value) {
          setState(() => _selectedIndex = value);
        },
      )
    ]));
  }
}
