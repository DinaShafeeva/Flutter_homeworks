// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostAdapter extends TypeAdapter<Post> {
  @override
  final int typeId = 0;

  @override
  Post read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Post(
      authorName: fields[0] as String,
      authorAvatar: fields[1] as String,
      mediaList: (fields[2] as List).cast<String>(),
      likesCount: fields[3] as int,
      description: fields[4] as String,
      isLiked: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Post obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.authorName)
      ..writeByte(1)
      ..write(obj.authorAvatar)
      ..writeByte(2)
      ..write(obj.mediaList)
      ..writeByte(3)
      ..write(obj.likesCount)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.isLiked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PostContainerAdapter extends TypeAdapter<PostContainer> {
  @override
  final int typeId = 1;

  @override
  PostContainer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PostContainer(
      posts: (fields[0] as List).cast<Post>(),
    );
  }

  @override
  void write(BinaryWriter writer, PostContainer obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.posts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostContainerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
