// ignore_for_file: public_member_api_docs, sort_constructors_first
class DevelopmentFlowParameters {
  final int status;
  final int questionId;
  DevelopmentFlowParameters({
    required this.status,
    required this.questionId,
  });

Map<String,dynamic> toMap(){
  return{
    'status':status,
    'questionId':questionId,
  };
}
}
