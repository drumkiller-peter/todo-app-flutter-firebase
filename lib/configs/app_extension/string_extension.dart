extension StringExtension on String {
  String removeHyphens() {
    return replaceAll("-", "");
  }
}
