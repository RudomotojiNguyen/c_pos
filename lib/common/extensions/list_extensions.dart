extension ListUtils<T> on List<T> {
  num sumBy(num Function(T element) f) {
    num sum = 0;
    for (final item in this) {
      sum += f(item);
    }
    return sum;
  }
}
