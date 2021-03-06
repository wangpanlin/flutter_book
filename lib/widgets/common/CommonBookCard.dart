import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:flutter_book/helpers/constants.dart';

class CommonBookCard extends StatelessWidget {
  double boxWidth;
  CommonBookCard({this.boxWidth});

  @override
  Widget build(BuildContext context) {
    boxWidth ??= MediaQuery.of(context).size.width - Constants.pageMargin * 2 - 52.0 - 114.0;
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: Color(AppColors.themeColorGray),
              borderRadius: BorderRadius.all(Radius.circular(4.0))),
          margin: EdgeInsets.only(top: 16.0),
          padding: EdgeInsets.only(left: 114.0, right: 6.0),
          height: 125.0,
          child: Container(
            padding: EdgeInsets.all(10.0),
            width: boxWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '主要介绍Flutter布局中的Row、Column控件',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: Color(AppColors.fontColor),
                              fontSize: 18.0),
                        ),
                        Text('从今天开始正式介绍 Flutter 中的各种 Widgets 了',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                color: Color(AppColors.fontColor),
                                fontSize: 14.0))
                      ],
                    )),
                    // SizedBox(
                    //   width: 18.0,
                    //   height: 30.0,
                    //   child: IconButton(
                    //     padding: EdgeInsets.all(0.0),
                    //     onPressed: () {
                    //       print("object");
                    //     },
                    //     icon: SvgPicture.asset(
                    //       'assets/icon/icon_view_more.svg',
                    //       width: 20.0,
                    //       height: 30.0,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(height: 14.0),
                Text('After Thomas,Kruger',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Color(AppColors.fontColorGray), fontSize: 12.0))
              ],
            ),
          ),
        ),
        Positioned(
            left: 16.0,
            child: Container(
              width: 86.0,
              height: 126.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'http://admin.soscoon.com/uploadImages/95b0838eb05d6f8f91ad924dd7e6e5ea672ef183.png'))),
            )),
      ],
    );
  }
}
