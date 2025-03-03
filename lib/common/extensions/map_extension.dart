extension MapExtension on Map<String, dynamic> {
  int getKeyPosition(String key) {
    List<String> keys = this.keys.toList();
    return keys.indexOf(key);
  }

  String? getNextKey(String currentKey) {
    List<String> keys = this.keys.toList();
    int currentIndex = keys.indexOf(currentKey);

    // Kiểm tra nếu key tiếp theo tồn tại
    if (currentIndex != -1 && currentIndex < keys.length - 1) {
      return keys[currentIndex + 1];
    }

    return null; // Trả về null nếu không có key tiếp theo
  }

  bool isLastKey(String key) {
    if (isEmpty) {
      return false;
    }

    return keys.last == key;
  }
}
