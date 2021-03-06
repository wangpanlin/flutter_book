import 'package:flutter/material.dart';
import 'package:flutter_book/widgets/common/CommonTitle.dart';
import 'package:flutter_book/helpers/constants.dart';
import 'package:flutter_book/model/RecommendData.dart'
    show RecommendModel, RecommendData;
import 'package:fluro/fluro.dart';
import 'package:flutter_book/routers/application.dart';
import 'package:flutter_book/helpers/fluro_convert_util.dart';

class Recommend extends StatelessWidget {
  final List<RecommendModel> recommendData = RecommendData().recommendData;

  List<Widget> get cardList {
    List<Widget> newArr = [];
    recommendData.forEach((RecommendModel data) {
      newArr.add(_CardItem(
        imageUrl: data.imageUrl,
        title: data.title,
      ));
    });
    return newArr;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CommonTitle(
          title: "推荐",
          onTap: () => {
                Application.router.navigateTo(
                  context,
                  "/detail?title=${FluroConvertUtils.fluroCnParamsEncode('最受欢迎')}",
                  transition: TransitionType.native,
                  // transitionDuration: const Duration(milliseconds: 300),
                )
              },
        ),
        Container(
          height: 140.0,
          margin: EdgeInsets.only(top: 40.0, bottom: 18.0),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: cardList,
          ),
        )
      ],
    );
  }
}

class _CardItem extends StatelessWidget {
  final String imageUrl;
  final String title;

// 构造方法
  _CardItem({@required this.title, @required this.imageUrl})
      : assert(title != null),
        assert(imageUrl != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(4.0))),
      margin: EdgeInsets.only(right: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(4.0))),
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/image_none.png',
              image: this.imageUrl,
              fit: BoxFit.cover,
              width: 80.0,
              height: 80.0,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(this.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style:
                  TextStyle(fontSize: 14.0, color: Color(AppColors.fontColor)))
        ],
      ),
    );
  }
}
