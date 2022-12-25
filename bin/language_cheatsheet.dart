import 'dart:developer';
import 'dart:html';

void main(List<String> args) {
  final names = <String>[];
  final namesMap = {1: 'Ahmed', 2: 'Mohammed', 3: 'Hassan'};
  names.add("Ahmed");
  names.add("Mohammed");
  names.add("Hassan");

  print(joinWithCommas(1));
  print(joinWithCommas(1, 2, 3));
  print(joinWithCommas(1, 2, 3, 4));

  final myClass = MyClass();
  myClass.addValue(10);
  myClass.addValue(20);

  print(myClass.count);

  names.skip(1).take(2).forEach(print);
  names.map(times).forEach(print);
  print(namesMap);

  sumUpToFive(10);

  printName("Hassan", "Mohammed", middelName: "Salah");
}

String times(String name) {
  final length = name.length;
  return name * length;
}

class BigObject {
  int anInt = 0;
  String aString = '';
  List<double> aList = [];
  bool _done = false;

  void allDone() {
    _done = true;
  }
}

//Cascade
BigObject fillBigObject(BigObject obj) {
  return obj
    ..aList = [3.0]
    ..anInt = 1
    ..aString = 'String!'
    ..allDone();
}

//Getter and Setter
class MyClass {
  int _aProperty = 0; //private property

  int get aProperty => _aProperty;

  final List<int> _values = <int>[];

  void addValue(int value) {
    _values.add(value);
  }

  int get count {
    return _values.length;
  }

  set setProperty(int value) {
    if (value > 0) _aProperty = value;
  }
}

class InvalidPriceException {}

class ShoppingCart {
  List<double> _prices = [];
  double get total {
    return _prices.fold(0, (previousValue, element) => previousValue + element);
  }

  set prices(List<double> prices) {
    bool hasNegativeNumbers = prices.any((element) => element < 0);
    if (hasNegativeNumbers) throw InvalidPriceException();

    _prices = prices;
  }
}

// Optional positional paramaters

//Positional parameters
int sum(int a, int b, int c) {
  return a + b + c;
}

// Optional positional paramaters
// Optional positional paramaters are always last in a function's paramaters.
//The default value is null unleass you provide another default value.
int sumUpToFive(int a, [int? b, int? c, int? d, int? e]) {
  int sum = 0;
  if (b != null) sum + b;
  if (c != null) sum + c;
  if (d != null) sum + d;
  if (e != null) sum + e;

  return sum;
}

String joinWithCommas(int a, [int? b, int? c, int? d, int? e]) {
  String value = "";

  value += "$a";

  if (b != null) value += ', $b';
  if (c != null) value += ', $c';
  if (d != null) value += ', $d';
  if (e != null) value += ', $e';
  return value;
}

//Named parameters
// Named parameters are optional unless they’re explicitly marked as required.
// A function can’t have both optional positional and named parameters.
void printName(String firstName, String lastName, {String? middelName}) {
  print('$firstName ${middelName ?? ''} $lastName');
}

class MyDataObject {
  final int anInt;
  final String aString;
  final double aDouble;

  MyDataObject({
    this.anInt = 1,
    this.aString = 'Old!',
    this.aDouble = 2.0,
  });

  // Add your copyWith method here:
  MyDataObject copyWith({int? newInt, String? newString, double? newDouble}) {
    return MyDataObject(
        anInt: newInt ?? 1,
        aDouble: newDouble ?? 2.0,
        aString: newString ?? 'Old!');
  }
}

// Exceptions
// Dart code can throw and catch exceptions.
//In contrast to Java, all of Dart’s exceptions are unchecked exceptions. Methods don’t declare which exceptions they might throw, and you aren’t required to catch any exceptions.
// Dart provides Exception and Error types, but you’re allowed to throw any non-null object:
/*
try {
  breedMoreLlamas();
} on OutOfLlamasException { //Use the on keyword to filter for specific exceptions by type
  // A specific exception
  buyMoreLlamas();
} on Exception catch (e) { //catch keyword to get a reference to the exception object
  // Anything else that is an exception
  print('Unknown exception: $e');
} catch (e) {
  // No specified type, handles all
  print('Something really unknown: $e');
} finally{ //use finally keyword even if an exception is thrown.
  clean();
}
*/

