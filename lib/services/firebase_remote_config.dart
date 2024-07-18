import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';

class FirebaseRemoteConfigService{
  FirebaseRemoteConfigService() :
        _remoteConfig = FirebaseRemoteConfig.instance;

  final FirebaseRemoteConfig _remoteConfig;

  Future<bool> fetchRemoteConfig() async {

    try {
      await _remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 20),
        minimumFetchInterval: const Duration(hours: 1),
      ));
      // remoteConfig.setDefaults({'showDiscountedPrice': true});
      await _remoteConfig.fetchAndActivate();

      final bool?  _showDiscountedPrice = _remoteConfig.getBool(
          'showDiscountedPrice');

      return _showDiscountedPrice ?? true;
    } catch (e) {
      if (kDebugMode) {
        print('Failed to fetch remote config: $e');
      }
    }
    return true;
  }


}