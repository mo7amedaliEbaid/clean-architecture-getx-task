import 'package:internet_connection_checker/internet_connection_checker.dart';
abstract class NetworkInfo{
  Future<bool> get isConnected;
}

class NetworkInfoImp extends NetworkInfo{
  final InternetConnectionChecker connectionChecker;

  NetworkInfoImp({required this.connectionChecker});
  @override
  // TODO: implement isConnected
  Future<bool> get isConnected => connectionChecker.hasConnection;

}