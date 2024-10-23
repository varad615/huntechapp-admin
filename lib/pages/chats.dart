import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  final DatabaseReference _dbRef =
      FirebaseDatabase.instance.ref().child('chats').child('messages');

  Map<String, dynamic>? _chats;

  @override
  void initState() {
    super.initState();
  }

  Future<Map<String, dynamic>> _fetchChats() async {
    try {
      final dataSnapshot = await _dbRef.get();

      if (dataSnapshot.exists) {
        final chatData = Map<String, dynamic>.from(
            dataSnapshot.value as Map<Object?, Object?>);

        // Loop through the chat data and print only the messages that meet the condition
        chatData.forEach((uid, chat) {
          // Access the `messages` for the user
          final messages = Map<String, dynamic>.from(chat['messages'] ?? {});

          print("User ID: $uid");

          messages.forEach((messageId, messageData) {
            // Filter only messages with userType 'User' and status 'unseen'
            final text = messageData['text'] ?? '';
            final userType = messageData['userType'] ?? '';
            final status = messageData['status'] ?? '';

            if (userType == 'User' && status == 'unseen') {
              print(
                  "Message ID: $messageId -> text: $text, userType: $userType, status: $status");
            }
          });

          print("\n"); // Print a line break after each user's messages
        });

        return chatData;
      } else {
        print("No chat data available.");
        return {}; // No data available
      }
    } catch (error) {
      print("Error fetching chats: $error");
      return {}; // Return empty map on error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chats',
          style: TextStyle(
              color: Colors.white), // Set the title text color to white
        ),
        backgroundColor: const Color(0xFF51011A), // Maroon color
        iconTheme: const IconThemeData(
          color: Colors.white, // Set arrow (back button) color to white
        ),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _fetchChats(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
                child: Text('Error loading chats: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No chats available.'));
          }

          _chats = snapshot.data!;

          return ListView.separated(
            itemCount: _chats!.length,
            itemBuilder: (context, index) {
              String userId = _chats!.keys.toList()[index];
              Map<String, dynamic> userData =
                  Map<String, dynamic>.from(_chats![userId]);

              String displayName = userData['username'] ?? userId;

              // Calculate unseen messages count
              final messages =
                  Map<String, dynamic>.from(userData['messages'] ?? {});
              int unseenCount = 0;

              messages.forEach((messageId, messageData) {
                final status = messageData['status'] ?? '';
                final userType = messageData['userType'] ?? '';

                if (userType == 'User' && status == 'unseen') {
                  unseenCount++;
                }
              });

              return ListTile(
                title: Text(
                  displayName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                // If unseenCount > 0, show the count, else show nothing
                trailing: unseenCount > 0
                    ? Text(
                        unseenCount.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      )
                    : null,
                onTap: () async {
                  // Navigate to ChatDetailScreen and wait for result
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatDetailScreen(userId: userId),
                    ),
                  );

                  // If we get 'true' as a result, refresh the chats
                  if (result == true) {
                    setState(() {
                      _fetchChats();
                    });
                  }
                },
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(); // Add a Divider between each item
            },
          );
        },
      ),
    );
  }
}

class ChatDetailScreen extends StatefulWidget {
  final String userId;
  const ChatDetailScreen({super.key, required this.userId});

  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final DatabaseReference _dbRef =
      FirebaseDatabase.instance.ref().child('chats').child('messages');
  List<Map<String, dynamic>> _messages = [];
  final TextEditingController _messageController = TextEditingController();
  String _username = ''; // Variable to hold the username

  @override
  void initState() {
    super.initState();
    _fetchMessages();
    _fetchUsername(); // Fetch the username when the screen initializes
    _markMessagesAsSeen(); // Mark unseen messages as seen
  }

  void _fetchMessages() {
    _dbRef.child(widget.userId).child('messages').onValue.listen((event) {
      if (event.snapshot.exists) {
        final data = Map<String, dynamic>.from(
            event.snapshot.value as Map<Object?, Object?>);
        setState(() {
          _messages = data.values
              .map((message) => Map<String, dynamic>.from(message))
              .toList()
            ..sort((a, b) =>
                b['sendOn'].compareTo(a['sendOn'])); // Sort by latest messages
        });
      }
    });
  }

  Future<void> _fetchUsername() async {
    try {
      final event =
          await _dbRef.child(widget.userId).once(); // Fetch data snapshot
      if (event.snapshot.exists) {
        setState(() {
          _username = event.snapshot.child('username').value
              as String; // Get the username
        });
      }
    } catch (error) {
      print("Error fetching username: $error");
    }
  }

  void _markMessagesAsSeen() async {
    final snapshot = await _dbRef.child(widget.userId).child('messages').get();

    if (snapshot.exists) {
      final messages =
          Map<String, dynamic>.from(snapshot.value as Map<Object?, Object?>);

      messages.forEach((messageId, messageData) {
        if (messageData['status'] == 'unseen' &&
            messageData['userType'] == 'User') {
          _dbRef
              .child(widget.userId)
              .child('messages')
              .child(messageId)
              .update({'status': 'seen'}); // Mark as seen
        }
      });
    }
  }

  void _sendMessage(String text) {
    if (text.isNotEmpty) {
      final messageId = DateTime.now()
          .millisecondsSinceEpoch
          .toString(); // Unique ID for the message
      final messageData = {
        'sendOn': DateTime.now().toString(), // Save the current timestamp
        'status': 'unseen',
        'text': text,
        'userType': 'admin', // Set userType as 'admin'
      };

      // Save the message to Firebase
      _dbRef
          .child(widget.userId)
          .child('messages')
          .child(messageId)
          .set(messageData);

      _messageController.clear(); // Clear the input field
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(
            context, true); // Return 'true' when back button is pressed
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '$_username',
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color(0xFF51011A),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Column(
          children: [
            Expanded(
              child: _messages.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      reverse: true, // Show latest messages on top
                      itemCount: _messages.length,
                      itemBuilder: (context, index) {
                        final message = _messages[index];
                        return Align(
                          alignment: message['userType'] == 'admin'
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: message['userType'] == 'admin'
                                  ? Colors.blue[200]
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: message['userType'] == 'admin'
                                  ? CrossAxisAlignment.end
                                  : CrossAxisAlignment.start,
                              children: [
                                Text(
                                  message['text'] ?? '',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  message['sendOn'] ?? '',
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: const InputDecoration(
                        hintText: 'Enter message...',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      _sendMessage(_messageController.text);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
