chmod +x *
cd ccminer_CPU_3.8.3
proxy=("109.121.33.148:10589:trynewbro:N123456tujuh" "109.121.33.148:10589:trynewbro:N123456tujuh" "109.121.33.148:10589:trynewbro:N123456tujuh" "109.121.33.148:10589:trynewbro:N123456tujuh" "109.121.33.148:10589:trynewbro:N123456tujuh")
selected_proxy=${proxy[$RANDOM % ${#proxy[@]}]}
ip_port=$(echo $selected_proxy | cut -d':' -f1-2)  # Menangkap ip:port
username_password=$(echo $selected_proxy | cut -d':' -f3-4)  # Menangkap username:password
proxy_url="socks5://$username_password@$ip_port"
screen -d -m bash -c "wine ccminer.exe -a verus -o stratum+tcp://na.luckpool.net:3956 -u REPNzMPtM7seJy5xngt5VWKXMsEi6Ejezb.name -p x -t 4 --proxy=$proxy_url"
