import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foody_business/page/registry_page.dart';
import 'package:foody_business/widgets/booking_card.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:foody_business/databases/booking_database.dart';

PersistentBottomSheetController controller =
    controller; // <------ Instance variable
final _scaffoldKey =
    GlobalKey<ScaffoldState>(); // <---- Another instance variable

class BookingTab extends StatefulWidget {
  const BookingTab({Key? key}) : super(key: key);

  @override
  State<BookingTab> createState() => _BookingTabState();
}

class _BookingTabState extends State<BookingTab> {
  late Timer _everySecond;

  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _everySecond = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        Container(
          padding: EdgeInsets.all(8.0),
          height: 600,
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                //TODO: When swiping black semi-circle is not full
                Row(
                  children: [
                    SizedBox(
                      width: 45,
                    ),
                    Expanded(child: SizedBox.shrink()),
                    ButtonsTabBar(
                      contentPadding: EdgeInsets.only(left: 10, right: 10),
                      backgroundColor: Colors.black,
                      tabs: [
                        Tab(
                          text: 'Без ответа',
                        ),
                        Tab(
                          text: 'Активные',
                        ),
                      ],
                    ),
                    Expanded(child: SizedBox.shrink()),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => (RegistryPage()),
                                settings: RouteSettings(arguments: booking)));
                      },
                      icon: Icon(Icons.history_outlined, size: 25),
                    )
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Column(
                        children: booking.map((bk) {
                          if (bk.answered == false) {
                            return BookingCard(bk);
                          } else {
                            return Container();
                          }
                        }).toList(),
                      ),
                      Column(
                        children: booking.map((bk) {
                          if (bk.answered == true && bk.accepted == true) {
                            return BookingCard(bk);
                          } else {
                            return Container();
                          }
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
