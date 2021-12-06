class TransAction {
  final String id;
  final String title;
  final DateTime date;
  final String description;
  final double ask;
  final double total;
  final String code;
  final String codeToParse;


  TransAction({
    required this.id,
    required this.title,
    required this.date,
    required this.description,
    required this.ask,
    required this.total,
    required this.code,
    required this.codeToParse,
  });

}