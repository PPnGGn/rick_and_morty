// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CharactersTable extends Characters
    with TableInfo<$CharactersTable, Character> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharactersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _speciesMeta = const VerificationMeta(
    'species',
  );
  @override
  late final GeneratedColumn<String> species = GeneratedColumn<String>(
    'species',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
    'gender',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _originNameMeta = const VerificationMeta(
    'originName',
  );
  @override
  late final GeneratedColumn<String> originName = GeneratedColumn<String>(
    'origin_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _originUrlMeta = const VerificationMeta(
    'originUrl',
  );
  @override
  late final GeneratedColumn<String> originUrl = GeneratedColumn<String>(
    'origin_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _locationNameMeta = const VerificationMeta(
    'locationName',
  );
  @override
  late final GeneratedColumn<String> locationName = GeneratedColumn<String>(
    'location_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _locationUrlMeta = const VerificationMeta(
    'locationUrl',
  );
  @override
  late final GeneratedColumn<String> locationUrl = GeneratedColumn<String>(
    'location_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
    'image',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _episodeMeta = const VerificationMeta(
    'episode',
  );
  @override
  late final GeneratedColumn<String> episode = GeneratedColumn<String>(
    'episode',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isFavoriteMeta = const VerificationMeta(
    'isFavorite',
  );
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
    'is_favorite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_favorite" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _cachedAtMeta = const VerificationMeta(
    'cachedAt',
  );
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
    'cached_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    status,
    species,
    type,
    gender,
    originName,
    originUrl,
    locationName,
    locationUrl,
    image,
    episode,
    url,
    isFavorite,
    cachedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'characters';
  @override
  VerificationContext validateIntegrity(
    Insertable<Character> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('species')) {
      context.handle(
        _speciesMeta,
        species.isAcceptableOrUnknown(data['species']!, _speciesMeta),
      );
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    }
    if (data.containsKey('gender')) {
      context.handle(
        _genderMeta,
        gender.isAcceptableOrUnknown(data['gender']!, _genderMeta),
      );
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('origin_name')) {
      context.handle(
        _originNameMeta,
        originName.isAcceptableOrUnknown(data['origin_name']!, _originNameMeta),
      );
    }
    if (data.containsKey('origin_url')) {
      context.handle(
        _originUrlMeta,
        originUrl.isAcceptableOrUnknown(data['origin_url']!, _originUrlMeta),
      );
    }
    if (data.containsKey('location_name')) {
      context.handle(
        _locationNameMeta,
        locationName.isAcceptableOrUnknown(
          data['location_name']!,
          _locationNameMeta,
        ),
      );
    }
    if (data.containsKey('location_url')) {
      context.handle(
        _locationUrlMeta,
        locationUrl.isAcceptableOrUnknown(
          data['location_url']!,
          _locationUrlMeta,
        ),
      );
    }
    if (data.containsKey('image')) {
      context.handle(
        _imageMeta,
        image.isAcceptableOrUnknown(data['image']!, _imageMeta),
      );
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('episode')) {
      context.handle(
        _episodeMeta,
        episode.isAcceptableOrUnknown(data['episode']!, _episodeMeta),
      );
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
        _isFavoriteMeta,
        isFavorite.isAcceptableOrUnknown(data['is_favorite']!, _isFavoriteMeta),
      );
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Character map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Character(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      species: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}species'],
      ),
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      ),
      gender: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gender'],
      )!,
      originName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}origin_name'],
      ),
      originUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}origin_url'],
      ),
      locationName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location_name'],
      ),
      locationUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location_url'],
      ),
      image: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image'],
      )!,
      episode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}episode'],
      ),
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      ),
      isFavorite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_favorite'],
      )!,
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
    );
  }

  @override
  $CharactersTable createAlias(String alias) {
    return $CharactersTable(attachedDatabase, alias);
  }
}

