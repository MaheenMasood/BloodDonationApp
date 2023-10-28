import 'package:flutter/material.dart';

class AddManagerScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  void saveManagerInformation(BuildContext context) {
    final newManager = {
  "Name": nameController.text,
  "Area": areaController.text,
  "Phone": phoneController.text,
};

    Navigator.pop(context, newManager);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Add Manager"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: areaController,
                decoration: InputDecoration(labelText: "Area"),
              ),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(labelText: "Phone"),
              ),
              ElevatedButton(
                onPressed: () {
                  saveManagerInformation(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                child: Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
