
import 'package:demo/events_ui/event_model.dart';
import 'package:flutter/material.dart';

class AnnounceEventPage extends StatefulWidget {
  const AnnounceEventPage({super.key});

  @override
  _AnnounceEventPageState createState() => _AnnounceEventPageState();
}

class _AnnounceEventPageState extends State<AnnounceEventPage> {
  final _formKey = GlobalKey<FormState>();
  final _eventNameController = TextEditingController();
  final _eventDetailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Announce Event'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _eventNameController,
                
                decoration: InputDecoration(
                  labelText: 'Event Name',
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10)
                  ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black54),
                        borderRadius: BorderRadius.circular(10)
                    ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter event name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _eventDetailsController,
                // decoration: const InputDecoration(labelText: 'Event Details'),
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Event Details',
                   alignLabelWithHint: true,
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10)
                  ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black54),
                        borderRadius: BorderRadius.circular(10)
                    ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter event details';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    eventNotifier.value = eventNotifier.value.copyWith(
                      eventName: _eventNameController.text,
                      eventDetails: _eventDetailsController.text,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Event Announced!')),
                    );
                  }
                },
                child: const Text('Announce'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
