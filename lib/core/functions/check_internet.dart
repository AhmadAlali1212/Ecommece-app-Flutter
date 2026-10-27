import 'dart:async';
import 'dart:io';

Future<bool> CheckInternet() async {
  try {
    final checkInternet = await InternetAddress.lookup(
      'google.com',
    ).timeout(const Duration(seconds: 5));

    return checkInternet.isNotEmpty &&
        checkInternet.first.rawAddress.isNotEmpty;
  } on SocketException catch (_) {
    return false;
  } on TimeoutException catch (_) {
    return false;
  }
}
