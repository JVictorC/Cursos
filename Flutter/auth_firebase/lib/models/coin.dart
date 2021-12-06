class Coin {
  final String code;
  final String name;
  final double high;
  final double low;
  final double ask;

  Coin({
    required this.code,
    required this.name,
    required this.high,
    required this.low,
    required this.ask,
  });

  String getName() {
    List<String> nameArray = name.split('/');
    return nameArray[0];
  }
}
