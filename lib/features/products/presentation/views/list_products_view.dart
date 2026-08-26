import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapplicationadvanced/core/widgets/custom_circule_progressIndicator.dart';
import 'package:myapplicationadvanced/features/products/presentation/views/widgets/list_products_body.dart';

import '../../../../core/widgets/helpers.dart';
import '../manager/prodcuts_cubit.dart';
import 'add_product_view.dart';

class ListProductsView extends StatelessWidget {
  const ListProductsView({super.key});
  static const String routeName = 'list_products';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProdcutsCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Prodcuts'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AddProductView.routeName);
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
        body: BlocConsumer<ProdcutsCubit, ProdcutsState>(
          listener: (context, state) {
            if (state is DeleteProdcutsSuccess) {
              customSnackBar(
                context,
                content: 'Product deleted successfuly',
                color: Colors.green,
              );
            }
            if (state is ProdcutsFailure) {
              customSnackBar(context, content: '', color: Colors.red);
            }
          },
          builder: (context, state) {
            if (state is ProdcutsLoading) {
              return const CustomCircularProgressIndicator();
            }
            if (state is FecthProdcutsSuccess) {
              return ListProductsBody();
            }
            return ListProductsBody();
          },
        ),
      ),
    );
  }
}
