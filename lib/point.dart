class Point {
  double _x;
  double _y;

  Point({double x, double y}) {
    _x = x;
    _y = y;
  }

  Point.origin()
      : _x = 0,
        _y = 0 {}

  // getter/setter
  double get X => _x;
  double get Y => _y;
  set X(double value) => _x = value;
  set Y(double value) => _y = value;

  // public interface
  void move(double x, double y) {
    _x += x;
    _y += y;
  }

  @override
  String toString() {
    return 'Point: (${X.toStringAsFixed(2)},${Y.toStringAsFixed(2)})';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final Point otherPoint = other;
    return otherPoint._x == _x && otherPoint._y == _y;
  }
}
