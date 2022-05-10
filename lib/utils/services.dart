import 'dart:io';

import 'package:get/get.dart';

import 'package:maraqittalmiat/utils/constans.dart';
import 'package:http/http.dart ' as http;

import '../app/data/models/channel_info.dart';
import '../app/data/models/model_videos.dart';

class Services {
  static const CHANNEL_ID = 'UCY0rEO2mZH5BK0-jggUXjpQ';
  static const _baseURL = 'www.youtube.googleapis.com';
  Channelinfo? data;
  ModelVideos? videoList;
  Item? item;
  String? playlistId;
  String? pageToken;

  // curl \
  // 'https://youtube.googleapis.com/youtube/v3/channels?part=snippet%2CcontentDetails%2Cstatistics&id=UCY0rEO2mZH5BK0-jggUXjpQ&access_token=AIzaSyDM1ed8WHdsj_Bo40NNjkM0jaZm6Z5vYU8&key=[YOUR_API_KEY]' \
  // --header 'Authorization: Bearer [YOUR_ACCESS_TOKEN]' \
  // --header 'Accept: application/json' \
  // --compressed

  static Future<Channelinfo> getChannelInfo() async {
    Map<String, String> parameters = {
      'part': 'snippet,contentDetails,statistics',
      'id': CHANNEL_ID,
      'key': Constans.KEY
    };

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'aplication/json',
    };
    Uri uri = Uri.https(_baseURL, '/youtube/v3/channels', parameters);
    http.Response response = await http.get(uri, headers: headers);
    

    Channelinfo channelinfo = channelinfoFromJson(response.body);

    return channelinfo;
  }

  static Future<ModelVideos> getVideoList({String? playlistId}) async {
    Map<String, String> parameters = {
      'part': 'snippets',
      'playlistId': 'UUY0rEO2mZH5BK0-jggUXjpQ',
      'maxResults': '8',
      'key': Constans.KEY
    };

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'aplication/json',
    };

    Uri uri = Uri.https(_baseURL, '/youtube/v3/playlistItems', parameters);
    http.Response response = await http.get(uri, headers: headers);
    ModelVideos videoList = modelVideosFromJson(response.body);

    print(videoList);
    return videoList;
  }
}
