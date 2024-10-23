import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class AvailabilitySettingPage extends StatefulWidget {
  @override
  _AvailabilitySettingPageState createState() => _AvailabilitySettingPageState();
}

class _AvailabilitySettingPageState extends State<AvailabilitySettingPage> {
  bool _isAvailable = false;
  final TextEditingController _phoneController = TextEditingController();
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref().child('setting');

  @override
  void initState() {
    super.initState();
    _fetchSettings(); // Fetch initial values
  }

  void _fetchSettings() async {
    final availabilitySnapshot = await _dbRef.child('available').get();
    final phoneSnapshot = await _dbRef.child('phoneNumber').get();

    if (availabilitySnapshot.exists) {
      setState(() {
        _isAvailable = availabilitySnapshot.value as bool;
      });
    }

    if (phoneSnapshot.exists) {
      setState(() {
        _phoneController.text = phoneSnapshot.value as String;
      });
    }
  }

  void _updateAvailability(bool value) {
    _dbRef.child('available').set(value).then((_) {
      setState(() {
        _isAvailable = value;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Availability updated to ${value ? 'available' : 'unavailable'}')),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update availability: $error')),
      );
    });
  }

  void _updatePhoneNumber() {
    String phoneNumber = _phoneController.text.trim();
    if (phoneNumber.isNotEmpty) {
      _dbRef.child('phoneNumber').set(phoneNumber).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Phone number updated to $phoneNumber')),
        );
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update phone number: $error')),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid phone number')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Availability Settings',
          style: TextStyle(color: Colors.white), // Text color set to white
        ),
        backgroundColor: const Color(0xFF51011A), // Maroon color
        iconTheme: const IconThemeData(color: Colors.white), // Icon color set to white
          ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Available', style: TextStyle(fontSize: 18)),
                Switch(
                  value: _isAvailable,
                  onChanged: (value) => _updateAvailability(value),
                ),
              ],
            ),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF51011A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: Size(double.infinity, 48), // Full-width button
              ),
              onPressed: _updatePhoneNumber,
              child: const Text('Update Phone Number', style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
