import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

fontSize(double size, {double min = 10, double max = 22}) {
  if (size < min) {
    return min;
  } else if (size > max) {
    return max;
  }
  return size;
}

String getHourFromTimeStamp(Timestamp timestamp) {
  var date =
      DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);
  return DateFormat.Hm().format(date);
}
