import 'package:rectangles/point.dart';
import 'package:rectangles/rectangle.dart';

void main() {
  test01_ctors();
  test02_methods();
  test03_center();
  test04_adjust();
  test05_move();
  test06_equals();
  test07_intersection();
  test08_readme();
}

void test01_ctors() {
  var rect1 = Rectangle.origin();
  print(rect1.toString());
  var rect2 = Rectangle(x1: 3, y1: 3, x2: 5, y2: 5);
  print(rect2.toString());
  var rect3 = Rectangle(x1: 3, y1: 3, x2: 5, y2: 1);
  print(rect3.toString());
  var rect4 = Rectangle(x1: 3, y1: 3, x2: 1, y2: 1);
  print(rect4.toString());
  var rect5 = Rectangle(x1: 3, y1: 3, x2: 1, y2: 5);
  print(rect5.toString());
}

void test02_methods() {
  Rectangle rect = Rectangle(x1: 3, y1: 4, x2: 9, y2: 10);
  print(rect.toString());
  print('Circumference: ${rect.circumference.toStringAsFixed(2)}');
  print('Diagonal:      ${rect.diagonal.toStringAsFixed(2)}');
  print('Area:          ${rect.area.toStringAsFixed(2)}');
  String s = rect.isSquare ? 'true' : 'false';
  print('IsSquare:      ${s}');
}

void test03_center() {
  Rectangle rect1 = Rectangle(x1: 1, y1: 3, x2: 3, y2: 1);
  print(rect1);
  Point p1 = rect1.center;
  print('Center: ${p1.toString()}');
  Rectangle rect2 = Rectangle(x1: 1, y1: 4, x2: 4, y2: 1);
  print(rect2);
  Point p2 = rect2.center;
  print('Center: ${p2.toString()}');
}

void test04_adjust() {
  Rectangle rect = Rectangle(x1: 3, y1: 3, x2: 1, y2: 1);
  print(rect);
  rect.adjustWidth(3);
  print(rect);
  rect.adjustWidth(-1);
  print(rect);
  rect.adjustHeight(3);
  print(rect);
  rect.adjustHeight(-1);
  print(rect);
}

void test05_move() {
  Rectangle rect = Rectangle(x1: 1, y1: 5, x2: 4, y2: 1);
  print(rect);
  rect.move(5, -5);
  print(rect);
}

void test06_equals() {
  Rectangle rect1 = Rectangle(x1: 1, y1: 2, x2: 3, y2: 4);
  Rectangle rect2 = Rectangle(x1: 1, y1: 2, x2: 3, y2: 4);
  print(rect1 == rect1);
  print(rect1 == rect2);
  rect1.move(1, 0);
  print(rect1 == rect2);
  rect1.move(-1, 0);
  print(rect1 == rect2);
}

void test07_intersection() {
  Rectangle rect1 = Rectangle(x1: 4, y1: 8, x2: 9, y2: 5);
  Rectangle rect2 = Rectangle(x1: 2, y1: 10, x2: 8, y2: 6);
  Rectangle rect = rect1.intersection(rect2);
  print(rect);
  Rectangle rect3 = Rectangle(x1: 7, y1: 9, x2: 9, y2: 4);
  rect = rect1.intersection(rect3);
  print(rect);
  rect = rect3.intersection(rect3);
  print(rect);
  Rectangle rect4 = Rectangle(x1: 6, y1: 7, x2: 10, y2: 5);
  rect = rect1.intersection(rect4);
  print(rect);
}

void test08_readme() {
  Rectangle rect1 = Rectangle(x1: 1, y1: 4, x2: 4, y2: 1);
  Rectangle rect2 = Rectangle(x1: 2, y1: 5, x2: 6, y2: 2);
  Rectangle rect = rect1.intersection(rect2);
  print(rect);
  Rectangle rect0 = Rectangle(x1: 1, y1: 1, x2: 4, y2: 5);
  rect0.move(3, 6);
}
