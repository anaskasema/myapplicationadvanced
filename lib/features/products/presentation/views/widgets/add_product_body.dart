import 'package:flutter/material.dart';
import 'package:myapplicationadvanced/core/widgets/custom_button.dart';
import 'package:myapplicationadvanced/core/widgets/custom_text_field.dart';

class AddProductBody extends StatefulWidget {
  const AddProductBody({super.key});

  @override
  State<AddProductBody> createState() => _AddProductBodyState();
}

class _AddProductBodyState extends State<AddProductBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController untis = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController price = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    name.dispose();
    description.dispose();
    untis.dispose();
    category.dispose();
    price.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              CustomTextField(
                controller: name,
                labelText: 'name',
                hintText: 'name',
                icon: Icons.add,
              ),

              SizedBox(height: 10),
              CustomTextField(
                controller: description,
                labelText: 'description',
                hintText: 'description',
                icon: Icons.description,
                obscureText: false,
              ),
              SizedBox(height: 20),
              CustomTextField(
                controller: untis,
                labelText: 'untis',
                hintText: 'untis',
                icon: Icons.list,
                obscureText: false,
              ),
              SizedBox(height: 20),
              CustomTextField(
                controller: category,
                labelText: 'category',
                hintText: 'category',
                icon: Icons.category,
                obscureText: false,
              ),
              SizedBox(height: 20),
              CustomTextField(
                controller: price,
                labelText: 'price',
                hintText: 'price',
                icon: Icons.attach_money,
                obscureText: false,
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'Add Product',
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    // await context.read<ProdcutsCubit>().addProduct(
                    //   productModel: ProductsModel(
                    //     name: name.text,
                    //     description: description.text,
                    //     untis: int.parse(untis.text),
                    //     category: category.text,
                    //     price: double.parse(price.text),
                    //   ),
                    // );
                  }
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
