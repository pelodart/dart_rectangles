import 'dart:math' as math;
import 'point.dart';

class Rectangle {
  Point _leftTop;
  Point _rightBottom;

  Rectangle({double x1, double y1, double x2, double y2}) {
    _leftTop = Point(x: x1, y: y1);
    _rightBottom = Point(x: x2, y: y2);
    _normalize();
  }

  Rectangle.origin()
      : _leftTop = Point.origin(),
        _rightBottom = Point.origin() {}

  // getter/setter
  double get X1 => _leftTop.X;
  double get Y1 => _leftTop.Y;
  double get X2 => _rightBottom.X;
  double get Y2 => _rightBottom.Y;

  set X1(double value) {
    _leftTop.X = value;
    _normalize();
  }

  set Y1(double value) {
    _leftTop.Y = value;
    _normalize();
  }

  set X2(double value) {
    _rightBottom.X = value;
    _normalize();
  }

  set Y2(double value) {
    _rightBottom.Y = value;
    _normalize();
  }

  // public interface (getter or methods)
  double get circumference =>
      2 * ((_rightBottom.X - _leftTop.X) + (_leftTop.Y - _rightBottom.Y));

  double get diagonal =>
      math.sqrt(((_rightBottom.X - _leftTop.X) * (_rightBottom.X - _leftTop.X) +
          (_leftTop.Y - _rightBottom.Y) * (_leftTop.Y - _rightBottom.Y)));

  double get area =>
      (_rightBottom.X - _leftTop.X) * (_leftTop.Y - _rightBottom.Y);

  bool get isSquare =>
      (_rightBottom.X - _leftTop.X) == (_leftTop.Y - _rightBottom.Y);

  Point get center => Point(
      x: _leftTop.X + (_rightBottom.X - _leftTop.X) / 2.0,
      y: _rightBottom.Y + (_leftTop.Y - _rightBottom.Y) / 2.0);

  void adjustWidth(double width) {
    _rightBottom.X = _leftTop.X + width;
    _normalize();
  }

  void adjustHeight(double height) {
    _rightBottom.Y = _leftTop.Y - height;
    _normalize();
  }

  void move(double x, double y) {
    _leftTop.move(x, y);
    _rightBottom.move(x, y);
  }

  Rectangle intersection(Rectangle rect) {
    double x1, y1, x2, y2;

    if (_rightBottom.X <= rect._leftTop.X ||
        _leftTop.X >= rect._rightBottom.X ||
        _leftTop.Y <= rect._rightBottom.Y ||
        _rightBottom.Y >= rect._leftTop.Y) {
      return Rectangle();
    }

    if (_leftTop.X < rect._leftTop.X) {
      x1 = rect._leftTop.X;
    } else {
      x1 = _leftTop.X;
    }

    if (_rightBottom.X < rect._rightBottom.X) {
      x2 = _rightBottom.X;
    } else {
      x2 = rect._rightBottom.X;
    }

    if (_leftTop.Y > rect._leftTop.Y) {
      y1 = rect._leftTop.Y;
    } else {
      y1 = _leftTop.Y;
    }

    if (_rightBottom.Y > rect._rightBottom.Y) {
      y2 = _rightBottom.Y;
    } else {
      y2 = rect._rightBottom.Y;
    }

    return Rectangle(x1: x1, y1: y1, x2: x2, y2: y2);
  }

  @override
  String toString() {
    String s1 =
        'Rectangle: (${_leftTop.X},${_leftTop.Y}),(${_rightBottom.X},${_rightBottom.Y})';
    String s2 = "[Area=${area}, Circumference=${circumference}, ";
    String s3 = "Diagonal=${diagonal}, IsSquare=${isSquare}]";
    return '${s1}\n  ${s2}\n  ${s3}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final Rectangle otherRectangle = other;
    return otherRectangle._leftTop == _leftTop &&
        otherRectangle._rightBottom == _rightBottom;
  }

  // private helper method(s)
  void _normalize() {
    if (_leftTop.X > _rightBottom.X) {
      double tmp = _leftTop.X;
      _leftTop.X = _rightBottom.X;
      _rightBottom.X = tmp;
    }

    if (_leftTop.Y < _rightBottom.Y) {
      double tmp = _leftTop.Y;
      _leftTop.Y = _rightBottom.Y;
      _rightBottom.Y = tmp;
    }
  }
}
