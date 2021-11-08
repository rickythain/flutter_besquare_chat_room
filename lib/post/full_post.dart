import 'package:besquare_chat_room/model/api_result_posts.dart';
import 'package:flutter/material.dart';

class FullPostPage extends StatefulWidget {
  // const FullPostPage({Key? key}) : super(key: key);
  Post post;
  FullPostPage({Key? key, required this.post}) : super(key: key);

  @override
  _FullPostPageState createState() => _FullPostPageState();
}

class _FullPostPageState extends State<FullPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Post'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: Image.network(
                    widget.post.image ??
                        'https://media.istockphoto.com/vectors/no-image-vector-symbol-missing-available-icon-no-gallery-for-this-vector-id1199024795?b=1&k=20&m=1199024795&s=170667a&w=0&h=DTSoNLtBG8cvnopNM2NGhNZhFtmbJfFrRTddcmhT2KE=',
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        child: Icon(Icons.photo_size_select_actual_rounded),
                        color: Theme.of(context).primaryColor,
                        height: 100,
                      );
                    },
                    fit: BoxFit.cover,
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  clipBehavior: Clip.hardEdge,
                ),
                // Container(
                //   child: Row(
                //     children: [Expanded(
                //       child: ),
                //       Expanded(child: child)],
                //   ),
                //   color: Colors.red,
                // ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          widget.post.title ?? 'no title',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          widget.post.author ?? 'no author',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Text(
                          (widget.post.date ?? 'no date').toString(),
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            widget.post.description ?? 'no description',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        )
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
