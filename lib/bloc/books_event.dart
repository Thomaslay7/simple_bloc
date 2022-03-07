part of 'books_bloc.dart';

@immutable
abstract class BooksEvent {}

class SetBooks extends BooksEvent{
  final Books books;

  SetBooks(this.books);
}
