import 'dart:convert';

import 'package:advicer/0_data/models/advice_model.dart';
import 'package:http/http.dart' as http;

abstract class AdviceRemoteDatasource {
  Future<AdviceModel> getRandomAdviceFromApi();
}

class AdviceRemoteDatasourceImpl implements AdviceRemoteDatasource {
  final client = http.Client();
  @override
  Future<AdviceModel> getRandomAdviceFromApi() async {
    final response = await client.get(
      Uri.parse(
        'https://api.flutter-community.com/api/v1/advice',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    final responseBody = json.decode(response.body);
    return AdviceModel.fromJson(responseBody);
  }
}
