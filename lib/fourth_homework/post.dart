import 'package:hive/hive.dart';

part 'post.g.dart';

@HiveType(typeId: 0)
class Post extends HiveObject{
  Post({
    required this.authorName,
    required this.authorAvatar,
    required this.mediaList,
    required this.likesCount,
    required this.description,
    required this.isLiked
  });

  @HiveField(0)
  String authorName;
  @HiveField(1)
  String authorAvatar;
  @HiveField(2)
  List<String> mediaList;
  @HiveField(3)
  int likesCount;
  @HiveField(4)
  String description;
  @HiveField(5)
  bool isLiked;
}

@HiveType(typeId: 1)
class PostContainer {
  @HiveField(0)
  List<Post> posts;

  PostContainer({
    required this.posts,
  });
}