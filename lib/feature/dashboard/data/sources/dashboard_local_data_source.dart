import 'package:assessment_github_repos/feature/dashboard/data/model/github_repository_model.dart';

import '../../../../core/database/database_helper.dart';

abstract class DashboardLocalDataSource {
  Future<int> saveGithubRepository(GithubRepositoryModel repository);
  Future<GithubRepositoryModel?> getGithubRepository(int id);
  Future<int> updateGithubRepository(GithubRepositoryModel repository);
  Future<List<GithubRepositoryModel>> getAllGithubRepositories();
  Future<int> deleteGithubRepository(int id);
  Future<void> saveGithubRepositories(List<GithubRepositoryModel> repos);
}

class DashboardLocalDataSourceImpl implements DashboardLocalDataSource {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  Future<int> saveGithubRepository(GithubRepositoryModel repository) async {
    return await _dbHelper.createGithubRepository(repository);
  }

  @override
  Future<GithubRepositoryModel?> getGithubRepository(int id) async {
    return await _dbHelper.readGithubRepository(id);
  }

  @override
  Future<int> updateGithubRepository(GithubRepositoryModel repository) async {
    return await _dbHelper.updateGithubRepository(repository);
  }

  @override
  Future<List<GithubRepositoryModel>> getAllGithubRepositories() async {
    return await _dbHelper.readAllGithubRepositories();
  }

  @override
  Future<int> deleteGithubRepository(int id) async {
    return await _dbHelper.deleteGithubRepository(id);
  }

  @override
  Future<void> saveGithubRepositories(List<GithubRepositoryModel> repos) async {
    return await _dbHelper.createGithubRepositories(repos);
  }
}
