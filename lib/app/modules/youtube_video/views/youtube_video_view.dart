import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:maraqittalmiat/app/data/models/model_videos.dart';

import 'package:maraqittalmiat/utils/bottom_navbar.dart';
import 'package:maraqittalmiat/utils/dimensions.dart';

import '../../../../widgets/app_bar.dart';
import '../../../controllers/page_index_controller.dart';
import '../../../data/models/channel_info.dart';
import '../controllers/youtube_video_controller.dart';

class YoutubeVideoView extends GetView<YoutubeVideoController> {
  final pageC = Get.find<PageIndexController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarGlobal(
        appBar: AppBar(),
      ),
      body: Column(
        children: [
          _loadChanel(),
          Expanded(
            child: FutureBuilder<ModelVideos>(
                future: controller.getVideoList(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: SpinKitFadingCube(
                        color: Colors.green,
                        size: 50.0,
                      ),
                    );
                  }
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: controller.videoList!.videos!.length,
                        itemBuilder: (context, index) {
                          VideoItem videoItem =
                              controller.videoList!.videos![index];
                          return Container(
                            width: AppDimensions.pageVieewContainer,
                            height: AppDimensions.pageVieewContainer,
                            // child: Text(videoItem.video.channelTitle),
                            child: Image.network(
                                "${videoItem.video.thumbnails.medium.url}"),
                          );
                        });
                  } else {
                    return Center(
                      child: Text("Empty"),
                    );
                  }
                }),
          )
        ],
      ),
      bottomNavigationBar: NavbarBottom(pageC: pageC),
    );
  }

  FutureBuilder<Channelinfo> _loadChanel() {
    return FutureBuilder<Channelinfo>(
      future: controller.getChannelInfo(),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return Center();
        }
        if (snap.hasData) {
          return Container(
            margin: EdgeInsets.all(AppDimensions.font20),
            padding: EdgeInsets.all(AppDimensions.height10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimensions.radius15),
                color: Colors.green[100]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipOval(
                  child: Container(
                    width: AppDimensions.height30 * 2,
                    height: AppDimensions.height30 * 2,
                    child: Image(
                      image: NetworkImage(
                          snap.data!.items[0].snippet.thumbnails.medium.url),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: AppDimensions.height10,
                ),
                Text(
                  snap.data!.items[0].snippet.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: AppDimensions.height10,
                ),
                Text(
                  snap.data!.items[0].statistics.videoCount,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: Text("Empty"),
          );
        }
      },
    );
  }
}
