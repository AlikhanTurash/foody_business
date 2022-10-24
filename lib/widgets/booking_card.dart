import 'package:foody_business/widgets/edit_dialog.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../classes/booking.dart';

import 'package:flutter/material.dart';

import 'order_dialog.dart';

class BookingCard extends StatefulWidget {
  Booking booking;
  BookingCard(this.booking, {Key? key}) : super(key: key);

  @override
  State<BookingCard> createState() => _BookingCardState();
}

class _BookingCardState extends State<BookingCard> {
  refresh() {
    setState(() {});
  }

  // buttonChanger() {
  //   if (widget.booking.answered == false) {
  //     return Builder(
  //       builder: (BuildContext context) {
  //         return ElevatedButton(
  //           onPressed: () {
  //             showMaterialModalBottomSheet(
  //                 context: context,
  //                 builder: (c) => OrderDialog(notifyParent: refresh),
  //                 expand: false,
  //                 settings: RouteSettings(arguments: widget.booking),
  //                 shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(10.0)));
  //           },
  //           style: ElevatedButton.styleFrom(primary: Colors.grey),
  //           child: Text('Ответить'),
  //         );
  //       },
  //     );
  //   } else {
  //     return Builder(
  //       builder: (BuildContext context) {
  //         return ElevatedButton(
  //             onPressed: () {
  //               showMaterialModalBottomSheet(
  //                   context: context,
  //                   builder: (c) => EditDialog(notifyParent: refresh),
  //                   expand: false,
  //                   settings: RouteSettings(arguments: widget.booking),
  //                   shape: RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.circular(10.0)));
  //             },
  //             style: ElevatedButton.styleFrom(primary: Colors.green),
  //             child: Text('Принято'));
  //       },
  //     );
  //   }
  // }

  orderInfo() {
    if (widget.booking.answered == true && widget.booking.accepted == false) {
      return Text('${widget.booking.declineExplanation}');
    } else {
      if (widget.booking.answered == false) {
        return Builder(
          builder: (BuildContext context) {
            return ElevatedButton(
              onPressed: () {
                showMaterialModalBottomSheet(
                    context: context,
                    builder: (c) => OrderDialog(notifyParent: refresh),
                    expand: false,
                    settings: RouteSettings(arguments: widget.booking),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              child: Text('Ответить'),
            );
          },
        );
      } else {
        return Builder(
          builder: (BuildContext context) {
            return ElevatedButton(
                onPressed: () {
                  showMaterialModalBottomSheet(
                      context: context,
                      builder: (c) => EditDialog(notifyParent: refresh),
                      expand: false,
                      settings: RouteSettings(arguments: widget.booking),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)));
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: Text('Принято'));
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        height: 70,
        width: 355,
        decoration: BoxDecoration(
            color: Color(0xFFe8e8e8), borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Text(
                    '${widget.booking.numOfPeople} человек(а)',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //TODO: Format date (today, tomorrow then date)
                  Text('${widget.booking.date}'),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: SizedBox(
                      height: 25,
                      width: 150,
                      child: orderInfo(),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class BookingCard extends StatelessWidget {
//   Booking booking;
//   BookingCard(this.booking, {Key? key}) : super(key: key);
//
//   Builder buttonChanger() {
//     if (booking.answered == false) {
//       return Builder(
//         builder: (BuildContext context) {
//           return ElevatedButton(
//             onPressed: () {
//               showMaterialModalBottomSheet(
//                   context: context,
//                   builder: (c) => OrderDialog(),
//                   expand: false,
//                   settings: RouteSettings(arguments: booking),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0)));
//             },
//             style: ElevatedButton.styleFrom(primary: Colors.grey),
//             child: Text('Ответить'),
//           );
//         },
//       );
//     } else {
//       return Builder(
//         builder: (BuildContext context) {
//           return ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(primary: Colors.green),
//               child: Text('Принято'));
//         },
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 15.0),
//       child: Container(
//         height: 70,
//         width: 355,
//         decoration: BoxDecoration(
//             color: Color(0xFFe8e8e8), borderRadius: BorderRadius.circular(10)),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Row(
//                 children: [
//                   Text(
//                     '${booking.numOfPeople} человек(а)',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                   )
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('${booking.date}'),
//                   Container(
//                     margin: EdgeInsets.all(5),
//                     child: SizedBox(
//                       height: 25,
//                       width: 150,
//                       child: buttonChanger(),
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
