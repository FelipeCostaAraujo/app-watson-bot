import 'package:flutter_dotenv/flutter_dotenv.dart';

class Settings{
  static final String url = env['API_URL'];
}