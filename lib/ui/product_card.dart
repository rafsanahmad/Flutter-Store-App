import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mina_store/model/app_state_model.dart';
import 'package:mina_store/model/product.dart';
import 'package:mina_store/utils/constants.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {this.imageAspectRatio = 33 / 49, required this.product, Key? key})
      : assert(imageAspectRatio > 0),
        super(key: key);

  final double imageAspectRatio;
  final Product product;

  @override
  Widget build(BuildContext context) {
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        decimalDigits: 0, locale: Localizations.localeOf(context).toString());
    final ThemeData theme = Theme.of(context);

    final imageWidget = Image.asset(
      product.assetName,
      package: product.assetPackage,
      fit: BoxFit.cover,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        AspectRatio(
          aspectRatio: imageAspectRatio,
          child: imageWidget,
        ),
        SizedBox(
          height: textBoxHeight * MediaQuery.of(context).textScaleFactor,
          width: boxWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                product.name,
                style: theme.textTheme.headline6,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(height: 4.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    formatter.format(product.price),
                    style: theme.textTheme.subtitle2,
                  ),
                  const SizedBox(width: 10.0),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      final model =
                          Provider.of<AppStateModel>(context, listen: false);
                      model.addProductToCart(product.id);
                    },
                    child: const Icon(
                      CupertinoIcons.plus_circled,
                      semanticLabel: 'Add',
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
