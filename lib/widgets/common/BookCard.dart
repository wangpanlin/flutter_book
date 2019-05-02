import 'package:flutter/material.dart';
import 'package:flutter_book/helpers/constants.dart';

class BookCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String author;
  final double width;
  final double height;
  final double gap;

  BookCard(
      {@required this.title,
      @required this.imageUrl,
      @required this.author,
      this.gap = 16.0,
      this.width = 96.0,
      this.height = 148.0})
      : assert(title != null),
        assert(imageUrl != null),
        assert(author != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                color: Color(AppColors.themeColorGray),
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(this.imageUrl))),
          ),
          SizedBox(
            height: gap,
          ),
          Text(
            this.title,
            maxLines: 2,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Color(AppColors.fontColor), fontSize: 14.0),
          ),
          Text(
            this.author,
            maxLines: 1,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Color(AppColors.fontColorGray), fontSize: 12.0),
          ),
        ],
      ),
    );
  }
}
