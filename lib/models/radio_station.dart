import 'dart:convert';

class RadioStation {
  String changeuuid;
  String stationuuid;
  String name;
  String url;
  String urlResolved;
  String homepage;
  String favicon;
  String tags;
  String country;
  String countrycode;
  String iso31662;
  String state;
  String language;
  String languagecodes;
  int votes;
  String lastchangetime;
  String lastchangetimeIso8601;
  String codec;
  int bitrate;
  int hls;
  int lastcheckok;
  String lastchecktime;
  String lastchecktimeIso8601;
  String lastcheckoktime;
  String lastcheckoktimeIso8601;
  String lastlocalchecktime;
  String lastlocalchecktimeIso8601;
  String clicktimestamp;
  dynamic clicktimestampIso8601;
  int clickcount;
  int clicktrend;
  int sslError;
  double geoLat;
  double geoLong;
  bool hasExtendedInfo;

  RadioStation({
    required this.changeuuid,
    required this.stationuuid,
    required this.name,
    required this.url,
    required this.urlResolved,
    required this.homepage,
    required this.favicon,
    required this.tags,
    required this.country,
    required this.countrycode,
    required this.iso31662,
    required this.state,
    required this.language,
    required this.languagecodes,
    required this.votes,
    required this.lastchangetime,
    required this.lastchangetimeIso8601,
    required this.codec,
    required this.bitrate,
    required this.hls,
    required this.lastcheckok,
    required this.lastchecktime,
    required this.lastchecktimeIso8601,
    required this.lastcheckoktime,
    required this.lastcheckoktimeIso8601,
    required this.lastlocalchecktime,
    required this.lastlocalchecktimeIso8601,
    required this.clicktimestamp,
    required this.clicktimestampIso8601,
    required this.clickcount,
    required this.clicktrend,
    required this.sslError,
    required this.geoLat,
    required this.geoLong,
    required this.hasExtendedInfo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'changeuuid': changeuuid,
      'stationuuid': stationuuid,
      'name': name,
      'url': url,
      'urlResolved': urlResolved,
      'homepage': homepage,
      'favicon': favicon,
      'tags': tags,
      'country': country,
      'countrycode': countrycode,
      'iso31662': iso31662,
      'state': state,
      'language': language,
      'languagecodes': languagecodes,
      'votes': votes,
      'lastchangetime': lastchangetime,
      'lastchangetimeIso8601': lastchangetimeIso8601,
      'codec': codec,
      'bitrate': bitrate,
      'hls': hls,
      'lastcheckok': lastcheckok,
      'lastchecktime': lastchecktime,
      'lastchecktimeIso8601': lastchecktimeIso8601,
      'lastcheckoktime': lastcheckoktime,
      'lastcheckoktimeIso8601': lastcheckoktimeIso8601,
      'lastlocalchecktime': lastlocalchecktime,
      'lastlocalchecktimeIso8601': lastlocalchecktimeIso8601,
      'clicktimestamp': clicktimestamp,
      'clicktimestampIso8601': clicktimestampIso8601,
      'clickcount': clickcount,
      'clicktrend': clicktrend,
      'sslError': sslError,
      'geoLat': geoLat,
      'geoLong': geoLong,
      'hasExtendedInfo': hasExtendedInfo,
    };
  }

  factory RadioStation.fromMap(Map<String, dynamic> map) {
    return RadioStation(
      changeuuid: map['changeuuid'] as String,
      stationuuid: map['stationuuid'] as String,
      name: map['name'] as String,
      url: map['url'] as String,
      urlResolved:
          map['urlResolved'] != null ? map['urlResolved'] as String : '',
      homepage: map['homepage'] as String,
      favicon: map['favicon'] as String,
      tags: map['tags'] as String,
      country: map['country'] as String,
      countrycode: map['countrycode'] as String,
      iso31662: map['iso31662'] != null ? map['iso31662'] as String : '',
      state: map['state'] as String,
      language: map['language'] as String,
      languagecodes: map['languagecodes'] as String,
      votes: map['votes'] as int,
      lastchangetime: map['lastchangetime'] as String,
      lastchangetimeIso8601: map['lastchangetimeIso8601'] != null
          ? map['lastchangetimeIso8601'] as String
          : '',
      codec: map['codec'] as String,
      bitrate: map['bitrate'] as int,
      hls: map['hls'] as int,
      lastcheckok: map['lastcheckok'] as int,
      lastchecktime: map['lastchecktime'] as String,
      lastchecktimeIso8601: map['lastchecktimeIso8601'] != null
          ? map['lastchecktimeIso8601'] as String
          : '',
      lastcheckoktime: map['lastcheckoktime'] as String,
      lastcheckoktimeIso8601: map['lastcheckoktimeIso8601'] != null
          ? map['lastcheckoktimeIso8601'] as String
          : '',
      lastlocalchecktime: map['lastlocalchecktime'] as String,
      lastlocalchecktimeIso8601: map['lastlocalchecktimeIso8601'] != null
          ? map['lastlocalchecktimeIso8601'] as String
          : '',
      clicktimestamp: map['clicktimestamp'] as String,
      clicktimestampIso8601: map['clicktimestampIso8601'] as dynamic,
      clickcount: map['clickcount'] as int,
      clicktrend: map['clicktrend'] as int,
      sslError: map['sslError'] != null ? map['sslError'] as int : 0,
      geoLat: map['geoLong'] != null ? map['geoLat'] as double : 0,
      geoLong: map['geoLong'] != null ? map['geoLong'] as double : 0,
      hasExtendedInfo: map['hasExtendedInfo'] != null
          ? map['hasExtendedInfo'] as bool
          : false,
    );
  }

  String toJson() => json.encode(toMap());

  factory RadioStation.fromJson(String source) =>
      RadioStation.fromMap(json.decode(source) as Map<String, dynamic>);
}
