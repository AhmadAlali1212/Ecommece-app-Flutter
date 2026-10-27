# تطبيق التجارة الإلكترونية

تطبيق متجر إلكتروني متعدد اللغات مبني باستخدام Flutter، يوفّر تجربة شراء متكاملة تبدأ من اختيار اللغة وتسجيل الحساب، ثم تصفح المنتجات وإضافتها إلى المفضلة والسلة، وإتمام الطلب ومتابعته عبر الخريطة.

> اسم الحزمة الحالي: `ecommeceappcourse`  
> الإصدار الحالي: `1.0.0+1`  
> نوع المشروع: Flutter Application  
> لغة الواجهة: العربية والإنجليزية

## المحتويات

- [نظرة عامة](#نظرة-عامة)
- [المزايا](#المزايا)
- [التقنيات والحزم](#التقنيات-والحزم)
- [متطلبات التشغيل](#متطلبات-التشغيل)
- [التثبيت والإعداد](#التثبيت-والإعداد)
- [تشغيل التطبيق](#تشغيل-التطبيق)
- [تدفق المستخدم](#تدفق-المستخدم)
- [بنية المشروع](#بنية-المشروع)
- [الشاشات والمسارات](#الشاشات-والمسارات)
- [واجهات الخادم](#واجهات-الخادم)
- [الإعدادات والصلاحيات](#الإعدادات-والصلاحيات)
- [اختبار التطبيق](#اختبار-التطبيق)
- [استكشاف الأخطاء](#استكشاف-الأخطاء)
- [الأمان قبل النشر](#الأمان-قبل-النشر)
- [حالة المشروع](#حالة-المشروع)

## نظرة عامة

| العنصر | التفاصيل |
| --- | --- |
| المنصة | Android، iOS، Web، Linux، macOS، Windows وفق دعم Flutter والحزم المستخدمة |
| الإطار | Flutter / Dart |
| إدارة الحالة والتنقل | GetX |
| مصدر البيانات | REST API مبني على PHP عبر `http` |
| التخزين المحلي | SharedPreferences، مع وجود دعم Sqflite في الاعتمادات |
| الإشعارات | Firebase Cloud Messaging |
| التتبع والبيانات اللحظية | Cloud Firestore لتحديث موقع الطلب |
| الخرائط | Google Maps، تحديد الموقع، الترميز الجغرافي، وحساب المسار |
| الخطوط | Cairo للعربية وPlayfair Display للعناوين |
| اتجاه الواجهة | RTL للعربية وLTR للإنجليزية |

## المزايا

### الحساب والمصادقة

- اختيار اللغة عند أول تشغيل.
- شاشة تعريفية Onboarding.
- إنشاء حساب وتأكيد رمز التحقق.
- تسجيل الدخول والخروج.
- استعادة كلمة المرور عبر البريد ورمز التحقق.
- حفظ حالة اللغة والثيم محليًا.

### التسوق

- عرض الصفحة الرئيسية والتصنيفات والعروض.
- عرض المنتجات حسب التصنيف والبحث عنها.
- عرض تفاصيل المنتج والصور والألوان والتقييمات.
- إضافة المنتجات إلى المفضلة أو حذفها.
- إضافة المنتجات إلى السلة وتعديل الكمية.
- التحقق من القسائم قبل إتمام الطلب.

### الطلب والدفع

- إدارة عناوين الشحن.
- اختيار العنوان من خلال Google Maps.
- إنشاء الطلب من شاشة Checkout.
- عرض الطلبات قيد التنفيذ والطلبات المؤرشفة.
- عرض تفاصيل الطلب وتتبع الطلب على الخريطة.
- تقييم الطلب والمنتجات.

### تجربة الاستخدام

- دعم العربية والإنجليزية.
- الوضع الفاتح والداكن.
- إشعارات Firebase للمستخدمين.
- تصميم متجاوب باستخدام `responsive_builder`.
- حالات تحميل وعدم وجود بيانات ومعالجة أخطاء باستخدام ملفات Lottie.

## التقنيات والحزم

| المجال | الحزم المستخدمة |
| --- | --- |
| الأساس | `flutter`, `cupertino_icons` |
| إدارة الحالة والتنقل | `get` |
| الشبكة والتاريخ | `http`, `intl`, `jiffy` |
| الصور والوسائط | `cached_network_image`, `image_picker`, `image_pickers`, `flutter_svg`, `lottie` |
| Firebase | `firebase_core`, `firebase_messaging`, `cloud_firestore` |
| الخرائط والموقع | `google_maps_flutter`, `geolocator`, `geocoding`, `flutter_polyline_points` |
| التخزين | `shared_preferences`, `sqflite`, `path` |
| الواجهة والحركة | `show_up_animation`, `auto_animated`, `smooth_page_indicator`, `responsive_builder` |
| التسوق والتفاعل | `qr_flutter`, `grouped_list`, `dropdown_search`, `badges`, `rating_dialog` |
| الحسابات والروابط | `google_sign_in`, `url_launcher`, `flutter_otp_text_field` |
| الأدوات | `font_awesome_flutter`, `fluttericon`, `dartz`, `flutter_ringtone_player`, `device_preview` |
| التطوير والاختبار | `flutter_test`, `flutter_lints` |

## متطلبات التشغيل

| المتطلب | الإصدار أو الوصف |
| --- | --- |
| Flutter SDK | إصدار متوافق مع Dart `^3.9.2` |
| Dart SDK | `3.9.2` أو أحدث ضمن نطاق Flutter المثبت |
| Android Studio | مطلوب لمحاكي Android أو جهاز فعلي |
| Xcode | مطلوب لبناء iOS على macOS فقط |
| PHP API | خادم PHP محلي باسم `ecommeceapp` |
| قاعدة البيانات | قاعدة البيانات التي يعتمد عليها مشروع الـ PHP API |
| Firebase | مشروع Firebase مربوط بالتطبيق |
| Google Maps | مفتاح API مفعّل لخدمات Maps وDirections |

## التثبيت والإعداد

### 1. جلب المشروع وتثبيت الاعتمادات

```bash
git clone <repository-url>
cd ecommeceapp
flutter pub get
```

### 2. إعداد Firebase

1. أنشئ مشروعًا في [Firebase Console](https://console.firebase.google.com/).
2. أضف تطبيق Android باستخدام package name الخاص بالمشروع.
3. نزّل `google-services.json` وضعه في `android/app/google-services.json`.
4. فعّل Firebase Cloud Messaging.
5. فعّل Cloud Firestore إذا كان تتبع الطلبات مستخدمًا.
6. راجع إعدادات Firebase الخاصة بـ iOS عند بناء نسخة iOS.

يهيّئ التطبيق Firebase في `lib/core/services/service.dart`، ويطلب صلاحية الإشعارات عند بدء التطبيق.

### 3. إعداد خادم PHP API

عنوان الخادم الافتراضي في `lib/core/constant/app_link.dart` هو:

```text
http://10.0.2.2/ecommeceapp
```

العنوان `10.0.2.2` يشير إلى جهاز التطوير من داخل Android Emulator. عند التشغيل على جهاز فعلي استبدله بعنوان IP المحلي لجهاز التطوير، مثل:

```dart
static const String server = "http://192.168.1.10/ecommeceapp";
```

تأكد من تشغيل Apache أو PHP، واستيراد قاعدة البيانات، وإتاحة مجلدي رفع الصور `upload/items` و`upload/categories`.

### 4. إعداد Google Maps

فعّل Maps SDK وDirections API من Google Cloud. يستخدم التطبيق الخرائط في اختيار عنوان الشحن وتفاصيل الطلب والتتبع، ويستخدم Directions API لحساب المسار.

| الملف | الاستخدام |
| --- | --- |
| `android/app/src/main/AndroidManifest.xml` | مفتاح Google Maps لتطبيق Android |
| `lib/core/functions/get_decode_poly_line.dart` | مفتاح Directions API لحساب المسار |
| إعدادات iOS | مفتاح الخرائط لتطبيق iOS عند دعمه |

## تشغيل التطبيق

```bash
flutter devices
flutter run -d <device-id>
```

أمثلة:

```bash
flutter run -d android
flutter run -d chrome
```

إنشاء نسخة Android:

```bash
flutter build apk --release
flutter build appbundle --release
```

## تدفق المستخدم

```text
اختيار اللغة -> Onboarding -> تسجيل الدخول أو إنشاء حساب
    -> الصفحة الرئيسية -> التصنيفات / البحث / العروض
    -> تفاصيل المنتج -> المفضلة أو السلة
    -> العنوان -> Checkout -> إنشاء الطلب
    -> الطلبات الحالية -> التفاصيل -> التتبع والتقييم
```

## بنية المشروع

```text
lib/
├── main.dart                         نقطة تشغيل التطبيق وتهيئة GetX
├── routes.dart                        تعريف مسارات GetX
├── bindings/                          ربط واعتماد المتحكمات
├── controller/                        منطق الحالة والتدفقات
│   ├── auth/                           تسجيل الدخول وإنشاء الحساب
│   ├── checkEmail/                     استعادة كلمة المرور
│   ├── address/                        إدارة العناوين
│   └── orders/                         الدفع والطلبات والتتبع
├── core/
│   ├── class/                          CRUD ومعالجة حالات البيانات
│   ├── constant/                       الروابط والمسارات والثوابت والثيمات
│   ├── functions/                      التحقق، الإشعارات، الخرائط والمساعدات
│   ├── localization/                   الترجمة وتغيير اللغة
│   ├── middleware/                      التوجيه الأولي
│   └── services/                       تهيئة Firebase والتخزين المحلي
├── data/
│   ├── datasource/remote/               طبقة الاتصال بنقاط API
│   └── model/                           نماذج المنتجات والطلبات والعناوين
└── view/
    ├── screen/                          الشاشات الرئيسية
    ├── widget/                          المكونات القابلة لإعادة الاستخدام
    └── address/                         شاشات العناوين
```

## الشاشات والمسارات

| المسار | الشاشة | الغرض |
| --- | --- | --- |
| `/` | اختيار اللغة | تحديد اللغة الأولية |
| `/onboarding` | Onboarding | تعريف المستخدم بالتطبيق |
| `/login` | تسجيل الدخول | دخول المستخدم |
| `/signUp` | إنشاء حساب | تسجيل مستخدم جديد |
| `/verificationcode` | رمز التحقق | تأكيد الحساب |
| `/forgetPassword` | نسيان كلمة المرور | بدء الاستعادة |
| `/verificationEmail` | تحقق البريد | تأكيد رمز الاستعادة |
| `/resetPassword` | إعادة تعيين كلمة المرور | تعيين كلمة مرور جديدة |
| `/home` | الصفحة الرئيسية | التصنيفات والعروض والمنتجات |
| `/itemsScreen` | المنتجات | عرض منتجات تصنيف محدد |
| `/itemDetails` | تفاصيل المنتج | التفاصيل والتقييم والإضافة للسلة |
| `/viewMyfavorite` | المفضلة | إدارة المنتجات المحفوظة |
| `/cartScreen` | السلة | مراجعة العناصر والكميات |
| `/adressView` | العناوين | عرض عناوين الشحن |
| `/adressAdd` | إضافة عنوان | اختيار موقع وإضافة عنوان |
| `/adressDetails` | تفاصيل العنوان | تعديل أو مراجعة العنوان |
| `/checkout` | الدفع | تأكيد العنوان والقسيمة والطلب |
| `/ordersPending` | الطلبات الحالية | الطلبات غير المكتملة |
| `/archive` | الأرشيف | الطلبات المكتملة أو المؤرشفة |
| `/orderDetails` | تفاصيل الطلب | العناصر والحالة والتقييم |
| `/tracking` | تتبع الطلب | عرض موقع الطلب ومساره |

## واجهات الخادم

جميع الروابط التالية تُبنى من القيمة `AppLink.server`، وتستخدمها طبقة `datasource/remote`.

| المجال | Endpoint | العملية |
| --- | --- | --- |
| المصادقة | `/auth/signup.php` | إنشاء حساب |
| المصادقة | `/auth/login.php` | تسجيل الدخول |
| المصادقة | `/auth/verify_code.php` | تأكيد الحساب |
| المصادقة | `/auth/resend.php` | إعادة إرسال الرمز |
| كلمة المرور | `/forgetpassword/check_email.php` | التحقق من البريد |
| كلمة المرور | `/forgetpassword/verify_code_email.php` | تأكيد الرمز |
| كلمة المرور | `/forgetpassword/reset_password.php` | تغيير كلمة المرور |
| الرئيسية | `/home.php` | بيانات الصفحة الرئيسية |
| المنتجات | `/item/items.php` | جلب المنتجات |
| المنتجات | `/item/search.php` | البحث |
| الصور | `/upload/categories` | صور التصنيفات |
| الصور | `/upload/items` | صور المنتجات |
| المفضلة | `/favorite/favorite_add.php` و`favorite_remove.php` | الإضافة والحذف |
| المفضلة | `/favorite/view_myfavorite.php` و`delelt_from_favorite.php` | العرض والحذف |
| السلة | `/cart/add.php` و`remove.php` | تعديل السلة |
| السلة | `/cart/cart_count.php` و`view.php` | العدد والعرض |
| العناوين | `/address/add.php` و`edit.php` و`remove.php` و`view.php` | إدارة العناوين |
| القسائم | `/coupon/check_coupon.php` | التحقق من القسيمة |
| الطلبات | `/orders/checkout.php` | إنشاء طلب |
| الطلبات | `/orders/pending.php` و`archive.php` | عرض الطلبات |
| الطلبات | `/orders/details.php` و`delete.php` | التفاصيل والحذف |
| الإشعارات | `/notifications.php` | جلب الإشعارات |
| العروض | `/offers.php` | جلب العروض |
| التقييم | `/rating/rating_order.php` و`rating_items.php` | حفظ التقييمات |

## الإعدادات والصلاحيات

| الصلاحية | سبب الاستخدام |
| --- | --- |
| الموقع | اختيار عنوان الشحن وتتبع الموقع |
| الإشعارات | استقبال تحديثات الطلب |
| الإنترنت | الاتصال بالـ API وFirebase والخرائط |
| الصور والكاميرا | اختيار الصور عند الحاجة |

يتم حفظ الإعدادات التالية عبر `SharedPreferences`:

| المفتاح | القيم |
| --- | --- |
| `lang` | `ar` أو `en` |
| `theme` | `dark` أو `light` |

## اختبار التطبيق

```bash
flutter analyze
flutter test
dart format lib test
```

| المجال | حالات الاختبار الأساسية |
| --- | --- |
| الحساب | إنشاء الحساب، الرمز، الدخول، الخروج، استعادة كلمة المرور |
| المنتجات | التصنيف، البحث، التفاصيل، الصور، التقييم |
| السلة | الإضافة، تغيير الكمية، الحذف، الإجمالي |
| العنوان | الإضافة، التعديل، اختيار الموقع |
| الطلب | القسيمة، Checkout، إنشاء الطلب |
| التتبع | ظهور الخريطة وتحديث الموقع |
| الإعدادات | اللغة، الثيم، إعادة فتح التطبيق |
| الشبكة | التحميل، الخطأ، عدم وجود البيانات |

## استكشاف الأخطاء

### التطبيق لا يصل إلى الـ API

- على Android Emulator استخدم `10.0.2.2` بدل `localhost`.
- على جهاز فعلي استخدم IP جهاز التطوير داخل الشبكة.
- تأكد من تشغيل Apache/PHP والسماح بالوصول عبر الجدار الناري.
- راجع قيمة `AppLink.server` ومسارات PHP.

### Firebase لا يعمل

- تأكد من وجود `android/app/google-services.json` الصحيح.
- تحقق من package name ومشروع Firebase المرتبط.
- فعّل Cloud Messaging وFirestore عند الحاجة.
- نفّذ `flutter clean` ثم `flutter pub get` وأعد البناء.

### الخرائط لا تظهر

- تحقق من تفعيل Maps SDK وDirections API.
- راجع مفتاح API في Manifest وملف حساب المسار.
- قيّد المفتاح حسب package name وSHA-1.
- تأكد من منح صلاحية الموقع وتشغيل خدمة الموقع.

### الصور لا تظهر

- تحقق من إتاحة `upload/items` و`upload/categories` عبر الخادم.
- اختبر رابط الصورة من المتصفح أو Postman.
- تأكد من أن API يعيد روابط يمكن للجهاز أو المحاكي الوصول إليها.

## الأمان قبل النشر

هذا المشروع معدّ حاليًا للتطوير المحلي. قبل نشره في بيئة إنتاجية:

1. استبدل HTTP بـ HTTPS.
2. لا تضع مفاتيح Google API صراحة داخل الكود أو المستودع.
3. قيّد مفاتيح Google Maps حسب التطبيقات والخدمات المطلوبة، ودوّر أي مفاتيح ظهرت في ملفات المشروع.
4. انقل عنوان الـ API إلى إعدادات بيئة أو آلية إعداد آمنة بدل تثبيته داخل `app_link.dart`.
5. أضف تحققًا من المدخلات ومصادقة قوية في الـ PHP API.
6. امنع رفع الملفات غير الموثوقة وحدد الحجم والامتدادات.
7. راجع قواعد Firestore قبل تفعيل التتبع في الإنتاج.
8. لا ترفع ملفات الأسرار أو بيانات Firebase الخاصة ببيئة الإنتاج إلى مستودع عام.

## حالة المشروع

| المجال | الحالة الحالية |
| --- | --- |
| واجهة Flutter الأساسية | موجودة |
| المصادقة واستعادة كلمة المرور | موجودة عبر PHP API |
| المنتجات والتصنيفات والعروض | موجودة |
| المفضلة والسلة | موجودة |
| العناوين والخرائط | موجودة |
| Checkout والطلبات | موجودة |
| تتبع الطلب | موجود عبر Google Maps وFirestore |
| الإشعارات | مهيأة عبر Firebase Cloud Messaging |
| API إنتاجي آمن | يحتاج إعدادًا قبل النشر |
| مفاتيح وخدمات الإنتاج | تحتاج تقييدًا وإدارة أسرار |

## مراجع مفيدة

- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Documentation](https://dart.dev/guides)
- [GetX](https://pub.dev/packages/get)
- [Firebase for Flutter](https://firebase.google.com/docs/flutter/setup)
- [Google Maps Flutter](https://pub.dev/packages/google_maps_flutter)
- [FlutterFire Cloud Messaging](https://firebase.google.com/docs/cloud-messaging/flutter/client)
