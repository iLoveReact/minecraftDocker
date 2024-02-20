FROM openjdk:17

WORKDIR /minecraft_server

RUN apt-get update && apt-get install -y wget 
    
RUN wget -O minecraft_server.1.20.4.jar https://piston-data.mojang.com/v1/objects/8dd1a28015f51b1803213892b50b7b4fc76e594d/server.jar

RUN java -Xms1024M -Xmx1024M -jar minecraft_server.1.20.4.jar --nogui

RUN echo "eula=true" > eula.txt

RUN sed -i 's/online-mode=true/online-mode=false/g' server.properties

EXPOSE 25565

CMD [ "java", "-Xms1024M", "-Xmx1024M", "-jar",  "minecraft_server.1.20.4.jar", "--nogui"]