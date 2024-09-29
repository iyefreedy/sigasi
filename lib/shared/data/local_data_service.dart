import 'dart:developer';

import 'package:path/path.dart';
import 'package:sigasi/shared/domain/models/item/item.dart';
import 'package:sigasi/shared/domain/models/item_category/item_category.dart';
import 'package:sigasi/shared/domain/models/resident/resident.dart';
import 'package:sigasi/shared/domain/models/village/village.dart';

import 'package:sqflite/sqflite.dart';

import '../domain/models/district/district.dart';
import '../domain/models/population_group/population_group.dart';
import 'data_service.dart';

class LocalDataService implements DataService {
  Database? _database;

  @override
  Future<List<District>> allDistricts() async {
    try {
      final db = await _getDatabase();

      final result = await db.query('district');
      return result.map(District.fromJson).toList();
    } catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<void> deleteDistrict(int id) async {
    try {
      final db = await _getDatabase();
      await db.delete('district', where: 'id=?', whereArgs: [id]);
    } catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<District> findDistrictById(int id) async {
    try {
      final db = await _getDatabase();
      final result = await db.query('district', where: 'id=?', whereArgs: [id]);

      return District.fromJson(result.first);
    } catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<District> saveDistrict(District district) async {
    final districtId = district.id;

    try {
      final db = await _getDatabase();
      if (districtId != null) {
        await db.update(
          'district',
          district.toJson()..remove('id'),
          where: 'id=?',
          whereArgs: [districtId],
        );
        return district;
      } else {
        final newDistrict =
            await db.insert('district', district.toJson()..remove('id'));
        return district.copyWith.call(id: newDistrict);
      }
    } catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<List<Village>> allVillages() async {
    try {
      final db = await _getDatabase();

      final result = await db.query('village');
      return result.map(Village.fromJson).toList();
    } catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<Village> createVillage(Village village) async {
    try {
      final db = await _getDatabase();

      final newDistrict =
          await db.insert('village', village.toJson()..remove('id'));
      return village.copyWith.call(id: newDistrict);
    } catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<void> deleteVillage(int id) async {
    try {
      final db = await _getDatabase();
      await db.delete('village', where: 'id=?', whereArgs: [id]);
    } catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<Village> findVillageById(int id) async {
    try {
      final db = await _getDatabase();
      final result = await db.query('village', where: 'id=?', whereArgs: [id]);

      return Village.fromJson(result.first);
    } catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<Village> updateVillage(Village village) async {
    try {
      final db = await _getDatabase();
      await db.update(
        'village',
        village.toJson()..remove('id'),
        where: 'id=?',
        whereArgs: [village.id],
      );
      return village;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<PopulationGroup>> allPopulationGroups() async {
    try {
      final db = await _getDatabase();

      final results = await db.query('population_group');

      return results.map(PopulationGroup.fromJson).toList();
    } on DatabaseException catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<PopulationGroup> findPopulationGroupById(int id) async {
    try {
      final db = await _getDatabase();
      final result =
          await db.query('population_group', where: 'id=?', whereArgs: [id]);

      return PopulationGroup.fromJson(result.first);
    } catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<PopulationGroup> createPopulationGroup(
      PopulationGroup populationGroup) async {
    try {
      final db = await _getDatabase();
      final newPopulationGroupId = await db.insert(
          'population_group', populationGroup.toJson()..remove('id'));

      return populationGroup.copyWith(id: newPopulationGroupId);
    } on DatabaseException catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<void> deletePopulationGroup(int id) async {
    try {
      final db = await _getDatabase();
      await db.delete('population_group', where: 'id=?', whereArgs: [id]);
    } catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<PopulationGroup> updatePopulationGroup(
      PopulationGroup populationGroup) async {
    try {
      final db = await _getDatabase();
      await db.update(
        'population_group',
        populationGroup.toJson()..remove('id'),
        where: 'id=?',
        whereArgs: [populationGroup.id],
      );
      return populationGroup;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ItemCategory>> allItemCategories() async {
    try {
      final db = await _getDatabase();

      final results = await db.query('item_category');

      return results.map(ItemCategory.fromJson).toList();
    } on DatabaseException catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<ItemCategory> createItemCategory(ItemCategory itemType) async {
    try {
      final db = await _getDatabase();

      final newItemTypeId =
          await db.insert('item_category', itemType.toJson()..remove('id'));

      return itemType.copyWith(id: newItemTypeId);
    } on DatabaseException catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<void> deleteItemCategory(int id) async {
    try {
      final db = await _getDatabase();

      await db.delete('item_category', where: 'id=?', whereArgs: [id]);
    } on DatabaseException catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<ItemCategory> findItemCategoryById(int id) async {
    try {
      final db = await _getDatabase();

      final results =
          await db.query('item_category', where: 'id=?', whereArgs: [id]);

      return ItemCategory.fromJson(results.first);
    } on DatabaseException catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<ItemCategory> updateItemCategory(ItemCategory itemType) async {
    try {
      final db = await _getDatabase();

      await db.update('item_category', itemType.toJson()..remove('id'),
          where: 'id=?', whereArgs: [itemType.id]);

      return itemType;
    } on DatabaseException catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<List<Item>> allItems() async {
    try {
      final db = await _getDatabase();

      final results = await db.query('item');

      return results.map(Item.fromJson).toList();
    } on DatabaseException catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<Item> createItem(Item item) async {
    try {
      final db = await _getDatabase();

      final newItemId = await db.insert('item', item.toJson()..remove('id'));

      return item.copyWith(id: newItemId);
    } on DatabaseException catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<void> deleteItem(int id) async {
    try {
      final db = await _getDatabase();

      await db.delete('item', where: 'id=?', whereArgs: [id]);
    } on DatabaseException catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<Item> getItemById(int id) async {
    try {
      final db = await _getDatabase();

      final results = await db.query('item', where: 'id=?', whereArgs: [id]);

      return Item.fromJson(results.first);
    } on DatabaseException catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<Item> updateItem(Item item) async {
    try {
      final db = await _getDatabase();

      await db.update('item', item.toJson()..remove('id'),
          where: 'id=?', whereArgs: [item.id]);

      return item;
    } on DatabaseException catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<List<Resident>> allResidents() async {
    try {
      final db = await _getDatabase();
      final results = await db.query('resident');

      return results.map(Resident.fromJson).toList();
    } on DatabaseException catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<Resident> createResident(Resident resident) async {
    try {
      final db = await _getDatabase();

      final newResidentId = await db.update(
        'resident',
        resident.toJson()..remove('id'),
        where: 'id=?',
        whereArgs: [resident.id],
      );

      return resident.copyWith(id: newResidentId);
    } on DatabaseException catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<void> deleteResident(int id) async {
    try {
      final db = await _getDatabase();

      await db.delete('resident', where: 'id=?', whereArgs: [id]);
    } on DatabaseException catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<Resident> findResidentById(int id) async {
    try {
      final db = await _getDatabase();

      final result = await db.query('item', where: 'id=?', whereArgs: [id]);

      return Resident.fromJson(result.first);
    } on DatabaseException catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<Resident> updateResident(Resident resident) async {
    try {
      final db = await _getDatabase();

      await db.update('item', resident.toJson()..remove('id'),
          where: 'id=?', whereArgs: [resident.id]);

      return resident;
    } on DatabaseException catch (e) {
      log('$e');
      rethrow;
    }
  }

  Future<Database> _getDatabase() async {
    if (_database != null) return _database!;

    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'sigasi.db');

    final database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.transaction((trans) async {
          await trans.execute(createRoleTableQuery);

          await trans.execute(createDistrictTableQuery);

          await trans.execute(createVillageTableQuery);

          await trans.execute(createPopulationGroupQuery);

          await trans.execute(createItemCategoryTableQuery);

          await trans.execute(createItemTableQuery);

          await trans.execute(createResidentTableQuery);

          await trans.execute(createUserTableQuery);

          await trans.execute(createPostTableQuery);

          await trans.execute(createRequirementTableQuery);

          await trans.execute(createAssistanceTableQuery);

          await trans.execute(createAssistanceDetailTableQuery);
        });
      },
    );

    return database;
  }
}

const String createRoleTableQuery = '''
CREATE TABLE role (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT,
  created_at TEXT NOT NULL,
  updated_at TEXT NOT NULL
);

''';

const String createDistrictTableQuery = '''
CREATE TABLE district (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  created_at TEXT NOT NULL,
  updated_at TEXT NOT NULL
);
''';

const String createVillageTableQuery = '''
CREATE TABLE village (
  id INTEGER PRIMARY KEY,
  district_id INTEGER NOT NULL,
  name TEXT NOT NULL,
  latitude REAL,
  longtitude REAL,
  created_at TEXT NOT NULL,
  updated_at TEXT NOT NULL,
  FOREIGN KEY (district_id) REFERENCES district(id)
);
''';

const String createPopulationGroupQuery = '''
CREATE TABLE population_group (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT,
  created_at TEXT NOT NULL,
  updated_at TEXT NOT NULL
);
''';

const String createItemCategoryTableQuery = '''
CREATE TABLE item_category (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT,
    created_at TEXT NOT NULL,
    updated_at TEXT NOT NULL
);
''';

const String createItemTableQuery = '''
CREATE TABLE item (
    id INTEGER PRIMARY KEY,
    item_category_id INTEGER NOT NULL,
    name TEXT NOT NULL,
    description TEXT,
    created_at TEXT NOT NULL,
    updated_at TEXT NOT NULL,
    FOREIGN KEY (item_category_id) REFERENCES item(id)
);
''';

const String createResidentTableQuery = '''
CREATE TABLE resident (
    id INTEGER PRIMARY KEY,
    population_group_id INTEGER NOT NULL,
    village_id INTEGER NOT NULL,
    identity_number TEXT NOT NULL,
    name TEXT NOT NULL,
    gender TEXT NOT NULL CHECK (gender IN ('MALE', 'FEMALE')),
    birth_date TEXT NOT NULL,
    address TEXT NOT NULL,
    created_at TEXT NOT NULL,
    updated_at TEXT NOT NULL,
    FOREIGN KEY (population_group_id) REFERENCES population_group(id),
    FOREIGN KEY (village_id) REFERENCES village(id)
);
''';

const String createUserTableQuery = '''
CREATE TABLE user (
  id INTEGER PRIMARY KEY,
  role_id INTEGER NOT NULL,
  resident_id INTEGER NOT NULL,
  username TEXT NOT NULL,
  password_hash TEXT NOT NULL,
  created_at TEXT NOT NULL,
  updated_at TEXT NOT NULL,
  FOREIGN KEY (role_id) REFERENCES role(id),
  FOREIGN KEY (resident_id) REFERENCES resident(id)
);
''';

const String createPostTableQuery = '''
CREATE TABLE post (
  id INTEGER PRIMARY KEY,
  head_id INTEGER NOT NULL,
  name TEXT NOT NULL,
  location TEXT NOT NULL,
  problem TEXT NOT NULL,
  solution TEXT NOT NULL,
  created_at TEXT NOT NULL,
  updated_at TEXT NOT NULL,
  FOREIGN KEY (head_id) REFERENCES user(id)
);
''';

const String createRequirementTableQuery = '''
CREATE TABLE requirement (
    id INTEGER PRIMARY KEY,
    item_id INTEGER NOT NULL,
    post_id INTEGER NOT NULL,
    amount REAL NOT NULL,
    received REAL NOT NULL,
    last_updated_by INTEGER NOT NULL,
    created_at TEXT NOT NULL,
    updated_at TEXT NOT NULL,
    FOREIGN KEY (item_id) REFERENCES item(id),
    FOREIGN KEY (post_id) REFERENCES post(id),
    FOREIGN KEY (last_updated_by) REFERENCES user(id)
);
''';

const String createAssistanceTableQuery = '''
CREATE TABLE assistance (
    id INTEGER PRIMARY KEY,
    donor_id INTEGER NOT NULL,
    last_updated_by INTEGER NOT NULL,
    receive_date TEXT NOT NULL,
    created_at TEXT NOT NULL,
    updated_at TEXT NOT NULL,
    FOREIGN KEY (donor_id) REFERENCES user(id),
    FOREIGN KEY (last_updated_by) REFERENCES user(id)
);
''';

const String createAssistanceDetailTableQuery = '''
CREATE TABLE assistance_detail (
    id INTEGER PRIMARY KEY,
    assistance_id INTEGER NOT NULL,
    item_id INTEGER NOT NULL,
    amount REAL NOT NULL,
    FOREIGN KEY (assistance_id) REFERENCES assistance(id),
    FOREIGN KEY (item_id) REFERENCES item(id)
);
''';
