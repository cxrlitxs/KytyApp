class KytyTextField extends StatelessWidget{

  String sHint;
  TextEditingController tecController;
  bool blIsPassword;
  double dPaddingH;
  double dPaddingV;

  KTTextField({Key? key,this.sHint="",
    required this.tecController,
    this.blIsPassword=false,
    this.dPaddingH=60,
    this.dPaddingV=15
  }) : super(key: key);

}