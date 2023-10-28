import 'package:flutter/cupertino.dart';

import 'Donor_Detail.dart';

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  String userName = 'John';
  String userCity = 'New York';
  List<String> userAddresses = ['Address 1', 'Address 2'];
  List<String> bloodGroups = ['A+', 'B-'];
  String lastDonateDate = '2023-01-15';

  @override
  Widget build(BuildContext context) {
    return DonorDetail(
      userName: userName,
      userCity: userCity,
      userAddresses: userAddresses,
      bloodGroups: bloodGroups,
      lastDonateDate: lastDonateDate,
      onUpdate: (updatedData) {
        // Handle the updated data here and set the state.
        setState(() {
          userName = updatedData['name'];
          userCity = updatedData['city'];
          bloodGroups = updatedData['bloodGroups'];
          lastDonateDate = updatedData['Date'];
          userAddresses = updatedData['addresses'];
        });
      },
    );
  }
}