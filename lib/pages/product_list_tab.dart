import 'package:flutter/cupertino.dart';
import 'package:mina_store/model/product.dart';
import 'package:mina_store/model/products_repository.dart';
import 'package:mina_store/ui/assymetric_view.dart';

class ProductListTab extends StatelessWidget {
  final Category category;

  const ProductListTab({this.category = Category.all, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AsymmetricView(products: ProductsRepository.loadProducts(category));
  }
}
