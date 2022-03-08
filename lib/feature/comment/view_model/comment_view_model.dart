import 'package:bloc/bloc.dart';
import 'package:bloc_statemanagement/feature/comment/service/comment_service.dart';

import '../model/comment_model.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit(this.commmentService) : super(CommentsInitial()) {
    fetchLisData(); //init()
  }

  ICommentService commmentService;
  List<CommentModel>? model;
  int? listCount = 0;
  Future<void> fetchLisData() async {
    emit(CommentLoading());
    final model = await commmentService.fetchCommentData();
    listCount = model?.length;
    emit(CommentComplete(model));
  }
}

abstract class CommentState {}

class CommentsInitial extends CommentState {}

class CommentLoading extends CommentState {}

class CommentComplete extends CommentState {
  final List<CommentModel>? items;

  CommentComplete(this.items);
}

class CommentErrorState extends CommentState {}
