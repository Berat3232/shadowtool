while true
do

clear

echo "S H A D O W  T O O L S CLOUDFLARED"
echo ""
echo "1) Cloudflared indir"
echo ""
echo "2) Cloudflared siteyi kur"
echo ""
echo "3) Önceki menü"

read -p "Seçim yap : " secim
if [ "$secim" == "1" ]; then

clear

echo "Cloudflared indirliyor"
echo "Cloudflared is being downloaded."
sleep 2

sudo apt install cloudflared -y

clear

echo "Cloudflared indirildi menüye dönülüyor"
echo "Cloudflared has been downloaded, returning to the menu."
sleep 2
continue

elif [ "$secim" == "2" ]; then
clear

read -p "Dosya dizinini girin : " dizin 

cd $dizin || { clear; 
echo "Dosya dizini hatalı farklı bir dosya dizini deneyin (The file directory is incorrect; try a different file directory.)";
sleep 2; continue; }

clear
read -p "Lütfen bir port numarası girin (Enter port number) : " port

clear
echo "Siteniz açılıyor lütfen bekleyin"
echo "Pls wait"
sleep 2

python3 -m http.server $port 
sleep 1

echo ""
echo "Local site adresiniz (localsite url) : localhost:$port"
echo "Siteniz dış dünaya açılıyor lütfen bekleyin" 
echo "Your site is going public, please wait."
sleep 2

cloudflared tunnel --url localhost:$port

echo ""
echo "Menüye döünlüyor dönmek için enter tuşuna basın"
echo "Returning to the menu. Press Enter to return."
echo ""

read -p "Enter..."
continue

elif [ "$secim" == "3" ]; then
clear

echo "Önceki menüye dönülüyor"
echo "Returning to the previous menu."
sleep 2

break

else
clear
echo "Yanlış seçim tekrar deneyin"
echo "Wrong choice, try again."
sleep 2
continue

fi
done

