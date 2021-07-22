import 'package:flutter/material.dart';
import 'package:flutter_bloc_lat4/api/model/post.dart';
import 'package:google_fonts/google_fonts.dart';

class PostItem extends StatelessWidget {
  final Post post;

  PostItem({
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    // var i = index;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          // border: Border.all(),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              offset: Offset(5, 5),
              color: Colors.black54,
              blurRadius: 5,
              spreadRadius: 0.5,
            ),
          ]),
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 15,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                    left: 20,
                  ),
                  child: Text(
                    post.id.toString(),
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title.toString(),
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    post.body.toString(),
                    style: GoogleFonts.lato(),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
