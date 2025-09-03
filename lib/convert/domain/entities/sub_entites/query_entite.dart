
import 'package:equatable/equatable.dart';

class QueryEntite extends Equatable {
  final  String from;
  final  String to;
   final double amount;

 const   QueryEntite({
        required this.from,
        required this.to,
        required this.amount,
    });
    
      @override

      List<Object?> get props => [from,to,amount];

}
