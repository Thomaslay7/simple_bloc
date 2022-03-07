/// bookcase : [{"title":"shelf 1","id":"s1","books":[{"title":"Secrets of the JavaScript Ninja","isbn":"193398869X","author":"John Resig","genre":"Technology"},{"title":"Ender's Game (The Ender Quintet)","isbn":"0812550706","author":"Orson Scott Card","genre":"Sci Fi"},{"title":"I, Robot","isbn":"055338256X","author":"Isaac Asimov","genre":"Sci Fi"}]},{"title":"shelf 2","id":"s2","books":[{"title":"JavaScript Patterns","isbn":"0596806752","author":"Stoyan Stefanov","genre":"Technology"},{"title":"Abraham Lincoln","isbn":"0195374525","author":"James M. McPherson","genre":"Biography"}]},{"title":"shelf 3","id":"s3","books":[{"title":"JavaScript: The Good Parts","isbn":"0596517742","author":"Douglas Crockford","genre":"Technology"},{"title":"A Clash of Kings (A Song of Ice and Fire, Book 2)","isbn":"0345535421","author":"R.R. Martin","genre":"Fantasy"},{"title":"A Storm of Swords: A Song of Ice and Fire: Book Three","isbn":"055357342X","author":"R.R. Martin","genre":"Fantasy"}]},{"title":"shelf 4","id":"s4","books":[{"title":"A Game of Thrones (A Song of Ice and Fire, Book 1)","isbn":"0553593714","author":"R.R. Martin","genre":"Fantasy"},{"title":"Steve Jobs","isbn":"1451648545","author":"Walter Isaacson","genre":"Biography"},{"title":"Jim Henson: The Biography","isbn":"0345526112","author":"Brian Jay Jones","genre":"Biography"},{"title":"Do Androids Dream of Electric Sheep?","isbn":"0345404475","author":"Philip K. Dick","genre":"Sci Fi"}]}]

class Books {
  List<Bookcase>? _bookcase;

  List<Bookcase> get bookcase => _bookcase!;

  Books({
      List<Bookcase>? bookcase}){
    _bookcase = bookcase!;
}

  Books.fromJson(dynamic json) {
    if (json["bookcase"] != null) {
      _bookcase = [];
      json["bookcase"].forEach((v) {
        _bookcase!.add(Bookcase.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_bookcase != null) {
      map["bookcase"] = _bookcase!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// title : "shelf 1"
/// id : "s1"
/// books : [{"title":"Secrets of the JavaScript Ninja","isbn":"193398869X","author":"John Resig","genre":"Technology"},{"title":"Ender's Game (The Ender Quintet)","isbn":"0812550706","author":"Orson Scott Card","genre":"Sci Fi"},{"title":"I, Robot","isbn":"055338256X","author":"Isaac Asimov","genre":"Sci Fi"}]

class Bookcase {
  String? _title;
  String? _id;
  List<BookDetail>? _books;

  String get title => _title!;
  String get id => _id!;
  List<BookDetail> get books => _books!;

  Bookcase({
      String? title,
      String? id,
      List<BookDetail>? books}){
    _title = title;
    _id = id;
    _books = books;
}

  Bookcase.fromJson(dynamic json) {
    _title = json["title"];
    _id = json["id"];
    if (json["books"] != null) {
      _books = [];
      json["books"].forEach((v) {
        _books!.add(BookDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["title"] = _title;
    map["id"] = _id;
    if (_books != null) {
      map["books"] = _books!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// title : "Secrets of the JavaScript Ninja"
/// isbn : "193398869X"
/// author : "John Resig"
/// genre : "Technology"

class BookDetail {
  String? _title;
  String? _isbn;
  String? _author;
  String? _genre;

  String get title => _title!;
  String get isbn => _isbn!;
  String get author => _author!;
  String get genre => _genre!;

  BookDetail({
      String? title,
      String? isbn,
      String? author,
      String? genre}){
    _title = title;
    _isbn = isbn;
    _author = author;
    _genre = genre;
}

  BookDetail.fromJson(dynamic json) {
    _title = json["title"];
    _isbn = json["isbn"];
    _author = json["author"];
    _genre = json["genre"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["title"] = _title;
    map["isbn"] = _isbn;
    map["author"] = _author;
    map["genre"] = _genre;
    return map;
  }

}