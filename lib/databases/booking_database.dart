import '../classes/booking.dart';

List<Booking> booking = [
  Booking(
    id: 1,
    numOfPeople: 3,
    date: DateTime.utc(2022, 9, 30, 18, 00),
    answered: true,
  ),
  Booking(
    id: 2,
    numOfPeople: 1,
    date: DateTime.utc(2022, 9, 26, 10, 40),
    answered: false,
  ),
  Booking(
    id: 3,
    numOfPeople: 2,
    date: DateTime.utc(2022, 9, 24, 14, 20),
    answered: false,
  ),
  Booking(
    id: 4,
    numOfPeople: 6,
    date: DateTime.utc(2022, 9, 28, 16, 30),
    answered: false,
  ),
  Booking(
    id: 5,
    numOfPeople: 5,
    date: DateTime.utc(2022, 10, 1, 14, 00),
    answered: false,
  ),
];
