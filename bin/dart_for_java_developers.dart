import 'dart:math';


void main(List<String> arguments) {
  final circle = Circle(10);
  final square = Square(10);
  final person = Person();
  //Cascade
  final person2 = Person()
    .._sonName = "Mohammed"
    ..age = 10
    ..name = "Ahmed";

  print(circle);
  print(square);
  print(person);
  print(person2);
}

abstract class Shape {
  num get area;
}

class Circle implements Shape {
  int radius;

  Circle(this.radius);

  @override
  num get area => pi * pow(radius, 2);

  @override
  String toString() {
    return "Circle[radius -> $radius]";
  }
}

class Square implements Shape {
  int side;

  Square(this.side);
  @override
  num get area => pow(side, 2);

  @override
  String toString() {
    return 'Square[Side -> $side]';
  }
}

class Person {
  String name;
  int age;
  String? _sonName;

  String get sonName => _sonName ?? 'Mark';

  Person({this.age = 10, this.name = ""});

  @override
  String toString() {
    return 'Person(name=$name, age=$age, sonName=$sonName]';
  }
}
