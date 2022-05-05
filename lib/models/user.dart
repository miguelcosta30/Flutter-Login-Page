class UserLoginResponse {
  final String email;
  final String id;
  final String message;
  final int status;

  UserLoginResponse(this.email,this.id,this.message,this.status);

  UserLoginResponse.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        id = json['ID'],
        message = json ['message'],
        status = json['status'];


  Map<String, dynamic> toJson() => {
        'email': email,
        'ID' : id,
        'message' : message,
        'status': status,
      };
}