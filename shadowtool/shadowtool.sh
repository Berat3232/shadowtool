while true 
do

clear

echo "S H A D O W  T O O L"
echo ""
echo "1) Web site güvenlik Tools"
echo ""
echo "2) Cloudflared bağlantı"
echo ""


read -p "Seçim yap : " secim

if [ "$secim" == "2" ]; then
clear
echo "Ayrı menüye yönlendiriliyorsunuz"
echo "You are being redirected to a separate menu."
sleep 2

cd cloudflared
bash cloudflaredmenu.sh



elif [ "$secim" == "1" ]; then

while true
do

clear

echo "S H A D O W  T O O L  M E N U 2"
echo ""
echo "1) Gerekenleri indir (Download what you need)"
echo ""
echo "2) Nmap taraması (Nmap scan)"
echo ""
echo "3) Sqlmap taraması (Sqlmap scan)"
echo ""
echo "4) Menü"

read -p "Seçim yap : " secim2

if [ "$secim2" == "1" ]; then
clear

echo "Gereken veriler indiriliyor(Downloading the necessary data.)"
sleep 2

sudo apt update && sudo apt upgrade

sudo apt install sqlmap -y
sudo apt install nmap -y 

clear

echo "İndirme tamamlandı menüye dönülüyor (The download is being converted to a complete menu.)"
sleep 2
continue

elif [ "$secim2" == "2" ]; then
clear

read -p "Bir ip adresi girin : " ip

sudo nmap -O -sS -sV "$ip"

echo ""
echo "Tarama tamamlandı menüye dönmek için enter tuşuna basın"
echo "Scanning complete. Press Enter to return to the menu."
echo ""

read -p "Enter..."
continue

elif [ "$secim2" == "3" ]; then
clear

read -p "Parametre girin (enter parameter) : " parametre

clear
echo "Tarama yapılıyor (Scanning in progress)"
sleep 2

sudo sqlmap -u "$parametre" --random-agent --batch --forms --crawl=2 --level=2 --risk=2

echo ""
echo "Tarama tamamlandı menüye dönmek için enter tuşuna basın"
echo "Scanning complete. Press Enter to return to the menu."
echo ""

read -p "Enter..."
continue

elif [ "$secim2" == "4" ]; then
break

else 
echo ""
echo "Hatalı seçim menüye dönülüyor"
sleep 2

fi
done

else 
echo ""
echo "Hatalı seçim menüye dönülüyor"
sleep 2

fi
done