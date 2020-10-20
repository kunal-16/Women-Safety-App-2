class ContactModel{
  String number;
  ContactModel(String number)
  {
    this.number = number;
  }
  
  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      'number': number
    };
    return map;
  }

  ContactModel.fromMap(Map<String, dynamic> map){
    number = map['number'];
  }
}