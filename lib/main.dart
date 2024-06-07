import 'dart:async';

import 'package:assessment_github_repos/github_repos_app.dart';
import 'package:flutter/widgets.dart';

Future<void> main() async {
  runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const GithubReposApp());
  }, (error, stackTrace) {
    // Handle error
    debugPrint('Caught error: $error');
    debugPrint('Stack trace: $stackTrace');
  });
}
