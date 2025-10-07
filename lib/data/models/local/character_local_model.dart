import 'package:rick_and_morty/domain/entities/entities.dart';
import 'package:rick_and_morty/domain/enums/enums.dart';
import 'package:rick_and_morty/core/database/database.dart';

/// Модель персонажа для локальной БД
/// Это чистая модель данных, которая не зависит от domain entities
class CharacterLocalModel {
  final int id;
  final String name;
  final String status;
  final String? species;
  final String? type;
  final String gender;
  final String? originName;
  final String? originUrl;
  final String? locationName;
  final String? locationUrl;
  final String image;
  final String? episode;
  final String? url;
  final bool isFavorite;
  final DateTime cachedAt;

  const CharacterLocalModel({
    required this.id,
    required this.name,
    required this.status,
    this.species,
    this.type,
    required this.gender,
    this.originName,
    this.originUrl,
    this.locationName,
    this.locationUrl,
    required this.image,
    this.episode,
    this.url,
    required this.isFavorite,
    required this.cachedAt,
  });

  /// Создать из строки БД (Drift)
  factory CharacterLocalModel.fromDb(Character dbCharacter) {
    return CharacterLocalModel(
      id: dbCharacter.id,
      name: dbCharacter.name,
      status: dbCharacter.status,
      species: dbCharacter.species,
      type: dbCharacter.type,
      gender: dbCharacter.gender,
      originName: dbCharacter.originName,
      originUrl: dbCharacter.originUrl,
      locationName: dbCharacter.locationName,
      locationUrl: dbCharacter.locationUrl,
      image: dbCharacter.image,
      episode: dbCharacter.episode,
      url: dbCharacter.url,
      isFavorite: dbCharacter.isFavorite,
      cachedAt: dbCharacter.cachedAt,
    );
  }

  /// Преобразовать в Entity (для domain слоя)
  CharacterEntity toEntity() {
    return CharacterEntity(
      id: id,
      name: name,
      status: CharacterStatus.values.firstWhere(
        (e) => e.value == status,
        orElse: () => CharacterStatus.unknown,
      ),
      species: species ?? '',
      type: type ?? '',
      gender: CharacterGender.values.firstWhere(
        (e) => e.value == gender,
        orElse: () => CharacterGender.unknown,
      ),
      origin: originName != null
          ? OriginEntity(name: originName, url: originUrl)
          : null,
      location: locationName != null
          ? LocationEntity(name: locationName, url: locationUrl)
          : null,
      image: image,
      episode: episode?.split(',') ?? [],
      url: url ?? '',
    );
  }

  /// Создать из Entity (для сохранения в БД)
  factory CharacterLocalModel.fromEntity(
    CharacterEntity entity, {
    bool isFavorite = false,
  }) {
    return CharacterLocalModel(
      id: entity.id,
      name: entity.name,
      status: entity.status.value,
      species: entity.species,
      type: entity.type,
      gender: entity.gender.value,
      originName: entity.origin?.name,
      originUrl: entity.origin?.url,
      locationName: entity.location?.name,
      locationUrl: entity.location?.url,
      image: entity.image,
      episode: entity.episode.join(','),
      url: entity.url,
      isFavorite: isFavorite,
      cachedAt: DateTime.now(),
    );
  }
}
