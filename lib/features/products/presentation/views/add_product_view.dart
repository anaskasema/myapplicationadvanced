import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapplicationadvanced/features/products/presentation/views/widgets/add_product_body.dart';

import '../../../../core/widgets/helpers.dart';
import '../manager/prodcuts_cubit.dart';
import 'list_products_view.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const String routeName = 'add_product';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProdcutsCubit(),
      child: Scaffold(
        appBar: AppBar(title: Text('Add Product')),
        body: BlocListener<ProdcutsCubit, ProdcutsState>(
          listener: (context, state) {
            if (state is ProdcutsFailure) {
              customSnackBar(context, content: '', color: Colors.red);
            }
            if (state is AddProdcutsSuccess) {
              customSnackBar(
                context,
                content: 'product created succesfuly',
                color: Colors.green,
              );
              Navigator.of(context).pushNamed(ListProductsView.routeName);
            }
          },
          child: AddProductBody(),
        ),
      ),
    );
  }
}
