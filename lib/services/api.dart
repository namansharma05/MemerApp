import 'dart:convert';
import 'package:meme_generator/model/memes_response.dart';
import 'package:http/http.dart' as http;

abstract class API {
  static final String _baseUrl = 'https://api.imgflip.com/get_memes';
  static Future<Data> getMemes() async {
    final response = await http.get(Uri.parse("$_baseUrl/get_memes"));
    if (response.statusCode == 200) {
      final MemesResponse memesResponse =
          MemesResponse.fromJson(jsonDecode(response.body));
      return memesResponse.data!;
    } else {
      throw Exception('Failed to load memes');
    }
  }
}
