import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:product_tracker_app/Application/models/failure.dart';
import 'package:product_tracker_app/config.dart';

class BasicPostRequest {
  static Future<Either<Failure, dynamic>> make(
      {required String path,
      required Map<String, dynamic> bodyData,
      Function(Map<String, dynamic>)? onResolveOk}) async {
    final res = await http.post(
      Uri.parse(Config.kUrl + path),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(bodyData),
    );

    try {
      Map<String, dynamic> response = json.decode(res.body);

      if (onResolveOk == null) {
        return Right(response);
      }

      if (response['ok']) {
        return Right(onResolveOk(response));
      } else {
        return Left(Failure(message: response.toString()));
      }
    } catch ($e) {
      return Left(Failure(message: $e.toString()));
    }
  }
}
