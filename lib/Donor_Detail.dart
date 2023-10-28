import 'package:flutter/material.dart';

import 'Edit_Donor_Detail.dart';
import 'ManagerLogInPage.dart';

class DonorDetail extends StatelessWidget {
  final String userName;
  final String userCity;
  final List<String> userAddresses;
  final List<String> bloodGroups;
  final String lastDonateDate;
  final Function(Map<String, dynamic>) onUpdate;
  
  DonorDetail({
    required this.userName,
    required this.userCity,
    required this.userAddresses,
    required this.bloodGroups,
    required this.lastDonateDate,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    List<String> displayedAddresses =
        userAddresses.isEmpty ? ['No address'] : userAddresses;
    List<String> displayedBloodGroups =
        bloodGroups.isEmpty ? ['No blood group'] : bloodGroups;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Donor Detail'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        'Name',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        userName,
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'City',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        userCity,
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    ),
                    Text(
                      'Addresses:',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: displayedAddresses.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            ' - ${displayedAddresses[index]}',
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                        );
                      },
                    ),
                    Text(
                      'Blood Groups:',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: displayedBloodGroups.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            ' - ${displayedBloodGroups[index]}',
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              final updatedData = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditDonorDetail(
                                    onSave: (updatedData) {
                                       onUpdate(updatedData); // Call the onUpdate callback with the updated data
                                    },
                                  ),
                                ),
                              );
                              if (updatedData != null) {
                                // Call the onSave callback to update the data in the parent widget (HomePage)
                                onUpdate(updatedData);
                               // widget.onUpdate(updatedData);
                                // Close the EditDonorDetail screen
                                Navigator.pop(context);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                            ),
                            child: Text('Edit'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Center(
                // Wrap the ElevatedButton with Center widget
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to the Manager screen when the "Add Manager" button is pressed.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ManagerLogInPage(
                            onTap:
                                () {}), // Replace with the actual Manager screen widget
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary:
                        Colors.green, // You can choose the color you prefer
                  ),
                  child: Text('Add By Manager'),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
