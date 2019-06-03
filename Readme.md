# Eine Klasse ``Rectangle``

Definieren und implementieren Sie eine Klasse ``Rectangle``, die ein Rechteck im Sinne des kartesischen Koordinatensystems verwaltet. Das Rechteck soll dabei durch zwei Punkte (*x*<sub>1</sub>, *y*<sub>1</sub>) und (*x*<sub>2</sub>, *y*<sub>2</sub>) festgelegt werden, die die linke obere und rechte untere Ecke markieren.

Folgende Anforderungen an die Klasse ``Rectangle`` sind mit geeigneten programmiersprachlichen, objektorientierten Konstrukten der Programmiersprache Dart umzusetzen:

* Bei der Erzeugung eines ``Rectangle``-Objekts mit dem Standard-Konstruktor werden beide Koordinaten auf den Wert (0, 0) gesetzt.

* Bei der Erzeugung eines ``Rectangle``-Objekts mit einem benutzerdefinierten Konstruktor werden die Koordinaten entsprechend der Parameter des Konstruktors gesetzt. Dabei soll für zwei Punkte (*x*<sub>1</sub>, *y*<sub>1</sub>) und (*x*<sub>2</sub>, *y*<sub>2</sub>) im Objekt stets gelten: *x*<sub>1</sub> ≤ *x*<sub>2</sub> und *y*<sub>1</sub> ≥ *y*<sub>2</sub>. Erfüllen die als Parameter übergebenen Koordinaten diese Eigenschaft nicht, so sind im Objekt zwei modifizierte Punkte an Hand der Original-Punkte abzuleiten. Mit dieser Forderung soll erreicht werden, dass die beiden Punkte im Objekt stets die *linke obere* und *rechte untere* Ecke des Rechtecks beschreiben. Die Implementierung der nachfolgend beschriebenen Methoden vereinfacht sich auf diese Weise erheblich!

* Ergänzen Sie die Klasse um *getter*- und *setter*-Methoden zum Lesen und Schreiben der Koordinaten des Rechtecks. Achten Sie darauf, dass beim Ändern einer Koordinate die Regel *x*<sub>1</sub> ≤ *x*<sub>2</sub> und *y*<sub>1</sub> ≥ *y*<sub>2</sub> beibehalten bleibt.

* Schreiben Sie eine Methode ``print``, um die Instanzvariablen eines ``Rectangle``-Objekts in der Konsole ausgeben zu können. Sollten Ihnen bereits Kenntnisse im Umfeld der Vererbung in Dart vertraut sein, dann überschreiben Sie doch die ``toString``-Methode aus der Basisklasse ``Object`` mit derselben Zielsetzung.

* Schreiben Sie eine Methode ``circumference`` zur Berechnung des Umfangs eines Rechtecks.

* Die Methode ``diagonal`` berechnet die Länge der Diagonalen des Rechtecks.

* Schreiben Sie eine Methode ``area`` zur Berechnung der Fläche eines Rechtecks.

* Die Methode ``isSquare`` überprüft, ob das Rechteck ein Quadrat ist oder nicht.

* Schreiben Sie eine Methode ``center``, die den Punkt im Zentrum des Rechtecks berechnet. Definieren Sie eine zweite Klasse ``Point``, die von der ``center``-Methode als Rückgabetyp verwendet wird.

* Schreiben Sie eine Methode ``adjustWidth``, die die Breite eines Rechtecks ändert: *x*<sub>2</sub> = *x*<sub>1</sub> + *width*.

   Beispiel: Für ein Rechteck mit den Koordinaten (1, 1) und (4, 5) besitzt nach dem Aufruf

   ``AdjustWidth(10);``

   die Koordinate *x*<sub>2</sub> den Wert 11.

* Schreiben Sie eine Methode ``adjustHeight``, die die Höhe eines Rechtecks ändert:

   *y*<sub>2</sub> = *y*<sub>1</sub> - *height*.

* Schreiben Sie eine Methode ``intersection``, die ein zweites ``Rectangle``-Objekt als Parameter übergeben bekommt und dasjenige Rechteck berechnet, das die beiden Rechtecke gemeinsam haben. Das Resultat-Rechteck ist als Rückgabewert der ``intersection``-Methode zurückzuliefern.

   Beispiel:

   ```dart
   Rectangle rect1 = Rectangle(x1: 1, y1: 4, x2: 4, y2: 1);
   Rectangle rect2 = Rectangle(x1: 2, y1: 5, x2: 6, y2: 2);
   Rectangle rect = rect1.intersection(rect2);
   ```

   liefert ein Rechtecht mit den Eckpunkten (2, 4) und (4, 2) zurück.

* Schreiben Sie eine Methode ``move``, die ein Rechteck in *x*- und/oder *y*-Richtung verschieben kann:

   Beispiel:

   ```dart
   Rectangle rect = Rectangle(x1: 1, y1: 1, x2: 4, y2: 5);
   rect.move(3, 6);
   ```

   Das Rechteck wird um 3 in *x*- und 6 in *y*-Richtung verschoben.

   Testen Sie die geforderte Funktionalität durch entsprechende Testfunktionen im Hauptprogramm.

