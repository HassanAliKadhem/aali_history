class Mosque {
  final String name;
  final String imageUrl;
  final String mapUrl;
  Mosque(this.name, this.imageUrl, this.mapUrl);
}

List<Mosque> mosques = [
  Mosque(
      "مسجد أمير محمد",
      "https://fastly.4sqi.net/img/general/600x600/7820396_WgA05pJcyt6RnwbxspUjHPm25Y8TdnBDm8h75TkHQlE.jpg",
      getMapView(
        "%D9%85%D8%B3%D8%AC%D8%AF%20%D8%A3%D9%85%D9%8A%D8%B1%20%D9%85%D8%AD%D9%85%D8%AF&t",
      )),
  Mosque("مسجد الشيخ محمد", "", ""),
  Mosque(
    "مسجد عين رستان",
    "http://media.alwasatnews.com/data/2015/4510/images/loc-40.jpg",
    getMapView(
        "%D9%85%D8%B3%D8%AC%D8%AF%20%D8%B9%D9%8A%D9%86%20%D8%B1%D8%B3%D8%AA%D8%A7%D9%86&t"),
  ),
  Mosque(
    "مسجد الإمام علي (السادة)",
    "",
    getMapView("مسجد الامام علي (السادة)"),
  ),
  Mosque("مسجد محاذي لضريح الشيخ محمد", "", ""),
  Mosque("مسجد الغراية", "", ""),
  Mosque("مسجد الأخضر", "", ""),
  Mosque("مسجد العلويات", "", ""),
  Mosque("مسجد الحوطة القنطارة", "", ""),
  Mosque("مسجد الكرد", "", ""),
  Mosque("مسجد السلامية الشرقي (أبو لومي)", "", ""),
  Mosque("مسجد السلامية الغربي", "", ""),
  Mosque("مسجد ملا حسين", "", ""),
  Mosque("مسجد الجبيلية", "", ""),
  Mosque("مسجد الحوراء", "", ""),
  Mosque("مسجد النبيه إبراهيم", "", ""),
  Mosque("مسجد الزهراء", "", ""),
  Mosque(
    "جامع عالي القديم (جامع عالي معن)",
    "http://media.alwasatnews.com/data/2016/5130/images/54944a79aca4cdd1.jpg",
    getMapView("جامع عالي معن"),
  ), // http://www.alwasatnews.com/news/1161732.html
  Mosque("جامع عالي الجديد", "", ""),
  Mosque(
    "مسجد السوق",
    "http://media.alwasatnews.com/data/2016/5005/images/loc-m-1-6.jpg",
    getMapView("مسجد السوق عالي"),
  ), // http://www.alwasatnews.com/news/1116661.html
  Mosque("مسجد الشيخ عيسى", "", ""),
  Mosque(
    "مسجد الخرارة",
    "http://media.alwasatnews.com/data/2016/5005/images/69f77b6305c45690.jpg",
    getMapView("مسجد الخرارة"),
  ), // http://www.alwasatnews.com/news/1116661.html
  Mosque(
    "مسجد الإمام الحسين",
    "",
    getMapView("مسجد الإمام الحسين عالي"),
  ),
  Mosque("مسجد الإمام الحسن", "", ""),
  Mosque("مسجد الإمام الرضا", "", ""),
  Mosque("جامع موضي بالقرب من ممشى عالي", "", ""),
];

String getMapView(String query) {
  return '<div class="mapouter"><div class="gmap_canvas"><iframe id="gmap_canvas" style="position:fixed; top:0; left:0; bottom:0; right:0; width:100%; height:100%; border:none; margin:0; padding:0; overflow:hidden; z-index:999999;" src="https://maps.google.com/maps?q=$query=&z=19&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe><a href="https://embedgooglemap.net/124/"></a><br><style>.mapouter{position:relative;text-align:right;height:500px;width:600px;}</style><a href="https://www.embedgooglemap.net"></a><style>.gmap_canvas {overflow:hidden;background:none!important;height:500px;width:600px;}</style></div></div>';
}
