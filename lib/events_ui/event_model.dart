import 'package:flutter/foundation.dart';

class Event {
  final String? eventName;
  final String? eventDetails;
  final String? eventDate;

  Event({this.eventName, this.eventDetails, this.eventDate});

  Event copyWith({
    String? eventName,
    String? eventDetails,
    String? eventDate,
  }) {
    return Event(
      eventName: eventName ?? this.eventName,
      eventDetails: eventDetails ?? this.eventDetails,
      eventDate: eventDate ?? this.eventDate,
    );
  }
}

// Create a global ValueNotifier
final eventNotifier = ValueNotifier<Event>(Event());