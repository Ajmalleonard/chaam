import 'dart:math';

abstract class Helper {
  static final random = Random();

  static String randomPictureUrl() {
    final randomInt = random.nextInt(1000);

    return 'https://picsum.photos/$randomInt/300';
  }

  static DateTime randomDate() {
    final random = Random();
    final currentDate = DateTime.now();
    return currentDate.subtract(Duration(seconds: random.nextInt(200000)));
  }
}