## Test

Testen Sie Ihre Implementierung mit einem möglichst umfangreichen Testrahmen. Das nachfolgende Code-Fragment soll eine Anregung darstellen:

**Testrahmen**:

```dart
import 'package:rectangles/point.dart';
import 'package:rectangles/rectangle.dart';
import 'package:sprintf/sprintf.dart';

void main() {
  test01_ctors();
  test02_methods();
  test03_center();
  test04_adjust();
  test05_move();
  test06_intersection();
  test07_readme();
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
  print(sprintf('Circumference: %g', [rect.circumference]));
  print(sprintf('Diagonal:      %g', [rect.diagonal]));
  print(sprintf('Area:          %g', [rect.area]));
  String s = rect.isSquare ? 'true' : 'false';
  print(sprintf('IsSquare:      %s', [s]));
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

void test06_intersection() {
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

void test07_readme() {
  Rectangle rect1 = Rectangle(x1: 1, y1: 4, x2: 4, y2: 1);
  Rectangle rect2 = Rectangle(x1: 2, y1: 5, x2: 6, y2: 2);
  Rectangle rect = rect1.intersection(rect2);
  print(rect);
  Rectangle rect0 = Rectangle(x1: 1, y1: 1, x2: 4, y2: 5);
  rect0.move(3, 6);
}
```

**Ausgabe**:

```dart
Rectangle: (0.0,0.0),(0.0,0.0)
  [Area=0.0, Circumference=0.0, 
  Diagonal=0.0, IsSquare=true]

Rectangle: (3.0,5.0),(5.0,3.0)
  [Area=4.0, Circumference=8.0, 
  Diagonal=2.8284271247461903, IsSquare=true]
Rectangle: (3.0,3.0),(5.0,1.0)
  [Area=4.0, Circumference=8.0, 
  Diagonal=2.8284271247461903, IsSquare=true]
Rectangle: (1.0,3.0),(3.0,1.0)
  [Area=4.0, Circumference=8.0, 
  Diagonal=2.8284271247461903, IsSquare=true]

Rectangle: (1.0,5.0),(3.0,3.0)
  [Area=4.0, Circumference=8.0, 
  Diagonal=2.8284271247461903, IsSquare=true]

Rectangle: (3.0,10.0),(9.0,4.0)
  [Area=36.0, Circumference=24.0, 
  Diagonal=8.48528137423857, IsSquare=true]

Circumference: 24
Diagonal:      8.48528
Area:          36
IsSquare:      true

Rectangle: (1.0,3.0),(3.0,1.0)
  [Area=4.0, Circumference=8.0, 
  Diagonal=2.8284271247461903, IsSquare=true]

Center: Point: (2.0,2.0)
Rectangle: (1.0,4.0),(4.0,1.0)
  [Area=9.0, Circumference=12.0, 
  Diagonal=4.242640687119285, IsSquare=true]

Center: Point: (2.5,2.5)

Rectangle: (1.0,3.0),(3.0,1.0)
  [Area=4.0, Circumference=8.0, 
  Diagonal=2.8284271247461903, IsSquare=true]

Rectangle: (1.0,3.0),(4.0,1.0)
  [Area=6.0, Circumference=10.0, 
  Diagonal=3.605551275463989, IsSquare=false]
Rectangle: (0.0,3.0),(1.0,1.0)
  [Area=2.0, Circumference=6.0, 
  Diagonal=2.23606797749979, IsSquare=false]
Rectangle: (0.0,3.0),(1.0,0.0)
  [Area=3.0, Circumference=8.0, 
  Diagonal=3.1622776601683795, IsSquare=false]
Rectangle: (0.0,4.0),(1.0,3.0)
  [Area=1.0, Circumference=4.0, 
  Diagonal=1.4142135623730951, IsSquare=true]

Rectangle: (1.0,5.0),(4.0,1.0)
  [Area=12.0, Circumference=14.0, 
  Diagonal=5.0, IsSquare=false]

Rectangle: (6.0,0.0),(9.0,-4.0)
  [Area=12.0, Circumference=14.0, 
  Diagonal=5.0, IsSquare=false]

Rectangle: (4.0,8.0),(8.0,6.0)
  [Area=8.0, Circumference=12.0, 
  Diagonal=4.47213595499958, IsSquare=false]
Rectangle: (7.0,8.0),(9.0,5.0)
  [Area=6.0, Circumference=10.0, 
  Diagonal=3.605551275463989, IsSquare=false]
Rectangle: (7.0,9.0),(9.0,4.0)
  [Area=10.0, Circumference=14.0, 
  Diagonal=5.385164807134504, IsSquare=false]

Rectangle: (6.0,7.0),(9.0,5.0)
  [Area=6.0, Circumference=10.0, 
  Diagonal=3.605551275463989, IsSquare=false]
Rectangle: (2.0,4.0),(4.0,2.0)
  [Area=4.0, Circumference=8.0, 
  Diagonal=2.8284271247461903, IsSquare=true]
```
