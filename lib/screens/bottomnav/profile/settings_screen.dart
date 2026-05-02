import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false;
  String selectedLanguage = "English";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text("Dark Mode"),
            value: isDarkMode,
            onChanged: (value) {
              setState(() {
                isDarkMode = value;
              });
            },
          ),
          ListTile(
            title: const Text("Select Language"),
            subtitle: Text(selectedLanguage),
            trailing: const Icon(Icons.language),
            onTap: () {
              showDialog(
                context: context,
                builder: (ctx) {
                  return AlertDialog(
                    title: const Text("Choose Language"),
                    content: DropdownButton<String>(
                      value: selectedLanguage,
                      items: const [
                        DropdownMenuItem(value: "English", child: Text("English")),
                        DropdownMenuItem(value: "తెలుగు", child: Text("తెలుగు")),
                        DropdownMenuItem(value: "Hindi", child: Text("हिंदी")),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedLanguage = value!;
                          Navigator.of(ctx).pop();
                        });
                      },
                    ),
                  );
                },
              );
            },
          ),
          const Divider(),
          const ListTile(
            title: Text("App Version"),
            subtitle: Text("1.0.0"),
            trailing: Icon(Icons.info_outline),
          ),
        ],
      ),
    );
  }
}
