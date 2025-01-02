# Hedef Kitle Analizi ve Pazarlama Yönetim Sistemi
Bu proje, hedef kitle analizi ve pazarlama kampanyalarını yönetmek amacıyla geliştirilmiştir. Kullanıcıların kampanyalara katılımını takip etme, ürünlerin ve kullanıcıların analizini yapma, ödeme işlemleri ve kullanıcı etkinliklerini kaydetme gibi işlemleri gerçekleştirmek için tasarlanmıştır. Ayrıca, kullanıcılar için favoriler, alışveriş sepeti ve adres yönetimi gibi temel özellikler de içerir.

## Proje Amacı
 Bu sistem, şirketlerin müşteri verilerini analiz ederek doğru hedef kitleye pazarlama yapmalarına yardımcı olur. Kullanıcıların davranışlarını ve etkileşimlerini izleyerek, en verimli pazarlama stratejilerini oluşturmayı amaçlar. Ayrıca, kullanıcıların ödeme işlemleri, ürün satın alma geçmişi ve kampanyalara katılımı gibi verileri analiz ederek kişiselleştirilmiş teklifler sunar.

Özellikler
- Kullanıcı Yönetimi: Kullanıcı kayıtları, giriş işlemleri, şifre sıfırlama ve hesap düzenlemeleri yapılabilir.
- Adres Yönetimi: Kullanıcılar, teslimat adreslerini ekleyip düzenleyebilirler.
- Ürün Yönetimi: Ürünler, kategoriler ve fiyatlar yönetilebilir.
- Alışveriş Sepeti: Kullanıcılar, ürünleri sepete ekleyebilir ve ödeme yapabilirler.
- Favoriler: Kullanıcılar beğendikleri ürünleri favorilerine ekleyebilirler.
- Ödeme İşlemleri: Kullanıcılar ödemelerini gerçekleştirip, ödeme geçmişlerini inceleyebilirler.
- Sipariş Yönetimi: Kullanıcılar siparişlerini görüntüleyebilir, sipariş durumu takip edebilirler.
- Kampanya Yönetimi: Pazarlama kampanyaları oluşturulabilir ve bu kampanyaların performansı analiz edilebilir.
- Kullanıcı Etkinlik Takibi: Kullanıcıların sitedeki etkinlikleri (örneğin, ürün görüntüleme, satın alma) kaydedilir.
- Teknolojiler
- Veritabanı: MySQL (utf8mb4_unicode_ci)
- Backend Framework: Laravel
- Frontend: HTML, CSS, JavaScript (Bootstrap)
- Diğer: Google Maps API, Payment Gateway API (Stripe/PayPal)
- Veritabanı Tabloları
  
## Aşağıda proje için oluşturulmuş bazı temel veritabanı tabloları ve ilişkiler bulunmaktadır:

- users: Kullanıcı bilgilerini içerir (ad, soyad, e-posta, şifre, vb.).
- roles: Kullanıcı rollerini tanımlar (admin, kullanıcı vb.).
- categories: Ürün kategorilerini tanımlar (elektronik, giyim vb.).
- products: Ürün bilgilerini içerir (isim, açıklama, fiyat, vb.).
- cart_items: Kullanıcıların sepetlerine ekledikleri ürünleri tutar.
- orders: Kullanıcıların verdiği siparişlerin detaylarını içerir.
- payments: Ödeme bilgilerini tutar.
- favorites: Kullanıcıların favori ürünlerini saklar.
- user_activities: Kullanıcıların sistemde gerçekleştirdiği aktiviteleri kaydeder (ürün görüntüleme, satın alma vb.).

# Kurulum
## Bu projeyi yerel makinenizde çalıştırmak için aşağıdaki adımları takip edebilirsiniz:

Projeyi klonlayın:

```
git clone https://github.com/Spayrix/db-1.git
```


Gerekli bağımlılıkları yükleyin:
```
composer install
npm install
```

.env dosyasını yapılandırın:

```
cp .env.example .env
```

.env dosyasındaki veritabanı ayarlarını kendi sisteminize göre düzenleyin.

Veritabanını oluşturun ve migrasyonları çalıştırın:

```
php artisan migrate
```
Uygulamayı başlatın:
```
php artisan serve
```
Tarayıcınızda http://localhost:8000 adresine giderek uygulamayı görüntüleyebilirsiniz.
