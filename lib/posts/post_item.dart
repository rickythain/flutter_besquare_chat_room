import 'package:besquare_chat_room/model/api_result_posts.dart';
import 'package:besquare_chat_room/post/full_post.dart';
import 'package:besquare_chat_room/posts/post_fav_cubit.dart';
import 'package:besquare_chat_room/storage/besquare_server.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostItem extends StatefulWidget {
  // const PostItem({Key? key}) : super(key: key);
  Post post;
  var author;
  PostItem({Key? key, required this.post, required this.author})
      : super(key: key);

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
                children: [
                  Expanded(
                    child: Image.network(
                      widget.post.image ??
                          'https://media.istockphoto.com/vectors/no-image-vector-symbol-missing-available-icon-no-gallery-for-this-vector-id1199024795?b=1&k=20&m=1199024795&s=170667a&w=0&h=DTSoNLtBG8cvnopNM2NGhNZhFtmbJfFrRTddcmhT2KE=',
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          child: Icon(Icons.photo_size_select_actual_rounded),
                          color: Theme.of(context).primaryColor,
                          constraints: BoxConstraints.expand(),
                        );
                      },
                      fit: BoxFit.cover,
                      width: 100,
                      height: 150,
                    ),
                    // child: CachedNetworkImage(
                    //   imageUrl: widget.post.image ??
                    //       'https://media.istockphoto.com/vectors/no-image-vector-symbol-missing-available-icon-no-gallery-for-this-vector-id1199024795?b=1&k=20&m=1199024795&s=170667a&w=0&h=DTSoNLtBG8cvnopNM2NGhNZhFtmbJfFrRTddcmhT2KE=',
                    //   placeholder: (context, url) => CircularProgressIndicator(),
                    //   errorWidget: (context, url, error) => Icon(Icons.error),
                    // ),
                    flex: 3,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            widget.post.title ?? 'no title',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: false,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            (widget.post.date ?? 'no date').toString(),
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              widget.post.description ?? 'no description',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              softWrap: false,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                      ),
                    ),
                    flex: 3,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BlocBuilder<FavPost, bool>(
                            builder: (context, state) {
                              FavPost().initializeFav(widget.post.favorite!);
                              if (state == false) {
                                return IconButton(
                                    onPressed: () {
                                      print('fav it');
                                      context
                                          .read<FavPost>()
                                          .changeFav(true, widget.post);
                                    },
                                    icon: Icon(Icons.favorite_border));
                              } else {
                                return IconButton(
                                    onPressed: () {
                                      print('unfav it');
                                      context
                                          .read<FavPost>()
                                          .changeFav(false, widget.post);
                                    },
                                    icon: Icon(
                                      Icons.favorite,
                                      color: Theme.of(context).primaryColor,
                                    ));
                              }
                            },
                          ),
                          ((widget.author == widget.post.author)
                              ? IconButton(
                                  onPressed: () {
                                    deletePost(widget.post.id.toString());
                                    getAllPosts();
                                  },
                                  icon: Icon(Icons.delete))
                              : Container()),
                        ],
                      ),
                    ),
                    flex: 1,
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
          height: 150,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                )
              ])),
    );
  }
}
