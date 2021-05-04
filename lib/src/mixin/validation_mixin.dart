class ValidationMixin{
  String? validEmail (String? value){
    if(value!.contains("@") && value.contains(".")){
      return null;
    }
    else{
      return "Invalid email address";
    }
  }

  String? validPassword (String? value){
    if(value!.length>=8){
      return null;
    }
    else{
      return "Invalid Password";
    }
  }

  String? validGender (String? value){
    if(value!=null){
      return null;
    }
    else{
      return "Please Select a Gender";
    }
  }
}