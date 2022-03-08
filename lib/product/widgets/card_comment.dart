import 'package:flutter/material.dart';

import '../../feature/comment/model/comment_model.dart';

class CommentCard extends StatelessWidget {
  final CommentModel? model;
  const CommentCard({
    Key? key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _elevationCard = 10;

    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
      child: Card(
        elevation: _elevationCard,
        child: ListTile(
          leading: Text(model?.id.toString() ?? ''),
          title: Text(model?.body ?? ''),
          subtitle: Text(model?.email ?? ''),
        ),
      ),
    );
  }
}
