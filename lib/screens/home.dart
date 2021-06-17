import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_lat4/bloc/post_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Bloc ListView",
          style: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostUnitialized) {
              return Center(
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              PostLoaded postLoaded = state as PostLoaded;
              return ListView.builder(
                itemCount: postLoaded.posts!.length,
                itemBuilder: (context, i) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 15,
                    ),
                    child: Column(
                      children: [
                        Text(postLoaded.posts![i].title.toString()),
                        Text(postLoaded.posts![i].body.toString()),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
