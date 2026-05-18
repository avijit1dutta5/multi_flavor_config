import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/di/injector.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/responsive/responsive.dart';
import '../controllers/products_controller.dart';
import '../widgets/product_card.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => sl<ProductsController>()..load(),
      child: const _ProductsView(),
    );
  }
}

class _ProductsView extends StatelessWidget {
  const _ProductsView();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final controller = context.watch<ProductsController>();

    Widget body;
    switch (controller.status) {
      case ViewStatus.idle:
      case ViewStatus.loading:
        body = const Center(child: CircularProgressIndicator());
      case ViewStatus.failure:
        body = Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(loc.t('loadError')),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: context.read<ProductsController>().load,
                child: Text(loc.t('retry')),
              ),
            ],
          ),
        );
      case ViewStatus.success:
        body = Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: Responsive.maxContentWidth(context),
            ),
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Responsive.gridColumns(context),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.7,
              ),
              itemCount: controller.products.length,
              itemBuilder: (_, i) =>
                  ProductCard(product: controller.products[i]),
            ),
          ),
        );
    }

    return Scaffold(
      appBar: AppBar(title: Text(loc.t('productsTitle'))),
      body: body,
    );
  }
}
