part of 'layout_cubit.dart';

@immutable
sealed class LayoutState {}

final class LayoutInitial extends LayoutState {}

final class LayoutSuccess extends LayoutState {}

final class LayoutLoading extends LayoutState {}

final class LayoutFailure extends LayoutState {}

final class LayoutAddInitial extends LayoutState {}

final class LayoutRemoveSuccess extends LayoutState {}

final class LayoutAddSuccess extends LayoutState {}

final class LayoutAddLoading extends LayoutState {}

final class LayoutAddFailure extends LayoutState {}
