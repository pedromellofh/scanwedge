import 'package:flutter_test/flutter_test.dart';
import 'package:scanwedge/models/extendedbatterystatus.dart';

void main() {
  ExtendedBatteryStatus createExtendedBatteryStatus(Map<String, dynamic> extraJson) {
    final baseJson = {
      'status': 2,
      'health': 2,
      'healthPercentage': 90,
      'batteryPercentDecommissionThreshold': 80,
    };
    return ExtendedBatteryStatus.fromJson({...baseJson, ...extraJson});
  }

  test('extendedbatterystatus test', () async {
    final status = createExtendedBatteryStatus({'healthPercentage': 70});
    expect(status.status, BatteryStatus.charging);
    expect(status.health, BatteryHealth.good);
    expect(status.healthPercentage, 70);
    expect(status.batteryPercentDecommissionThreshold, 80);
    expect(status.batteryDecommissionPercentageLeft, -50);
  });
}
