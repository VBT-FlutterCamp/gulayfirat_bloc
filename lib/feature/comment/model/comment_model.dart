import 'package:vexana/vexana.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment_model.g.dart';

@JsonSerializable()
class CommentModel extends INetworkModel<CommentModel> {
  CommentModel({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  @override
  CommentModel fromJson(Map<String, dynamic> json) {
    return _$CommentModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$CommentModelToJson(this);
  }
}
