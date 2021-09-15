class PostEntity {
  final String userName;
  final String caption;
  final String timeAgo;
  final List<dynamic> imageUrl;
  final List<dynamic> commentsText;
  final List<dynamic> usersOfComments;
  final int likes;
  final int comments;
  final int shares;

  const PostEntity(
      {required this.userName,
      required this.caption,
      required this.timeAgo,
      required this.imageUrl,
      required this.likes,
      required this.comments,
      required this.shares,
      required this.commentsText,
      required this.usersOfComments});
}
