import 'package:assessment_github_repos/feature/dashboard/application/github_repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'feature/dashboard/presentation/dashboard_page.dart';

class GithubReposApp extends StatelessWidget {
  const GithubReposApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DashboardRepositoryProvider()..fetchRepositories(),
      child: MaterialApp(
        title: "Github Repos App",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        debugShowCheckedModeBanner: false,
        home: const DashboardPage(),
      ),
    );
  }
}
