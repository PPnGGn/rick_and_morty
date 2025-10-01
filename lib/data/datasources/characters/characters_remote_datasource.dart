import 'package:dio/dio.dart';
import 'package:rick_and_morty/data/models/response/response_models.dart';
import 'package:retrofit/retrofit.dart';

part 'characters_remote_datasource.g.dart';

@RestApi()
abstract class CharactersRemoteDatasource {
  factory CharactersRemoteDatasource(Dio dio, {String baseUrl}) =
      _CharactersRemoteDatasource;

  @GET('/character')
  Future<CharactersResponse> getAllCharacters({
    @Query('page') int? page,
    @Query('name') String? name,
    @Query('status') String? status,
    @Query('species') String? species,
    @Query('type') String? type,
    @Query('gender') String? gender,
  });

  @GET('/character/{id}')
  Future<Character> getCharacterById(@Path('id') int id);
}
