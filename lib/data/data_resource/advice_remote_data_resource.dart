import 'dart:convert';

import 'package:clean_architecture_app/data/models/advice_model.dart';
import 'package:http/http.dart' as http;

abstract class AdviceRemoteDataResource {
  Future<AdviceModel> getRandomAdviceFromApi();
}

class AdviceRemoteDataResourceImpl implements AdviceRemoteDataResource {
  final client = http.Client();
  @override
  Future<AdviceModel> getRandomAdviceFromApi() async {
    final response = await client.get(
        Uri.parse('https://api.flutter-community.com/api/v1/advice'),
        headers: {'content-type': 'application/json'});
    final responseBody = jsonDecode(response.body);
    return AdviceModel.fromJson(responseBody);
  }
}
