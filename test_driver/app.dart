import 'package:flutter/widgets.dart';
import 'package:flutter_driver/driver_extension.dart';

import 'package:stationery_shop/env.dart';
import 'package:stationery_shop/main.dart';
import 'package:stationery_shop/src/services/api_service.dart';

void main() {
  const baseUrl = '${Env.apiBaseUrl}:${Env.apiPort}/${Env.apiPath}/${Env.apiVersion}';
  final apiService = ApiService(baseUrl: baseUrl);
  enableFlutterDriverExtension();
  runApp(InventoryApp(apiService: apiService));
}
