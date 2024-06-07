import '../../../feature/dashboard/data/model/github_repository_model.dart';

class GithubRepositoryDto {
  int? id;
  String? nodeId;
  String? name;
  String? fullName;
  bool? private;
  OwnerDto? owner;
  String? htmlUrl;
  String? description;
  bool? fork;
  String? url;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? pushedAt;
  String? gitUrl;
  String? sshUrl;
  String? cloneUrl;
  String? svnUrl;
  String? homepage;
  int? size;
  int? stargazersCount;
  int? watchersCount;
  String? language;
  bool? hasIssues;
  bool? hasProjects;
  bool? hasDownloads;
  bool? hasWiki;
  bool? hasPages;
  bool? hasDiscussions;
  int? forksCount;
  bool? archived;
  bool? disabled;
  int? openIssuesCount;
  LicenseDto? license;
  bool? allowForking;
  bool? isTemplate;
  bool? webCommitSignoffRequired;
  String? visibility;
  int? forks;
  int? openIssues;
  int? watchers;
  String? defaultBranch;
  double? score;
  List<String>? topics;

  GithubRepositoryDto(
      {this.id,
      this.nodeId,
      this.name,
      this.fullName,
      this.private,
      this.owner,
      this.htmlUrl,
      this.description,
      this.fork,
      this.url,
      this.createdAt,
      this.updatedAt,
      this.pushedAt,
      this.gitUrl,
      this.sshUrl,
      this.cloneUrl,
      this.svnUrl,
      this.homepage,
      this.size,
      this.stargazersCount,
      this.watchersCount,
      this.language,
      this.hasIssues,
      this.hasProjects,
      this.hasDownloads,
      this.hasWiki,
      this.hasPages,
      this.hasDiscussions,
      this.forksCount,
      this.archived,
      this.disabled,
      this.openIssuesCount,
      this.license,
      this.allowForking,
      this.isTemplate,
      this.webCommitSignoffRequired,
      this.visibility,
      this.forks,
      this.openIssues,
      this.watchers,
      this.defaultBranch,
      this.score,
      this.topics});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'node_id': nodeId,
      'name': name,
      'full_name': fullName,
      'private': private != null ? (private! ? 1 : 0) : null,
      'html_url': htmlUrl,
      'description': description,
      'fork': fork != null ? (fork! ? 1 : 0) : null,
      'url': url,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'pushed_at': pushedAt?.toIso8601String(),
      'git_url': gitUrl,
      'ssh_url': sshUrl,
      'clone_url': cloneUrl,
      'svn_url': svnUrl,
      'homepage': homepage,
      'size': size,
      'stargazers_count': stargazersCount,
      'watchers_count': watchersCount,
      'language': language,
      'has_issues': hasIssues != null ? (hasIssues! ? 1 : 0) : null,
      'has_projects': hasProjects != null ? (hasProjects! ? 1 : 0) : null,
      'has_downloads': hasDownloads != null ? (hasDownloads! ? 1 : 0) : null,
      'has_wiki': hasWiki != null ? (hasWiki! ? 1 : 0) : null,
      'has_pages': hasPages != null ? (hasPages! ? 1 : 0) : null,
      'has_discussions':
          hasDiscussions != null ? (hasDiscussions! ? 1 : 0) : null,
      'forks_count': forksCount,
      'archived': archived != null ? (archived! ? 1 : 0) : null,
      'disabled': disabled != null ? (disabled! ? 1 : 0) : null,
      'open_issues_count': openIssuesCount,
      'allow_forking': allowForking != null ? (allowForking! ? 1 : 0) : null,
      'is_template': isTemplate != null ? (isTemplate! ? 1 : 0) : null,
      'web_commit_signoff_required': webCommitSignoffRequired != null
          ? (webCommitSignoffRequired! ? 1 : 0)
          : null,
      'visibility': visibility,
      'forks': forks,
      'open_issues': openIssues,
      'watchers': watchers,
      'default_branch': defaultBranch,
      'score': score,
    };
  }

  factory GithubRepositoryDto.fromMap(Map<String, dynamic> map) {
    return GithubRepositoryDto(
      id: map['id'] as int?,
      nodeId: map['node_id'] as String?,
      name: map['name'] as String?,
      fullName: map['full_name'] as String?,
      private: map['private'] != null ? (map['private'] == 1) : null,
      htmlUrl: map['html_url'] as String?,
      description: map['description'] as String?,
      fork: map['fork'] != null ? (map['fork'] == 1) : null,
      url: map['url'] as String?,
      createdAt:
          map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updatedAt:
          map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
      pushedAt:
          map['pushed_at'] != null ? DateTime.parse(map['pushed_at']) : null,
      gitUrl: map['git_url'] as String?,
      sshUrl: map['ssh_url'] as String?,
      cloneUrl: map['clone_url'] as String?,
      svnUrl: map['svn_url'] as String?,
      homepage: map['homepage'] as String?,
      size: map['size'] as int?,
      stargazersCount: map['stargazers_count'] as int?,
      watchersCount: map['watchers_count'] as int?,
      language: map['language'] as String?,
      hasIssues: map['has_issues'] != null ? (map['has_issues'] == 1) : null,
      hasProjects:
          map['has_projects'] != null ? (map['has_projects'] == 1) : null,
      hasDownloads:
          map['has_downloads'] != null ? (map['has_downloads'] == 1) : null,
      hasWiki: map['has_wiki'] != null ? (map['has_wiki'] == 1) : null,
      hasPages: map['has_pages'] != null ? (map['has_pages'] == 1) : null,
      hasDiscussions:
          map['has_discussions'] != null ? (map['has_discussions'] == 1) : null,
      forksCount: map['forks_count'] as int?,
      archived: map['archived'] != null ? (map['archived'] == 1) : null,
      disabled: map['disabled'] != null ? (map['disabled'] == 1) : null,
      openIssuesCount: map['open_issues_count'] as int?,
      allowForking:
          map['allow_forking'] != null ? (map['allow_forking'] == 1) : null,
      isTemplate: map['is_template'] != null ? (map['is_template'] == 1) : null,
      webCommitSignoffRequired: map['web_commit_signoff_required'] != null
          ? (map['web_commit_signoff_required'] == 1)
          : null,
      visibility: map['visibility'] as String?,
      forks: map['forks'] as int?,
      openIssues: map['open_issues'] as int?,
      watchers: map['watchers'] as int?,
      defaultBranch: map['default_branch'] as String?,
      score: map['score'] as double?,
    );
  }

  GithubRepositoryDto.fromModel(GithubRepositoryModel model)
      : id = model.id,
        nodeId = model.nodeId,
        name = model.name,
        fullName = model.fullName,
        private = model.private,
        owner = model.owner != null ? OwnerDto.fromModel(model.owner!) : null,
        htmlUrl = model.htmlUrl,
        description = model.description,
        fork = model.fork,
        url = model.url,
        createdAt = model.createdAt,
        updatedAt = model.updatedAt,
        pushedAt = model.pushedAt,
        gitUrl = model.gitUrl,
        sshUrl = model.sshUrl,
        cloneUrl = model.cloneUrl,
        svnUrl = model.svnUrl,
        homepage = model.homepage,
        size = model.size,
        stargazersCount = model.stargazersCount,
        watchersCount = model.watchersCount,
        language = model.language,
        hasIssues = model.hasIssues,
        hasProjects = model.hasProjects,
        hasDownloads = model.hasDownloads,
        hasWiki = model.hasWiki,
        hasPages = model.hasPages,
        hasDiscussions = model.hasDiscussions,
        forksCount = model.forksCount,
        archived = model.archived,
        disabled = model.disabled,
        openIssuesCount = model.openIssuesCount,
        license =
            model.license != null ? LicenseDto.fromModel(model.license!) : null,
        allowForking = model.allowForking,
        isTemplate = model.isTemplate,
        webCommitSignoffRequired = model.webCommitSignoffRequired,
        visibility = model.visibility,
        forks = model.forks,
        openIssues = model.openIssues,
        watchers = model.watchers,
        defaultBranch = model.defaultBranch,
        score = model.score,
        topics = model.topics;
}

