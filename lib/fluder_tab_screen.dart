
import 'package:flutter/material.dart';
import 'fluder_config.dart';
import 'fluder_home_screen.dart';

class FluderTabScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.blueGrey,
            primaryColor: Colors.white,
        ),
        home: FutureBuilder(
            future: loadConfig(),
            builder: (context, future) {
              if(!future.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              final List<dynamic> rssList = future.data;
              return DefaultTabController(
                  length: rssList.length,
                  child: Scaffold(
                      appBar: AppBar(
                          title: const Text('Flutter RSS Reader'),
                          bottom: TabBar(
                              tabs: rssList.map((rss) {
                                return Tab(text: rss.shortName);
                              }).toList(),
                          ),
                      ),
                      body: TabBarView(
                          children: rssList.map((rss) {
                            return Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: FluderHomeScreen(rss: rss),
                            );
                          }).toList(),
                      ),
                  ),
              );
            },
            ),
            );
  }
}
