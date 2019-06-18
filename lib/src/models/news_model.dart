class NewsModel {
  final String _title;
  final String _description;
  final String _body;
  final String _date;
  final String _authorName;


  NewsModel(this._title,this._description,this._body,this._date,this._authorName);

  String get title => _title;
  String get description => _description;
  String get body => _body;
  String get date => _date;
  String get authorName => _authorName;





}