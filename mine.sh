chmod +x *
cd ccminer_CPU_3.8.3
proxy=("109.121.33.229:10589:trynewbro:N123456tujuh" "109.121.33.189:10589:trynewbro:N123456tujuh" "109.121.33.149:10589:trynewbro:N123456tujuh" "109.121.33.148:10589:trynewbro:N123456tujuh" "109.121.33.59:10589:trynewbro:N123456tujuh" "109.121.33.31:10589:trynewbro:N123456tujuh" "45.205.147.239:62000:e3a942f4:b0780893" "45.205.147.114:62000:7c9ff6cd:3a658577" "45.205.147.124:62000:3afb3516:8ab4c9f4" "45.205.147.112:62000:ff1e134a:5855b9a2" "45.205.147.106:62000:899d1e0d:c32d0278" "45.205.147.117:62000:f44b8faf:509f0858" "45.205.147.236:62000:4f96a38f:c3f5c521" "45.205.147.125:62000:063a473d:4b22932e" "45.205.147.109:62000:7ab25482:2dce3df2" "45.205.147.100:62000:bf2f6429:dcacee1b" "45.205.147.123:62000:7f7bcf1e:561b23ea" "45.205.147.103:62000:d02d9f59:e1d031f3" "45.205.147.104:62000:060a37a7:264418ee" "45.205.147.230:62000:b71ac1f8:084faff2" "45.205.147.226:62000:f60d7b88:b8170c6c" "45.205.147.229:62000:4c90bbc5:86deecb0" "45.205.147.122:62000:efd2ecc0:44bd53e3" "45.205.147.102:62000:ab668ae8:4da32b43" "45.205.147.105:62000:9ca71d27:c48c8e3a" "45.205.147.110:62000:0cbfa830:6538cde3" "45.205.147.250:62000:ee07169a:8cda6447" "45.205.147.243:62000:cc797779:eadef832" "45.205.147.116:62000:81384499:1b0656e4" "45.205.147.99:62000:32aa9a3b:295eace9" "45.205.147.119:62000:c128b265:db3af800" "45.205.147.107:62000:534e6a93:1b286170" "45.205.147.118:62000:70ede72e:f3b29584" "45.205.147.121:62000:4d86ac4a:ce43b6e4" "45.205.147.249:62000:5ace24f0:86d80890" "45.205.147.232:62000:5e7c81be:ce92bf83" "45.205.147.108:62000:4dbfa259:0e352296" "45.205.147.113:62000:adfae9b5:5ee8071c" "45.205.147.126:62000:fc4c92bf:9bd47f66" "45.205.147.101:62000:c2785c0e:5546baab" "45.205.147.248:62000:ce5cd5fb:e07737aa" "45.205.147.245:62000:8a3f2427:adc9e701" "45.205.147.98:62000:380140e1:88774a05" "45.205.147.228:62000:4dcced29:ca65c6d8" "45.205.147.120:62000:795f444c:fcac1c90" "45.205.147.111:62000:224e2fde:6bdaf15a")
selected_proxy=${proxy[$RANDOM % ${#proxy[@]}]}
ip_port=$(echo $selected_proxy | cut -d':' -f1-2)  # Menangkap ip:port
username_password=$(echo $selected_proxy | cut -d':' -f3-4)  # Menangkap username:password
proxy_url="socks5://$username_password@$ip_port"
screen -d -m bash -c "wine ccminer.exe -a verus -o stratum+tcp://eu.luckpool.net:3956 -u REPNzMPtM7seJy5xngt5VWKXMsEi6Ejezb.tetes_new_2 -p x -t 6 --proxy=$proxy_url"
