class PostsModel {
  final String userName;
  final String userProfilePic;
  final String postPic;
  final int commentsNo;
  final int likes;

  PostsModel({
    required this.userName,
    required this.postPic,
    required this.commentsNo,
    required this.likes,
    required this.userProfilePic,
  });
}
