
# Final Project

<div align="center">


https://user-images.githubusercontent.com/96587699/208317133-5a7e7c24-610c-4e24-8101-34914e4829eb.mov



</div>

## Games App
- Games App, bütün platform oyunlarının aratılabildiği, yüksek puanlı, yeni çıkan gibi kriterlere göre filtrelenerek listelenebildiği, oyun detayları incelenerek favoriye alınabilen, oyunlar hakkında notlar alınabilen bir iOS uygulamasıdır.
- Uygulamada localization mevcuttur. Cihaz diline göre ingilizce veya türkçe olarak kullanılabilir.
- Uygulama Onboarding ekranı ile açılır. Onboarding tamamlandıktan sonra ana tablara geçiş yapılır.
- Uygulama Games, Favs, Notes Tablarına bağlı ekranlardan oluşur.
- Uygulama ekranlarını aşağıdan inceleyebilirsiniz.

### Onboarding
<div>
<div align="center">
<table>
<tr>
<td><img src="https://user-images.githubusercontent.com/96587699/208307913-eefac758-75c7-4c6a-b6f8-ba6732c9e092.png" alt="drawing" width="275"/></td>  
<td><img src="https://user-images.githubusercontent.com/96587699/208307912-9b9142e5-fdc8-415c-b79f-442f1549216c.png" alt="drawing" width="275"/></td>  
</td>  
</tr>
</table>
</div>
- Uygulama 3sn'lik LaunchScreen sonrasında Onboarding Ekranı ile açılır.
- Onboarding ekranı 3 sayfadan oluşur. Sayfalar CollectionView'de Horizontal olarak yönetilir. İster kaydırılarak, ister next butonu ile sayfalar ilerletilebilir.
- Son sayfada buton "Get started" olarak değiştirilerek uygulamanın ilk Tab'ı olan Games'e yönlendirme yapılır.

## Games Tab
<div>
<div align="center">
<table>
<tr>
<td><img src="https://user-images.githubusercontent.com/96587699/208307909-d1021786-91e7-48e6-baf5-defdcb0dafaa.png" alt="drawing" width="275
"/></td>  
<td><img src="https://user-images.githubusercontent.com/96587699/208307907-00ca5326-80dc-45f1-b74a-623608d266ee.png" alt="drawing" width="275
"/></td>  
<td><img src="https://user-images.githubusercontent.com/96587699/208309014-2bf18a2a-ddea-4458-9a68-3b4ed9da709d.png" alt="drawing" width="275
"/></td>  
</tr>
</table>
</div>

- Games Tab default olarak bütün oyunların listelendiği sayfadır.
- Sayfa açılışında "Welcome!" Local Notification'ı çalışır.
- Ekranda pagination mevcuttur. Oyunlar 20'li olarak sayfa sonuna inildikçe fetch edilir.
- Navigation'da bulunan Search Bar'dan oyun araması yapılabilir.
- Arama yapılırken her harf tuşlamasında istek göndermemek için her klavye tuşu basımından sonra 0.5sn bekler. Daha sonra istek atılarak aranan oyunlar listelenir.
- Sağ navigation itemı olan listeleme menüsünden bütün oyunlar, çok oy alanlar ve yeni çıkanlar filtrelenebilir.
- Filtreler veya arama uygulanırken istek esnasında sayfa koyulaşarak indicator gösterimi sağlanır.
- Sayfanın altlarına inildikten sonra yeni filtre uygulandığında sayfa otomatik olarak yukarı kayar ve yeni liste baştan listelenmiş olur.
- Bir oyunun üzerine tıklayınca detay sayfasına geçiş sağlanır.

### Game Details Sayfası
<div>
<div align="center">
<table>
<tr>
<td><img src="https://user-images.githubusercontent.com/96587699/208307904-f2a0f848-c99d-41bd-94f6-a206f658f7dd.png" alt="drawing" width="275
"/></td>  
<td><img src="https://user-images.githubusercontent.com/96587699/208307901-a5a88130-792c-4d72-862e-bce8b0228be8.png" alt="drawing" width="275
"/></td>  
</tr>
</table>
</div>

