import 'package:demo_app/core/errors/failure.dart';

class UnauthenticatedFailed extends Failure{
  UnauthenticatedFailed(super.message);

  String getMessage(){
    return super.message;
  }
}