import 'package:flutter/material.dart';

class EditDonorDetail extends StatefulWidget {
  final Function(Map<String, dynamic>) onSave; // Callback function
  EditDonorDetail({required this.onSave});

  @override
  _EditDonorDetailState createState() => _EditDonorDetailState();
}

class _EditDonorDetailState extends State<EditDonorDetail> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController lastDonateDateController = TextEditingController();
  String selectedBloodGroup = 'A+'; // Default value
  //String selectedBloodGroup = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Edit Donor Detail'),
      ),
      body: SingleChildScrollView(
        // Wrap your content in SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Full Name:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: fullNameController,
                decoration: InputDecoration(
                  hintText: 'Enter Full Name',
                ),
              ),
              Text(
                'Location:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: locationController,
                decoration: InputDecoration(
                  hintText: 'Enter Location',
                ),
              ),
              Text(
                'Last Donate Date:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: lastDonateDateController,
                decoration: InputDecoration(
                  hintText: 'Enter Last Donate Date',
                ),
              ),
              Text(
                'Blood Group:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              // Radio buttons for Blood Group selection
              Column(
                children: <Widget>[
                  RadioListTile<String>(
                    title: Text('A+'),
                    value: 'A+',
                    groupValue: selectedBloodGroup,
                    onChanged: (value) {
                      setState(() {
                        selectedBloodGroup = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text('B+'),
                    value: 'B+',
                    groupValue: selectedBloodGroup,
                    onChanged: (value) {
                      setState(() {
                        selectedBloodGroup = value!;
                      });
                    },
                  ),
                  // Include radio buttons for other blood groups as well
                  RadioListTile<String>(
                    title: Text('O+'),
                    value: 'O+',
                    groupValue: selectedBloodGroup,
                    onChanged: (value) {
                      setState(() {
                        selectedBloodGroup = value!;
                      });
                    },
                  ),
                  // Include radio buttons for other blood groups as well
                  RadioListTile<String>(
                    title: Text('AB+'),
                    value: 'AB+',
                    groupValue: selectedBloodGroup,
                    onChanged: (value) {
                      setState(() {
                        selectedBloodGroup = value!;
                      });
                    },
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Create a Map to store the updated data
                        Map<String, dynamic> updatedData = {
                          'name': fullNameController.text,
                          'city': locationController.text,
                          'bloodGroups': [selectedBloodGroup],
                          'Date': [lastDonateDateController.text],
                        };
                        // Call the callback to notify the parent screens
                        widget.onSave(updatedData);
                        // Close the EditDonorDetail screen
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors
                            .red, // Set the button's background color to red
                      ),
                      child: Text('Save'),
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
