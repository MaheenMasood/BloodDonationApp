import 'package:flutter/material.dart';
import 'package:my_app/services/auth/auth_services.dart';
import 'package:provider/provider.dart';

import 'Donor_Detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Callback function to update user data
void updateUserInformation(Map<String, dynamic> updatedData) {
  setState(() {
    // Find the index of the user to be updated in the 'users' list
    int userIndex = users.indexWhere((user) => user['name'] == updatedData['name']);

    if (userIndex != -1) {
      // Update the user's information in the 'users' list
      users[userIndex] = updatedData;
    }
  });
}

  // Sign out
  void signOut() {
    // Get auth service
    final authServices = Provider.of<AuthServices>(context, listen: false);
    authServices.signOut();
  }

  String searchQuery = ''; // Declare searchQuery here

  // Define a list of user names and cities
  List<Map<String, dynamic>> users = [
    {
      'name': 'Afshii',
      'city': 'Karachi',
      'addresses': ['123 Husainabad St'],
      'bloodGroups': ['A+'],
      'Date': ['12/June/2023']
    },
    {
      'name': 'Ashii',
      'city': 'Karachi',
      'addresses': ['789 Main Baldia St'],
      'bloodGroups': ['OB+'],
      'Date': ['24/Dec/2023']
    },
    {
      'name': 'Sundas',
      'city': 'Karachi',
      'addresses': ['456  Baldia St'],
      'bloodGroups': ['B+'],
      'Date': ['12/Oct/2023']
    },
    {
      'name': 'Dija',
      'city': 'Karachi',
      'addresses': ['789 Bunsroad St'],
      'bloodGroups': ['O+'],
      'Date': ['8/Oct/2023']
    },
    {
      'name': 'Hamna',
      'city': 'Karachi',
      'addresses': ['800 Nazimabad St'],
      'bloodGroups': ['A+'],
      'Date': ['10/Aug/2023']
    },
    {
      'name': 'Sarah',
      'city': 'Karachi',
      'addresses': ['800 NewK Karachi St'],
      'bloodGroups': ['B+'],
      'Date': ['1/Oct/2023']
    },
    {
      'name': 'Sukaina',
      'city': 'Karachi',
      'addresses': ['800 Pib St'],
      'bloodGroups': ['O+'],
      'Date': ['15/Feb/2023']
    },
    {
      'name': 'Nadia',
      'city': 'Karachi',
      'addresses': ['800 Pib St'],
      'bloodGroups': ['O+'],
      'Date': ['15/Feb/2023']
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Adjust the filteredUsers list to ensure it doesn't exceed the users list
    final filteredUsers = users
        .where((user) =>
            user['name'].toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('All Donors'),
        actions: [
          // Sign out button
          IconButton(
            onPressed: signOut,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Search Users',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {
                // Split user data into name and city
                final userName = filteredUsers[index]['name'];
                final userCity = filteredUsers[index]['city'];
                final lastDonateDate =
                    filteredUsers[index]['Date'] as List<String>;
                final lastDonateDateText =
                    lastDonateDate.join(", "); // Join the date strings

                return UserContainer(
                  userName: userName,
                  userCity: userCity,
                  userAddresses:
                      filteredUsers[index]['addresses'] as List<String>,
                  bloodGroups:
                      filteredUsers[index]['bloodGroups'] as List<String>,
                  lastDonateDate: lastDonateDateText,
                  onSave: (updatedData) {
                    setState(() {
                      // Update the data in the users list
                      final index =
                          users.indexWhere((user) => user['name'] == userName);
                      if (index != -1) {
                        users[index] = updatedData;
                      }
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class UserContainer extends StatefulWidget {
  final String userName;
  final String userCity;
  final List<String> userAddresses;
  final List<String> bloodGroups;
  final String lastDonateDate;

  final void Function(Map<String, dynamic>) onSave;

  UserContainer({
    required this.userName,
    required this.userCity,
    required this.userAddresses,
    required this.bloodGroups,
    required this.lastDonateDate,
    required this.onSave,
  });

  @override
  _UserContainerState createState() => _UserContainerState();
}

class _UserContainerState extends State<UserContainer> {
  String editedUserName = '';
  String editedUserCity = '';
  List<String> editedUserAddresses = [];
  List<String> editedBloodGroups = [];
  String editedLastDonateDate = '';

  @override
  void initState() {
    super.initState();
    editedUserName = widget.userName;
    editedUserCity = widget.userCity;
    editedUserAddresses = List.from(widget.userAddresses);
    editedBloodGroups = List.from(widget.bloodGroups);
    editedLastDonateDate = widget.lastDonateDate;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DonorDetail(
              userName: editedUserName,
              userCity: editedUserCity,
              userAddresses: editedUserAddresses,
              bloodGroups: editedBloodGroups,
              lastDonateDate: editedLastDonateDate,
              onUpdate: (updatedData) {
                setState(() {
                  editedUserName = updatedData['name'];
                  editedUserCity = updatedData['city'];
                  editedUserAddresses = List.from(updatedData['addresses']);
                  editedBloodGroups = List.from(updatedData['bloodGroups']);
                  editedLastDonateDate = updatedData['Date'];
                });
                widget.onSave(updatedData);
              },
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 2),
              blurRadius: 2.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: $editedUserName',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'City: $editedUserCity',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Addresses: ${editedUserAddresses.join(", ")}',
              style: TextStyle(fontSize: 14),
            ),
            Text(
              'Blood Groups: ${editedBloodGroups.join(", ")}',
              style: TextStyle(fontSize: 14),
            ),
            Text(
              'Last Donate Date: $editedLastDonateDate',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
