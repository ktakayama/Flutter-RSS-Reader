
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'fluder_rss_service.dart';

Future<List<dynamic>> loadConfig() async {
  String jsonString = await rootBundle.loadString('assets/config.json');
  Map<String, dynamic> configData = json.decode(jsonString);
  final List<dynamic> rssList = configData['feeds'].map((data) =>
      FluderRssService(
          shortName: data['shortName'],
          name: data['name'],
          url: data['url']
      )
  ).toList();
  return rssList;
}

