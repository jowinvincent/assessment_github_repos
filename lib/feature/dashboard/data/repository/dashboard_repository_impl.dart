import 'package:assessment_github_repos/feature/dashboard/data/model/github_repository_model.dart';
import 'package:assessment_github_repos/feature/dashboard/data/sources/dashboard_local_data_source.dart';
import 'package:assessment_github_repos/feature/dashboard/data/sources/dashboard_remote_data_source.dart';

import '../../domain/repository/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource remoteDataSource;
  final DashboardLocalDataSource localDataSource;

  DashboardRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<GithubRepositoryModel>> fetchGithubRepositories(
      {bool isRefresh = false}) async {
    List<GithubRepositoryModel> repos = [];
    try {
      repos =
          await remoteDataSource.fetchGithubRepositories(isRefresh: isRefresh);
      await localDataSource.saveGithubRepositories(repos);
      return await localDataSource.getAllGithubRepositories();
    } catch (e) {
      repos = await localDataSource.getAllGithubRepositories();
    }
    return repos;
  }
}
