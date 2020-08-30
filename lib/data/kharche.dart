class Kharche{
  String _payer;
  String _desc="";
  int _amt;
  Kharche(this._desc,this._amt,this._payer);
  int getAmt(){
      return _amt;
  }
  String descRiption(){
    return _desc;
  }
  String getPayer(){
    return _payer;
  }
}