- Oyun detay sayfasında Oyun Adı, Yayın Tarihi, Raiting ve Metacritic puanları, oyun detay metni, genre bilgileri, ekran görüntüleri, raiting ve review detayları ve yayıncı bilgileri bulunur. Sayfa scroll edilerek detaylar incelenebilir.
- Add to favorite butonuna tıklayarak oyun CoreData'ya kaydedilebilir ve Favori sayfasına eklenebilir. Buton tıklandıktan sonra added to favorite butonuna dönüşür. Yine bu butona tekrar tıklanarak favorilerden ve CoreData'dan silinebilir.
- Sayfanın altında bulunan ekran görüntüleri compositional layout ile horizontal collection view olarak gösterilir.
- Servisten yyyy-mm-dd formatında gelen tarih extention ile dönüştürülerek görselde görülen formata çevrilmiştir.

## Favorites Tab
<div>
<div align="center">
<table>
<tr>
<td><img src="https://user-images.githubusercontent.com/96587699/208307899-1971a3d9-6e85-49e3-9b10-99a9d3474d0e.png" alt="drawing" width="275
"/></td>  
<td><img src="https://user-images.githubusercontent.com/96587699/208307898-3df7cba1-1d31-4f81-be48-e49c58cd6fb5.png" alt="drawing" width="275
"/></td> 
</tr>
</table>
</div>

- Favorites Tab'ında oyun detay sayfasından favoriye eklenen oyunlar collection view ile listelenir.
- Favorilerden birine tıklanarak özet detay sayfası modal olarak açılır. Modal açılan ekranda bulunan "Remove From Favorites" butonuna tıklanarak buradan da oyunlar favoriden çıkarılabilir.

## Notes Tab
<div>
<div align="center">
<table>
<tr>
<td><img src="https://user-images.githubusercontent.com/96587699/208307897-2e1ef6fe-81a8-42ed-bf6d-57fea08019d7.png" alt="drawing" width="275
"/></td>  
<td><img src="https://user-images.githubusercontent.com/96587699/208307889-75c99234-f38a-4973-9014-e9d467be48b7.png" alt="drawing" width="275
"/></td> 
<td><img src="https://user-images.githubusercontent.com/96587699/208307885-3727b001-87e0-419e-a477-46c059672353.png" alt="drawing" width="275
"/></td> 
</tr>
</table>
</div>

- Notes Tab not eklenen oyunların listelendiği ekrandır. Yeni bir oyuna not eklemek için ekranda bulunan ekle (+) butonu ile oyun arama sayfasına yönlenme sağlanır.
- Not eklenen oyunlar sola kaydırılarak silinebilir.
- Notların üzerine tıklandığında not ekleme ekranı dolu şekilde editleme yapmak üzere açılır. Save ederek güncelleme sağlanabilir veya çıkış (x) butonu ile güncelleme yapılmadan ekran kapatılabilir.
- Boş ve dolu olarak yukarıdaki görselde görebilirsiniz.

<div>
<div align="center">
<table>
<tr>
<td><img src="https://user-images.githubusercontent.com/96587699/208307894-abe395d8-6e5e-42be-8920-7344d704bf2f.png" alt="drawing" width="275
"/></td> 
<td><img src="https://user-images.githubusercontent.com/96587699/208307892-01679d6d-d70c-4829-9b28-1402b365f331.png" alt="drawing" width="275
"/></td> 
<td><img src="https://user-images.githubusercontent.com/96587699/208307881-cf31ec8b-e1d4-48a5-a4ce-af6c2f822e2b.png" alt="drawing" width="275
"/></td> 
</tr>
</table>
</div>

- Bir oyuna not eklemek için arama ekranından bir oyun aratılır.
- Aranan oyuna tıklanarak not ekleme ekranı açılır.
- Not ekleme ekranında oyuna daha önce not eklenip eklenmediği kontrolü yapılır. Eğer eklenmişse daha önce eklenen not editlenmek üzere açılır. Eğer eklenmemişse boş şekilde yeni not eklemek için açılır.
- Eklenen notlar CoreData'ya kaydedilir.
- Bu sayede bir oyuna tek bir not eklenir ve istenirse üzerine ekleme yapılabilir. Böylece aynı oyuna fazladan not eklenmesiyle oluşabilecek karışıklık ortadan kaldırılır.

