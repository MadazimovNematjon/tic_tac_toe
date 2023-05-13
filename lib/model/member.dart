class Member{
  String? fullName;
  String? gmail;
  String? password;
  String? img_url;

  Member(this.fullName,this.gmail,);

  Member.fromJson(Map<String,dynamic> json)
  : fullName = json['fullName'],
  gmail = json['gmail'],
  password = json['password'],
  img_url = json['img_url'];

  Map<String,dynamic> toJson()=>{
    'fullName' : fullName,
    'gmail' : gmail,
    'password' : password,
    'img_url' : img_url,
  };

}
