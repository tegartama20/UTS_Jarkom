# UTS_Jarkom
Nama : TEGAR TAMA WISNUSESA

Nim : 20210801238

Prodi : TEKNIK INFORMATIKA

1.Routing static adalah konfigurasi jaringan yang diproses menggunakan tabel kemudian dikonfigurasi secara manual oleh seseorang administrator jaringan.

2.Routing dynamic adalah routing yang dilakukan oleh router yang dilakukan router dengan cara membuat jalur komunikasi data otomatis sesuai dengan pengaturan yang yang dibuat.jika ada perubahan topologi jaringan ,maka router akan otomatis membuat jalur routing yang baru ,routing dyanamic ini lebih mudah dilakukan daripada menggunakan routing static dan default.

3.Firewall adalah sistem atau perangkat yang berfungsi untuk mengontrol lalu lintas jaringan yang masuk dan keluar dari perangkat jaringan.bekerja menganalisis data yang masuk dan keluar ,lalu memutuskan apakah data tersebut akan di izinkan,ditolak atau diblokir.

4.NAT (Network Address Tanslator) adalah sebuah jaringan yang sangat berguna untuk komputer. jaringan ini dapat menyambungkan dari jaringan pribadi menuju kedalam jaringan publik ,seperti firewall dan router.

# Cased
# Topologi
![topologi jarkomlanjut](https://github.com/user-attachments/assets/68b1a969-7cbb-4d99-ae1e-d2bce32713d2)

### 1. **Gambaran IPIP Tunnel**
- Router-router tersebut terhubung menggunakan **IPIP (IP-in-IP) tunnel**, yang membungkus paket IP dalam paket IP lain untuk melewati jaringan publik (seperti Internet) dengan aman.
- Setiap router memiliki alamat IP publik yang digunakan untuk membangun tunnel, serta alamat IP privat yang digunakan secara internal.

### 2. **Router 1 (R1 CR)**
- **IP Publik**: 10.10.1.1/24
- **Tunnel**: IPIP Tunnel dengan alamat 25.25.25.1/24.
- **Jaringan Privat**: Terhubung ke switch melalui interface Eth2 dengan IP 192.168.3.1/24, memberikan koneksi ke beberapa PC dalam jaringan 192.168.3.x.

### 3. **Router 2 (R2 KJ)**
- **IP Publik**: 16.17.2.1/24
- **Tunnel**: Terhubung ke R1 CR menggunakan IPIP Tunnel dengan alamat 25.25.25.2/24, dan juga terhubung ke R3 KHI menggunakan IPIP Tunnel dengan alamat 30.30.30.1/24.
- **Jaringan Privat**: Terhubung ke switch melalui interface Eth2 dengan IP 192.168.4.1/24, melayani beberapa PC dalam subnet 192.168.4.x.

### 4. **Router 3 (R3 KHI)**
- **IP Publik**: 15.15.2.1/24
- **Tunnel**: IPIP Tunnel dengan alamat 30.30.30.2/24 terhubung ke R2 KJ.
- **Jaringan Privat**: Terhubung ke switch melalui Eth2 dengan IP 192.168.5.1/24, melayani PC-PC dalam subnet 192.168.5.x.

### 5. **Koneksi Tunnel**
- **R1 CR ↔ R2 KJ**: Terhubung melalui IPIP Tunnel dengan alamat 25.25.25.1/24 (R1 CR) dan 25.25.25.2/24 (R2 KJ).
- **R2 KJ ↔ R3 KHI**: Terhubung melalui IPIP Tunnel dengan alamat 30.30.30.1/24 (R2 KJ) dan 30.30.30.2/24 (R3 KHI).

### 6. **Segmentasi Jaringan**
Setiap router mengelola subnetnya masing-masing:
- **R1 CR**: 192.168.3.0/24
- **R2 KJ**: 192.168.4.0/24
- **R3 KHI**: 192.168.5.0/24

Subnet-subnet ini saling terhubung menggunakan **IPIP tunnels**, memungkinkan komunikasi antar perangkat di subnet yang berbeda melalui router-router.

### 7. **Interface Ethernet**
- Setiap router memiliki dua interface Ethernet:
  - **Eth1**: Untuk koneksi IP publik, yang digunakan untuk komunikasi dengan Internet dan membangun tunnel IPIP.
  - **Eth2**: Untuk menghubungkan perangkat internal (PC dan switch) dalam jaringan lokal.

### Ringkasan Analisis:
Topologi jaringan ini mewakili VPN site-to-site menggunakan tunneling IPIP, di mana tiga jaringan area lokal (LAN) yang berbeda di lokasi yang berbeda (diwakili oleh R1 CR, R2 KJ, dan R3 KHI) terhubung melalui alamat IP publik menggunakan tunnel. Router-router ini menangani lalu lintas antar LAN tersebut dan ke Internet. Setiap router melayani subnet lokalnya sendiri dan memungkinkan komunikasi yang aman di jaringan publik melalui tunneling yang dienkapsulasi.
