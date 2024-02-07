class UsersModel{
  String ?name;
  String ?email;
  String ?phoneNumber;
  String? userId;

  UsersModel({
    this.name,
    this.email,
    this.phoneNumber,
    this.userId
});
  UsersModel.fromFireStore(Map<String,dynamic>json){
    name=json['name'];
    email=json['email'];
    phoneNumber=json['phone'];
    userId=json['userId'];
  }
}