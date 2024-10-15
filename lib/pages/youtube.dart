import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:huntechelp_admin/pages/player.dart';


class YouTubePage extends StatefulWidget {
  @override
  _YouTubePageState createState() => _YouTubePageState();
}

class _YouTubePageState extends State<YouTubePage> {
  TextEditingController _searchController = TextEditingController();
  List _videos = [];
  List _filteredVideos = [];
  String _apiKey = 'AIzaSyCN47LtDXNy5pLIbNcarZqOgF3xtzN2L4w';
  String _channelId = 'UC8zteQuBHOUz4Ej1iomSgeQ';

  @override
  void initState() {
    super.initState();
    fetchVideos();
    _searchController.addListener(_filterVideos);
  }

  Future<void> fetchVideos() async {
    String url =
        'https://www.googleapis.com/youtube/v3/search?part=snippet&channelId=$_channelId&type=video&maxResults=20&key=$_apiKey';

    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        _videos = data['items'];
        _filteredVideos = _videos; // Initialize with all videos
      });
    }
  }

  void _filterVideos() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredVideos = _videos.where((video) {
        var title = video['snippet']['title'].toLowerCase();
        return title.contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Video Tutorials',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredVideos.length,
              itemBuilder: (context, index) {
                var video = _filteredVideos[index];
                var videoId = video['id']['videoId'];
                var videoTitle = video['snippet']['title'];
                var thumbnailUrl =
                    video['snippet']['thumbnails']['high']['url'];
                var channelTitle = video['snippet']['channelTitle'];

                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0), // Added padding
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoPlayerPage(
                            videoId: videoId,
                            videoTitle: videoTitle,
                          ),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                thumbnailUrl,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 8,
                              right: 8,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                color: Colors.black.withOpacity(0.8),
                                child: Text(
                                  '10:15', // Static duration for now
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            videoTitle,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 4),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            channelTitle,
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
