
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skinfix_challenge/models/books.dart';

part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc() : super(BooksInitial()){
    on<SetBooks>((event, emit) {
      Books books = event.books;
      emit(LoadedBooks(books: books));
    });
  }
}
