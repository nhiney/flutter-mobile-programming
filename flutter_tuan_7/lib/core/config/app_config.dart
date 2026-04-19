import 'dart:convert';
import 'package:flutter/services.dart';

class AppConfig {
  static final AppConfig _instance = AppConfig._internal();
  static AppConfig get instance => _instance;

  AppConfig._internal();

  Map<String, dynamic> _data = {};
  bool _loaded = false;

  Future<void> load() async {
    if (_loaded) return;
    final raw = await rootBundle.loadString('assets/config/app_config.json');
    _data = json.decode(raw) as Map<String, dynamic>;
    _loaded = true;
  }

  T get<T>(String dotPath, T defaultValue) {
    final keys = dotPath.split('.');
    dynamic node = _data;
    for (final k in keys) {
      if (node is Map<String, dynamic> && node.containsKey(k)) {
        node = node[k];
      } else {
        return defaultValue;
      }
    }
    return (node as T?) ?? defaultValue;
  }

  List<Map<String, dynamic>> getObjectList(String dotPath) {
    final keys = dotPath.split('.');
    dynamic node = _data;
    for (final k in keys) {
      if (node is Map<String, dynamic> && node.containsKey(k)) {
        node = node[k];
      } else {
        return [];
      }
    }
    if (node is List) {
      return node.cast<Map<String, dynamic>>();
    }
    return [];
  }

  List<String> getStringList(String dotPath) {
    final keys = dotPath.split('.');
    dynamic node = _data;
    for (final k in keys) {
      if (node is Map<String, dynamic> && node.containsKey(k)) {
        node = node[k];
      } else {
        return [];
      }
    }
    if (node is List) {
      return node.cast<String>();
    }
    return [];
  }
}
