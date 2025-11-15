import 'package:intl/intl.dart';

/// Formats a DateTime object into the 'YYYY-MM-DD' string
/// required by your backend's `RegisterRequest`.
String formatToYyyyMmDd(DateTime date) {
  return DateFormat('yyyy-MM-dd').format(date);
}

/// Formats an ISO 8601 string (like those from OffsetDateTime)
/// into a more readable format for the UI.
///
/// Example: "2025-11-13T16:04:39+01:00" -> "Nov 13, 2025, 4:04 PM"
String formatReadableDateTime(String isoString) {
  try {
    final DateTime dateTime = DateTime.parse(isoString);
    // Format: "MMM d, yyyy, h:mm a" (e.g., "Nov 13, 2025, 4:04 PM")
    return DateFormat.yMd().add_jm().format(dateTime.toLocal());
  } catch (e) {
    print("Error formatting date: $e");
    return "Invalid Date";
  }
}

/// Formats just the time from an ISO 8601 string.
///
/// Example: "2025-11-13T16:04:39+01:00" -> "4:04 PM"
String formatReadableTime(String isoString) {
   try {
    final DateTime dateTime = DateTime.parse(isoString);
    // Format: "h:mm a" (e.g., "4:04 PM")
    return DateFormat.jm().format(dateTime.toLocal());
  } catch (e) {
    print("Error formatting time: $e");
    return "--:--";
  }
}