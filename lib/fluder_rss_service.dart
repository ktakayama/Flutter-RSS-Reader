import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';

class FluderRssService {
  final String shortName;
  final String name;
  final String url;

  const FluderRssService({this.shortName, this.name, this.url});

  Future<RssFeed> getFeed() =>
      http.read(this.url).then((xmlString) => RssFeed.parse(xmlString));
}

