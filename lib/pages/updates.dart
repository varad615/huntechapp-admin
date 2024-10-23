import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class UpdatesPage extends StatefulWidget {
  const UpdatesPage({super.key});

  @override
  _UpdatesPageState createState() => _UpdatesPageState();
}

class _UpdatesPageState extends State<UpdatesPage> {
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref().child('updates');
  final TextEditingController _updateController = TextEditingController();
  final ScrollController _scrollController = ScrollController(); // Scroll controller
  List<Map<String, dynamic>> _updates = [];

  @override
  void initState() {
    super.initState();
    _fetchUpdates(); // Fetch updates when the page loads
  }

  // Fetch the updates from Firebase Realtime Database
  void _fetchUpdates() {
    _dbRef.onValue.listen((event) {
      if (event.snapshot.value != null) {
        final data = Map<String, dynamic>.from(event.snapshot.value as Map<Object?, Object?>);
        setState(() {
          _updates = data.entries.map((entry) {
            final id = entry.key;
            final updateData = Map<String, dynamic>.from(entry.value);
            return {
              'id': id,
              'text': updateData['text'],
              'createdOn': updateData['createdOn'],
            };
          }).toList()
            ..sort((a, b) => DateTime.parse(a['createdOn'])
                .compareTo(DateTime.parse(b['createdOn']))); // Sort by date
        });

        // Scroll to the bottom of the list
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_scrollController.hasClients) {
            _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
          }
        });
      }
    });
  }

  // Add a new update to Firebase Realtime Database
  void _addUpdate(String text) {
    if (text.isNotEmpty) {
      final updateId = DateTime.now().millisecondsSinceEpoch.toString();
      final updateData = {
        'text': text,
        'createdOn': DateTime.now().toString(),
      };

      _dbRef.child(updateId).set(updateData); // Save the update to Firebase
      _updateController.clear(); // Clear the input field
    }
  }

  // Delete an update from Firebase
  void _deleteUpdate(String updateId) {
    _dbRef.child(updateId).remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Updates',
          style: TextStyle(color: Colors.white), // Text color set to white
        ),
        backgroundColor: const Color(0xFF51011A), // Maroon color
        iconTheme: const IconThemeData(color: Colors.white), // Icon color set to white
      ),
      body: Column(
        children: [
          Expanded(
            child: _updates.isEmpty
                ? const Center(child: Text('No updates available.'))
                : ListView.builder(
                    controller: _scrollController, // Attach scroll controller
                    itemCount: _updates.length,
                    itemBuilder: (context, index) {
                      final update = _updates[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        padding: const EdgeInsets.all(10),
                        width: double.infinity, // Make bubble full width
                        decoration: BoxDecoration(
                          color: Colors.grey[300], // Light gray color for the bubbles
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              update['text'],
                              style: const TextStyle(
                                color: Colors.black, // Text color
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Created on: ${update['createdOn']}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () => _deleteUpdate(update['id']), // Delete the update
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _updateController,
                    decoration: InputDecoration(
                      hintText: 'Type an update...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(width: 1),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () => _addUpdate(_updateController.text), // Add update to Firebase
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
