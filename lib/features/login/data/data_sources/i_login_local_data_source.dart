abstract class ILoginLocalDataSource{
  Future<void> saveToken(String token);
  Future<String> getToken();
}