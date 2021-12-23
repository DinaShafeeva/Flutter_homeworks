import 'package:fl_homework/fourth_homework/post.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';

part 'store.g.dart';

class PostsStore = _PostsStore with _$PostsStore;

abstract class _PostsStore with Store {

  late Box box;

  _PostsStore() {
    initiallizeHive();
    fetchPosts();
  }

  initiallizeHive() async {
    box = Hive.box<PostContainer>('post');
  }

  @observable
  ObservableList<Post> posts = ObservableList.of([]);

  @action
  void fetchPosts() {
    PostContainer? container = box.get('post', defaultValue: null);
    if (container != null) {
      posts = ObservableList.of(container.posts);
    } else {
      final postsList = <Post>[
        Post(
            authorName: 'Dina',
            authorAvatar: 'resources/images/cute_cat.jpg',
            mediaList: ['resources/images/deny_cat.jpg', 'resources/images/deny_cat.jpg'],
            description: 'Огромная домашка. Стадия 1. Отрицание.',
            likesCount: 10,
            isLiked: false
        ),
        Post(
            authorName: 'Dina',
            authorAvatar: 'resources/images/cute_cat.jpg',
            mediaList: ['resources/images/angry_cat.jpg', 'resources/images/angry_cat.jpg'],
            description: 'Огромная домашка. Стадия 2. Гнев.',
            likesCount: 5,
            isLiked: false
        ),
        Post(
            authorName: 'Dina',
            authorAvatar: 'resources/images/cute_cat.jpg',
            mediaList: ['resources/images/tired_cat.jpeg', 'resources/images/tired_cat.jpeg'],
            description: 'Огромная домашка. Стадия 3. Принятие.',
            likesCount: 35,
            isLiked: false
        ),
      ];
      PostContainer postContainer = PostContainer(posts: postsList);
      box.put('post', postContainer);
      fetchPosts();
    }
  }

  @action
  addPost(String media, String description) {
    Post newPost = Post(
      authorName: 'Dina',
      authorAvatar: 'resources/images/cute_cat.jpg',
      mediaList: [media],
      description: description,
      likesCount: 0,
      isLiked: false
    );
    posts.insert(0, newPost);
    PostContainer postContainer = PostContainer(posts: posts);
    box.put('post', postContainer);
  }
}