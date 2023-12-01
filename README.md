# DevSecOps Configuration with Terraform, Ansible and AWS

   1. [Descripción](#descripción)
   2. [Requisitos](#requisitos)
   3. [Configuración](#configuración)
   4. [Variables](#variables)
   5. [Terraform Comandos](#terraform-comandos)

## Descripción

Automatización completa para una configuración segura de DevSecOps en AWS. Utiliza Ansible y Terraform para desplegar infraestructura, Jenkins para CI/CD, Trivy y OWASP para escaneo de vulnerabilidades, Sonarqube para análisis estático de código. Incluye configuración para Docker y Kubernetes.

## Requisitos

1. Terraform
2. Cuenta de AWS
3. Ansible
4. Linux (Ubuntu) o WSL2 con Ubuntu.

## Configuración

1. En Terraform
   1. Crear un archivo llamado `terraform.tfvars`, dentro del archivo, crea las variables de AWS.
   2. `aws_access_key` y `aws_secret_key` son las credenciales de AWS.

2. En Ansible
   1. Instala Ansible en tu máquina local de Linux o WSL2 con Ubuntu, para ello, ejecuta el script `ansible/install_ansible.sh`.
   2. En el resource `null_resource` del archivo `main.tf` de Terraform, establecer la ruta del archivo `ansible-playbook` en el `provisioner` de Terraform.

3. En Terraform
   1. Ejecuta el comando `terraform fmt` para formatear el código.
   2. Ejecuta el comando `terraform init` para inicializar el proyecto.
   3. Ejecuta el comando `terraform validate` para validar el código de Terraform.
   4. Ejecuta el comando `terraform plan` para ver el plan de ejecución.
   5. Ejecuta el comando `terraform apply -auto-approve` para aplicar los cambios en AWS.
      1. Establecer el nombre de la key_pair, por ejemplo: `public_instance`.
   6. Ejecuta el comando `ssh -i "ruta/del/archivo/filepem" ubuntu@ec2-{ec2-public-ip}.compute-1.amazonaws.com` (es el DNS de la instancia) para conectarse a la instancia creada.
   7. ``NOTA:`` Ejecuta el comando `terraform destroy` para destruir la instancia creada una vez ya no la necesites.

3. En Jenkins
   1. Entra al servidor de Jenkins a través del la IP pública de la instancia (EC2-Public-IP-Address:8080) y sigue los pasos para configurar Jenkins.
   2. Establece una contraseña para el usuario `admin`, la cual se encuentra en el archivo `jenkins/secrets/initialAdminPassword` o usa el comando `sudo cat /var/lib/jenkins/secrets/initialAdminPassword`.
   3. Instala los plugins recomendados.
   4. Crea un usuario y contraseña para el usuario `admin`.
   5. Ve al directorio de plugins que se encuentra en ``Manage Jenkins → Plugins → Available Plugins →`` e instala los siguientes plugins:
      1. adoptopenjdk
      2. sonar
      3. nodejs
      4. dependency-check-jenkins-plugin
      5. docker-plugin
      6. docker-commons
      7. docker-workflow
      8. docker-java-api
      9. docker-build-step
      10. kubernetes
      11. kubernetes-credentials
      12. kubernetes-client-api
      13. kubernetes-cli
   6. Ve a ``Manage Jenkins → Global Tool Configuration → JDK → JDK installations → Add JDK`` y establece el nombre como `jdk17`, dar click en `Instalar automáticamente` e instalalo a través de `Install from adoptium.net` y la versión `jdk-17+35`.
   7. Ve a ``Manage Jenkins → Global Tool Configuration → NodeJS → NodeJS installations → Add NodeJS`` y establece el nombre como `node18`, dar click en `Instalar automáticamente` e instalalo a través de `Install from nodejs.org` y la versión `18.18.0`.
   8. Ve a ``Manage Jenkins → Global Tool Configuration → SonarQube Scanner → SonarQube installations → Add SonarQube Scanner`` y establece el nombre como `sonarqube`, dar click en `Instalar automáticamente` e instalalo a través de `Install from sonarsource.org` y la versión `5.3.1`.

4. Sonarqube
   1. Ejecuta el comando `sudo chmod 777 /var/run/docker.sock` y luego `docker run -d --name sonar -p 9000:9000 sonarqube:lts-community` para crear el contenedor de Sonarqube en el puerto 9000.
   2. Entra al servidor de Sonarqube a través del la IP pública de la instancia (EC2-Public-IP-Address:9000) y sigue los pasos para configurar Sonarqube.
   3. Establece una contraseña para el usuario `admin`, la cual se encuentra en el archivo `sonarqube/conf/sonar.properties` o usa el comando `sudo cat /opt/sonarqube/conf/sonar.properties`.

## Variables

1. `aws_access_key` y `aws_secret_key` son las credenciales de AWS.
2. `aws_region` es la región de AWS.
3. `aws_ami` es la imagen de AWS.
4. `aws_instance_type` es el tipo de instancia de AWS.
5. `aws_key_pair` es la key_pair de AWS.