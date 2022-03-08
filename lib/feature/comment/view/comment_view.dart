import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/network/network_service.dart';
import '../../../product/widgets/card_comment.dart';
import '../service/comment_service.dart';
import '../view_model/comment_view_model.dart';

class CommentView extends StatelessWidget {
  const CommentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CommentCubit(CommentService(NetworkService.instace.networkManager)),
      child: BlocConsumer<CommentCubit, CommentState>(
        listener: (context, state) {
          if (state is CommentErrorState) {
            showModalBottomSheet(
                context: context, builder: (context) => const Text('Hataa'));
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(context.watch<CommentCubit>().listCount.toString()),
            ),
            body: builListBody(state),
          );
        },
      ),
    );
  }

  Widget builListBody(CommentState state) {
    if (state is CommentLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is CommentComplete) {
      return ListView.builder(
          itemCount: state.items?.length,
          itemBuilder: (BuildContext context, int index) {
            return CommentCard(model: state.items?[index]);
          });
    } else {
      return const Text('hata');
    }
  }
}
