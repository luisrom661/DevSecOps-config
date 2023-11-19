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

## Configuración

1. Terraform
   1. Crear un archivo `terraform.tfvars` con las variables de AWS.
   2. `aws_access_key` y `aws_secret_key` son las credenciales de AWS.

2. Ansible
   1. En el resource `null_resource` establecer la ruta del archivo `ansible-playbook` en el `provisioner` de Terraform.

3. Jenkins
   1. Entra al servidor de Jenkins a través del la IP pública de la instancia (EC2-Public-IP-Address:8080) y sigue los pasos para configurar Jenkins.
   2. Establece una contraseña para el usuario `admin`, la cual se encuentra en el archivo `jenkins/secrets/initialAdminPassword` o usa el comando `sudo cat /var/lib/jenkins/secrets/initialAdminPassword`.

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

## Terraform Comandos

1. `terraform fmt` para formatear el código.
2. `terraform init` para inicializar el proyecto.
3. `terraform validate -no-color` para validar el código de Terraform.
4. `terraform plan` para ver el plan de ejecución.
5. `terraform apply -auto-approve` para aplicar los cambios en AWS.
   1. Establecer el nombre de la key_pair, siempre al final el "pem": (ej, server_pem)
6. `ssh -i "ruta del archivo pem" ubuntu@'ruta del DNS'` para conectarse a la instancia creada.
7. `Terraform destroy` para destruir la instancia creada.