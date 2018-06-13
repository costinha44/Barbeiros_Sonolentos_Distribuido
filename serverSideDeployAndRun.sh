echo "Compressing data to be sent to the server side node."
rm -rf serverSide.zip
zip -rq serverSide.zip serverSide comInf
echo "Transfering data to the server side node."
sshpass -f password ssh cd##??@l040101-ws08.ua.pt 'mkdir -p teste/BarbeirosSonolentosSocketCS'
sshpass -f password ssh cd##??@l040101-ws08.ua.pt 'rm -rf teste/BarbeirosSonolentosSocketCS/*'
sshpass -f password scp serverSide.zip cd##??@l040101-ws08.ua.pt:teste/BarbeirosSonolentosSocketCS
echo "Decompressing data sent to the server side node."
sshpass -f password ssh cd##??@l040101-ws08.ua.pt 'cd teste/BarbeirosSonolentosSocketCS ; unzip -uq serverSide.zip'
echo "Compiling program files at the server side node."
sshpass -f password ssh cd##??@l040101-ws08.ua.pt 'cd teste/BarbeirosSonolentosSocketCS ; javac */*.java'
echo "End of compiling at the server side node."
sleep 1
echo "Executing program at the server side node."
sshpass -f password ssh cd##??@l040101-ws08.ua.pt 'cd teste/BarbeirosSonolentosSocketCS ; java serverSide.ServerSleepingBarbers'
echo "Server  shutdown."
sshpass -f password ssh cd##??@l040101-ws08.ua.pt 'cd teste/BarbeirosSonolentosSocketCS ; less stat'
