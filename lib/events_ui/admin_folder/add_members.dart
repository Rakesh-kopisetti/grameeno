
import 'package:demo/events_ui/committee_member_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddMembersScreen extends StatefulWidget {
  const AddMembersScreen({super.key});

  @override
  State<AddMembersScreen> createState() => _AddMembersScreenState();
}

class _AddMembersScreenState extends State<AddMembersScreen> {
  final TextEditingController _nameController = TextEditingController();

  void _addMember(CommitteeMemberData provider) {
    if (_nameController.text.isNotEmpty) {
      provider.addMember(_nameController.text);
      _nameController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Member Added Successfully')),
      );
    }
  }

  void _removeMember(CommitteeMemberData provider, int index) {
    provider.removeMember(index);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Member Removed Successfully')),
    );
  }

  void _showAddMemberDialog(CommitteeMemberData provider) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Member'),
          content: TextField(
            controller: _nameController,
            decoration: const InputDecoration(hintText: "Enter member's name"),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                _addMember(provider);
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final committeeMemberProvider = Provider.of<CommitteeMemberData>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Committee Members'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Committee Members',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const Divider(thickness: 2),
            Expanded(
              child: _buildMembersList(committeeMemberProvider),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddMemberDialog(committeeMemberProvider),
        backgroundColor: Colors.teal,
        tooltip: 'Add Member',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildMembersList(CommitteeMemberData provider) {
    return ListView.builder(
      itemCount: provider.committeeMembers.length,
      itemBuilder: (context, index) {
        final member = provider.committeeMembers[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          elevation: 2,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.teal,
              child: Text(
                member.isNotEmpty ? member[0].toUpperCase() : '',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text(member, style: const TextStyle(fontWeight: FontWeight.w500)),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
              onPressed: () => showLogoutDialog(context, provider, index),
              tooltip: 'Remove Member',
            ),
          ),
        );
      },
    );
  }

void showLogoutDialog(BuildContext context, CommitteeMemberData provider, int index) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text("Remove Member"),
      content: const Text("Are you sure you want to remove the member?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          ),
          onPressed: () {
            _removeMember(provider, index);
            Navigator.pop(ctx);
          },
          child: const Text("Remove", style: TextStyle(color: Colors.white)),
        ),
      ],
    ),
  );
}

}
///----