class OwnerDto {
  int? repoId;
  String? login;
  int? id;
  String? nodeId;
  String? avatarUrl;
  String? url;
  String? htmlUrl;
  String? followersUrl;
  String? followingUrl;
  String? gistsUrl;
  String? starredUrl;
  String? subscriptionsUrl;
  String? organizationsUrl;
  String? reposUrl;
  String? eventsUrl;
  String? receivedEventsUrl;
  String? type;
  bool? siteAdmin;

  OwnerDto({
    this.repoId,
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.siteAdmin,
  });

  Map<String, dynamic> toMap() {
    return {
      'repo_id': repoId,
      'login': login,
      'id': id,
      'node_id': nodeId,
      'avatar_url': avatarUrl,
      'url': url,
      'html_url': htmlUrl,
      'followers_url': followersUrl,
      'following_url': followingUrl,
      'gists_url': gistsUrl,
      'starred_url': starredUrl,
      'subscriptions_url': subscriptionsUrl,
      'organizations_url': organizationsUrl,
      'repos_url': reposUrl,
      'events_url': eventsUrl,
      'received_events_url': receivedEventsUrl,
      'type': type,
      'site_admin': siteAdmin != null ? (siteAdmin! ? 1 : 0) : null,
    };
  }

  factory OwnerDto.fromMap(Map<String, dynamic> map) {
    return OwnerDto(
      repoId: map['repo_id'] as int?,
      login: map['login'] as String?,
      id: map['id'] as int?,
      nodeId: map['node_id'] as String?,
      avatarUrl: map['avatar_url'] as String?,
      url: map['url'] as String?,
      htmlUrl: map['html_url'] as String?,
      followersUrl: map['followers_url'] as String?,
      followingUrl: map['following_url'] as String?,
      gistsUrl: map['gists_url'] as String?,
      starredUrl: map['starred_url'] as String?,
      subscriptionsUrl: map['subscriptions_url'] as String?,
      organizationsUrl: map['organizations_url'] as String?,
      reposUrl: map['repos_url'] as String?,
      eventsUrl: map['events_url'] as String?,
      receivedEventsUrl: map['received_events_url'] as String?,
      type: map['type'] as String?,
      siteAdmin: map['site_admin'] != null ? (map['site_admin'] == 1) : null,
    );
  }

