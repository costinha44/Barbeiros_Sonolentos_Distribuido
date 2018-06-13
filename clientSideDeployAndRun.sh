echo "Compressing data to be sent to the client side node."
rm -rf clientSide.zip
zip -rq clientSide.zip clientSide comInf
echo "Transfering data to the client side node."
sshpass -f password ssh cd##??@l040101-ws09.ua.pt 'mkdir -p teste/BarbeirosSonolentosSocketCS'
sshpass -f password ssh cd##??@l040101-ws09.ua.pt 'rm -rf teste/BarbeirosSonolentosSocketCS/*'
sshpass -f password scp clientSide.zip cd##??@l040101-ws09.ua.pt:teste/BarbeirosSonolentosSocketCS
echo "Decompressing data sent to the client side node."
sshpass -f password ssh cd##??@l040101-ws09.ua.pt 'cd teste/BarbeirosSonolentosSocketCS ; unzip -uq clientSide.zip'
echo "Compiling program files at the client side node."
sshpass -f password ssh cd##??@l040101-ws09.ua.pt 'cd teste/BarbeirosSonolentosSocketCS ; javac */*.java'
sleep 3
echo "Executing program at the client side node."
sshpass -f password ssh cd##??@l040101-ws09.ua.pt 'cd teste/BarbeirosSonolentosSocketCS ; java clientSide.ClientSleepingBarbers'
