import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mina_store/theme/colors.dart';
import 'package:provider/provider.dart';

import '../model/app_state_model.dart';
import '../model/product.dart';

class ProductRowItem extends StatelessWidget {
  const ProductRowItem({
    required this.product,
    required this.lastItem,
    Key? key,
  }) : super(key: key);

  final Product product;
  final bool lastItem;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final row = SafeArea(
      top: false,
      bottom: false,
      minimum: const EdgeInsets.only(
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
              width: 76,
              height: 76,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    product.name,
                    style: theme.textTheme.headline6,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 8)),
                  Text('\$${product.price}', style: theme.textTheme.caption)
                ],
              ),
            ),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              final model = Provider.of<AppStateModel>(context, listen: false);
              model.addProductToCart(product.id);
            },
            child: const Icon(
              CupertinoIcons.plus_circled,
              semanticLabel: 'Add',
            ),
          ),
        ],
      ),
    );

    if (lastItem) {
      return row;
    }

    return Column(
      children: <Widget>[
        row,
        Padding(
          padding: const EdgeInsets.only(
            left: 100,
            right: 16,
          ),
          child: Container(
            height: 1,
            color: colorDivider,
          ),
        ),
      ],
    );
  }
}
