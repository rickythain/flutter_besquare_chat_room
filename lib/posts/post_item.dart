import 'package:besquare_chat_room/model/api_result_posts.dart';
import 'package:besquare_chat_room/post/full_post.dart';
import 'package:flutter/material.dart';

class PostItem extends StatefulWidget {
  // const PostItem({Key? key}) : super(key: key);
  Post post;
  PostItem({Key? key, required this.post}) : super(key: key);

  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Material(
          child: InkWell(
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              // textDirection: TextDirection.ltr,
              children: [
                Expanded(
                  child: Image.network(
                    widget.post.image ??
                        'https://media.istockphoto.com/vectors/no-image-vector-symbol-missing-available-icon-no-gallery-for-this-vector-id1199024795?b=1&k=20&m=1199024795&s=170667a&w=0&h=DTSoNLtBG8cvnopNM2NGhNZhFtmbJfFrRTddcmhT2KE=',
                    errorBuilder: (context, error, stackTrace) {
                      return Text('whoops!');
                    },
                    fit: BoxFit.cover,
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(widget.post.title ?? 'no title'),
                      Text((widget.post.date ?? 'no date').toString()),
                      Text(
                        widget.post.description ?? 'no description',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                  ),
                  flex: 3,
                )
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FullPostPage(
                          post: widget.post,
                        )),
              );
            },
          ),
          color: Colors.transparent,
        ),
        color: Colors.lightBlue,
        height: 100,
      ),
    );
  }
}
