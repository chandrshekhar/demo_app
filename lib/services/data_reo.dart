import 'dart:convert';

import 'package:demo_app/model/json_model.dart';
import 'package:flutter/services.dart';

class DataRepository {
  Future<List<JsonModel>> getData() async {
    final jsonData = await _getJson();

    final result = jsonDecode(jsonData) as List;

    final data = result.map((e) => JsonModel.fromJson(e)).toList();
    return data;
  }

  Future<String> _getJson() async {
    return await rootBundle.loadString('assets/items.json');
  }
}
