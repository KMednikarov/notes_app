import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final message;
  Failure({required this.message});
  @override
  List<Object> get props => [];
}

// General failures

class CacheFailure extends Failure {
  static const String CACHE_FAILURE_MESSAGE = 'Failed to retrieve notes';
  CacheFailure() : super(message: CACHE_FAILURE_MESSAGE);
}