  OwnerDto.fromModel(OwnerModel model)
      : repoId = null, // No corresponding field in Model
        login = model.login,
        id = model.id,
        nodeId = model.nodeId,
        avatarUrl = model.avatarUrl,
        url = model.url,
        htmlUrl = model.htmlUrl,
        followersUrl = model.followersUrl,
        followingUrl = model.followingUrl,
        gistsUrl = model.gistsUrl,
        starredUrl = model.starredUrl,
        subscriptionsUrl = model.subscriptionsUrl,
        organizationsUrl = model.organizationsUrl,
        reposUrl = model.reposUrl,
        eventsUrl = model.eventsUrl,
        receivedEventsUrl = model.receivedEventsUrl,
        type = model.type,
        siteAdmin = model.siteAdmin;
}

class LicenseDto {
  int? repoId;
  String? key;
  String? name;
  String? spdxId;
  String? url;
  String? nodeId;

  LicenseDto({
    this.repoId,
    this.key,
    this.name,
    this.spdxId,
    this.url,
    this.nodeId,
  });

  Map<String, dynamic> toMap() {
    return {
      'repo_id': repoId,
      'key': key,
      'name': name,
      'spdx_id': spdxId,
      'url': url,
      'node_id': nodeId,
    };
  }

  factory LicenseDto.fromMap(Map<String, dynamic> map) {
    return LicenseDto(
      repoId: map['repo_id'] as int?,
      key: map['key'] as String?,
      name: map['name'] as String?,
      spdxId: map['spdx_id'] as String?,
      url: map['url'] as String?,
      nodeId: map['node_id'] as String?,
    );
  }

  LicenseDto.fromModel(LicenseModel model)
      : repoId = null, // No corresponding field in Model
        key = model.key,
        name = model.name,
        spdxId = model.spdxId,
        url = model.url,
        nodeId = model.nodeId;
}

class TopicDto {
  int? repoId;
  String? topic;

  TopicDto({this.repoId, this.topic});

  Map<String, dynamic> toMap() {
    return {'repo_id': repoId, 'topic': topic};
  }

  factory TopicDto.fromMap(Map<String, dynamic> map) {
    return TopicDto(
      repoId: map['repo_id'] as int?,
      topic: map['topic'] as String?,
    );
  }
}
