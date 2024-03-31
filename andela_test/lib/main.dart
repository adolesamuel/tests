// [11:43 PM] Francis Ocholi
// Write a function in Dart that takes an integer representing a time duration
// in seconds and converts it to a human-readable format in hours, minutes, and seconds.
// For example:
// If the input is 3661, the output should be "1h 1m 1s".
// If the input is 7200, the output should be "2h 0m 0s".
// Please implement the solution without using any external libraries for time conversions.

void main() {
  final result = convertTimeInSecs(3661);
  final result2 = convertTimeInSecs(7200);
  final result3 = convertTimeInSecs(1);

  print(result);
  print(result2);
  print(result3);
}

String convertTimeInSecs(int timeInSecs) {
  const hourFactor = 3600;
  final int hour = timeInSecs ~/ hourFactor;

  int remainder = timeInSecs % hourFactor;

  final minutes = remainder ~/ 60;

  remainder = remainder % 60;

  if (hour == 0 && minutes == 0) {
    return '${remainder}s';
  } else if (hour == 0) {
    return '${minutes}m  ${remainder}s';
  } else {
    return '${hour}h ${minutes}m  ${remainder}s';
  }
}
