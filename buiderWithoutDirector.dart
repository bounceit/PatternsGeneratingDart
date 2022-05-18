
import 'Builder.dart'
show 

CocktailBase,
CoctailTypeGlass,
CoctailTypeOfIce,
CoctailBasicIngredient,
CocktailGarnish;

class CoctailBuider {
  String _name = '';
  CocktailBase _basic = const CocktailBase(CoctailTypeGlass.standart, CoctailTypeOfIce.crush,);
  CoctailBasicIngredient _base = CoctailBasicIngredient.rom;
  int _makingTime = 10;
  List<CocktailGarnish> _garnish = const <CocktailGarnish>[
    CocktailGarnish.flower,
    CocktailGarnish.lime,
  ];

  List<CocktailGarnish> get garnish => _garnish;
  int get makingTime =>  _makingTime;
  CoctailBasicIngredient get base => _base;
  CocktailBase get basic => _basic;
  String get name => _name;

  void setGarnish(List<CocktailGarnish> garnish) => _garnish = garnish;
  void setName(String name) => _name = name;
  void setMakingTime(int makingTime) => _makingTime = makingTime;
  void setBasicIngredient(CoctailBasicIngredient base) => _base = base;
  void setCoctailBase(CocktailBase basic) => _basic = basic;

  Coctail buid() => Coctail(this);
}

class Coctail {
  late final String name;
  late final CocktailBase base;
  late final CoctailBasicIngredient basic;
  late final int makingTime;
  late final List<CocktailGarnish> garnish;

  Coctail(CoctailBuider buider) {
    name = buider.name;
    base = buider.basic;
    basic = buider.base;
    makingTime = buider.makingTime;
    garnish = buider.garnish;
  }

      @override
  String toString() {
      var infoStr = 'Название коктейля : $name \n';
  infoStr += base.toString();
  infoStr += 'Basic ingredient : ${basic.toString().split('.')[1]}\n';
  infoStr += 'garnish : (';
  garnish.forEach((element) {
    infoStr += element.toString().split('.')[1]+ ', ';
  });  
  infoStr += ')\n';
  infoStr += 'Время ожидания : $makingTime min';
  return infoStr;
}
static CoctailBuider get bulider => CoctailBuider();
}

void main() {
  var coctailBuilder = Coctail.bulider;
   coctailBuilder
    ..setName('Aperol')
    ..setCoctailBase(CocktailBase(CoctailTypeGlass.hurricane, CoctailTypeOfIce.crush))
    ..setBasicIngredient(CoctailBasicIngredient.pepsi)
    ..setMakingTime(12)
    ..setGarnish(<CocktailGarnish>[
      CocktailGarnish.flower,
      CocktailGarnish.salt
    ]);
    var aperol = coctailBuilder.buid();
    print(aperol);

    print('---' * 20);

  coctailBuilder
    ..setName('Negroni')
    ..setCoctailBase(CocktailBase(CoctailTypeGlass.standart, CoctailTypeOfIce.crush))
    ..setBasicIngredient(CoctailBasicIngredient.rom)
    ..setMakingTime(12)
    ..setGarnish(<CocktailGarnish>[
      CocktailGarnish.flower,
      CocktailGarnish.pomaranche
    ]);
    var negroni = coctailBuilder.buid();
    print(negroni);
}