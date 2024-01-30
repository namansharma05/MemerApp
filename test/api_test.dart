import 'package:flutter_test/flutter_test.dart';
import 'package:meme_generator/services/api.dart';

void main() {
  test('Test API', () async {
    final response = await API.getMemes();
    print(response.data!.memes![0].name!.toString());
    expect(response.success, true);
  });
}
