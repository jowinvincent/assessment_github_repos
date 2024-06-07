import 'package:assessment_github_repos/feature/dashboard/application/github_repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GitHub Repositories'),
      ),
      body: Consumer<DashboardRepositoryProvider>(
        builder: (ctx, repoProvider, _) {
          return RefreshIndicator(
            onRefresh: () => repoProvider.fetchRepositories(isRefresh: true),
            child: repoProvider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : repoProvider.repositories.isNotEmpty
                    ? ListView.separated(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: repoProvider.repositories.length,
                        itemBuilder: (ctx, i) {
                          return ListTile(
                            title:
                                Text(repoProvider.repositories[i].name ?? ""),
                            subtitle: Text(
                                repoProvider.repositories[i].description ?? ""),
                            trailing: Text(
                                '${repoProvider.repositories[i].stargazersCount ?? 0} ⭐'),
                            onTap: () {
                              // You can add more detailed view here
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(
                            height: 4,
                          );
                        },
                      )
                    : ListView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: const [
                          Center(
                            child: Text("No results found"),
                          ),
                        ],
                      ),
          );
        },
      ),
    );
  }
}
