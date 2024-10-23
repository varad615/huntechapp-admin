import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Chat());
}

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final _database = FirebaseDatabase.instance.ref();
  final _controller = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _userId = '';
  List<Map<String, dynamic>> _messages = [];
  bool _isCallEnabled = false; // Initially disabled
  String _phoneNumber = '';

  // Send the message with 'type: user'
  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    final messageId =
        _database.child('chat').child('messages').child(_userId).push().key;

    _database
        .child('chat')
        .child('messages')
        .child(_userId)
        .child(messageId!)
        .set({
      'text': text,
      'time': DateTime.now().millisecondsSinceEpoch,
      'type': 'user',
    });

    _controller.clear();
  }

  // Retrieve messages and listen for changes
  void _retrieveMessages() {
    _database
        .child('chat')
        .child('messages')
        .child(_userId)
        .onValue
        .listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;

      if (data != null) {
        final List<Map<String, dynamic>> loadedMessages = [];

        data.forEach((key, value) {
          final messageData = value as Map<dynamic, dynamic>;
          loadedMessages.add({
            'text': messageData['text'],
            'time': messageData['time'],
            'type': messageData['type'],
          });
        });

        // Sort the messages by timestamp (ascending order)
        loadedMessages.sort((a, b) => b['time'].compareTo(a['time']));

        setState(() {
          _messages = loadedMessages;
        });
      }
    });
  }

  // Fetch phone number and availability from Firebase
  void _fetchPhoneDetails() {
    _database.child('phoneDetails').onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;

      if (data != null) {
        setState(() {
          _phoneNumber = data['phoneNumber'] ?? '';
          _isCallEnabled = data['available'] ?? false;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    User? user = _auth.currentUser;
    if (user != null) {
      setState(() {
        _userId = user.uid;
      });
      _retrieveMessages();
      _fetchPhoneDetails(); // Fetch phone details when the widget initializes
    }
  }

  // Format the timestamp to display time in hh:mm format
  String _formatTimestamp(int timestamp) {
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return "${date.hour}:${date.minute}";
  }

  // Make a phone call
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  void createTemporaryNumber() {
    _database.child('phoneDetails').set({
      'phoneNumber': '8691937999',
      'available': true,
    }).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Temporary number created with availability')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0), // Custom height
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(8.0), // Rounded corners
          ),
          child: AppBar(
            backgroundColor: const Color(0xFF51011A), // Maroon color
            title: const Text(
              'Chat',
              style: TextStyle(color: Colors.white), // White text color
            ),
            iconTheme: const IconThemeData(color: Colors.white), // White back button
            actions: [
              // Padding(
              //   padding: const EdgeInsets.only(right: 16.0),
              //   child: CircleAvatar(
              //     backgroundColor: Colors.white,
              //     child: IconButton(
              //       icon: Icon(Icons.call, color: Color(0xFF51011A)), // Call icon
              //       onPressed: createTemporaryNumber,
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: Icon(
                      Icons.call,
                      color: _isCallEnabled
                          ? const Color(0xFF51011A)
                          : Colors.grey, // Show gray when disabled
                    ),
                    onPressed: _isCallEnabled
                        ? () {
                            _makePhoneCall(_phoneNumber); // Use fetched phone number
                          }
                        : () {
                            // Show snackbar when the button is disabled
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('User is not available. Call after some time.'),
                              ),
                            );
                          },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              reverse: true, // New messages appear at the bottom
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                bool isUserMessage = message['type'] == 'user';

                return Align(
                  alignment: isUserMessage
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color:
                          isUserMessage ? Colors.green[300] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: isUserMessage
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Text(
                          message['text'],
                          style: const TextStyle(color: Colors.black),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          _formatTimestamp(message['time']),
                          style: const TextStyle(color: Colors.black54, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF51011A), // Background color for the entire row
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8.0)), // Rounded top corners
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(
                          top: 10,
                          bottom: 8,
                          left: 10), // Add top and bottom margin
                      decoration: BoxDecoration(
                        color: Colors.white, // Maroon background for the text box
                        borderRadius: BorderRadius.circular(8.0), // Rounded corners
                      ),
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0), // Rounded corners
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Enter message',
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10), // Add horizontal padding
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.white), // Send icon
                    onPressed: () {
                      _sendMessage(_controller.text);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
