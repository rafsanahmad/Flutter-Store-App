import 'package:flutter/cupertino.dart';
import 'package:mina_store/model/product.dart';
import 'package:mina_store/pages/category_menu_page.dart';
import 'package:mina_store/pages/product_list_tab.dart';
import 'package:mina_store/pages/shopping_cart_tab.dart';
import 'package:mina_store/ui/backdrop.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ShopAppState();
}

class _ShopAppState extends State<HomePage> {
  Category _currentCategory = Category.all;

  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        late final CupertinoTabView returnValue;
        switch (index) {
          case 0:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Backdrop(
                  currentCategory: Category.all,
                  frontLayer: ProductListTab(category: _currentCategory),
                  backLayer: CategoryMenuPage(
                    currentCategory: _currentCategory,
                    onCategoryTap: _onCategoryTap,
                  ),
                  frontTitle: Text('Mina\'s Store'),
                  backTitle: Text('Menu'),
                ),
              );
            });
            break;
          case 1:
            returnValue = CupertinoTabView(builder: (context) {
              return const CupertinoPageScaffold(
                child: ShoppingCartTab(),
              );
            });
            break;
        }
        return returnValue;
      },
    );
  }
}
