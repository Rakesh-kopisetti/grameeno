import 'package:demo/events_ui/donor_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ManageDonors extends StatefulWidget {
  @override
  _ManageDonorsState createState() => _ManageDonorsState();
}

class _ManageDonorsState extends State<ManageDonors> {
  final _formKey = GlobalKey<FormState>();
  String _donorName = '';
  String _donationDetails = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Donors'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Donor Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter donor name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _donorName = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Donation Details'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter donation details';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _donationDetails = value!;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        Provider.of<DonorData>(context, listen: false).addDonor(
                          Donor(name: _donorName, donation: _donationDetails),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Donor added successfully')),
                        );
                        _formKey.currentState!.reset();
                      }
                    },
                    child: Text('Add Donor'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Consumer<DonorData>(
                builder: (context, donorData, child) {
                  return ListView.builder(
                    itemCount: donorData.donors.length,
                    itemBuilder: (context, index) {
                      final donor = donorData.donors[index];
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                          title: Text(donor.name),
                          subtitle: Text(donor.donation),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}