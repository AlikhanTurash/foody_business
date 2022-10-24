import 'package:flutter/material.dart';
import '../widgets/booking_card.dart';
import './tabs/bookingTab.dart';
import 'home_page.dart';

class RegistryPage extends StatefulWidget {
  const RegistryPage({Key? key}) : super(key: key);

  @override
  State<RegistryPage> createState() => _RegistryPageState();
}

class _RegistryPageState extends State<RegistryPage> {
  @override
  Widget build(BuildContext context) {
    final _booking = ModalRoute.of(context)!.settings.arguments as List;

    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 5, bottom: 5, top: 10),
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios_new),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
            ),
            Center(
              child: Column(
                children: _booking.map((bk) {
                  return BookingCard(bk);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
