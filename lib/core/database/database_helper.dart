import 'package:assessment_github_repos/core/database/dto/github_repository_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../feature/dashboard/data/model/github_repository_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> database() async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'github_repository.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    final batch = db.batch();
    batch.execute('''
      CREATE TABLE IF NOT EXISTS github_repository (
        id INTEGER PRIMARY KEY,
        node_id TEXT,
        name TEXT,
        full_name TEXT,
        private INTEGER,
        html_url TEXT,
        description TEXT,
        fork INTEGER,
        url TEXT,
        created_at TEXT,
        updated_at TEXT,
        pushed_at TEXT,
        git_url TEXT,
        ssh_url TEXT,
        clone_url TEXT,
        svn_url TEXT,
        homepage TEXT,
        size INTEGER,
        stargazers_count INTEGER,
        watchers_count INTEGER,
        language TEXT,
        has_issues INTEGER,
        has_projects INTEGER,
        has_downloads INTEGER,
        has_wiki INTEGER,
        has_pages INTEGER,
        has_discussions INTEGER,
        forks_count INTEGER,
        archived INTEGER,
        disabled INTEGER,
        open_issues_count INTEGER,
        allow_forking INTEGER,
        is_template INTEGER,
        web_commit_signoff_required INTEGER,
        visibility TEXT,
        forks INTEGER,
        open_issues INTEGER,
        watchers INTEGER,
        default_branch TEXT,
        score REAL
      )
    ''');

    batch.execute('''
      CREATE TABLE IF NOT EXISTS owner (
        repo_id INTEGER PRIMARY KEY,
        login TEXT,
        id INTEGER,
        node_id TEXT,
        avatar_url TEXT,
        url TEXT,
        html_url TEXT,
        followers_url TEXT,
        following_url TEXT,
        gists_url TEXT,
        starred_url TEXT,
        subscriptions_url TEXT,
        organizations_url TEXT,
        repos_url TEXT,
        events_url TEXT,
        received_events_url TEXT,
        type TEXT,
        site_admin INTEGER
      )
    ''');

    batch.execute('''
      CREATE TABLE IF NOT EXISTS license (
        repo_id INTEGER PRIMARY KEY,
        key TEXT,
        name TEXT,
        spdx_id TEXT,
        url TEXT,
        node_id TEXT
      )
    ''');

    batch.execute('''
      CREATE TABLE IF NOT EXISTS topics (
        repo_id INTEGER,
        topic TEXT
      )
    ''');

    await batch.commit(
      noResult: true,
    );
  }

  Future<int> createGithubRepository(GithubRepositoryModel repository) async {
    final db = await database();
    return await db.insert('github_repository', repository.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<GithubRepositoryModel?> readGithubRepository(int id) async {
    final db = await database();
    final maps = await db.query(
      'github_repository',
      columns: [
        'id',
        'node_id',
        'name',
        'full_name',
        'private',
        'owner',
        'html_url',
        'description',
        'fork',
        'url',
        'created_at',
        'updated_at',
        'pushed_at',
        'git_url',
        'ssh_url',
        'clone_url',
        'svn_url',
        'homepage',
        'size',
        'stargazers_count',
        'watchers_count',
        'language',
        'has_issues',
        'has_projects',
        'has_downloads',
        'has_wiki',
        'has_pages',
        'has_discussions',
        'forks_count',
        'archived',
        'disabled',
        'open_issues_count',
        'license',
        'allow_forking',
        'is_template',
        'web_commit_signoff_required',
        'topics',
        'visibility',
        'forks',
        'open_issues',
        'watchers',
        'default_branch',
        'score'
      ],
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return GithubRepositoryModel.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<List<GithubRepositoryModel>> readAllGithubRepositories() async {
    List<GithubRepositoryDto> repos = [];
    OwnerDto? owner;
    List<LicenseDto>? license;
    List<String> topics = [];
    final db = await database();
    final reposResult = await db.query('github_repository');
    repos =
        reposResult.map((json) => GithubRepositoryDto.fromMap(json)).toList();
    for (var repo in repos) {
      final ownerResult =
          await db.query('owner', where: 'repo_id = ${repo.id}');
      owner = ownerResult.map((json) => OwnerDto.fromMap(json)).toList().first;
      repo.owner = owner;

      final licenseResult =
          await db.query('license', where: 'repo_id = ${repo.id}');
      license = licenseResult.map((json) => LicenseDto.fromMap(json)).toList();
      repo.license = license.isNotEmpty ? license.first : null;

      final topicsResult =
          await db.query('topics', where: 'repo_id = ${repo.id}');
      topicsResult.map((json) => topics.add(json['topic'] as String));
      repo.topics = topics;
    }
    return repos.map((dto) => GithubRepositoryModel.fromDto(dto)).toList();
  }

  Future<int> updateGithubRepository(GithubRepositoryModel repository) async {
    final db = await database();
    return db.update(
      'github_repository',
      repository.toMap(),
      where: 'id = ?',
      whereArgs: [repository.id],
    );
  }

  Future<int> deleteGithubRepository(int id) async {
    final db = await database();
    return await db.delete(
      'github_repository',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> createGithubRepositories(
      List<GithubRepositoryModel> repos) async {
    // use compute or isolate for more complex task
    List<GithubRepositoryDto> repoDtos = [];
    for (var repo in repos) {
      repoDtos.add(GithubRepositoryDto.fromModel(repo));
    }
    final db = await database();
    await db.transaction((txn) async {
      Batch batch = txn.batch();
      batch.delete('github_repository');
      batch.delete('owner');
      batch.delete('license');
      batch.delete('topics');
      for (var repoDto in repoDtos) {
        repoDto.owner?.repoId = repoDto.id;
        repoDto.license?.repoId = repoDto.id;
        batch.insert(
          'github_repository',
          repoDto.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
        if (repoDto.owner != null) {
          batch.insert(
            'owner',
            repoDto.owner!.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        }
        if (repoDto.license != null) {
          batch.insert(
            'license',
            repoDto.license!.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        }
        if (repoDto.topics != null && repoDto.topics!.isNotEmpty) {
          for (var topic in repoDto.topics!) {
            TopicDto topicDto = TopicDto(repoId: repoDto.id, topic: topic);
            batch.insert(
              'topics',
              topicDto.toMap(),
              conflictAlgorithm: ConflictAlgorithm.replace,
            );
          }
        }
      }
      await batch.commit(noResult: true);
    }).catchError((error) {
      // Handle any errors that occur during the transaction
      debugPrint('Error inserting repositories: $error');
      // You can also rethrow the error or handle it in a way that makes sense for your app
    });
  }
}
