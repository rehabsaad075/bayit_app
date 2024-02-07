import 'package:cloud_firestore/cloud_firestore.dart';

class ServicesModel{
 String ?serviceName;
 String ?selectedServices;
 String ?otherServices;
 String ?serviceDate;
 String ?serviceTime;
 String ?phoneNumber;
 String ?cityName;
 String ?area;
 String ?street;
 String ?userId;
 Timestamp ?requestDate;
 DocumentReference ?id;

  ServicesModel({
    this.serviceName,
    this.selectedServices,
    this.otherServices,
    this.serviceDate,
    this.serviceTime,
    this.phoneNumber,
    this.cityName,
    this.area,
    this.street,
    this.userId,
    this.id,
    this.requestDate
});

 ServicesModel.fromFireStore(Map<String,dynamic>json,{required this.id}){
   serviceName=json['service_name'];
   selectedServices=json['selected_services'];
   otherServices=json['other_services'];
   serviceDate=json['service_date'];
   serviceTime=json['service_time'];
   phoneNumber=json['phone_number'];
   cityName=json['city_name'];
   area=json['area'];
   street=json['street'];
   userId=json['userId'];
   requestDate=json['created_time'];
 }

 Map<String,dynamic>toFireStore(){
   final Map<String,dynamic>data=<String,dynamic>{};
   data['service_name']=serviceName;
   data['selected_services']=selectedServices;
   data['other_services']=otherServices;
   data['service_date']=serviceDate;
   data['service_time']=serviceTime;
   data['city_name']=cityName;
   data['area']=area;
   data['street']=street;
   data['userId']=userId;
   data['created_time']=requestDate;
   return data;
 }
}