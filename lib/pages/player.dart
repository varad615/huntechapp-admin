import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VideoPlayerPage extends StatefulWidget {
  final String videoId;
  final String videoTitle;

  const VideoPlayerPage({super.key, required this.videoId, required this.videoTitle});

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late YoutubePlayerController _controller;
  String _description = '';
  String _channelTitle = ''; // Store channel title
  String _thumbnailUrl = ''; // Store thumbnail URL

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    fetchVideoDetails(widget.videoId);
  }

  Future<void> fetchVideoDetails(String videoId) async {
    String apiKey = 'AIzaSyCN47LtDXNy5pLIbNcarZqOgF3xtzN2L4w'; // Your API key
    String url =
        'https://www.googleapis.com/youtube/v3/videos?id=$videoId&part=snippet&key=$apiKey';

    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        _description = data['items'][0]['snippet']['description'] ?? '';
        _channelTitle = data['items'][0]['snippet']['channelTitle'] ?? '';
        _thumbnailUrl = data['items'][0]['snippet']['thumbnails']['high']['url'] ?? '';
      });
    } else {
      // Handle error
      print('Error fetching video details: ${response.statusCode}');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.videoTitle),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // YouTube player widget
          AspectRatio(
            aspectRatio: 16 / 9,
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              onReady: () {
                _controller.addListener(() {});
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Video title
                Text(
                  widget.videoTitle,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                // Channel title
                Text(
                  _channelTitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8),
                // Video description
                Text(
                  _description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          // Divider
          const Divider(),
          // Action buttons
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       // Like button
          //       Row(
          //         children: [
          //           Icon(Icons.thumb_up, color: Colors.grey),
          //           SizedBox(width: 8),
          //           Text("Like", style: TextStyle(color: Colors.grey)),
          //         ],
          //       ),
          //       // Dislike button
          //       Row(
          //         children: [
          //           Icon(Icons.thumb_down, color: Colors.grey),
          //           SizedBox(width: 8),
          //           Text("Dislike", style: TextStyle(color: Colors.grey)),
          //         ],
          //       ),
          //       // Share button
          //       Row(
          //         children: [
          //           Icon(Icons.share, color: Colors.grey),
          //           SizedBox(width: 8),
          //           Text("Share", style: TextStyle(color: Colors.grey)),
          //         ],
          //       ),
          //       // More options
          //       Row(
          //         children: [
          //           Icon(Icons.more_horiz, color: Colors.grey),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          // Divider(),
          // Add more details or comments section here if needed
        ],
      ),
    );
  }
}
