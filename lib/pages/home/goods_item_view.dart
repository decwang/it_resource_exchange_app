import 'package:flutter/material.dart';
import 'package:it_resource_exchange_app/common/constant.dart'
    show AppSize, AppColors;
import 'package:cached_network_image/cached_network_image.dart';
import '../../model/home_info.dart';
import 'package:intl/intl.dart';

class GoodsItemView extends StatelessWidget {
  const GoodsItemView({Key key, this.recomendProduct, this.onPressed})
      : assert(recomendProduct != null),
        super(key: key);

  final RecommendProductList recomendProduct;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    var format = new DateFormat('yyyy-MM-dd HH:mm');
    var date = DateTime.fromMillisecondsSinceEpoch(recomendProduct.createdTime);
    var createDateStr = format.format(date);

    return GestureDetector(
      onTap: this.onPressed,
      child: Container(
          height: 100.0,
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            width: AppSize.DividerWidth,
            color: AppColors.DividerColor,
          ))),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        recomendProduct.productTitle,
                        style: TextStyle(
                            fontSize: 15.0, color: AppColors.DarkTextColor),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(recomendProduct?.cateTitle ?? '',
                              style: TextStyle(
                                  color: AppColors.LightTextColor,
                                  fontSize: 12.0)),
                          Text(createDateStr,
                              style: TextStyle(
                                  color: AppColors.LightTextColor,
                                  fontSize: 12.0)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 6.0),
                width: 120.0,
                height: 80.0,
                child: CachedNetworkImage(
                  imageUrl: recomendProduct.coverUrl,
                  placeholder: (context, url) =>
                      Image.asset('./assets/imgs/img_default.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )),
    );
  }
}
