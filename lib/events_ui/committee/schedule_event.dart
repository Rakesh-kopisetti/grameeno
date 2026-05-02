import 'package:demo/events_ui/event_model.dart';
import 'package:flutter/material.dart';

class ScheduleEventPage extends StatefulWidget {
  const ScheduleEventPage({Key? key}) : super(key: key);

  @override
  _ScheduleEventPageState createState() => _ScheduleEventPageState();
}

class _ScheduleEventPageState extends State<ScheduleEventPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _eventNameController;
  final _eventDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the controller with the current event name
    _eventNameController = TextEditingController(text: eventNotifier.value.eventName);
    // Add a listener to update the controller when the event name changes
    eventNotifier.addListener(_onEventChanged);
  }

  @override
  void dispose() {
    // Clean up the listener and controllers to prevent memory leaks
    eventNotifier.removeListener(_onEventChanged);
    _eventNameController.dispose();
    _eventDateController.dispose();
    super.dispose();
  }

  void _onEventChanged() {
    // Update the text field with the new event name
    if (mounted) {
      setState(() {
        _eventNameController.text = eventNotifier.value.eventName ?? '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule Event'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _eventNameController,
                decoration: const InputDecoration(labelText: 'Event Name'),
                readOnly: true, // The committee should not edit the event name
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _eventDateController,
                decoration: const InputDecoration(labelText: 'Event Date'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter event date';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Update the event date using the notifier
                    eventNotifier.value = eventNotifier.value.copyWith(
                      eventDate: _eventDateController.text,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Event Scheduled!')),
                    );
                  }
                },
                child: const Text('Schedule'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}