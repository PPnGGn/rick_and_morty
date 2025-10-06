import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/router/app_router.dart';

@module
abstract class AppModule {
  @singleton
  AppRouter appRouter() => AppRouter();
}