typedef VoidFunction = void Function();

class ExceptionWithMessage {
  final String message;
  const ExceptionWithMessage(this.message);
}

// Call logException to log an exception, and doneLogging when finished.
abstract class Logger {
  void logException(Type t, [String? msg]);
  void doneLogging();
}

void tryFunction(VoidFunction untrustworthy, Logger logger) {
  // Invoking this method might cause an exception. Catch and handle
  // them using try-on-catch-finally.
  try {
    untrustworthy();
  } on ExceptionWithMessage catch (e) {
    logger.logException(e.runtimeType, e.message);
  } on Exception catch (e) {
    logger.logException(e.runtimeType);
  } catch (e) {
    rethrow;
  } finally {
    logger.doneLogging();
  }
}

//using this in a constructor
class MyColor {
  int red;
  int green;
  int blue;

  // MyColor(this.red, this.green, this.blue);

  // MyColor({required this.red, required this.green, required this.blue});

  MyColor([this.blue = 0, this.green = 0, this.red = 0]);
}

// Initializer lists
// Sometimes when you implement a constructor, you need to do some setup before the constructor body executes.'

class FirstTwoLetters {
  final String letterOne;
  final String letterTwo;

  // Create a constructor with an initializer list here:
  FirstTwoLetters(String word)
      : assert(word.length >= 2),
        letterOne = word[0],
        letterTwo = word[1];
}

//Named constructors
// To allow classes to have multiple constructors, Dart supports named constructors:
class Point {
  double x, y;

  Point(this.x, this.y);

//Named constructor
  Point.origin()
      : x = 0,
        y = 0;
}

final origin = Point.origin();
final point = Point(10, 20);

class Color {
  int red;
  int green;
  int blue;

  Color(this.red, this.green, this.blue);

  // Color.black()
  //     : red = 0,
  //       blue = 0,
  //       green = 0;

  Color.black() : this(0, 0, 0);
}

//Factory constructor
//Dart supports factory constructors, which can return subtypes or even null.
//To create a factory constructor, use the factory keyword:
class Shape {
  Shape();

  factory Shape.from(String type) {
    if (type == 'square') Square();
    if (type == 'circle') Circle();

    throw ArgumentError('Unrecognized $type');
  }
}

class Square extends Shape {}

class Circle extends Shape {}

class IntegerHolder {
  IntegerHolder();

  // Implement this factory constructor.
  factory IntegerHolder.fromList(List<int> list) {
    if (list.length == 1) return IntegerSingle(list[0]);
    if (list.length == 2) return IntegerDouble(list[0], list[1]);
    if (list.length == 3) return IntegerTriple(list[0], list[1], list[2]);
    throw Error();
  }
}

class IntegerSingle extends IntegerHolder {
  final int a;
  IntegerSingle(this.a);
}

class IntegerDouble extends IntegerHolder {
  final int a;
  final int b;
  IntegerDouble(this.a, this.b);
}

class IntegerTriple extends IntegerHolder {
  final int a;
  final int b;
  final int c;
  IntegerTriple(this.a, this.b, this.c);
}

//Const constructor
// If your class produces objects that never change, you can make these objects compile-time constants.
// To do this, define a const constructor and make sure that all instance variables are final.
class ImmutablePoint {
  static const ImmutablePoint origin = ImmutablePoint(0, 0);

  final int x;
  final int y;

  const ImmutablePoint(this.x, this.y);
}

final originPoint = ImmutablePoint.origin;
var point1 = ImmutablePoint(10, 10);

class Recipe {
  final List<String> ingredients;
  final int calories;
  final double milligramsOfSodium;

  const Recipe(this.ingredients, this.calories, this.milligramsOfSodium);
}
