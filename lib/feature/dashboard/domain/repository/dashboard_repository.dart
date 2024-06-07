import '../../data/model/github_repository_model.dart';

abstract class DashboardRepository {
  Future<List<GithubRepositoryModel>> fetchGithubRepositories(
      {bool isRefresh = false});
}
