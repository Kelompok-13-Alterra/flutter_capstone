import 'dart:math';

double randomRating(Random source, num start, num end) {
  final results = source.nextDouble() * (end - start) + start;
  return results;
}
