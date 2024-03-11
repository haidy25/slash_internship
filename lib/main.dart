import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_internship/features/products/presentation/bloc/products/products_bloc.dart';
import 'package:slash_internship/features/products/presentation/bloc/products/products_event.dart';
import 'package:slash_internship/features/products/presentation/pages/all_products_page.dart';
import 'package:slash_internship/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => di.sl<ProductBloc>()..add(GetAllProductsEvent()),
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Slash Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: ProductsPage(
              products: [],
            )));
  }
}
