
class ApiResponse<T> {

  bool success ;
  T? data ;
  String? message ;

  ApiResponse(this.success , this.data, this.message);

  @override
  String toString(){
    return "Success : $success \n Message : $message \n Data: $data" ;
  }

}