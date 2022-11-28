# sCity

![deskripsi](https://github.com/danielcm585/sCity/actions/workflows/dpl.yml/badge.svg)

## Kelompok E08 
1. Daniel Christian Mandolang (2106630006)
2. Dylan Adiprawira (2106750446)
3. Jessica Lambok (2106654883)
4. Muhammad Adryan Haska Putra (2106750641)
5. Naufal Fikri Hakim (2106750566)
6. Raudhatul Jannah (2106654422)
---

Aplikasi dapat diakses [disini](https://scity.herokuapp.com/)

_Smart city_ merupakan konsep baru tentang sebuah kota yang sering kita dengar. Konsepnya adalah mendigitalkan semua jenis kegiatan yang ada di sebuah kota. Tujuan sebenarnya dari smart city adalah untuk menciptakan sebuah kota yang cukup cerdas untuk mengenali segala macam peristiwa yang terjadi di sebuah kota. Ini adalah pilar utama _smart city_.

- _Smart environment_  
- _Smart economy_
- _Smart branding_
- _Smart government_
- _Smart society_
- _Smart living_

Memperkenalkan aplikasi super kami, sCity. sCity adalah aplikasi web yang memungkinkan Anda mengelola kehidupan kota cerdas Anda. sCity menyediakan banyak layanan yang dapat Anda gunakan untuk meningkatkan kehidupan cerdas Anda. Layanan yang termasuk adalah :

- _Single Sign On (SSO) authentication system_

- _State revenue budget monitor and tender management system_ - Daniel Christian Mandolang
    
    Akan ada 3 jenis pengguna pada app ini:
    1. Government (admin) dapat membuat project
    2. Users dapat membuat companies and membuat tenders untuk beberapa proyek
    
   Dengan menggunakan platform ini, kita dapat mengembangkan alokasi anggaran pendapatan negara yang transparan.

- _Tourism management with online booking service_ - Jessica Lambok
    
    Pada App _Tourism Managemen_ akan ada 2 tipe pengguna (admin and user).
    1. Admin: dapat menambahkan destinasi wisata yang akan di display ke user.
    2. User: dapat membeli tiket atdi setiap destinasi wisara.

   Aplikasi ini diharapkan dapat mempermudah pengguna untuk membeli tiket masuk ke Destinasi Wisata, dengan harapan sektor pariwisata di kota ini dapat terus berkembang.

- _Waste bank management system_ - Muhammad Adryan Haska Putra

    Pada _Waste bank management_ system 2 jenis pengguna (admin dan user) yang memiliki otoritas yang berbeda.
    1. User : Dapat melakukan penyetoran sampah di bank sampah
    2. Admin : dapat melakukan update terhadap progres bank sampah yang di setorkan oleh User
    
    Aplikasi ini diharapkan dapat membantu pengelolaan bank sampah menjadi lebih baik menggunakan teknologi yang digunakan.

- _Public health services management system_ - Dylan Adiprawira

    Pada _Health services_ ini terdapat 2 jenis pengguna (admin dan user) keduanya memiliki authorization yang berbeda
    1. Admin: dapat memasukkan nama puskesmas yang registered, mereview form yang diberi user untuk dikonfirmasi.
    2. User: dapat meregistrasi ke registered puskesmas, dapat mengisi appointment date, dapat mengisi form general.

    Aplikasi ini diharapkan dapat memudahkan client untuk mendapatkan pertolongan yang mudah dan cepat tanpa melewati burokrasi yang rumit.

- _Agricultural products management system_ - Raudhatul Jannah

    Pada _Agriculture products management system_, terdapat 2 jenis pengguna (admin dan user) keduanya memiliki authorization yang berbeda
    1. Admin: dapat manambahkan item yang ditawarkan oleh petani dan juga dapat menghapusnya
    2. User: dapat melihat listing item-item yang ditawarkan oleh petani dan dapat mencari item yang dicari melalui searchbar

    Aplikasi ini diharapkan dapat membantu para petani dalam mempromosikan dan menjual hasil tani yang didapatkannya.

- _Marine products management system_ - Naufal Fikri Hakim

    Pada _Marine products management_ system, terdapat 2 jenis pengguna (admin dan user) keduanya memiliki authorization yang berbeda
    1. Admin: dapat manambahkan item yang ditawarkan oleh nelayan dan juga dapat menghapusnya
    2. User: dapat melihat listing item-item yang ditawarkan oleh nelayan dan dapat mencari item yang dicari melalui searchbar

    Aplikasi ini diharapkan dapat membantu para nelayan dalam mempromosikan dan menjual hasil kekayaan laut yang didapatkannya.

Layanan tersebut dapat diakses secara online dengan _single sign on authentication_ melalui smart devices Anda yang mendukung browser web seperti ponsel, tablet, atau komputer.

## Alur Webservice
---
Seluruh modul aplikasi ini menggunakan API yang tersedia di web online tugas tengah semester sebekumnya yaitu SCity. Nantinya Form pada aplikasi ini akan melakukan melakukan POST request ke aplikasi web SCity ke endpoint modul yang bersesuaian. Kemudia akan dilakukan juga pengambilan data dengan menggunakan GET request dari aplikasi web SCity.
