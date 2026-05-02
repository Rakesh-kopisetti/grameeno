import 'package:demo/events_ui/donor_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Donors'),
      ),
      body: Consumer<DonorData>(
        builder: (context, donorData, child) {
          return ListView.builder(
            itemCount: donorData.donors.length,
            itemBuilder: (context, index) {
              final donor = donorData.donors[index];
              return Card(
                margin: EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(donor.name),
                  subtitle: Text(donor.donation),
                ),
              );
            },
          );
        },
      ),
    );
  }
}