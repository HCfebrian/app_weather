import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class Failure extends Equatable {
  final String message;
  final int code;

  Failure(this.code, this.message);

  @override
  List<Object> get props => [code];
}

class FailedToGetDataFailure extends Failure {
  FailedToGetDataFailure({@required int code, @required String message})
      : super(code, message);
}

class NotFoundFailure extends Failure {
  NotFoundFailure(int code) : super(code, "Cannot find Your City");
}

class TooMuchTrafficFailure extends Failure {
  TooMuchTrafficFailure(int code)
      : super(code, "Too Much Traffic Or Data Request at The Moment");
}

class NetworkFailure extends Failure{
  NetworkFailure() : super(0, "No Internet Connection");

}