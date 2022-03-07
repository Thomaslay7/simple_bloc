part of 'books_bloc.dart';

@immutable
abstract class BooksState {}

class BooksInitial extends BooksState {}

class LoadedBooks extends BooksState{
  final Books books;
  LoadedBooks({required this.books});
}