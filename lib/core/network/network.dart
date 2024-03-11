import 'package:internet_connection_checker/internet_connection_checker.dart';
//abstract implementation in case package out (darbt)

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);
  @override
  //true-->connected,false-->not connected
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
