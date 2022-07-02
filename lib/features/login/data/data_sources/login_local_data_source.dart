import 'package:demo_app/features/login/data/data_sources/i_login_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginLocalDataSource implements ILoginLocalDataSource{
  final Future<SharedPreferences> _prefs;

  LoginLocalDataSource(this._prefs);

  @override
  Future<void> saveToken(String token) async{
    final SharedPreferences prefs = await _prefs;
    prefs.setString('accessToken', token);
  }

  @override
  Future<String> getToken() async{
    final SharedPreferences prefs = await _prefs;
    return Future.value(prefs.getString('accessToken'));
  }
}