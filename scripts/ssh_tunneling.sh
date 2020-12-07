# Esta instrucción es para hacer tunelamiento del puerto 10000 para poder tener acceso a
# hive desde una parte externa del cluster Hadoop
#
# Este script se debe ejecutar en el nodo master del cluster y se debe reemplazar master-public-dns-name por
# el dns del cluster
#
# authorized_key se debe reemplazar por la clave PEM de acceso por lo que la misma se debe subir al nodo con anterioridad
# preferiblemente usando scp

ssh -o ServerAliveInterval=10 -i authorized_key  -N -L 10000:localhost:10000 hadoop@master-public-dns-name
