// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NetworkDatabase.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorNetworkDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$NetworkDatabaseBuilder databaseBuilder(String name) =>
      _$NetworkDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$NetworkDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$NetworkDatabaseBuilder(null);
}

class _$NetworkDatabaseBuilder {
  _$NetworkDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$NetworkDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$NetworkDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<NetworkDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$NetworkDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$NetworkDatabase extends NetworkDatabase {
  _$NetworkDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  NetworkDao? _networkConfigDaoInstance;

  NetworkSettingsDao? _networkSettingsConfigDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 2,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `NetworkConfigs` (`label` TEXT NOT NULL, `buttonPressedCommand` TEXT NOT NULL, `buttonReleasedCommand` TEXT NOT NULL, `isReleaseChecked` INTEGER NOT NULL, `id` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `NetworkSettingsConfig` (`receiveIpAddress` TEXT NOT NULL, `port` TEXT NOT NULL, `startPath` TEXT NOT NULL, `incomingIp` TEXT NOT NULL, `incomingPort` TEXT NOT NULL, `incomingStartPath` TEXT NOT NULL, `id` INTEGER, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  NetworkDao get networkConfigDao {
    return _networkConfigDaoInstance ??= _$NetworkDao(database, changeListener);
  }

  @override
  NetworkSettingsDao get networkSettingsConfigDao {
    return _networkSettingsConfigDaoInstance ??=
        _$NetworkSettingsDao(database, changeListener);
  }
}

class _$NetworkDao extends NetworkDao {
  _$NetworkDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _networkEntityInsertionAdapter = InsertionAdapter(
            database,
            'NetworkConfigs',
            (NetworkEntity item) => <String, Object?>{
                  'label': item.label,
                  'buttonPressedCommand': item.buttonPressedCommand,
                  'buttonReleasedCommand': item.buttonReleasedCommand,
                  'isReleaseChecked': item.isReleaseChecked ? 1 : 0,
                  'id': item.id
                },
            changeListener),
        _networkEntityUpdateAdapter = UpdateAdapter(
            database,
            'NetworkConfigs',
            ['id'],
            (NetworkEntity item) => <String, Object?>{
                  'label': item.label,
                  'buttonPressedCommand': item.buttonPressedCommand,
                  'buttonReleasedCommand': item.buttonReleasedCommand,
                  'isReleaseChecked': item.isReleaseChecked ? 1 : 0,
                  'id': item.id
                },
            changeListener),
        _networkEntityDeletionAdapter = DeletionAdapter(
            database,
            'NetworkConfigs',
            ['id'],
            (NetworkEntity item) => <String, Object?>{
                  'label': item.label,
                  'buttonPressedCommand': item.buttonPressedCommand,
                  'buttonReleasedCommand': item.buttonReleasedCommand,
                  'isReleaseChecked': item.isReleaseChecked ? 1 : 0,
                  'id': item.id
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<NetworkEntity> _networkEntityInsertionAdapter;

  final UpdateAdapter<NetworkEntity> _networkEntityUpdateAdapter;

  final DeletionAdapter<NetworkEntity> _networkEntityDeletionAdapter;

  @override
  Future<List<NetworkEntity>> findAllNetworks() async {
    return _queryAdapter.queryList('SELECT * FROM NetworkConfigs',
        mapper: (Map<String, Object?> row) => NetworkEntity(
            id: row['id'] as int?,
            label: row['label'] as String,
            buttonPressedCommand: row['buttonPressedCommand'] as String,
            buttonReleasedCommand: row['buttonReleasedCommand'] as String,
            isReleaseChecked: (row['isReleaseChecked'] as int) != 0));
  }

  @override
  Stream<NetworkEntity?> findNetworkById(int id) {
    return _queryAdapter.queryStream(
        'SELECT * FROM NetworkConfigs WHERE id = ?1',
        mapper: (Map<String, Object?> row) => NetworkEntity(
            id: row['id'] as int?,
            label: row['label'] as String,
            buttonPressedCommand: row['buttonPressedCommand'] as String,
            buttonReleasedCommand: row['buttonReleasedCommand'] as String,
            isReleaseChecked: (row['isReleaseChecked'] as int) != 0),
        arguments: [id],
        queryableName: 'NetworkConfigs',
        isView: false);
  }

  @override
  Future<void> insertNetwork(NetworkEntity network) async {
    await _networkEntityInsertionAdapter.insert(
        network, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateNetwork(NetworkEntity network) async {
    await _networkEntityUpdateAdapter.update(network, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteNetwork(NetworkEntity network) async {
    await _networkEntityDeletionAdapter.delete(network);
  }
}

class _$NetworkSettingsDao extends NetworkSettingsDao {
  _$NetworkSettingsDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _networkSettingsInsertionAdapter = InsertionAdapter(
            database,
            'NetworkSettingsConfig',
            (NetworkSettings item) => <String, Object?>{
                  'receiveIpAddress': item.receiveIpAddress,
                  'port': item.port,
                  'startPath': item.startPath,
                  'incomingIp': item.incomingIp,
                  'incomingPort': item.incomingPort,
                  'incomingStartPath': item.incomingStartPath,
                  'id': item.id
                },
            changeListener),
        _networkSettingsUpdateAdapter = UpdateAdapter(
            database,
            'NetworkSettingsConfig',
            ['id'],
            (NetworkSettings item) => <String, Object?>{
                  'receiveIpAddress': item.receiveIpAddress,
                  'port': item.port,
                  'startPath': item.startPath,
                  'incomingIp': item.incomingIp,
                  'incomingPort': item.incomingPort,
                  'incomingStartPath': item.incomingStartPath,
                  'id': item.id
                },
            changeListener),
        _networkSettingsDeletionAdapter = DeletionAdapter(
            database,
            'NetworkSettingsConfig',
            ['id'],
            (NetworkSettings item) => <String, Object?>{
                  'receiveIpAddress': item.receiveIpAddress,
                  'port': item.port,
                  'startPath': item.startPath,
                  'incomingIp': item.incomingIp,
                  'incomingPort': item.incomingPort,
                  'incomingStartPath': item.incomingStartPath,
                  'id': item.id
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<NetworkSettings> _networkSettingsInsertionAdapter;

  final UpdateAdapter<NetworkSettings> _networkSettingsUpdateAdapter;

  final DeletionAdapter<NetworkSettings> _networkSettingsDeletionAdapter;

  @override
  Future<List<NetworkSettings>> findAllNetworkSettings() async {
    return _queryAdapter.queryList('SELECT * FROM NetworkSettingsConfig',
        mapper: (Map<String, Object?> row) => NetworkSettings(
            id: row['id'] as int?,
            receiveIpAddress: row['receiveIpAddress'] as String,
            port: row['port'] as String,
            startPath: row['startPath'] as String,
            incomingIp: row['incomingIp'] as String,
            incomingPort: row['incomingPort'] as String,
            incomingStartPath: row['incomingStartPath'] as String));
  }

  @override
  Stream<NetworkSettings?> findNetworkSettingsById(int id) {
    return _queryAdapter.queryStream(
        'SELECT * FROM NetworkSettingsConfig WHERE id = ?1',
        mapper: (Map<String, Object?> row) => NetworkSettings(
            id: row['id'] as int?,
            receiveIpAddress: row['receiveIpAddress'] as String,
            port: row['port'] as String,
            startPath: row['startPath'] as String,
            incomingIp: row['incomingIp'] as String,
            incomingPort: row['incomingPort'] as String,
            incomingStartPath: row['incomingStartPath'] as String),
        arguments: [id],
        queryableName: 'NetworkSettingsConfig',
        isView: false);
  }

  @override
  Future<void> insertNetworkSettings(NetworkSettings networkSettings) async {
    await _networkSettingsInsertionAdapter.insert(
        networkSettings, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateNetworkSettings(NetworkSettings networkSettings) async {
    await _networkSettingsUpdateAdapter.update(
        networkSettings, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteNetworkSettings(NetworkSettings networkSettings) async {
    await _networkSettingsDeletionAdapter.delete(networkSettings);
  }
}
