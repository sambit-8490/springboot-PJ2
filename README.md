------------------DEPLOY SPRINGBOOT PROJECT-------------

----USING TOOLS----
1.UBUNTU VIRTUAL BOX (LINUX VM)
2. GIT
3. MAVEN
4. DOCKER
5. JENKINS
6. KUBERNETES
----------------------------------------
STEP-1 -- IN UBUNTU INSTALL GIT, JAVA, MAVEN, JENKINS, DOCKER, MINIKUBE AND KUBERNETES CLUSTER(KUBECTL).
-----
---JENKINS INSTALL STEP--
 sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
    https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
    ---------
     echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null
    -----------
    sudo apt-get update
  sudo apt-get install openjdk-17-jre
  sudo apt-get install jenkins
  ---AFETR INSTALL JENKINS ADD JENKINS TO YOUR GROUP---------
  sudo gpasswd -a jenkins sambit/ubuntu
  sudo gpasswd -a sambit jenkins
  sudo gpasswd -a docker jenkins
 ------ GIVE PERMISSION TO JENKINS HOME-DIRECTORY PATH ====  RWX OR 777 PERMISSION
  ------INSTALL 3 DOCKER PLUGINS IN JENKINS--------
  
  -----INTEGREATE JENKINS WITH KUBERNETES STEP -----
  GIVE PERMISSION TO /.KUBE/CONFIG = 777
   GIVE PERMISSION TO /.MINIKUBE/ = 777
  -------------------------

  
  ------DOCKER INSTALL----
  sudo apt install docker .io
  ---AFETR INSTALL JENKINS ADD DOCKER TO YOUR GROUP---------
  sudo gpasswd -a docker sambit/ubuntu
  sudo gpasswd -a sambit docker
  -----THEN RESTART YOUR SYSTEM-----

  
  ------KUBERNETES INSTALL OR SETUP --STEP------
  kubectl: Install kubectl binary with curl on Linux

 curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
   
 curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"

echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

kubectl: kubectl install

sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

minikube: install

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64

:::::INSTALL KUBESHARK:::::::
sh <(curl -Ls https://kubeshark.co/install)

::START:::
kubeshark tap

------------
  
  
