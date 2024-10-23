import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';

class YouTubePage extends StatefulWidget {
  const YouTubePage({super.key});

  @override
  _YouTubePageState createState() => _YouTubePageState();
}

class _YouTubePageState extends State<YouTubePage> {
  final TextEditingController _searchController = TextEditingController();
  List _videos = [];
  List _filteredVideos = [];
  final String _apiKey = 'AIzaSyCN47LtDXNy5pLIbNcarZqOgF3xtzN2L4w';
  final String _channelId = 'UC8zteQuBHOUz4Ej1iomSgeQ';
  String? _selectedVideoId; // To store selected video ID
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref().child('setting');

  @override
  void initState() {
    super.initState();
    fetchVideos();
    fetchSelectedVideoId(); // Fetch the selected video ID when the page loads
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
        _filteredVideos = _videos;
      });
    }
  }

  Future<void> fetchSelectedVideoId() async {
    DataSnapshot snapshot = await _dbRef.child('videoid').get();
    if (snapshot.exists) {
      setState(() {
        _selectedVideoId = snapshot.value as String; // Set the selected video ID from database
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

  void _setVideoOfDay() async {
    if (_selectedVideoId != null) {
      await _dbRef.child('videoid').set(_selectedVideoId);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Video of the day set successfully!')),
      );
    }
  }

  void _removeVideoOfDay() async {
    await _dbRef.child('videoid').remove();
    setState(() {
      _selectedVideoId = null; // Clear the selected video locally
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Video of the day removed!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Video Tutorials',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
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
                prefixIcon: const Icon(Icons.search),
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
                var thumbnailUrl = video['snippet']['thumbnails']['high']['url'];

                bool isSelected = _selectedVideoId == videoId;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (_selectedVideoId == videoId) {
                          _selectedVideoId = null; // Deselect if already selected
                        } else {
                          _selectedVideoId = videoId;
                        }
                      });
                    },
                    child: Card(
                      color: isSelected ? Colors.grey[300] : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              thumbnailUrl,
                              width: 100,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              videoTitle,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          if (_selectedVideoId != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: MaterialButton(
                onPressed: _setVideoOfDay,
                color: const Color(0xFF51011A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minWidth: double.infinity,
                child: const Text(
                  'Set Video of the Day',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: MaterialButton(
              onPressed: _removeVideoOfDay,
              color: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              minWidth: double.infinity,
              child: const Text(
                'Remove Video of the Day',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
