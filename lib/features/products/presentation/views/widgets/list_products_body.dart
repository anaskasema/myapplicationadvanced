import 'package:flutter/material.dart';

class ListProductsBody extends StatelessWidget {
  const ListProductsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (context, index) {
        return Divider(
          thickness: 2,
          color: Colors.black,
          indent: 10,
          endIndent: 10,
        );
      },
      itemBuilder: (context, index) {
        return ListTile(
          trailing: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Text(
                  'Price: 600',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Expanded(
                child: Text(
                  'Units: 10',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () async {
                        showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return AlertDialog(
                              title: Text('Delete Product'),
                              content: Text(
                                'Are you sure you want to delete this product?',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(dialogContext);
                                  },
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(dialogContext);
                                    // context
                                    //     .read<ProdcutsCubit>()
                                    //     .deleteProducts(
                                    //       documentID: productsModel[index].id!,
                                    //     );
                                  },
                                  child: const Text('Delete'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: Icon(Icons.delete),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                  ],
                ),
              ),
            ],
          ),
          leading: Column(
            children: [
              Icon(Icons.category),
              Text(
                'phones',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ],
          ),
          title: Text(
            'Samsung Galxy s25 ultra 256GB',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            'Samsung Galxy s25 ultra 256GB, Color: black, battery: 50000, display: OLED, ram: 12',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        );
      },
    );
  }
}
