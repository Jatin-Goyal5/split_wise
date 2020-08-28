class People{
String _phoneNo="8585937950";
String _name="you";
String _desc="";
double _money=0;
//String _name;
People(this._phoneNo,this._name);
String getPhoneno(){
  return _phoneNo;
}
  String getName(){
    return _name;
  }
  void addMoney(double amt){
  _money+=amt;
  }
  double getMoney(){
    return _money;
  }

}