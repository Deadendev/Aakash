class RepoService {
  static Future<void> createRepo({
    required String name,
    required String description,
    required bool isPublic,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    // In a real implementation, this would call the GitHub API.
    // For now, we just simulate success.
    print('Simulated creation of repo: $name (public: $isPublic)');
  }
}