import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppStorage {
  // ignore: unused_field
  Box? _box;

  Future<void> initAppStorage() async {
    await Hive.initFlutter();
    _box = await Hive.openBox('payment box');
  }

  // example of storing & getting value

  final String _upiId = 'upiId';

  String? getUpiId() {
    return _box?.get(_upiId) as String?;
  }

  Future<void> putUpiId(String upiId) async {
    await _box?.put(_upiId, upiId);
  }

  final String _name = 'name';

  String? getName() {
    return _box?.get(_name) as String?;
  }

  Future<void> putName(String name) async {
    await _box?.put(_name, name);
  }

  final String _amount = 'amount';

  String? getAmount() {
    return _box?.get(_amount) as String?;
  }

  Future<void> putAmount(String amount) async {
    await _box?.put(_amount, amount);
  }

  final String _description = 'description';

  String? getDescription() {
    return _box?.get(_description) as String?;
  }

  Future<void> putDescription(String description) async {
    await _box?.put(_description, description);
  }

  Future<void> clearAllData() async {
    await _box?.clear();
  }
}

final appStorageProvider = Provider<AppStorage>(
  (_) {
    throw UnimplementedError();
  },
);