## Detaylar
- Uygulama macOS Ventura 13.0.1 ve XCode 14.1 sürümü ile oluşturulmuştur.
- Uygulama içinde servisten gelen tarihi düzenlemek için Date Extention'ı eklenmiştir.
- İçinde indicator, alert ve keyboard gestures bulunan bir BaseViewController oluşturulmuştur. Alert, indicator veya keyboard gesture kullanılan ekranlar bu ViewController'dan inherit edilmiştir.
- Aramalar yapılırken ",-*<>%&/..." gibi özel karakterleri servise göndermemek için  string extention'ı oluşturulmuştur.
- Stringleri localize edebilmek için localize methodu string extention'ına eklenmiştir.
- Parametreli localize string alabilmek için ayrıca localizedWithParameter fonksiyonu oluşturulmuştur.
- Görseli gelmeyen oyunların resimlerini default olarak gösterebilmek için Asset'de bulunan "emptyImage" görselini URL'e çevirmeyi sağlayan static createLocalUrl fonksiyonu bulunan AssetExtractor class'ı oluşturulmuştur.
- Games Tab'ında sayfanın altlarına inildikten sonra yeni filtre uygulandığında sayfa otomatik olarak yukarı kayar ve yeni liste baştan listelenmiş olur.
- Arama yapılırken her harf tuşlamasında istek göndermemek için her klavye tuşu basımından sonra 0.5sn bekler. Daha sonra istek atılarak aranan oyunlar listelenir.
- Listeleme ekranlarında pagination mevcuttur. Oyunlar 20'li olarak sayfa sonuna inildikçe fetch edilir.
- Not ekleme ekranında oyuna daha önce not eklenip eklenmediği kontrolü yapılır. Eğer eklenmişse daha önce eklenen not editlenmek üzere açılır. Eğer eklenmemişse boş şekilde yeni not eklemek için açılır.
- Uygulamada bulunan bütün ViewModel'lere unit test yazılmış ve uygulamanın %40,9'u cover edilmiştir.
## Dark Mode Ekran Görüntüleri
<div>
<div align="center">
<table>
<tr>
<td><img src="https://user-images.githubusercontent.com/96587699/208314683-aac020f2-99b9-4377-8ae2-c6474d5eb9f9.png" alt="drawing" width="275
"/></td> 
<td><img src="https://user-images.githubusercontent.com/96587699/208314682-06115e7e-c9da-414d-b2e7-2b214a81d2bf.png" alt="drawing" width="275
"/></td> 
<td><img src="https://user-images.githubusercontent.com/96587699/208314680-f4fc697a-c764-43a9-a465-7bc92c55f683.png" alt="drawing" width="275
"/></td> 
</tr>
</table>
<table>
<tr>
<td><img src="https://user-images.githubusercontent.com/96587699/208314672-4d48dd44-b11d-4a90-88d8-b5185f2259f6.png" alt="drawing" width="275
"/></td> 
<td><img src="https://user-images.githubusercontent.com/96587699/208314676-dc9937e2-81c4-4074-94cf-59c166df343b.png" alt="drawing" width="275
"/></td> 
<td><img src="https://user-images.githubusercontent.com/96587699/208314674-17c2fb4a-128f-4c75-a4ae-0d5660a23a3e.png" alt="drawing" width="275
"/></td> 
</tr>
</table>
</div>

## Türkçe Ekran Görüntüleri
<div>
<div align="center">
<table>
<tr>
<td><img src="https://user-images.githubusercontent.com/96587699/208314853-c303c363-ccab-4442-ab9e-de3befa78276.png" alt="drawing" width="275
"/></td> 
<td><img src="https://user-images.githubusercontent.com/96587699/208314852-73e6b26d-bdd0-4ca0-a651-6b4367a04b42.png" alt="drawing" width="275
"/></td> 
<td><img src="https://user-images.githubusercontent.com/96587699/208314851-7f879031-8cb7-45f5-900a-a328f495118a.png" alt="drawing" width="275
"/></td> 
</tr>
</table>
<table>
<tr>
<td><img src="https://user-images.githubusercontent.com/96587699/208314850-897ba3ac-3cd8-41bc-9c36-db9ac35b81b4.png" alt="drawing" width="275
"/></td> 
<td><img src="https://user-images.githubusercontent.com/96587699/208314848-55e55ac4-88d3-42e3-a88d-1b81ed242b2c.png" alt="drawing" width="275
"/></td> 
</tr>
</table>
</div>

## Pragmatic Programmer & Clean Code
- Pragmatic programmer ve Clean Code özetleri eklenmiştir.
- Commit tarihlerine bakmak için repomu inceleyebilirsiniz.
- https://github.com/esattozlu?tab=repositories
