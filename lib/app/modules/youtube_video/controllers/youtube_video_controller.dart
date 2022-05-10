import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:maraqittalmiat/utils/services.dart';
import '../../../../utils/constans.dart';
import '../../../data/models/channel_info.dart';
import '../../../data/models/model_videos.dart';

class YoutubeVideoController extends GetxController {
  static const CHANNEL_ID = 'UCY0rEO2mZH5BK0-jggUXjpQ';
  static const _baseURL = 'www.googleapis.com';
  Channelinfo? data;
  ModelVideos? videoList;
  Item? item;
  String playlistId = "";
  String? pageToken;
  List<ModelVideos>? list;

  // curl \
  // 'https://youtube.googleapis.com/youtube/v3/channels?part=snippet%2CcontentDetails%2Cstatistics&id=UCY0rEO2mZH5BK0-jggUXjpQ&access_token=AIzaSyDM1ed8WHdsj_Bo40NNjkM0jaZm6Z5vYU8&key=[YOUR_API_KEY]' \
  // --header 'Authorization: Bearer [YOUR_ACCESS_TOKEN]' \
  // --header 'Accept: application/json' \
  // --compressed
  Future<Channelinfo> getChannelInfo() async {
    Map<String, String> parameters = {
      'part': 'snippet,contentDetails,statistics',
      'id': CHANNEL_ID,
      'key': Constans.KEY
    };

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'aplication/json',
    };
    Uri uri = Uri.https(_baseURL, '/youtube/v3/channels/', parameters);
    http.Response response = await http.get(uri, headers: headers);
    // print(response);

    data = channelinfoFromJson(response.body);
    item = data?.items[0];
    playlistId = item!.contentDetails.relatedPlaylists.uploads;

    return data!;
  }

  Future<ModelVideos> getVideoList({String? playlistId}) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'playlistId': 'UUY0rEO2mZH5BK0-jggUXjpQ',
      'maxResults': '8',
      'key': Constans.KEY
    };

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'aplication/json',
    };

    Uri uri = Uri.https(_baseURL, '/youtube/v3/playlistItems', parameters);
    var response = await http.get(uri, headers: headers);
    Map<String, dynamic> data = (json.decode(response.body));
    videoList = ModelVideos.fromJson(data);
    print(videoList);
    return videoList!;
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getChannelInfo();
    getVideoList();
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
