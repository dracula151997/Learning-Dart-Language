void main(List<String> args) {
  //Reading elements
  // Using for-loop
  const iterable = ['Salad', 'Popcorn', 'Toast'];
  for (final element in iterable) {
    print(element);
  }

  //using first() and last()
  // Using first or last on an empty Iterable results in a StateError.
  print('first element: ${iterable.first}');
  print('last element: ${iterable.last}');

  //using firstWhere(condition)

  //Simple expression
  String element = iterable.firstWhere((element) => element.length > 4,
      orElse: () => 'None');
  print('first element which its length is greater than 4: $element');

  //function block:
  String element2 = iterable.firstWhere((item) {
    return item.length > 4;
  });

  //function reference
  String element3 = iterable.firstWhere(predicate);

  //orElse function in case no value is found
  String element4 = iterable.firstWhere((element) => element.length > 4,
      orElse: () => 'None');

  /**
       * There is no right or wrong way. Use the way that works best for you, and that makes your code easier to read and understand.
       */

  //Checking condition
  //When working with Iterable, sometimes you need to verify that all the elements of a collection satisfy some condition.
  //dont use for-in loop (bad practise)
  //best practise -> use every() method
  //Using the every() method results in code that is more readable, compact, and less error-prone.
  print("every() method: ${iterable.every((element) => element.isNotEmpty)}");

//any() method: verifies that at least one element contains the character a.
//every() method: verifies that all elements have a length equal to or greater than 5.
  if (iterable.any((element) => element.contains('a'))) {
    print('At least one item contains "a"');
  }

  if (iterable.every((element) => element.length >= 5)) {
    print('All items have length >= 5');
  }

  //Filtering
  //using where():  is used to find all numbers that are even
  var evenNumbers = [1, -2, 3, 42].where((element) => element.isEven);
  print("Even numbers = $evenNumbers");

  if (evenNumbers.any((element) => element.isNegative)) {
    print('evenNumbers contains negative numbers.');
  }

  var largeNumbers = evenNumbers.where((element) => element > 1000);
  if (largeNumbers.isEmpty) print('largeNumbers is empty!');

  //using takeWhile() and skipWhile(): can also help you filter elements from an Iterable.
  const numbers = [0, 1, 3, -2, 0, 4, 5];

  final numbersUntilZero = numbers.takeWhile((value) => value != 0);
  print('Numbers until 0: $numbersUntilZero');

  final numbersStartingAtZero = numbers.skipWhile((value) => value != 0);
  print('Numbers starting at 0: $numbersStartingAtZero');

  //Mapping
  //using map() function: to apply a function over each of the elements, replacing each element with a new one.
  //The map() function isn’t evaluated until the Iterable is iterated.
  Iterable<int> output = numbers.map((e) => e * 10);
  print(output);
  Iterable<String> stringOutput = numbers.map((e) => e.toString());
  print(stringOutput);
}

bool predicate(String item) {
  return item.length > 4;
}

String singleWhere(Iterable<String> items) {
  return items.singleWhere(
      (element) => element.contains('a') && element.startsWith('M'));
}

bool anyUserUnder18(Iterable<User> users) {
  return users.any((element) => element.age < 18);
}

bool everyUserOver13(Iterable<User> users) {
  return users.every((element) => element.age > 13);
}

class User {
  String name;
  int age;

  User(
    this.name,
    this.age,
  );
}

Iterable<User> filterOutUnder21(Iterable<User> users) {
  return users.where((element) => element.age >= 21);
}

Iterable<User> findShortNamed(Iterable<User> users) {
  return users.where((element) => element.name.length <= 3);
}

Iterable<String> getNameAndAges(Iterable<User> users) {
  return users.map((e) => '${e.name} is ${e.age}');
}
