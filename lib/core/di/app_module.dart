import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @Named('perplexityApiKey')
  @lazySingleton
  String get perplexityApiKey {
    final key = dotenv.env['API_KEY'];
    if (key == null || key.isEmpty) {
      throw Exception('API_KEY not found in .env file');
    }
    return key;
  }
}
