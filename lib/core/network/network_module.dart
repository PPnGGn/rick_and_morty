import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/constants/api_constants.dart';
import 'package:rick_and_morty/data/datasources/characters/characters_remote_datasource.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: ApiConstants.connectTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Логирование запросов и ответов
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: false,
        error: true,
        logPrint: (object) => debugPrint(object.toString()),
      ),
    );

    return dio;
  }

  @lazySingleton
  CharactersRemoteDatasource charactersRemoteDatasource(Dio dio) {
    return CharactersRemoteDatasource(dio, baseUrl: ApiConstants.baseUrl);
  }
}
