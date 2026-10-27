import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommeceappcourse/core/constant/status_requset.dart';
import 'package:ecommeceappcourse/core/functions/check_internet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequset, Map>> postData(String linkuri, Map data) async {
    try {
      if (!await CheckInternet()) {
        return const Left(StatusRequset.OfflineFailure);
      }

      final response = await http
          .post(
            Uri.parse(linkuri),
            body: data.map(
              (key, value) => MapEntry(key.toString(), value.toString()),
            ),
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
          )
          .timeout(const Duration(seconds: 15));

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.body.trim().isEmpty) {
          return const Right({});
        }

        final decodedBody = jsonDecode(response.body);

        if (decodedBody is Map) {
          return Right(Map<String, dynamic>.from(decodedBody));
        }

        return const Left(StatusRequset.serviceFailure);
      }

      return const Left(StatusRequset.serviceFailure);
    } on TimeoutException catch (_) {
      return const Left(StatusRequset.exceptionFailure);
    } on FormatException catch (_) {
      return const Left(StatusRequset.exceptionFailure);
    } catch (_) {
      return const Left(StatusRequset.exceptionFailure);
    }
  }
}
