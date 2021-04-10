extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${this.substring(1)}';
  }

  String addZero() {
    if (this.length == 1) {
      return '#00${this}';
    } else if (this.length == 2) {
      return '#0${this}';
    } else if (this.length == 3) {
      return '#${this}';
    } else {
      return '#${this}';
    }
  }
}
