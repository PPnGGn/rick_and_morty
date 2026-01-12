import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'injection.config.dart';

final GetIt getIt = GetIt.instance;

@module
abstract class EnvModule {
  @preResolve
  Future<String> get apiKey async => dotenv.env['API_KEY'] ?? '';
}

@InjectableInit()
Future<GetIt> configureDependencies() async => getIt.init();
