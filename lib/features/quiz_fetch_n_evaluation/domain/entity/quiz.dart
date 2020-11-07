import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Quiz extends Equatable {
  final int responseCode;
  final List<Object> results;

  Quiz({
    @required this.responseCode,
    @required this.results,
  });

  @override
  List<Object> get props => [responseCode, results];
}
