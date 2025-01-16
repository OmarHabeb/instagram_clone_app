part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetUserDataLoadingState extends HomeState {}

final class GetUserDataSuccessState extends HomeState {}

final class GetUserDataFiledState extends HomeState {}

///////////////////////////////////////////////////
final class PickImageLoadingState extends HomeState {}

final class PickImageSuccessState extends HomeState {}

///////////////////////////////////////////////////
final class UpdateUserDataLoading extends HomeState {}

final class UpdateUserDataSuccess extends HomeState {}

final class UpdateUserDataFailed extends HomeState {}

///////////////////////////////////////////////////
final class GetUserPostsLoadingState extends HomeState {}

final class GetUserPostsSuccessState extends HomeState {}

final class GetUserPostsFiledState extends HomeState {}
