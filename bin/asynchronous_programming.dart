/**
 * Such asynchronous computations usually provide their result as a Future or, if the result has multiple parts, as a Stream. 
 * To interact with the asynchronous results, you can use the async and await keywords.
 * 
 * What is a future States: uncompleted or completed.
 * 
 * Uncompleted
 * When you call an asynchronous function, it returns an uncompleted future. That future is waiting for the function’s asynchronous operation to finish or to throw an error.
 * 
 * Completed
 * If the asynchronous operation succeeds, the future completes with a value. Otherwise, it completes with an error.
 * 
 * Working with futures: async and await
 * * To define an async function, add async before the function body.
 * * The await keyword works only in async functions.
 * 
 * Handling errors
 * To handle errors in an async function, use try-catch
 */

/// Incorrectly using an asynchronous function
// If a future doesn’t produce a usable value, then the future’s type is Future<void>.
Future<String> fetchUserOrder() => Future.delayed(
      const Duration(seconds: 4),
      () => throw 'Large Latter',
    );

Future<String> createOrderMessage() async {
  var order = await fetchUserOrder();
  return 'Your order is: $order';
}

Future<void> printOrderMessage() async {
  print('Awaiting user order');
  var order = await fetchUserOrder();
  print('Your order is: $order');
}

void countSeconds(int s) {
  for (var i = 1; i <= s; i++) {
    Future.delayed(Duration(seconds: i), () => print(i));
  }
}

Future<void> main(List<String> args) async {
  try {
    print('Awaiting user order...');
    var order = await fetchUserOrder();
    print('Your order is: $order');
  } catch (e) {
    print('Caught error: $e');
  }
  // countSeconds(4);
  // await printOrderMessage();
}
