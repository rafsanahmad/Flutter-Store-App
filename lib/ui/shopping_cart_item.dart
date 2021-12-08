import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mina_store/model/product.dart';

class ShoppingCartItem extends StatelessWidget {
  const ShoppingCartItem({
    required this.index,
    required this.product,
    required this.lastItem,
    required this.quantity,
    required this.formatter,
    Key? key,
  }) : super(key: key);

  final Product product;
  final int index;
  final bool lastItem;
  final int quantity;
  final NumberFormat formatter;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final row = SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          top: 8,
          bottom: 8,
          right: 8,
        ),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
                fit: BoxFit.cover,
                width: 40,
                height: 40,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          product.name,
                          style: theme.textTheme.caption,
                        ),
                        Text(
                          formatter.format(quantity * product.price),
                          style: theme.textTheme.bodyText1,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '${quantity > 1 ? '$quantity x ' : ''}'
                      '${formatter.format(product.price)}',
                      style: theme.textTheme.bodyText1,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return row;
  }
}
