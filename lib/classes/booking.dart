class Booking {
  final int id;
  final int numOfPeople;
  final DateTime date;
  bool answered;
  bool? accepted;
  String? declineExplanation;

  Booking({
    required this.id,
    required this.numOfPeople,
    required this.date,
    required this.answered,
    this.accepted,
    this.declineExplanation,
  });
}
