import 'package:bloc_statemanagement/feature/comment/model/comment_model.dart';
import 'package:vexana/vexana.dart';

abstract class ICommentService {
  final INetworkManager manager;

  ICommentService(this.manager);
  Future<List<CommentModel>?> fetchCommentData();
}

class CommentService extends ICommentService {
  CommentService(INetworkManager manager) : super(manager);

  @override
  Future<List<CommentModel>?> fetchCommentData() async {
    final response = await manager.send<CommentModel, List<CommentModel>?>(
        NetworkPath.comment.rawValue(),
        parseModel: CommentModel(),
        method: RequestType.GET);
    return response.data ?? [];
  }
}

enum NetworkPath { comment }

extension NetworkPathExtention on NetworkPath {
  String rawValue() {
    switch (this) {
      case NetworkPath.comment:
        return '/comments';
      default:
        throw Exception('Routes Not Found');
    }
  }
}
