import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnvTypeEnum { dev, production }

class EnvVaiable {
  //named constructor private
  EnvVaiable._();

  static final EnvVaiable instance =  EnvVaiable._();

  String _envType = '';
  Future<void> init({required EnvTypeEnum envTypeEnum}) async {
    switch (envTypeEnum) {
      case EnvTypeEnum.dev:
        await dotenv.load(fileName: '.env.dev');
      case EnvTypeEnum.production:
        await dotenv.load(fileName: '.env.production');
    }
    _envType = dotenv.get('ENV_TYPE');
  }


  bool get debugmod => _envType == 'dev';
}
