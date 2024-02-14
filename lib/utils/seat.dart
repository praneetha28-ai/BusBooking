class Seat {
  final String label;
  final SeatType type;
  MySeatState state;

  Seat({required this.label, required this.type, required this.state});
}

enum SeatType { window, aisle, middle }
enum MySeatState { empty, selected, sold }
