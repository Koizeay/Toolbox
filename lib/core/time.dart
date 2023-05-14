String getFormattedTimeFromSeconds(double seconds) {
  return getFormattedTimeFromMilliseconds(seconds * 1000);
}

String getFormattedTimeFromMilliseconds(double milliseconds) {
  Duration duration = Duration(
      milliseconds: milliseconds.toInt());
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitsMinutes = twoDigits(
      duration.inMinutes.remainder(60));
  String twoDigitsSeconds = twoDigits(
      duration.inSeconds.remainder(60));
  String threeDigitsMilliseconds = twoDigits(
      duration.inMilliseconds.remainder(1000));

  if (threeDigitsMilliseconds.length == 2) {
    threeDigitsMilliseconds = "0$threeDigitsMilliseconds";
  }

  threeDigitsMilliseconds = threeDigitsMilliseconds.substring(
      0, threeDigitsMilliseconds.length - 1);

  return "$twoDigitsMinutes:$twoDigitsSeconds:$threeDigitsMilliseconds";
}