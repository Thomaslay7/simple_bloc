import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skinfix_challenge/bloc/books_bloc.dart';
import 'package:skinfix_challenge/models/books.dart';
import 'package:skinfix_challenge/utils/colors.dart';
import 'package:skinfix_challenge/utils/dimens.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  List<bool> isClick = [true, false, false, false];
  Books booksData = Books(
    bookcase: [
      Bookcase(
        title: "shelf 1",
        id: "s1",
        books: [
          BookDetail(
              title: "Secrets of the JavaScript Ninja",
              isbn: "193398869X",
              author: "John Resig",
              genre:"Technology"
          ),
          BookDetail(
              title: "Ender's Game (The Ender Quintet)",
              isbn: "0812550706",
              author: "Orson Scott Card",
              genre: "Sci Fi"
          ),
          BookDetail(
              title: "I, Robot",
              isbn: "055338256X",
              author: "Isaac Asimov",
              genre: "Sci Fi"
          )
        ]
      ),
      Bookcase(
          title: "shelf 2",
          id: "s2",
          books: [
            BookDetail(
                title: "JavaScript Patterns",
                isbn : "0596806752",
                author : "Stoyan Stefanov",
                genre : "Technology"
            ),
            BookDetail(
                title : "Abraham Lincoln",
                isbn: "0195374525",
                author : "James M. McPherson",
                genre : "Biography"
            )
          ]
      ),
      Bookcase(
          title: "shelf 3",
          id: "s3",
          books: [
            BookDetail(
                title: "JavaScript: The Good Parts",
                isbn : "0596517742",
                author : "Douglas Crockford",
                genre : "Technology"
            ),
            BookDetail(
                title : "A Clash of Kings (A Song of Ice and Fire, Book 2)",
                isbn: "0345535421",
                author : "R.R. Martin",
                genre : "Fantasy"
            ),
            BookDetail(
                title: "A Storm of Swords: A Song of Ice and Fire: Book Three",
                isbn: "055357342X",
                author: "R.R. Martin",
                genre: "Fantasy"
            )
          ]
      ),
      Bookcase(
          title: "shelf 4",
          id: "s4",
          books: [
            BookDetail(
                title: "A Game of Thrones (A Song of Ice and Fire, Book 1)",
                isbn: "0553593714",
                author: "R.R. Martin",
                genre: "Fantasy"
            ),
            BookDetail(
                title: "Steve Jobs",
                isbn: "1451648545",
                author: "Walter Isaacson",
                genre: "Biography"
            ),
            BookDetail(
                title: "Jim Henson: The Biography",
                isbn: "0345526112",
                author: "Brian Jay Jones",
                genre: "Biography"
            ),
            BookDetail(
                title: "Do Androids Dream of Electric Sheep?",
                isbn: "0345404475",
                author : "Philip K. Dick",
                genre : "Sci Fi"
            )
          ]
      ),
    ]
  );
  @override
  void initState() {
    super.initState();
    BlocProvider.of<BooksBloc>(context).add(SetBooks(booksData));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(isClick.indexOf(true));
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text('Skinfix', style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800
        )),
      ),
      body: Container(
        height: heightInPercent(100, context),
        width: double.infinity,
        child: SingleChildScrollView(
          child: BlocBuilder<BooksBloc, BooksState>(
            builder: (context, state){
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: widthInPercent(25, context),
                    color: Colors.grey.withOpacity(0.2),
                    height: heightInPercent(100, context),
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index){
                          Bookcase detailBookCase = booksData.bookcase[index];
                          return GestureDetector(
                            onTap: (){
                              setState(() {
                                reset();
                                isClick[index] = true;
                              });
                            },
                            child: Container(
                              color: isClick[index] ? Colors.grey.withOpacity(0.6) : Colors.grey.withOpacity(0.2),
                              padding: EdgeInsets.symmetric(vertical: heightInPercent(2, context)),
                              alignment: Alignment.center,
                              child: Text(detailBookCase.title, style: const TextStyle(
                                  fontSize: 14,
                                fontWeight: FontWeight.w600
                              ),),
                            ),
                          );
                        },
                        separatorBuilder: (context, index){
                          return Container(height: heightInPercent(0.2,context),color: cBackground,);
                        },
                        itemCount: booksData.bookcase.length),
                  ),
                  Expanded(
                    child: Container(
                      height: heightInPercent(100, context),
                      padding: EdgeInsets.symmetric(horizontal:widthInPercent(3, context),vertical: heightInPercent(1, context)),
                      child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index){
                            BookDetail detailItem = booksData.bookcase[isClick.indexOf(true)].books[index];
                            return Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(4)
                              ),
                              padding: EdgeInsets.symmetric(vertical: heightInPercent(3, context), horizontal: widthInPercent(3, context)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(detailItem.author, style: const TextStyle(
                                      fontSize: 14
                                  ),),
                                  Text(detailItem.title, style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800
                                  ),),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index){
                            return SizedBox(height: heightInPercent(1,context),);
                          },
                          itemCount: booksData.bookcase[isClick.indexOf(true)].books.length),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
      backgroundColor: cBackground,
    );
  }

  reset(){
    isClick = [false, false, false, false];
  }
}