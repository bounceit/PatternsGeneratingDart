
abstract class TypeAlcohol {
  final String nameAlcohol;

  TypeAlcohol(this.nameAlcohol);
  
  void create();
}

abstract class CountryFrom {
  final String nameAlcohol;

  CountryFrom(this.nameAlcohol);

  void create();
}

abstract class JustType {
  final String nameAlcohol;

  JustType(this.nameAlcohol);

  void create();

}

class WiskeyAlcholType extends TypeAlcohol { 
  WiskeyAlcholType() : super('Wiskey');

  @override
  void create() {
    print('Тип выбраного алкоголя : $nameAlcohol');
  }
}

class WiskeyCountryFrom extends CountryFrom {
  WiskeyCountryFrom() : super('Usa');

  @override
  void create() {
    print('Виски привезён из : $nameAlcohol');

  }
}

class WiskeyJustType extends JustType {
  WiskeyJustType () : super('Burbon');

@override
void create() {
  print('В классификации это : $nameAlcohol');

 }
}

class Cognac extends TypeAlcohol { 
  Cognac() : super ('Коньяк');

  @override
  void create(){
    print('Тип выбранного алкоголя : $nameAlcohol');
  }
}

class CognacCountryFrom extends CountryFrom { 
  CognacCountryFrom() : super ('France');

  @override
  void create(){
    print('Коньяк привезён из : $nameAlcohol');

  }
}

class CognacJustType extends JustType {
  CognacJustType() : super('Коньяк');

  @override
  void create() {
    print('В классификации это : $nameAlcohol');
  }
}

abstract class AlcoholAbstractFactory {
  TypeAlcohol getTypeAlcohol();
  CountryFrom getCountryFrom();
  JustType getJustType();
}

class WiskeyAlcoholFactory implements AlcoholAbstractFactory {
  @override
  TypeAlcohol getTypeAlcohol() {
    return WiskeyAlcholType();
  }

  @override
  CountryFrom getCountryFrom() {
    return WiskeyCountryFrom();
  }

  @override
  JustType getJustType() {
    return WiskeyJustType();
  }
}

class CognacAlcoholFactory implements AlcoholAbstractFactory {
  @override
  TypeAlcohol getTypeAlcohol() {
    return Cognac();
  }

  @override
  CountryFrom getCountryFrom() {
    return CognacCountryFrom();
  }

  @override
  JustType getJustType() {
    return CognacJustType();
  }
}
enum TypeThis {Wiskey, Cognac}

class Application {
  final AlcoholAbstractFactory guiFactory;

  Application(this.guiFactory);

  void createGui(){
  guiFactory.getTypeAlcohol().create();
  guiFactory.getCountryFrom().create();
  guiFactory.getJustType().create();
  }
}
class AlcoholFactoryThis {
  static AlcoholAbstractFactory factory(TypeThis tupe) {
  switch (tupe) {
    case TypeThis.Wiskey:
     return WiskeyAlcoholFactory();
    case TypeThis.Cognac : return CognacAlcoholFactory();
    default:
     throw ArgumentError();
     }
  } 
}

void main(){
  var tupe = TypeThis.Cognac;
  var guifactory = AlcoholFactoryThis.factory(tupe);
  var app = Application(guifactory);
  app.createGui();
}