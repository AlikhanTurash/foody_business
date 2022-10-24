import 'package:flutter/material.dart';
import 'package:foody_business/classes/booking.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../page/tabs/bookingTab.dart';
import 'decline_dialog.dart';

class EditDialog extends StatefulWidget {
  final Function() notifyParent;
  const EditDialog({Key? key, required this.notifyParent}) : super(key: key);

  @override
  State<EditDialog> createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  var checkedValue = true;
  @override
  Widget build(BuildContext context) {
    final _booking = ModalRoute.of(context)!.settings.arguments as Booking;
    return Container(
      width: double.infinity,
      height: 250,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset('assets/close-circle.jpg'),
              ],
            ),
          ),
          SizedBox(
            height: 60,
          ),
          SizedBox(
            width: double.infinity,
            height: 70,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  showMaterialModalBottomSheet(
                      context: context,
                      builder: (c) => DeclineDialog(),
                      expand: false,
                      settings: RouteSettings(arguments: _booking),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)));
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.black12, elevation: 0),
                child: Text('Отменить бронь',
                    style: TextStyle(color: Colors.white, fontSize: 20))),
          ),
        ],
      ),
    );
  }
}
