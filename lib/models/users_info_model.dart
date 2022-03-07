class UserInfo{
  String login;
  int id;
  String avatar_url;
  String url;
  UserInfo({required this.url, required this.id, required this.login, required this.avatar_url});

  UserInfo.fromJson(Map<String, dynamic> json) :
      id = json['id'],
      login = json['login'],
      avatar_url = json['avatar_url'],
      url = json['url'];

  Map<String, dynamic> toJson()=> {
    'id': id,
    'login' : login,
    'avatar_url' : avatar_url,
    'url' : url,
  };
}