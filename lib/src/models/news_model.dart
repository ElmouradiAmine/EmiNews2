class NewsModel {
  final String _title;
  final String _description;
  final String _body;
  final String _date;
  final String _authorName;
  final String _imgURL;
  final String _brand;
  final String _brandLogoUrl;
  final int _views;
  final int _comments;
  final int _stars;


  NewsModel(this._title,this._description,this._body,this._date,this._authorName,this._imgURL,this._views, this._comments, this._stars,
      this._brand, this._brandLogoUrl);

  String get title => _title;
  String get description => _description;
  String get body => _body;
  String get date => _date;
  String get authorName => _authorName;
  String get imgURL => _imgURL;
  int get views => _views;
  int get comments => _comments;
  int get stars => _stars;
  String get brand => _brand;
  String get brandLogoUrl => _brandLogoUrl;


}