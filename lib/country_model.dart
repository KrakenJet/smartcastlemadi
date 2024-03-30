class CountryModel {
  Name? name;
  bool? independent;
  String? status;
  Currencies? currencies;
  List<String>? capital;
  String? region;
  String? subregion;
  Languages? languages;
  Translations? translations;
  List<int>? latlng;
  dynamic area;
  String? flag;
  Maps? maps;
  int? population;
  List<String>? timezones;
  List<String>? continents;
  Flags? flags;
  CoatOfArms? coatOfArms;
  String? startOfWeek;
  PostalCode? postalCode;

  CountryModel(
      {this.name,
      this.independent,
      this.status,
      this.currencies,
      this.capital,
      this.region,
      this.subregion,
      this.languages,
      this.translations,
      this.latlng,
      this.area,
      this.flag,
      this.maps,
      this.population,
      this.timezones,
      this.continents,
      this.flags,
      this.coatOfArms,
      this.startOfWeek,
      this.postalCode});

  CountryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    independent = json['independent'];
    status = json['status'];
    currencies = json['currencies'] != null
        ? Currencies.fromJson(json['currencies'])
        : null;
    capital = json['capital'] != null
        ? List<String>.from(json['capital'])
        : ["capital city is not found"];
    region = json['region'];
    subregion = json['subregion'];
    languages = json['languages'] != null
        ? Languages.fromJson(json['languages'])
        : null;
    translations = json['translations'] != null
        ? Translations.fromJson(json['translations'])
        : null;
    latlng = json['latlng'].cast<int>();
    area = json['area'];
    flag = json['flag'];
    maps = json['maps'] != null ? Maps.fromJson(json['maps']) : null;
    population = json['population'];
    timezones = json['timezones'].cast<String>();
    continents = json['continents'].cast<String>();
    flags = json['flags'] != null ? Flags.fromJson(json['flags']) : null;
    coatOfArms = json['coatOfArms'] != null
        ? CoatOfArms.fromJson(json['coatOfArms'])
        : null;
    startOfWeek = json['startOfWeek'];
    postalCode = json['postalCode'] != null
        ? PostalCode.fromJson(json['postalCode'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (name != null) {
      data['name'] = name!.toJson();
    }
    data['independent'] = independent;
    data['status'] = status;
    if (currencies != null) {
      data['currencies'] = currencies!.toJson();
    }
    data['capital'] = capital;
    data['region'] = region;
    data['subregion'] = subregion;
    if (languages != null) {
      data['languages'] = languages!.toJson();
    }
    if (translations != null) {
      data['translations'] = translations!.toJson();
    }
    data['latlng'] = latlng;
    data['area'] = area;
    data['flag'] = flag;
    if (maps != null) {
      data['maps'] = maps!.toJson();
    }
    data['population'] = population;
    data['timezones'] = timezones;
    data['continents'] = continents;
    if (flags != null) {
      data['flags'] = flags!.toJson();
    }
    if (coatOfArms != null) {
      data['coatOfArms'] = coatOfArms!.toJson();
    }
    data['startOfWeek'] = startOfWeek;
    if (postalCode != null) {
      data['postalCode'] = postalCode!.toJson();
    }
    return data;
  }
}

class Name {
  String? common;
  String? official;
  NativeName? nativeName;

  Name({this.common, this.official, this.nativeName});

  Name.fromJson(Map<String, dynamic> json) {
    common = json['common'];
    official = json['official'];
    nativeName = json['nativeName'] != null
        ? NativeName.fromJson(json['nativeName'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['common'] = common;
    data['official'] = official;
    if (nativeName != null) {
      data['nativeName'] = nativeName!.toJson();
    }
    return data;
  }
}

class NativeName {
  Ell? ell;
  Ell? tur;

  NativeName({this.ell, this.tur});

  NativeName.fromJson(Map<String, dynamic> json) {
    ell = json['ell'] != null ? Ell.fromJson(json['ell']) : null;
    tur = json['tur'] != null ? Ell.fromJson(json['tur']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (ell != null) {
      data['ell'] = ell!.toJson();
    }
    if (tur != null) {
      data['tur'] = tur!.toJson();
    }
    return data;
  }
}

class Ell {
  String? official;
  String? common;

  Ell({this.official, this.common});

  Ell.fromJson(Map<String, dynamic> json) {
    official = json['official'];
    common = json['common'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['official'] = official;
    data['common'] = common;
    return data;
  }
}

class Currencies {
  EUR? eUR;

  Currencies({this.eUR});

  Currencies.fromJson(Map<String, dynamic> json) {
    eUR = json['EUR'] != null ? EUR.fromJson(json['EUR']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (eUR != null) {
      data['EUR'] = eUR!.toJson();
    }
    return data;
  }
}

class EUR {
  String? name;
  String? symbol;

  EUR({this.name, this.symbol});

  EUR.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['symbol'] = symbol;
    return data;
  }
}

class Languages {
  String? ell;
  String? tur;

  Languages({this.ell, this.tur});

  Languages.fromJson(Map<String, dynamic> json) {
    ell = json['ell'];
    tur = json['tur'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ell'] = ell;
    data['tur'] = tur;
    return data;
  }
}

class Translations {
  Ell? ara;
  Ell? bre;
  Ell? ces;
  Ell? cym;
  Ell? deu;
  Ell? est;
  Ell? fin;
  Eng? fra;
  Ell? hrv;
  Ell? hun;
  Ell? ita;
  Ell? jpn;
  Ell? kor;
  Ell? nld;
  Ell? per;
  Ell? pol;
  Ell? por;
  Ell? rus;
  Ell? slk;
  Ell? spa;
  Ell? srp;
  Ell? swe;
  Ell? tur;
  Ell? urd;
  Ell? zho;

  Translations(
      {this.ara,
      this.bre,
      this.ces,
      this.cym,
      this.deu,
      this.est,
      this.fin,
      this.fra,
      this.hrv,
      this.hun,
      this.ita,
      this.jpn,
      this.kor,
      this.nld,
      this.per,
      this.pol,
      this.por,
      this.rus,
      this.slk,
      this.spa,
      this.srp,
      this.swe,
      this.tur,
      this.urd,
      this.zho});

  Translations.fromJson(Map<String, dynamic> json) {
    ara = json['ara'] != null ? Ell.fromJson(json['ara']) : null;
    bre = json['bre'] != null ? Ell.fromJson(json['bre']) : null;
    ces = json['ces'] != null ? Ell.fromJson(json['ces']) : null;
    cym = json['cym'] != null ? Ell.fromJson(json['cym']) : null;
    deu = json['deu'] != null ? Ell.fromJson(json['deu']) : null;
    est = json['est'] != null ? Ell.fromJson(json['est']) : null;
    fin = json['fin'] != null ? Ell.fromJson(json['fin']) : null;
    fra = json['fra'] != null ? Eng.fromJson(json['fra']) : null;
    hrv = json['hrv'] != null ? Ell.fromJson(json['hrv']) : null;
    hun = json['hun'] != null ? Ell.fromJson(json['hun']) : null;
    ita = json['ita'] != null ? Ell.fromJson(json['ita']) : null;
    jpn = json['jpn'] != null ? Ell.fromJson(json['jpn']) : null;
    kor = json['kor'] != null ? Ell.fromJson(json['kor']) : null;
    nld = json['nld'] != null ? Ell.fromJson(json['nld']) : null;
    per = json['per'] != null ? Ell.fromJson(json['per']) : null;
    pol = json['pol'] != null ? Ell.fromJson(json['pol']) : null;
    por = json['por'] != null ? Ell.fromJson(json['por']) : null;
    rus = json['rus'] != null ? Ell.fromJson(json['rus']) : null;
    slk = json['slk'] != null ? Ell.fromJson(json['slk']) : null;
    spa = json['spa'] != null ? Ell.fromJson(json['spa']) : null;
    srp = json['srp'] != null ? Ell.fromJson(json['srp']) : null;
    swe = json['swe'] != null ? Ell.fromJson(json['swe']) : null;
    tur = json['tur'] != null ? Ell.fromJson(json['tur']) : null;
    urd = json['urd'] != null ? Ell.fromJson(json['urd']) : null;
    zho = json['zho'] != null ? Ell.fromJson(json['zho']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (ara != null) {
      data['ara'] = ara!.toJson();
    }
    if (bre != null) {
      data['bre'] = bre!.toJson();
    }
    if (ces != null) {
      data['ces'] = ces!.toJson();
    }
    if (cym != null) {
      data['cym'] = cym!.toJson();
    }
    if (deu != null) {
      data['deu'] = deu!.toJson();
    }
    if (est != null) {
      data['est'] = est!.toJson();
    }
    if (fin != null) {
      data['fin'] = fin!.toJson();
    }
    if (fra != null) {
      data['fra'] = fra!.toJson();
    }
    if (hrv != null) {
      data['hrv'] = hrv!.toJson();
    }
    if (hun != null) {
      data['hun'] = hun!.toJson();
    }
    if (ita != null) {
      data['ita'] = ita!.toJson();
    }
    if (jpn != null) {
      data['jpn'] = jpn!.toJson();
    }
    if (kor != null) {
      data['kor'] = kor!.toJson();
    }
    if (nld != null) {
      data['nld'] = nld!.toJson();
    }
    if (per != null) {
      data['per'] = per!.toJson();
    }
    if (pol != null) {
      data['pol'] = pol!.toJson();
    }
    if (por != null) {
      data['por'] = por!.toJson();
    }
    if (rus != null) {
      data['rus'] = rus!.toJson();
    }
    if (slk != null) {
      data['slk'] = slk!.toJson();
    }
    if (spa != null) {
      data['spa'] = spa!.toJson();
    }
    if (srp != null) {
      data['srp'] = srp!.toJson();
    }
    if (swe != null) {
      data['swe'] = swe!.toJson();
    }
    if (tur != null) {
      data['tur'] = tur!.toJson();
    }
    if (urd != null) {
      data['urd'] = urd!.toJson();
    }
    if (zho != null) {
      data['zho'] = zho!.toJson();
    }
    return data;
  }
}

class Demonyms {
  Eng? eng;
  Eng? fra;

  Demonyms({this.eng, this.fra});

  Demonyms.fromJson(Map<String, dynamic> json) {
    eng = json['eng'] != null ? Eng.fromJson(json['eng']) : null;
    fra = json['fra'] != null ? Eng.fromJson(json['fra']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (eng != null) {
      data['eng'] = eng!.toJson();
    }
    if (fra != null) {
      data['fra'] = fra!.toJson();
    }
    return data;
  }
}

class Eng {
  String? f;
  String? m;

  Eng({this.f, this.m});

  Eng.fromJson(Map<String, dynamic> json) {
    f = json['f'];
    m = json['m'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['f'] = f;
    data['m'] = m;
    return data;
  }
}

class Maps {
  String? googleMaps;
  String? openStreetMaps;

  Maps({this.googleMaps, this.openStreetMaps});

  Maps.fromJson(Map<String, dynamic> json) {
    googleMaps = json['googleMaps'];
    openStreetMaps = json['openStreetMaps'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['googleMaps'] = googleMaps;
    data['openStreetMaps'] = openStreetMaps;
    return data;
  }
}

class Flags {
  String? png;
  String? svg;
  String? alt;

  Flags({this.png, this.svg, this.alt});

  Flags.fromJson(Map<String, dynamic> json) {
    png = json['png'];
    svg = json['svg'];
    alt = json['alt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['png'] = png;
    data['svg'] = svg;
    data['alt'] = alt;
    return data;
  }
}

class CoatOfArms {
  String? png;
  String? svg;

  CoatOfArms({this.png, this.svg});

  CoatOfArms.fromJson(Map<String, dynamic> json) {
    png = json['png'];
    svg = json['svg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['png'] = png;
    data['svg'] = svg;
    return data;
  }
}

class PostalCode {
  String? format;
  String? regex;

  PostalCode({this.format, this.regex});

  PostalCode.fromJson(Map<String, dynamic> json) {
    format = json['format'];
    regex = json['regex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['format'] = format;
    data['regex'] = regex;
    return data;
  }
}
