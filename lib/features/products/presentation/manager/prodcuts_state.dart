part of 'prodcuts_cubit.dart';

sealed class ProdcutsState {}

final class ProdcutsInitial extends ProdcutsState {}

final class ProdcutsLoading extends ProdcutsState {}

final class ProdcutsFailure extends ProdcutsState {}

final class AddProdcutsSuccess extends ProdcutsState {}

final class FecthProdcutsSuccess extends ProdcutsState {}

final class DeleteProdcutsSuccess extends ProdcutsState {}
