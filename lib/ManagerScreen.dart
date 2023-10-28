import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AddManager.dart';
import 'services/auth/auth_services.dart';

class ManagerScreen extends StatefulWidget {
  @override
  _ManagerScreenState createState() => _ManagerScreenState();
}

class _ManagerScreenState extends State<ManagerScreen> {
  List<Map<String, String>> managers = [
     {
      "Name": "John Doe",
      "Area": "Karachi",
      "Phone": "123-456-7890",
    },
    {
      "Name": "Jane Smith",
      "Area": "Lahore",
      "Phone": "987-654-3210",
    },
  ];

  void _addManager(Map<String, String> newManager) {
    setState(() {
      managers.add(newManager);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Manager Screen"),
        actions: [
          // Sign out button
          IconButton(
            onPressed: () {
              final authServices = Provider.of<AuthServices>(context, listen: false);
              authServices.signOut();
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (int i = 0; i < managers.length; i++)
              _buildManagerRow(managers[i]),
            SizedBox(height: 10.0), // Add some spacing
            // Add a single "+" icon for adding a manager
            IconButton(
              icon: Icon(Icons.add, size: 25),
              onPressed: () {
                _navigateToAddManagerScreen(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToAddManagerScreen(BuildContext context) async {
    final newManager = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddManagerScreen(),
      ),
    );
    if (newManager != null) {
      _addManager(newManager);
    }
  }

 Widget _buildManagerRow(Map<String, String?> manager) {
  return Column(
    children: [
      _buildDetailRow("Name", manager["Name"] ?? ""),
      _buildDetailRow("Area", manager["Area"] ?? ""),
      _buildDetailRow("Phone", manager["Phone"] ?? ""),
      SizedBox(height: 10.0),

    ElevatedButton(
        onPressed: () {
          // Implement the action you want when the "View" button is pressed.
          // You can navigate to a detailed view of the manager's information here.
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.red, // Set the button's background color to red
        ),
        child: Text("View"),
      ),
    ],
  );
}

  Widget _buildDetailRow(String title, String content) {
    return Row(
      children: [
        Text(
          title + ":",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 8.0),
        Text(
          content,
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
