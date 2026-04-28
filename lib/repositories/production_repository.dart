import 'package:watchlist_plus/data/database_helper.dart';
import 'package:watchlist_plus/models/production.dart';

class ProductionRepository {
  final _db = DatabaseHelper.instance;

  Future<List<Production>> findAll() => _db.findAllProductions();

  Future<Production> insert(Production production) =>
      _db.insertProduction(production);

  Future<void> update(Production production) =>
      _db.updateProduction(production);

  Future<void> delete(int id) => _db.deleteProduction(id);

  Future<void> deleteAll() => _db.deleteAllProductions();
}
