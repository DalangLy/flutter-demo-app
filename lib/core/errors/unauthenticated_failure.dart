import 'package:demo_app/core/errors/failure.dart';

class UnauthenticatedFailure extends Failure{
  UnauthenticatedFailure(super.message);

  String getMessage(){
    return super.message;
  }
}