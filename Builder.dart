
enum CoctailTypeGlass {standart, hurricane}
enum CoctailTypeOfIce {piece, crush}
enum CoctailBasicIngredient {wiskey, aperol, soda, pepsi, liker, vodka, rom}
enum CocktailGarnish {mint, lime, pomaranche, flower, salt}

class CocktailBase {
  final CoctailTypeGlass typeGlass;
  final CoctailTypeOfIce typeOfIce;

  const CocktailBase(this.typeGlass, this.typeOfIce);

  @override
  String toString() {
   var tGlass = typeGlass.toString().split('.')[1];
   var tIce = typeOfIce.toString().split('.')[1];
    return 'Основа коктейля : $tGlass стакан и тип льда : $tIce \n ';

  }
}

class Cocktail {
  String name;
  CocktailBase typeGlass;
  CoctailBasicIngredient base ;
  int makingTime;
  List<CocktailGarnish> garnish;

  Cocktail({
    this.name = 'Mohito',
    this.typeGlass = const CocktailBase(CoctailTypeGlass.hurricane, CoctailTypeOfIce.crush) ,
    this.makingTime = 8,
    this.base = CoctailBasicIngredient.wiskey,
    this.garnish = const <CocktailGarnish>[
      CocktailGarnish.flower,
      CocktailGarnish.lime,
    ]});

@override
String toString() {
  var infoStr = 'Название коктейля : $name \n';
  infoStr += typeGlass.toString();
  infoStr += 'Basic ingredient ${base.toString().split('.')[1]} \n';
  infoStr += 'гарнир : (';
  for (var element in garnish) {
    
    infoStr += element.toString().split('.')[1] + ',';
   }
  infoStr += ')\n';
  infoStr += 'Время ожидания : $makingTime min';
  return infoStr;
   
 }
}

abstract class Builder  {
  void prepareDough();
  void addBase();
  void addgarnish();
  Cocktail getCoctail();

}

class CocktailAperolBuilder implements Builder {
  late Cocktail _cocktail;

  CocktailAperolBuilder() {
    _cocktail = Cocktail(name: 'Aperol', makingTime: 4);
  }

 @override
  void prepareDough(){
    _cocktail.typeGlass = const CocktailBase(CoctailTypeGlass.hurricane, CoctailTypeOfIce.piece);
  }

@override
void addBase() {
  _cocktail.base = CoctailBasicIngredient.aperol;
  
}



@override 
  void addgarnish() {
    _cocktail.garnish =  const <CocktailGarnish>[
      CocktailGarnish.mint,
      CocktailGarnish.pomaranche,
    ];
  }


  @override
  Cocktail getCoctail(){
    return _cocktail;
  }
}
class  CocktailWiskeyBuilder implements Builder {
  late Cocktail _cocktail;

  CocktailWiskeyBuilder() {
    _cocktail = Cocktail(name: 'Wiskey', makingTime: 5);
  }

 @override
  void prepareDough(){
    _cocktail.typeGlass = const CocktailBase(CoctailTypeGlass.standart, CoctailTypeOfIce.crush);
  }

@override
void addBase() {
  _cocktail.base = CoctailBasicIngredient.wiskey;
  
}



@override 
  void addgarnish() {
    _cocktail.garnish =  <CocktailGarnish>[
      CocktailGarnish.flower,
      CocktailGarnish.lime,
    ];
  }


  @override
  Cocktail getCoctail(){
    return _cocktail;
  }
}

class Director {
  Builder? _builder;

  Director([this._builder]);

  set builder(Builder builder) => _builder = builder; 

  void makeCoctail(){
    assert (_builder != null, 'Oo');
    _builder?.prepareDough();
    _builder?.addBase();
    _builder?.addgarnish();
  }
}

void main (List<String> argument) {
  var director =  Director();
  for(var it in <Builder>[CocktailAperolBuilder(), CocktailWiskeyBuilder()]) {
    director._builder = it;
    director.makeCoctail();
    print(it.getCoctail());
    print('---' * 20);
  }
}