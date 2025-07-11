extension SafeList<T> on List<T>? {
  T? safeElementAt(int index) {
    if (this == null || index < 0 || index >= this!.length) {
      return null;
    }
    return this![index];
  }
}

extension IterableExtension<T> on Iterable<T> {
  Iterable<E> mapWithIndex<E>(E Function(int index, T value) f) {
    return Iterable.generate(length).map((i) => f(i, elementAt(i)));
  }
}
