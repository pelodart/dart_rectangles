import 'dart:math' as math;
import 'point.dart';

class Rectangle {
  double _x1;
  double _y1;
  double _x2;
  double _y2;

  Rectangle({double x1, double y1, double x2, double y2}) {
    _x1 = x1;
    _y1 = y1;
    _x2 = x2;
    _y2 = y2;
    _normalize();
  }

  Rectangle.origin()
      : _x1 = 0,
        _y1 = 0,
        _x2 = 0,
        _y2 = 0 {}

  // getter/setter
  double get X1 => _x1;
  double get Y1 => _y1;
  double get X2 => _x2;
  double get Y2 => _y2;

  set X1(double value) {
    _x1 = value;
    _normalize();
  }

  set Y1(double value) {
    _y1 = value;
    _normalize();
  }

  set X2(double value) {
    _x2 = value;
    _normalize();
  }

  set Y2(double value) {
    _y2 = value;
    _normalize();
  }

  // public interface (getter or methods)
  double get circumference => 2 * ((_x2 - _x1) + (_y1 - _y2));

  double get diagonal =>
      math.sqrt(((_x2 - _x1) * (_x2 - _x1) + (_y1 - _y2) * (_y1 - _y2)));

  double get area => (_x2 - _x1) * (_y1 - _y2);

  bool get isSquare => (_x2 - _x1) == (_y1 - _y2);

  Point get center =>
      Point(x: _x1 + (_x2 - _x1) / 2.0, y: _y2 + (_y1 - _y2) / 2.0);

  void adjustWidth(double width) {
    _x2 = _x1 + width;
    _normalize();
  }

  void adjustHeight(double height) {
    _y2 = _y1 - height;
    _normalize();
  }

  void move(double x, double y) {
    _x1 += x;
    _y1 += y;
    _x2 += x;
    _y2 += y;
  }

  Rectangle intersection(Rectangle rect) {
    double x1, y1, x2, y2;

    if (_x2 <= rect._x1 ||
        _x1 >= rect._x2 ||
        _y1 <= rect._y2 ||
        _y2 >= rect._y1) {
      return Rectangle.origin();
    }

    if (_x1 < rect._x1) {
      x1 = rect._x1;
    } else {
      x1 = _x1;
    }

    if (_x2 < rect._x2) {
      x2 = _x2;
    } else {
      x2 = rect._x2;
    }

    if (_y1 > rect._y1) {
      y1 = rect._y1;
    } else {
      y1 = _y1;
    }

    if (_y2 > rect._y2) {
      y2 = _y2;
    } else {
      y2 = rect._y2;
    }

    return Rectangle(x1: x1, y1: y1, x2: x2, y2: y2);
  }

  @override
  String toString() {
    String s1 = 'Rectangle: (${X1.toStringAsFixed(2)},${Y1.toStringAsFixed(2)}),(${X2.toStringAsFixed(2)},${Y2.toStringAsFixed(2)})';
    String s2 = "[Area=${area}, Circumference=${circumference.toStringAsFixed(2)}, ";
    String s3 = "Diagonal=${diagonal.toStringAsFixed(2)}, IsSquare=${isSquare}]";
    return '${s1}\n  ${s2}\n  ${s3}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final Rectangle otherRectangle = other;
    return otherRectangle._x1 == _x1 &&
        otherRectangle._y1 == _y1 &&
        otherRectangle._x2 == _x2 &&
        otherRectangle._y2 == _y2;
  }

  // private helper methods
  void _normalize() {
    if (_x1 > _x2) {
      double tmp = _x1;
      _x1 = _x2;
      _x2 = tmp;
    }

    if (_y1 < _y2) {
      double tmp = _y1;
      _y1 = _y2;
      _y2 = tmp;
    }
  }
}
