class Mosque {
  final String name;
  final String imageUrl;
  final String mapUrl;
  Mosque(this.name, this.imageUrl, this.mapUrl);
}

List<Mosque> mosques = [
  Mosque(
    "مسجد أمير محمد",
    "ammer_mohamed.jpg",
    getMapView(
      "%D9%85%D8%B3%D8%AC%D8%AF%20%D8%A3%D9%85%D9%8A%D8%B1%20%D9%85%D8%AD%D9%85%D8%AF&t",
    ),
  ),
  // Mosque("مسجد الشيخ محمد", "", ""),
  Mosque(
    "مسجد عين رستان",
    "aaen_rastan.jpg",
    getMapView(
      "%D9%85%D8%B3%D8%AC%D8%AF%20%D8%B9%D9%8A%D9%86%20%D8%B1%D8%B3%D8%AA%D8%A7%D9%86&t",
    ),
  ),
  Mosque(
    "مسجد الإمام علي\n(السادة)",
    "immam_ali.jpeg",
    getMapView("مسجد الامام علي (السادة)"),
  ),
  // Mosque("مسجد محاذي لضريح الشيخ محمد", "", ""),
  Mosque(
    "مسجد الغراية",
    "Algharrayah_Mosque.jpg",
    getMapView("مسجد الغراية عالي"),
  ),
  // Mosque("مسجد الأخضر", "", getMapView("مسجد الأخضر")),
  // Mosque("مسجد العلويات", "", ""),
  // Mosque("مسجد الحوطة القنطارة", "", ""),
  Mosque(
    "مسجد الكرد",
    "alkurd_mosque.jpg",
    getMapView("مسجد الكرد عالي"),
  ), // https://www.jwd.gov.bh/en/mosques/5243/
  Mosque(
    "مسجد السلامية الشرقي\n(أبو لومي)",
    "alsalamya_sharghi.jpg",
    getMapView("مسجد السلامية الشرقي (أبو لومي)"),
  ), //https://www.jwd.gov.bh/ar/mosques/5976/
  Mosque(
    "مسجد السلامية الغربي",
    "alsalamya_gharbi.jpg",
    getMapView("مسجد السلامية الغربي عالي"),
  ),
  Mosque("مسجد ملا حسين", "mulla_husain.jpg", getMapView("مسجد ملا حسين عالي")),
  Mosque(
    "مسجد الجبيلية",
    "Alajabilah Mosque.jpg",
    getMapView("مسجد الجبيلية عالي"),
  ),
  Mosque("مسجد الحوراء", "alhawra_zainab.jpg", getMapView("مسجد الحوراء عالي")),
  // Mosque(
  //   "مسجد النبيه إبراهيم",
  //   "https://www.jwd.gov.bh/ImageProcessor.aspx?fieldname=PhotoScan&tablename=Real_PhotoTbl&idfieldname=PhotoID&strIDFieldValue=1676&strServerFolder=PhotoGalary",
  //   getMapView("مسجد النبيه إبراهيم عالي"),
  // ),
  Mosque("مسجد الزهراء", "Alzahra_Mosque.jpg", getMapView("مسجد الزهراء عالي")),
  Mosque(
    "جامع عالي القديم\n(جامع عالي معن)",
    "aali_maan_mosque.jpg",
    getMapView("جامع عالي معن"),
  ), // http://www.alwasatnews.com/news/1161732.html
  // Mosque("جامع عالي الجديد", "", ""),
  Mosque(
    "مسجد السوق",
    "alsooq_mosque.jpg",
    getMapView("مسجد السوق عالي"),
  ), // http://www.alwasatnews.com/news/1116661.html
  // Mosque("مسجد الشيخ عيسى", "", ""),
  Mosque(
    "مسجد الخرارة",
    "alkarara_mosque.jpg",
    getMapView("مسجد الخرارة"),
  ), // http://www.alwasatnews.com/news/1116661.html
  Mosque("مسجد الإمام الحسين", "", getMapView("مسجد الإمام الحسين عالي")),
  // Mosque(
  //   "مسجد الإمام الحسن",
  //   "https://www.jwd.gov.bh/ImageProcessor.aspx?fieldname=Scan&tablename=Real_RealEstateMain&idfieldname=iRealEstNo&strIDFieldValue=3052&strServerFolder=RealEstate",
  //   getMapView("مسجد الإمام الحسن اسكان عالي"),
  // ),
  Mosque(
    "مسجد الإمام الرضا",
    "immam_reda_mosque.jpg",
    getMapView("مسجد الإمام الرضا اسكان عالي"),
  ),
  Mosque("جامع موضي", "moodhe_mosque.jpg", getMapView("جامع موضي عالي")),
];

String getMapView(String query) {
  return '<div class="mapouter"><div class="gmap_canvas"><iframe id="gmap_canvas" style="position:fixed; top:0; left:0; bottom:0; right:0; width:100%; height:100%; border:none; margin:0; padding:0; overflow:hidden; z-index:999999;" src="https://maps.google.com/maps?q=$query=&z=19&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe><a href="https://embedgooglemap.net/124/"></a><br><style>.mapouter{position:relative;text-align:right;height:500px;width:600px;}</style><a href="https://www.embedgooglemap.net"></a><style>.gmap_canvas {overflow:hidden;background:none!important;height:500px;width:600px;}</style></div></div>';
}
