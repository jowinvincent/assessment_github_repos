import 'package:assessment_github_repos/core/network/api_config.dart';
import 'package:assessment_github_repos/core/network/network_service.dart';
import 'package:assessment_github_repos/feature/dashboard/data/model/github_repository_model.dart';
import 'package:intl/intl.dart';

abstract class DashboardRemoteDataSource {
  Future<List<GithubRepositoryModel>> fetchGithubRepositories(
      {bool isRefresh = false});
}

class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final NetworkService _networkService =
      NetworkService(baseUrl: ApiConfig.baseUrl);

  @override
  Future<List<GithubRepositoryModel>> fetchGithubRepositories(
      {bool isRefresh = false}) async {
    String date = "2022-04-29";
    String prefix = isRefresh ? ">" : "%3E";
    if (isRefresh) {
      // final currentDate = DateTime.now().toIso8601String().split('T').first;
      DateTime now = DateTime.now();
      DateFormat formatter = DateFormat('yyyy-MM-dd');
      date = formatter.format(now);
    }
    final response = await _networkService.get(
        "/search/repositories?q=created:$prefix$date&sort=stars&order=desc");
    if (response.statusCode == 200) {
      Map<String, dynamic> items = response.data;
      return (items["items"] as List<dynamic>?)
              ?.map((item) => GithubRepositoryModel.fromMap(item))
              .toList() ??
          [];
    } else {
      // Error handling based on app use case.
      return [];
    }
  }
}
