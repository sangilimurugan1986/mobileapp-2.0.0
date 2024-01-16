import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  const months = {
    1: 'Jan',
    2: 'Feb',
    3: 'Mar',
    4: 'Apr',
    5: 'May',
    6: 'Jun',
    7: 'Jul',
    8: 'Aug',
    9: 'Sep',
    10: 'Oct',
    11: 'Nov',
    12: 'Dec',
  };

  return '${date.day} ${months[date.month]} ${date.year}';
}

String formatTime(TimeOfDay time) {
  final hour = time.hour;
  final minute = time.minute;
  final period = time.period;

  final _hour = hour == 0
      ? 12
      : hour > 12
          ? hour - 12
          : hour;

  final _period = period == DayPeriod.am ? 'AM' : 'PM';
  return '$_hour:$minute $_period';
}

DateTime parseDateTime(String dateString) {
  return DateTime.parse(dateString);
}

String formatDateTime(String dateString) {
  final dateTime = parseDateTime(dateString);
  final time = TimeOfDay.fromDateTime(dateTime);

  return '${formatDate(dateTime)} ${formatTime(time)}';
}

String getDateOnly(String sDate) {
  //DateTime dt = DateTime.parse('2020-01-02 03:04:05');
/*  String cdate =
      DateFormat("dd-MM-yyyy").format(DateTime.parse('2020-12-02 03:04:05'));// 21-Apr-2023 01:55 AM*/
  String cdate = DateFormat("dd-MMMM-yyyy hh:mm a").format(DateTime.parse(sDate));

  return cdate;
}

getCurrentDate() {
  return DateFormat('yyyy-MM-dd').format(DateTime.now());
}

String timeFormate(String time) {
  DateTime dt1 = DateTime.parse(time);

  return timeAgoCustom(dt1);
}

String timeAgoCustom(DateTime d) {
  Duration diff = DateTime.now().difference(d);

  if (diff.inDays > 365)
    return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "Yr Ago" : "Yrs Ago"}";
  if (diff.inDays > 30)
    return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "Mon Ago" : "Mons Ago"}";
  if (diff.inDays > 7)
    return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "Wk Ago" : "Wks Ago"}";
  if (diff.inDays > 0) return "${diff.inDays}" + ' Day Ago';
  if (diff.inHours > 0) return "${diff.inHours}" + ' Hour Ago';
  // if (diff.inDays > 0) return "${DateFormat('EEE').format(d)}";
  //if (diff.inHours > 0) return "${DateFormat('jm').format(d)}";
  if (diff.inMinutes > 0)
    return "${diff.inMinutes} ${diff.inMinutes == 1 ? "Min Ago" : "Mins Ago"}";
  return "${diff.inMinutes} Min Ago";
  return "Just Now";
}

/*String timeAgoSinceDate({bool numericDates = true}) {
  DateFormat("dd-MM-yyyy").format(DateTime.parse('2020-12-02 03:04:05'));

  //Duration diff = DateTime.now().difference(d);
  DateTime date = DateTime.now();
  final date2 = DateTime.now().toLocal();
  final difference = date2.difference(date);

  if (difference.inSeconds < 5) {
    return 'Just now';
  } else if (difference.inSeconds <= 60) {
    return '${difference.inSeconds} seconds ago';
  } else if (difference.inMinutes <= 1) {
    return (numericDates) ? '1 minute ago' : 'A minute ago';
  } else if (difference.inMinutes <= 60) {
    return '${difference.inMinutes} minutes ago';
  } else if (difference.inHours <= 1) {
    return (numericDates) ? '1 hour ago' : 'An hour ago';
  } else if (difference.inHours <= 60) {
    return '${difference.inHours} hours ago';
  } else if (difference.inDays <= 1) {
    return (numericDates) ? '1 day ago' : 'Yesterday';
  } else if (difference.inDays <= 6) {
    return '${difference.inDays} days ago';
  } else if ((difference.inDays / 7).ceil() <= 1) {
    return (numericDates) ? '1 week ago' : 'Last week';
  } else if ((difference.inDays / 7).ceil() <= 4) {
    return '${(difference.inDays / 7).ceil()} weeks ago';
  } else if ((difference.inDays / 30).ceil() <= 1) {
    return (numericDates) ? '1 month ago' : 'Last month';
  } else if ((difference.inDays / 30).ceil() <= 30) {
    return '${(difference.inDays / 30).ceil()} months ago';
  } else if ((difference.inDays / 365).ceil() <= 1) {
    return (numericDates) ? '1 year ago' : 'Last year';
  }
  return '${(difference.inDays / 365).floor()} years ago';
}*/
