import 'package:flutter/material.dart';
import 'package:med_app/ui/input_decorations.dart';
import 'package:med_app/widgets/widgets.dart';

class ProductScreem extends StatelessWidget {
  const ProductScreem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                const ProductImage(),
                Positioned(
                  top: 60,
                  left: 20,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 60,
                  right: 20,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const _ProductForm(),
            const SizedBox(height: 100)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save_outlined),
        onPressed: () {},
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _BuildBoxDecoration(),
        child: Form(
          child: Column(children: [
            const SizedBox(height: 10),
            TextFormField(
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'Nombre Del Producto', labelText: 'Nombre'),
            ),
            const SizedBox(height: 30),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '(Q)', labelText: 'Precio'),
            ),
            const SizedBox(height: 30),
            SwitchListTile.adaptive(
                value: true,
                title: const Text('Disponible'),
                onChanged: (value) {
                  //Pendiente
                })
          ]),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  BoxDecoration _BuildBoxDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, 5),
              blurRadius: 5)
        ]);
  }
}
