import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:huntechelp_admin/pages/chat.dart';
import 'package:huntechelp_admin/pages/chats.dart';
import 'package:huntechelp_admin/pages/profile.dart';
import 'package:huntechelp_admin/pages/youtube.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? _currentUser;
  String? _userName;

  @override
  void initState() {
    super.initState();
    _getCurrentUserInfo();
  }

  Future<void> _getCurrentUserInfo() async {
    _currentUser = _auth.currentUser;

    if (_currentUser != null) {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(_currentUser!.uid).get();

      if (userDoc.exists) {
        setState(() {
          _userName = userDoc['name'];
        });
      }
    }
  }

  Future<void> _signOut() async {
    await _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF51011A), // Maroon color
        title: _userName == null
            ? CircularProgressIndicator(
                color: Colors.white, // Spinner in white to match the theme
              )
            : Text(
                'Welcome, $_userName', // Welcome message with dynamic name
                style: TextStyle(
                  color: Colors.white, // White text color
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
        centerTitle: true,
        elevation: 0, // No shadow for a clean, flat look
        toolbarHeight: 80, // Increase the height for a large app bar
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20), // Balanced space

              // List of options
              Expanded(
                child: ListView(
                  children: [
                    // Option 1: Chat
                    ListTile(
                      leading: Icon(Icons.chat, color: Color(0xFF51011A)),
                      title: Text(
                        'Chats',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Chats()),
                        );
                      },
                    ),
                    Divider(), // Divider between items

                    // Option 2: YouTube Video Tutorial
                    ListTile(
                      leading: Icon(Icons.smart_display, color: Color(0xFF51011A)),
                      title: Text(
                        'Video Tutorial',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => YouTubePage()),
                        );
                      },
                    ),
                    Divider(),

                    // Option 3: Account
                    ListTile(
                      leading:
                          Icon(Icons.account_circle, color: Color(0xFF51011A)),
                      title: Text(
                        'Account',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfileScreen()),
                        );
                      },
                    ),
                    Divider(),

                    // Option 4: Call
                    ListTile(
                      leading: Icon(Icons.call, color: Color(0xFF51011A)),
                      title: Text(
                        'Call',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
