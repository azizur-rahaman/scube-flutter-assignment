import 'dart:convert';
import 'package:flutter/services.dart';
import '../../../../core/error/exceptions.dart';
import '../models/monitoring_model.dart';

abstract class MonitoringLocalDataSource {
  Future<MonitoringModel> getMonitoringData();
}

class MonitoringLocalDataSourceImpl implements MonitoringLocalDataSource {
  @override
  Future<MonitoringModel> getMonitoringData() async {
    try {
      final String jsonString = await rootBundle.loadString(
        'assets/json/monitoring_data.json',
      );
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      return MonitoringModel.fromJson(jsonMap);
    } catch (e) {
      throw CacheException();
    }
  }
}
