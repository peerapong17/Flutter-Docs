class StatefulProvider {
  int _count = 0;

  int get count => _count;

  set count(int count) {
    _count = count;
  }
}
