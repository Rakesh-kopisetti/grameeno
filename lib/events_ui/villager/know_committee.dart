
import 'package:demo/events_ui/committee_member_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KnowCommitteeScreen extends StatelessWidget {
  const KnowCommitteeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final committeeMemberProvider = Provider.of<CommitteeMemberData>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Committee Members'),
        backgroundColor: Colors.indigo,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: committeeMemberProvider.committeeMembers.length,
        itemBuilder: (context, index) {
          final member = committeeMemberProvider.committeeMembers[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.indigo,
                child: Text(
                  member.isNotEmpty ? member[0].toUpperCase() : '',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(member, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            ),
          );
        },
      ),
    );
  }
}
