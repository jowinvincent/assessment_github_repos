import 'package:assessment_github_repos/feature/dashboard/data/model/github_repository_model.dart';
import 'package:assessment_github_repos/feature/dashboard/data/repository/dashboard_repository_impl.dart';
import 'package:assessment_github_repos/feature/dashboard/data/sources/dashboard_local_data_source.dart';
import 'package:assessment_github_repos/feature/dashboard/data/sources/dashboard_remote_data_source.dart';
import 'package:flutter/material.dart';

class DashboardRepositoryProvider with ChangeNotifier {
  final dashboardRepository = DashboardRepositoryImpl(
    remoteDataSource: DashboardRemoteDataSourceImpl(),
    localDataSource: DashboardLocalDataSourceImpl(),
  );
  List<GithubRepositoryModel> _repositories = [];
  bool _isLoading = false;
  List<GithubRepositoryModel> get repositories => _repositories;
  bool get isLoading => _isLoading;

  Future<void> fetchRepositories({bool isRefresh = false}) async {
    _isLoading = true;
    notifyListeners();
    try {
      _repositories = await dashboardRepository.fetchGithubRepositories(
          isRefresh: isRefresh);
    } catch (error) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
