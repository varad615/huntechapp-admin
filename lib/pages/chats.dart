import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  final DatabaseReference _dbRef =
      FirebaseDatabase.instance.ref().child('chat').child('messages');
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Map<String, dynamic>? _chats;
  Map<String, String> _userNames = {};

  @override
  void initState() {
    super.initState();
  }

  Future<Map<String, dynamic>> _fetchChatsAndUserNames() async {
    try {
      // Fetch chat data from Firebase Realtime Database
      final dataSnapshot = await _dbRef.get();

      if (dataSnapshot.value != null) {
        final data = Map<String, dynamic>.from(dataSnapshot.value as Map);

        // Fetch user names from Firestore
        for (String userId in data.keys) {
          await _fetchUserName(userId);
        }

        return data;
      } else {
        return {}; // No data available
      }
    } catch (error) {
      // Log error to console for debugging
      print("Error fetching chats: $error");
      return {}; // Return empty map on error
    }
  }

  Future<void> _fetchUserName(String userId) async {
    try {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(userId).get();
      if (userDoc.exists) {
        _userNames[userId] = userDoc['name'];
      } else {
        _userNames[userId] = userId; // Fallback to UID if no name is found
      }
    } catch (error) {
      // Log error to console for debugging
      print("Error fetching user name for $userId: $error");
      _userNames[userId] = userId; // Fallback to UID in case of error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
        backgroundColor: Color(0xFF51011A), // Maroon color
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _fetchChatsAndUserNames(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While data is loading, show a loading spinner
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            // Handle error cases
            return Center(
                child: Text('Error loading chats: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // In case no chats are available
            return Center(child: Text('No chats available.'));
          }

          // Once data is loaded, display the list of users
          _chats = snapshot.data!;

          return ListView.builder(
            itemCount: _chats!.length,
            itemBuilder: (context, index) {
              String userId = _chats!.keys.toList()[index];
              String displayName =
                  _userNames[userId] ?? userId; // Show name or fallback to UID
              return ListTile(
                title: Text(
                  'User: $displayName',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatDetailScreen(userId: userId),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class ChatDetailScreen extends StatefulWidget {
  final String userId;
  ChatDetailScreen({required this.userId});

  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final DatabaseReference _dbRef =
      FirebaseDatabase.instance.ref().child('chat').child('messages');
  List<Map<String, dynamic>> _messages = [];

  @override
  void initState() {
    super.initState();
    _fetchMessages();
  }

  void _fetchMessages() {
    _dbRef.child(widget.userId).onValue.listen((event) {
      if (event.snapshot.value != null) {
        final data = Map<String, dynamic>.from(event.snapshot.value as Map);
        setState(() {
          _messages = data.values
              .map((message) => Map<String, dynamic>.from(message))
              .toList()
            ..sort((a, b) =>
                b['time'].compareTo(a['time'])); // Sort by latest messages
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with User: ${widget.userId}'),
        backgroundColor: Color(0xFF51011A), // Maroon color
      ),
      body: _messages.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              reverse: true, // Show latest messages on top
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ListTile(
                  title: Text(
                    message['text'],
                    style: TextStyle(
                      color: message['type'] == 'admin'
                          ? Colors.blue
                          : Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    _formatTimestamp(message['time']),
                  ),
                );
              },
            ),
    );
  }

  String _formatTimestamp(int timestamp) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return '${date.year}-${date.month}-${date.day} ${date.hour}:${date.minute}';
  }
}
