class XIVFreeCompany {
  String _active;
  List<dynamic> _crest;
  String _activeMemberCount;
  String _estateName;
  String _estateGreeting;
  String _estatePlot;
  String _grandCompany;
  String _name;
  String _server;
  String _rank;
  String _slogan;
  String _tag;

  set setActive(String u) => _active = u;
  get getActive => _active;

  set setCrest(List<dynamic> u) => _crest = u;
  get getCrest => _crest;

  set setActiveMemberCount(int u) => _activeMemberCount = u.toString();
  get getActiveMemberCount => _activeMemberCount;

  set setEstateName(String u) => _estateName = u;
  get getEstateName => _estateName;

  set setEstateGreeting(String u) => _estateGreeting = u;
  get getEstateGreeting => _estateGreeting;

  set setEstatePlot(String u) => _estatePlot = u;
  get getEstatePlot => _estatePlot;

  set setGrandCompany(String u) => _grandCompany = u;
  get getGrandCompany => _grandCompany;

  set setName(String u) => _name = u;
  get getName => _name;

  set setRank(int u) => _rank = u.toString();
  get getRank => _rank;

  set setServer(String u) => _server = u;
  get getServer => _server;

  set setSlogan(String u) => _slogan = u;
  get getSlogan => _slogan;

  set setTag(String u) => _tag = u;
  get getTag => _tag;
}
