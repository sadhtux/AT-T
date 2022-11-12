
### Ejecutar como root desde los servidores ###

### Creamos un directorio en el /tmp del equipo con el nombre del servidor
mkdir -pv /tmp/${HOSTNAME}

### Guardamos la salida del comando hostnamectl (info general de la VM) en el archivo cmd_hostnamectl.output
hostnamectl  >  /tmp/${HOSTNAME}/cmd_hostnamectl.output

### Guaradmos la salida del comando ip a (info networking) en el archivo cmd_ip-a.output
ip a  >  /tmp/${HOSTNAME}/cmd_ip-a.output

### Guardamos la salida del comando con informacion sobre la suscripcion en el archivo cmd_subscrition-mgnr-list-all.output
subscription-manager list --available --all   >  /tmp/${HOSTNAME}/cmd_subscrition-mgnr-list-all.output

### Comprimimos toda la info referente al HOST o VM en la que estamos trabajando en un tar.gz
tar cvzf ${HOSTNAME}_report.tar.gz /tmp/${HOSTNAME}

### Usamos scp para sacar el reporte a otro equipo para enviarlo al ejecutor de la ventana por parte de Redhat.
### Puede ser extraido de forma inversa (desde maquina windows con WinSCP para enviar por mail) 
### Url: https://winscp.net/eng/download.php
scp /tmp/${HOSTNAME}_report.tar.gz  remoteUser@remoteMachine:/home/remoteUser/
