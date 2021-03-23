FROM cm2network/steamcmd

ENV WORLD "Dedicated"
ENV NAME "Valheim docker dedicated server"
ENV PASSWORD "PASS_A_VALUE_FOR_MEE"

ENV STEAMAPPDIR "${HOMEDIR}/steamapps"

RUN mkdir ${STEAMAPPDIR} && /home/steam/steamcmd/steamcmd.sh +login anonymous +force_install_dir ${STEAMAPPDIR} +app_update 896660 validate +exit

VOLUME ["/saves"]

EXPOSE 2456 2457 2448

# Valheim uses these internally, not meant to be bound by users
ENV LD_LIBRARY_PATH ${STEAMAPPDIR}/linux64
ENV SteamAppId 892970

CMD ["sh", "-c", "${STEAMAPPDIR}/valheim_server.x86_64 -nographics -batchmode -name \"${NAME}\" -port 2456 -savedir \"/saves\" -world \"${WORLD}\" -password \"${PASSWORD}\""]