class Character extends DataClass implements Insertable<Character> {
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
  const Character({
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
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || species != null) {
      map['species'] = Variable<String>(species);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    map['gender'] = Variable<String>(gender);
    if (!nullToAbsent || originName != null) {
      map['origin_name'] = Variable<String>(originName);
    }
    if (!nullToAbsent || originUrl != null) {
      map['origin_url'] = Variable<String>(originUrl);
    }
    if (!nullToAbsent || locationName != null) {
      map['location_name'] = Variable<String>(locationName);
    }
    if (!nullToAbsent || locationUrl != null) {
      map['location_url'] = Variable<String>(locationUrl);
    }
    map['image'] = Variable<String>(image);
    if (!nullToAbsent || episode != null) {
      map['episode'] = Variable<String>(episode);
    }
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    map['is_favorite'] = Variable<bool>(isFavorite);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  CharactersCompanion toCompanion(bool nullToAbsent) {
    return CharactersCompanion(
      id: Value(id),
      name: Value(name),
      status: Value(status),
      species: species == null && nullToAbsent
          ? const Value.absent()
          : Value(species),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      gender: Value(gender),
      originName: originName == null && nullToAbsent
          ? const Value.absent()
          : Value(originName),
      originUrl: originUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(originUrl),
      locationName: locationName == null && nullToAbsent
          ? const Value.absent()
          : Value(locationName),
      locationUrl: locationUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(locationUrl),
      image: Value(image),
      episode: episode == null && nullToAbsent
          ? const Value.absent()
          : Value(episode),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      isFavorite: Value(isFavorite),
      cachedAt: Value(cachedAt),
    );
  }

  factory Character.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Character(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      status: serializer.fromJson<String>(json['status']),
      species: serializer.fromJson<String?>(json['species']),
      type: serializer.fromJson<String?>(json['type']),
      gender: serializer.fromJson<String>(json['gender']),
      originName: serializer.fromJson<String?>(json['originName']),
      originUrl: serializer.fromJson<String?>(json['originUrl']),
      locationName: serializer.fromJson<String?>(json['locationName']),
      locationUrl: serializer.fromJson<String?>(json['locationUrl']),
      image: serializer.fromJson<String>(json['image']),
      episode: serializer.fromJson<String?>(json['episode']),
      url: serializer.fromJson<String?>(json['url']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'status': serializer.toJson<String>(status),
      'species': serializer.toJson<String?>(species),
      'type': serializer.toJson<String?>(type),
      'gender': serializer.toJson<String>(gender),
      'originName': serializer.toJson<String?>(originName),
      'originUrl': serializer.toJson<String?>(originUrl),
      'locationName': serializer.toJson<String?>(locationName),
      'locationUrl': serializer.toJson<String?>(locationUrl),
      'image': serializer.toJson<String>(image),
      'episode': serializer.toJson<String?>(episode),
      'url': serializer.toJson<String?>(url),
      'isFavorite': serializer.toJson<bool>(isFavorite),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  Character copyWith({
    int? id,
    String? name,
    String? status,
    Value<String?> species = const Value.absent(),
    Value<String?> type = const Value.absent(),
    String? gender,
    Value<String?> originName = const Value.absent(),
    Value<String?> originUrl = const Value.absent(),
    Value<String?> locationName = const Value.absent(),
    Value<String?> locationUrl = const Value.absent(),
    String? image,
    Value<String?> episode = const Value.absent(),
    Value<String?> url = const Value.absent(),
    bool? isFavorite,
    DateTime? cachedAt,
  }) => Character(
    id: id ?? this.id,
    name: name ?? this.name,
    status: status ?? this.status,
    species: species.present ? species.value : this.species,
    type: type.present ? type.value : this.type,
    gender: gender ?? this.gender,
    originName: originName.present ? originName.value : this.originName,
    originUrl: originUrl.present ? originUrl.value : this.originUrl,
    locationName: locationName.present ? locationName.value : this.locationName,
    locationUrl: locationUrl.present ? locationUrl.value : this.locationUrl,
    image: image ?? this.image,
    episode: episode.present ? episode.value : this.episode,
    url: url.present ? url.value : this.url,
    isFavorite: isFavorite ?? this.isFavorite,
    cachedAt: cachedAt ?? this.cachedAt,
  );
  Character copyWithCompanion(CharactersCompanion data) {
    return Character(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      status: data.status.present ? data.status.value : this.status,
      species: data.species.present ? data.species.value : this.species,
      type: data.type.present ? data.type.value : this.type,
      gender: data.gender.present ? data.gender.value : this.gender,
      originName: data.originName.present
          ? data.originName.value
          : this.originName,
      originUrl: data.originUrl.present ? data.originUrl.value : this.originUrl,
      locationName: data.locationName.present
          ? data.locationName.value
          : this.locationName,
      locationUrl: data.locationUrl.present
          ? data.locationUrl.value
          : this.locationUrl,
      image: data.image.present ? data.image.value : this.image,
      episode: data.episode.present ? data.episode.value : this.episode,
      url: data.url.present ? data.url.value : this.url,
      isFavorite: data.isFavorite.present
          ? data.isFavorite.value
          : this.isFavorite,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Character(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('status: $status, ')
          ..write('species: $species, ')
          ..write('type: $type, ')
          ..write('gender: $gender, ')
          ..write('originName: $originName, ')
          ..write('originUrl: $originUrl, ')
          ..write('locationName: $locationName, ')
          ..write('locationUrl: $locationUrl, ')
          ..write('image: $image, ')
          ..write('episode: $episode, ')
          ..write('url: $url, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    status,
    species,
    type,
    gender,
    originName,
    originUrl,
    locationName,
    locationUrl,
    image,
    episode,
    url,
    isFavorite,
    cachedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Character &&
          other.id == this.id &&
          other.name == this.name &&
          other.status == this.status &&
          other.species == this.species &&
          other.type == this.type &&
          other.gender == this.gender &&
          other.originName == this.originName &&
          other.originUrl == this.originUrl &&
          other.locationName == this.locationName &&
          other.locationUrl == this.locationUrl &&
          other.image == this.image &&
          other.episode == this.episode &&
          other.url == this.url &&
          other.isFavorite == this.isFavorite &&
          other.cachedAt == this.cachedAt);
}

class CharactersCompanion extends UpdateCompanion<Character> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> status;
  final Value<String?> species;
  final Value<String?> type;
  final Value<String> gender;
  final Value<String?> originName;
  final Value<String?> originUrl;
  final Value<String?> locationName;
  final Value<String?> locationUrl;
  final Value<String> image;
  final Value<String?> episode;
  final Value<String?> url;
  final Value<bool> isFavorite;
  final Value<DateTime> cachedAt;
  const CharactersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.status = const Value.absent(),
    this.species = const Value.absent(),
    this.type = const Value.absent(),
    this.gender = const Value.absent(),
    this.originName = const Value.absent(),
    this.originUrl = const Value.absent(),
    this.locationName = const Value.absent(),
    this.locationUrl = const Value.absent(),
    this.image = const Value.absent(),
    this.episode = const Value.absent(),
    this.url = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.cachedAt = const Value.absent(),
  });
  CharactersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String status,
    this.species = const Value.absent(),
    this.type = const Value.absent(),
    required String gender,
    this.originName = const Value.absent(),
    this.originUrl = const Value.absent(),
    this.locationName = const Value.absent(),
    this.locationUrl = const Value.absent(),
    required String image,
    this.episode = const Value.absent(),
    this.url = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.cachedAt = const Value.absent(),
  }) : name = Value(name),
       status = Value(status),
       gender = Value(gender),
       image = Value(image);
  static Insertable<Character> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? status,
    Expression<String>? species,
    Expression<String>? type,
    Expression<String>? gender,
    Expression<String>? originName,
    Expression<String>? originUrl,
    Expression<String>? locationName,
    Expression<String>? locationUrl,
    Expression<String>? image,
    Expression<String>? episode,
    Expression<String>? url,
    Expression<bool>? isFavorite,
    Expression<DateTime>? cachedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (status != null) 'status': status,
      if (species != null) 'species': species,
      if (type != null) 'type': type,
      if (gender != null) 'gender': gender,
      if (originName != null) 'origin_name': originName,
      if (originUrl != null) 'origin_url': originUrl,
      if (locationName != null) 'location_name': locationName,
      if (locationUrl != null) 'location_url': locationUrl,
      if (image != null) 'image': image,
      if (episode != null) 'episode': episode,
      if (url != null) 'url': url,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (cachedAt != null) 'cached_at': cachedAt,
    });
  }

  CharactersCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? status,
    Value<String?>? species,
    Value<String?>? type,
    Value<String>? gender,
    Value<String?>? originName,
    Value<String?>? originUrl,
    Value<String?>? locationName,
    Value<String?>? locationUrl,
    Value<String>? image,
    Value<String?>? episode,
    Value<String?>? url,
    Value<bool>? isFavorite,
    Value<DateTime>? cachedAt,
  }) {
    return CharactersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      species: species ?? this.species,
      type: type ?? this.type,
      gender: gender ?? this.gender,
      originName: originName ?? this.originName,
      originUrl: originUrl ?? this.originUrl,
      locationName: locationName ?? this.locationName,
      locationUrl: locationUrl ?? this.locationUrl,
      image: image ?? this.image,
      episode: episode ?? this.episode,
      url: url ?? this.url,
      isFavorite: isFavorite ?? this.isFavorite,
      cachedAt: cachedAt ?? this.cachedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (species.present) {
      map['species'] = Variable<String>(species.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (originName.present) {
      map['origin_name'] = Variable<String>(originName.value);
    }
    if (originUrl.present) {
      map['origin_url'] = Variable<String>(originUrl.value);
    }
    if (locationName.present) {
      map['location_name'] = Variable<String>(locationName.value);
    }
    if (locationUrl.present) {
      map['location_url'] = Variable<String>(locationUrl.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (episode.present) {
      map['episode'] = Variable<String>(episode.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharactersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('status: $status, ')
          ..write('species: $species, ')
          ..write('type: $type, ')
          ..write('gender: $gender, ')
          ..write('originName: $originName, ')
          ..write('originUrl: $originUrl, ')
          ..write('locationName: $locationName, ')
          ..write('locationUrl: $locationUrl, ')
          ..write('image: $image, ')
          ..write('episode: $episode, ')
          ..write('url: $url, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }
}

class $CharacterDescriptionsTable extends CharacterDescriptions
    with TableInfo<$CharacterDescriptionsTable, CharacterDescription> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharacterDescriptionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _characterIdMeta = const VerificationMeta(
    'characterId',
  );
  @override
  late final GeneratedColumn<int> characterId = GeneratedColumn<int>(
    'character_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isFavoriteMeta = const VerificationMeta(
    'isFavorite',
  );
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
    'is_favorite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_favorite" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    characterId,
    description,
    createdAt,
    isFavorite,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'character_descriptions';
  @override
  VerificationContext validateIntegrity(
    Insertable<CharacterDescription> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('character_id')) {
      context.handle(
        _characterIdMeta,
        characterId.isAcceptableOrUnknown(
          data['character_id']!,
          _characterIdMeta,
        ),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
        _isFavoriteMeta,
        isFavorite.isAcceptableOrUnknown(data['is_favorite']!, _isFavoriteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {characterId};
  @override
  CharacterDescription map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CharacterDescription(
      characterId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}character_id'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      isFavorite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_favorite'],
      )!,
    );
  }

  @override
  $CharacterDescriptionsTable createAlias(String alias) {
    return $CharacterDescriptionsTable(attachedDatabase, alias);
  }
}

class CharacterDescription extends DataClass
    implements Insertable<CharacterDescription> {
  final int characterId;
  final String description;
  final DateTime createdAt;
  final bool isFavorite;
  const CharacterDescription({
    required this.characterId,
    required this.description,
    required this.createdAt,
    required this.isFavorite,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['character_id'] = Variable<int>(characterId);
    map['description'] = Variable<String>(description);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['is_favorite'] = Variable<bool>(isFavorite);
    return map;
  }

  CharacterDescriptionsCompanion toCompanion(bool nullToAbsent) {
    return CharacterDescriptionsCompanion(
      characterId: Value(characterId),
      description: Value(description),
      createdAt: Value(createdAt),
      isFavorite: Value(isFavorite),
    );
  }

  factory CharacterDescription.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CharacterDescription(
      characterId: serializer.fromJson<int>(json['characterId']),
      description: serializer.fromJson<String>(json['description']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'characterId': serializer.toJson<int>(characterId),
      'description': serializer.toJson<String>(description),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'isFavorite': serializer.toJson<bool>(isFavorite),
    };
  }

  CharacterDescription copyWith({
    int? characterId,
    String? description,
    DateTime? createdAt,
    bool? isFavorite,
  }) => CharacterDescription(
    characterId: characterId ?? this.characterId,
    description: description ?? this.description,
    createdAt: createdAt ?? this.createdAt,
    isFavorite: isFavorite ?? this.isFavorite,
  );
  CharacterDescription copyWithCompanion(CharacterDescriptionsCompanion data) {
    return CharacterDescription(
      characterId: data.characterId.present
          ? data.characterId.value
          : this.characterId,
      description: data.description.present
          ? data.description.value
          : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      isFavorite: data.isFavorite.present
          ? data.isFavorite.value
          : this.isFavorite,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CharacterDescription(')
          ..write('characterId: $characterId, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('isFavorite: $isFavorite')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(characterId, description, createdAt, isFavorite);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CharacterDescription &&
          other.characterId == this.characterId &&
          other.description == this.description &&
          other.createdAt == this.createdAt &&
          other.isFavorite == this.isFavorite);
}

class CharacterDescriptionsCompanion
    extends UpdateCompanion<CharacterDescription> {
  final Value<int> characterId;
  final Value<String> description;
  final Value<DateTime> createdAt;
  final Value<bool> isFavorite;
  const CharacterDescriptionsCompanion({
    this.characterId = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.isFavorite = const Value.absent(),
  });
  CharacterDescriptionsCompanion.insert({
    this.characterId = const Value.absent(),
    required String description,
    required DateTime createdAt,
    this.isFavorite = const Value.absent(),
  }) : description = Value(description),
       createdAt = Value(createdAt);
  static Insertable<CharacterDescription> custom({
    Expression<int>? characterId,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
    Expression<bool>? isFavorite,
  }) {
    return RawValuesInsertable({
      if (characterId != null) 'character_id': characterId,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
      if (isFavorite != null) 'is_favorite': isFavorite,
    });
  }

  CharacterDescriptionsCompanion copyWith({
    Value<int>? characterId,
    Value<String>? description,
    Value<DateTime>? createdAt,
    Value<bool>? isFavorite,
  }) {
    return CharacterDescriptionsCompanion(
      characterId: characterId ?? this.characterId,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (characterId.present) {
      map['character_id'] = Variable<int>(characterId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharacterDescriptionsCompanion(')
          ..write('characterId: $characterId, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('isFavorite: $isFavorite')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CharactersTable characters = $CharactersTable(this);
  late final $CharacterDescriptionsTable characterDescriptions =
      $CharacterDescriptionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    characters,
    characterDescriptions,
  ];
}

typedef $$CharactersTableCreateCompanionBuilder =
    CharactersCompanion Function({
      Value<int> id,
      required String name,
      required String status,
      Value<String?> species,
      Value<String?> type,
      required String gender,
      Value<String?> originName,
      Value<String?> originUrl,
      Value<String?> locationName,
      Value<String?> locationUrl,
      required String image,
      Value<String?> episode,
      Value<String?> url,
      Value<bool> isFavorite,
      Value<DateTime> cachedAt,
    });
typedef $$CharactersTableUpdateCompanionBuilder =
    CharactersCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> status,
      Value<String?> species,
      Value<String?> type,
      Value<String> gender,
      Value<String?> originName,
      Value<String?> originUrl,
      Value<String?> locationName,
      Value<String?> locationUrl,
      Value<String> image,
      Value<String?> episode,
      Value<String?> url,
      Value<bool> isFavorite,
      Value<DateTime> cachedAt,
    });

class $$CharactersTableFilterComposer
    extends Composer<_$AppDatabase, $CharactersTable> {
  $$CharactersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get species => $composableBuilder(
    column: $table.species,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get originName => $composableBuilder(
    column: $table.originName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get originUrl => $composableBuilder(
    column: $table.originUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get locationName => $composableBuilder(
    column: $table.locationName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get locationUrl => $composableBuilder(
    column: $table.locationUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get episode => $composableBuilder(
    column: $table.episode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CharactersTableOrderingComposer
    extends Composer<_$AppDatabase, $CharactersTable> {
  $$CharactersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get species => $composableBuilder(
    column: $table.species,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get originName => $composableBuilder(
    column: $table.originName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get originUrl => $composableBuilder(
    column: $table.originUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get locationName => $composableBuilder(
    column: $table.locationName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get locationUrl => $composableBuilder(
    column: $table.locationUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get episode => $composableBuilder(
    column: $table.episode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CharactersTableAnnotationComposer
    extends Composer<_$AppDatabase, $CharactersTable> {
  $$CharactersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get species =>
      $composableBuilder(column: $table.species, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<String> get originName => $composableBuilder(
    column: $table.originName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get originUrl =>
      $composableBuilder(column: $table.originUrl, builder: (column) => column);

  GeneratedColumn<String> get locationName => $composableBuilder(
    column: $table.locationName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get locationUrl => $composableBuilder(
    column: $table.locationUrl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<String> get episode =>
      $composableBuilder(column: $table.episode, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$CharactersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CharactersTable,
          Character,
          $$CharactersTableFilterComposer,
          $$CharactersTableOrderingComposer,
          $$CharactersTableAnnotationComposer,
          $$CharactersTableCreateCompanionBuilder,
          $$CharactersTableUpdateCompanionBuilder,
          (
            Character,
            BaseReferences<_$AppDatabase, $CharactersTable, Character>,
          ),
          Character,
          PrefetchHooks Function()
        > {
  $$CharactersTableTableManager(_$AppDatabase db, $CharactersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CharactersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CharactersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CharactersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> species = const Value.absent(),
                Value<String?> type = const Value.absent(),
                Value<String> gender = const Value.absent(),
                Value<String?> originName = const Value.absent(),
                Value<String?> originUrl = const Value.absent(),
                Value<String?> locationName = const Value.absent(),
                Value<String?> locationUrl = const Value.absent(),
                Value<String> image = const Value.absent(),
                Value<String?> episode = const Value.absent(),
                Value<String?> url = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
              }) => CharactersCompanion(
                id: id,
                name: name,
                status: status,
                species: species,
                type: type,
                gender: gender,
                originName: originName,
                originUrl: originUrl,
                locationName: locationName,
                locationUrl: locationUrl,
                image: image,
                episode: episode,
                url: url,
                isFavorite: isFavorite,
                cachedAt: cachedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String status,
                Value<String?> species = const Value.absent(),
                Value<String?> type = const Value.absent(),
                required String gender,
                Value<String?> originName = const Value.absent(),
                Value<String?> originUrl = const Value.absent(),
                Value<String?> locationName = const Value.absent(),
                Value<String?> locationUrl = const Value.absent(),
                required String image,
                Value<String?> episode = const Value.absent(),
                Value<String?> url = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
              }) => CharactersCompanion.insert(
                id: id,
                name: name,
                status: status,
                species: species,
                type: type,
                gender: gender,
                originName: originName,
                originUrl: originUrl,
                locationName: locationName,
                locationUrl: locationUrl,
                image: image,
                episode: episode,
                url: url,
                isFavorite: isFavorite,
                cachedAt: cachedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CharactersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CharactersTable,
      Character,
      $$CharactersTableFilterComposer,
      $$CharactersTableOrderingComposer,
      $$CharactersTableAnnotationComposer,
      $$CharactersTableCreateCompanionBuilder,
      $$CharactersTableUpdateCompanionBuilder,
      (Character, BaseReferences<_$AppDatabase, $CharactersTable, Character>),
      Character,
      PrefetchHooks Function()
    >;
typedef $$CharacterDescriptionsTableCreateCompanionBuilder =
    CharacterDescriptionsCompanion Function({
      Value<int> characterId,
      required String description,
      required DateTime createdAt,
      Value<bool> isFavorite,
    });
typedef $$CharacterDescriptionsTableUpdateCompanionBuilder =
    CharacterDescriptionsCompanion Function({
      Value<int> characterId,
      Value<String> description,
      Value<DateTime> createdAt,
      Value<bool> isFavorite,
    });

class $$CharacterDescriptionsTableFilterComposer
    extends Composer<_$AppDatabase, $CharacterDescriptionsTable> {
  $$CharacterDescriptionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get characterId => $composableBuilder(
    column: $table.characterId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CharacterDescriptionsTableOrderingComposer
    extends Composer<_$AppDatabase, $CharacterDescriptionsTable> {
  $$CharacterDescriptionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get characterId => $composableBuilder(
    column: $table.characterId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CharacterDescriptionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CharacterDescriptionsTable> {
  $$CharacterDescriptionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get characterId => $composableBuilder(
    column: $table.characterId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => column,
  );
}

class $$CharacterDescriptionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CharacterDescriptionsTable,
          CharacterDescription,
          $$CharacterDescriptionsTableFilterComposer,
          $$CharacterDescriptionsTableOrderingComposer,
          $$CharacterDescriptionsTableAnnotationComposer,
          $$CharacterDescriptionsTableCreateCompanionBuilder,
          $$CharacterDescriptionsTableUpdateCompanionBuilder,
          (
            CharacterDescription,
            BaseReferences<
              _$AppDatabase,
              $CharacterDescriptionsTable,
              CharacterDescription
            >,
          ),
          CharacterDescription,
          PrefetchHooks Function()
        > {
  $$CharacterDescriptionsTableTableManager(
    _$AppDatabase db,
    $CharacterDescriptionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CharacterDescriptionsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$CharacterDescriptionsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CharacterDescriptionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> characterId = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
              }) => CharacterDescriptionsCompanion(
                characterId: characterId,
                description: description,
                createdAt: createdAt,
                isFavorite: isFavorite,
              ),
          createCompanionCallback:
              ({
                Value<int> characterId = const Value.absent(),
                required String description,
                required DateTime createdAt,
                Value<bool> isFavorite = const Value.absent(),
              }) => CharacterDescriptionsCompanion.insert(
                characterId: characterId,
                description: description,
                createdAt: createdAt,
                isFavorite: isFavorite,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CharacterDescriptionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CharacterDescriptionsTable,
      CharacterDescription,
      $$CharacterDescriptionsTableFilterComposer,
      $$CharacterDescriptionsTableOrderingComposer,
      $$CharacterDescriptionsTableAnnotationComposer,
      $$CharacterDescriptionsTableCreateCompanionBuilder,
      $$CharacterDescriptionsTableUpdateCompanionBuilder,
      (
        CharacterDescription,
        BaseReferences<
          _$AppDatabase,
          $CharacterDescriptionsTable,
          CharacterDescription
        >,
      ),
      CharacterDescription,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CharactersTableTableManager get characters =>
      $$CharactersTableTableManager(_db, _db.characters);
  $$CharacterDescriptionsTableTableManager get characterDescriptions =>
      $$CharacterDescriptionsTableTableManager(_db, _db.characterDescriptions);
}
