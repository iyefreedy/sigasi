import '../domain/models/district/district.dart';
import '../domain/models/item/item.dart';
import '../domain/models/item_category/item_category.dart';
import '../domain/models/population_group/population_group.dart';
import '../domain/models/resident/resident.dart';
import '../domain/models/village/village.dart';

abstract class DataService {
  Future<List<District>> allDistricts();
  Future<District> findDistrictById(int id);
  Future<District> saveDistrict(District district);
  Future<void> deleteDistrict(int id);

  Future<List<Village>> allVillages();
  Future<Village> findVillageById(int id);
  Future<Village> createVillage(Village village);
  Future<Village> updateVillage(Village village);
  Future<void> deleteVillage(int id);

  Future<List<PopulationGroup>> allPopulationGroups();
  Future<PopulationGroup> findPopulationGroupById(int id);
  Future<PopulationGroup> createPopulationGroup(
      PopulationGroup populationGroup);
  Future<PopulationGroup> updatePopulationGroup(
      PopulationGroup populationGroup);
  Future<void> deletePopulationGroup(int id);

  Future<List<ItemCategory>> allItemCategories();
  Future<ItemCategory> findItemCategoryById(int id);
  Future<ItemCategory> createItemCategory(ItemCategory itemType);
  Future<ItemCategory> updateItemCategory(ItemCategory itemType);
  Future<void> deleteItemCategory(int id);

  Future<List<Item>> allItems();
  Future<Item> getItemById(int id);
  Future<Item> createItem(Item item);
  Future<Item> updateItem(Item item);
  Future<void> deleteItem(int id);

  Future<List<Resident>> allResidents();
  Future<Resident> findResidentById(int id);
  Future<Resident> createResident(Resident resident);
  Future<Resident> updateResident(Resident resident);
  Future<void> deleteResident(int id);
}
