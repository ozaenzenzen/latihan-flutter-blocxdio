import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_lat4/bloc/post_bloc.dart';
import 'package:flutter_bloc_lat4/widget/post_circularprogress.dart';
import 'package:flutter_bloc_lat4/widget/post_item.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController scrollController = ScrollController();
  PostBloc postBloc = PostBloc();

  void onScroll(){
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;

    if(currentScroll == maxScroll){
      postBloc.add(PostEvent());   
    }
  }

  @override
  Widget build(BuildContext context) {
    postBloc = BlocProvider.of<PostBloc>(context);
    scrollController.addListener(onScroll);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Bloc ListView",
          style: GoogleFonts.lato(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 10,
          // vertical: 15,
        ),
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostUnitialized) {
              return PostCircularProgress();
            } else {
              PostLoaded postLoaded = state as PostLoaded;
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                controller: scrollController,
                itemCount: (postLoaded.hasReachedMax ?? true)
                    ? postLoaded.posts!.length
                    : postLoaded.posts!.length + 1,
                itemBuilder: (context, index) {
                  if (index < postLoaded.posts!.length)
                    return PostItem(post: postLoaded.posts![index]);
                  else
                    return PostCircularProgress();
                },
              );
            }
          },
        ),
      ),
    );
  }
}

