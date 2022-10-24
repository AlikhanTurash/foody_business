import 'package:flutter/material.dart';

import '../classes/booking.dart';

class DeclineDialog extends StatefulWidget {
  const DeclineDialog({Key? key}) : super(key: key);

  @override
  State<DeclineDialog> createState() => _DeclineDialogState();
}

//TODO: When the keyboard comes up the TextField is not visible

class _DeclineDialogState extends State<DeclineDialog> {
  var noAvailableTables = true;
  String declineExplanation = '';
  late TextEditingController _controllerExplanation = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _booking = ModalRoute.of(context)!.settings.arguments as Booking;
    return Container(
      height: 460,
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
          Text('Пожалуйста, укажите причину отказа бронирования',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(
              "Отсутствие свободных столиков",
              style: TextStyle(
                fontSize: 11,
              ),
            ),
            value: noAvailableTables,
            onChanged: (newValue) {
              setState(() {
                noAvailableTables = newValue!;
              });
            },
            //  <-- leading Checkbox
          ),
          Text('или опишите подробней ниже:'),
          SizedBox(height: 15),
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: noAvailableTables == true ? Colors.black12 : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color:
                    noAvailableTables == true ? Colors.black12 : Colors.black,
              ),
            ),
            child: TextField(
              enabled: noAvailableTables == false,
              obscureText: false,
              maxLines: null,
              controller: _controllerExplanation,
              onChanged: (String value) {
                declineExplanation = value;
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  _booking.answered = true;
                  _booking.accepted = false;
                  if (noAvailableTables) {
                    _booking.declineExplanation = 'Нет столов';
                  } else {
                    _booking.declineExplanation = declineExplanation;
                  }
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(primary: Colors.black),
                child: Text('Подтвердить отмену',
                    style: TextStyle(color: Colors.white))),
          )
        ],
      ),
    );
  }
}
