class FollowingUserStatus {
  FollowingUserStatus({
    required this.userId,
    this.iconUrl,
    required this.displayName,
    required this.statusMessage,
  });

  final String userId;
  final String displayName;
  final String? iconUrl;
  final String statusMessage;
}
