import 'package:demo_app/features/login/domain/use_cases/login_use_case.dart';
import 'package:demo_app/features/login/presentation/blocs/login/login_bloc.dart';
import 'package:demo_app/features/login/presentation/pages/login_page.dart';
import 'package:demo_app/features/product/domain/use_cases/create_product_use_case.dart';
import 'package:demo_app/features/product/domain/use_cases/delete_product_use_case.dart';
import 'package:demo_app/features/product/domain/use_cases/update_product_use_case.dart';
import 'package:demo_app/features/product/presentation/blocs/create/create_product_bloc.dart';
import 'package:demo_app/features/product/presentation/blocs/delete/delete_product_bloc.dart';
import 'package:demo_app/features/product/presentation/blocs/update/update_product_bloc.dart';
import 'package:demo_app/features/stock/domain/use_cases/create_for_product_use_case.dart';
import 'package:demo_app/features/stock/domain/use_cases/create_stock_use_case.dart';
import 'package:demo_app/features/stock/domain/use_cases/delete_stock_use_case.dart';
import 'package:demo_app/features/stock/domain/use_cases/transfer_stock_use_case.dart';
import 'package:demo_app/features/stock/presentation/blocs/create/create_stock_bloc.dart';
import 'package:demo_app/features/stock/presentation/blocs/create_for_product/create_for_product_bloc.dart';
import 'package:demo_app/features/stock/presentation/blocs/delete/delete_stock_bloc.dart';
import 'package:demo_app/features/stock/presentation/blocs/transfer/transfer_product_bloc.dart';
import 'package:demo_app/features/user/data/repositories/user_repository.dart';
import 'package:demo_app/features/user/domain/use_cases/create_user_use_case.dart';
import 'package:demo_app/features/user/presentation/blocs/create/create_user_bloc.dart';
import 'package:demo_app/features/ware/domain/use_cases/create_ware_use_case.dart';
import 'package:demo_app/features/ware/domain/use_cases/delete_ware_use_case.dart';
import 'package:demo_app/features/ware/domain/use_cases/update_ware_use_case.dart';
import 'package:demo_app/features/ware/presentation/blocs/delete/delete_ware_bloc.dart';
import 'package:demo_app/features/ware/presentation/blocs/update/update_ware_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/login/data/data_sources/login_local_data_source.dart';
import 'features/login/data/data_sources/login_remote_data_source.dart';
import 'features/login/data/repositories/login_repository.dart';
import 'features/product/data/data_sources/product_remote_data_source.dart';
import 'features/product/data/repositories/product_repository.dart';
import 'features/product/domain/use_cases/get_all_products_use_case.dart';
import 'features/product/presentation/blocs/get/get_all_products_bloc.dart';
import 'features/stock/data/data_sources/stock_remote_data_source.dart';
import 'features/stock/data/repositories/stock_repository.dart';
import 'features/stock/domain/use_cases/get_all_stocks_use_case.dart';
import 'features/stock/presentation/blocs/get/get_all_stocks_bloc.dart';
import 'features/user/data/data_sources/user_remote_data_source.dart';
import 'features/ware/data/data_sources/ware_remote_data_source.dart';
import 'features/ware/data/repositories/ware_repository.dart';
import 'features/ware/domain/use_cases/get_all_wares_use_case.dart';
import 'features/ware/presentation/blocs/create/create_ware_bloc.dart';
import 'features/ware/presentation/blocs/get/get_all_wares_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc(LoginUseCase(LoginRepository(LoginRemoteDataSource(Dio()), LoginLocalDataSource(SharedPreferences.getInstance())))),),
        BlocProvider(create: (context) => CreateUserBloc(CreateUserUseCase(UserRepository(UserRemoteDataSource(Dio())), LoginRepository(LoginRemoteDataSource(Dio()), LoginLocalDataSource(SharedPreferences.getInstance()))))),
        BlocProvider(create: (context) => GetAllProductsBloc(GetAllProductsUseCase(ProductRepository(ProductRemoteDataSource(Dio()),), LoginRepository(LoginRemoteDataSource(Dio()), LoginLocalDataSource(SharedPreferences.getInstance())))),),
        BlocProvider(create: (context) => DeleteProductBloc(DeleteProductUseCase(ProductRepository(ProductRemoteDataSource(Dio()),), LoginRepository(LoginRemoteDataSource(Dio()), LoginLocalDataSource(SharedPreferences.getInstance())))),),
        BlocProvider(create: (context) => CreateProductBloc(CreateProductUseCase(ProductRepository(ProductRemoteDataSource(Dio()),), LoginRepository(LoginRemoteDataSource(Dio()), LoginLocalDataSource(SharedPreferences.getInstance())))),),
        BlocProvider(create: (context) => UpdateProductBloc(UpdateProductUseCase(ProductRepository(ProductRemoteDataSource(Dio()),), LoginRepository(LoginRemoteDataSource(Dio()), LoginLocalDataSource(SharedPreferences.getInstance())))),),
        BlocProvider(create: (context) => GetAllWaresBloc(GetAllWaresUseCase(WareRepository(WareRemoteDataSource(Dio())), LoginRepository(LoginRemoteDataSource(Dio()), LoginLocalDataSource(SharedPreferences.getInstance())))),),
        BlocProvider(create: (context) => CreateWareBloc(CreateWareUseCase(WareRepository(WareRemoteDataSource(Dio())), LoginRepository(LoginRemoteDataSource(Dio()), LoginLocalDataSource(SharedPreferences.getInstance())))),),
        BlocProvider(create: (context) => DeleteWareBloc(DeleteWareUseCase(WareRepository(WareRemoteDataSource(Dio())), LoginRepository(LoginRemoteDataSource(Dio()), LoginLocalDataSource(SharedPreferences.getInstance())))),),
        BlocProvider(create: (context) => UpdateWareBloc(UpdateWareUseCase(WareRepository(WareRemoteDataSource(Dio())), LoginRepository(LoginRemoteDataSource(Dio()), LoginLocalDataSource(SharedPreferences.getInstance())))),),
        BlocProvider(create: (context) => CreateProductBloc(CreateProductUseCase(ProductRepository(ProductRemoteDataSource(Dio())), LoginRepository(LoginRemoteDataSource(Dio()), LoginLocalDataSource(SharedPreferences.getInstance())))),),
        BlocProvider(create: (context) => GetAllStocksBloc(GetAllStocksUseCase(StockRepository(StockRemoteDataSource(Dio())), LoginRepository(LoginRemoteDataSource(Dio()), LoginLocalDataSource(SharedPreferences.getInstance())))),),
        BlocProvider(create: (context) => CreateStockBloc(CreateStockUseCase(StockRepository(StockRemoteDataSource(Dio())), LoginRepository(LoginRemoteDataSource(Dio()), LoginLocalDataSource(SharedPreferences.getInstance())))),),
        BlocProvider(create: (context) => DeleteStockBloc(DeleteStockUseCase(StockRepository(StockRemoteDataSource(Dio())), LoginRepository(LoginRemoteDataSource(Dio()), LoginLocalDataSource(SharedPreferences.getInstance())))),),
        BlocProvider(create: (context) => TransferProductBloc(TransferStockUseCase(StockRepository(StockRemoteDataSource(Dio())), LoginRepository(LoginRemoteDataSource(Dio()), LoginLocalDataSource(SharedPreferences.getInstance())))),),
        BlocProvider(create: (context) => CreateForProductBloc(CreateForProductUseCase(StockRepository(StockRemoteDataSource(Dio())), LoginRepository(LoginRemoteDataSource(Dio()), LoginLocalDataSource(SharedPreferences.getInstance())))),),
      ],
      child: MaterialApp(
        title: 'Training Demo',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
      ),
    );
  }
}