import '../../domain/entities/monitoring_data.dart';

class MonitoringModel extends MonitoringData {
  const MonitoringModel({
    required super.currentPower,
    required super.plantGeneration,
    required super.livePr,
    required super.cumulativePr,
    required super.returnPv,
    required super.totalEnergy,
    required super.weather,
    required super.comparison,
    required super.systemInfo,
    required super.inverters,
  });

  factory MonitoringModel.fromJson(Map<String, dynamic> json) {
    return MonitoringModel(
      currentPower: json['current_power'],
      plantGeneration: json['plant_generation'],
      livePr: json['live_pr'],
      cumulativePr: json['cumulative_pr'],
      returnPv: json['return_pv'],
      totalEnergy: json['total_energy'],
      weather: WeatherInfoModel.fromJson(json['weather']),
      comparison: ComparisonDataModel.fromJson(json['comparison']),
      systemInfo: SystemInfoModel.fromJson(json['system_info']),
      inverters: (json['inverters'] as List)
          .map((e) => InverterModel.fromJson(e))
          .toList(),
    );
  }
}

class WeatherInfoModel extends WeatherInfo {
  const WeatherInfoModel({
    required super.temperature,
    required super.windSpeed,
    required super.irradiation,
    required super.condition,
  });

  factory WeatherInfoModel.fromJson(Map<String, dynamic> json) {
    return WeatherInfoModel(
      temperature: json['temperature'],
      windSpeed: json['wind_speed'],
      irradiation: json['irradiation'],
      condition: json['condition'],
    );
  }
}

class ComparisonDataModel extends ComparisonData {
  const ComparisonDataModel({required super.yesterday, required super.today});

  factory ComparisonDataModel.fromJson(Map<String, dynamic> json) {
    return ComparisonDataModel(
      yesterday: DailyStatsModel.fromJson(json['yesterday']),
      today: DailyStatsModel.fromJson(json['today']),
    );
  }
}

class DailyStatsModel extends DailyStats {
  const DailyStatsModel({
    required super.acMaxPower,
    required super.netEnergy,
    required super.specificYield,
  });

  factory DailyStatsModel.fromJson(Map<String, dynamic> json) {
    return DailyStatsModel(
      acMaxPower: json['ac_max_power'],
      netEnergy: json['net_energy'],
      specificYield: json['specific_yield'],
    );
  }
}

class SystemInfoModel extends SystemInfo {
  const SystemInfoModel({
    required super.pvModules,
    required super.totalAcCapacity,
    required super.totalDcCapacity,
    required super.commissioningDate,
    required super.inverterCount,
  });

  factory SystemInfoModel.fromJson(Map<String, dynamic> json) {
    return SystemInfoModel(
      pvModules: json['pv_modules'],
      totalAcCapacity: json['total_ac_capacity'],
      totalDcCapacity: json['total_dc_capacity'],
      commissioningDate: json['commissioning_date'],
      inverterCount: json['inverter_count'],
    );
  }
}

class InverterModel extends Inverter {
  const InverterModel({
    required super.id,
    required super.currentPower,
    required super.lifetimeEnergy,
    required super.todayEnergy,
    required super.prevMeterEnergy,
    required super.livePower,
  });

  factory InverterModel.fromJson(Map<String, dynamic> json) {
    return InverterModel(
      id: json['id'],
      currentPower: json['current_power'],
      lifetimeEnergy: json['lifetime_energy'],
      todayEnergy: json['today_energy'],
      prevMeterEnergy: json['prev_meter_energy'],
      livePower: json['live_power'],
    );
  }
}
