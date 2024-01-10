import 'package:flutter/material.dart';
//import 'package:med_app/screems/screems.dart';
//import 'package:med_app/services/services.dart';
import 'package:med_app/widgets/widgets.dart';
//import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class HomeScreem extends StatelessWidget {
  const HomeScreem({super.key});

  @override
  Widget build(BuildContext context) {
    //final productsService = Provider.of<ProductsService>(context);

    //if (productsService.isLoading) return const LoadingScreem();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'product'),
              child: const ProductCard())),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
          var request = http.Request('POST',
              Uri.parse('http://feb6-179-60-225-68.ngrok-free.app/logflu'));
          request.bodyFields = {'User': 'ppineda', 'Pass': 'Adrian\$23'};
          request.headers.addAll(headers);

          http.StreamedResponse response = await request.send();
          print(response);

          if (response.statusCode == 200) {
            print(await response.stream.bytesToString());
          } else {
            print(response.reasonPhrase);
          }
        },
      ),
    );
  }
}
