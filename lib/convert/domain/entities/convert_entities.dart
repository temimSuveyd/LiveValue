import 'package:equatable/equatable.dart';
import 'package:qimahalan/convert/domain/entities/sub_entites/info_entites.dart';
import 'package:qimahalan/convert/domain/entities/sub_entites/query_entite.dart';

class ConvertEntities extends Equatable {
 final QueryEntite query;
 final InfoEntite info ;
 final double result ;

  const ConvertEntities({
required this.info,
required this.query,
required this.result
  });
  @override
  List<Object> get props => [result,info,query];
}
