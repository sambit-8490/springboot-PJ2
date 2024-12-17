# **Deploy Spring Boot Project**

## **Tools Used**
1. **Ubuntu VirtualBox (Linux VM)**  
2. **Git**  
3. **Maven**  
4. **Docker**  
5. **Jenkins**  
6. **Kubernetes (Minikube)**  

---

## **Step 1: Install Required Tools**

### **1.1 Install Git**
```bash
sudo apt update
sudo apt install git -y
git --version
```

### **1.2 Install Java (OpenJDK 17)**
```bash
sudo apt install openjdk-17-jre -y
java -version
```

### **1.3 Install Maven**
```bash
sudo apt install maven -y
mvn -version
```

---

## **Step 2: Install and Configure Jenkins**

### **2.1 Install Jenkins**
1. Add Jenkins repository and GPG key:
```bash
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
```
2. Add the Jenkins repository to your sources:
```bash
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
```
3. Update and install Jenkins:
```bash
sudo apt-get update
sudo apt-get install jenkins -y
```

### **2.2 Add User Permissions for Jenkins**
1. Add Jenkins to necessary groups (replace `sambit/ubuntu` with your username):
```bash
sudo gpasswd -a jenkins sambit
sudo gpasswd -a sambit jenkins
sudo gpasswd -a docker jenkins
```
2. Update permissions for Jenkins home directory:
```bash
sudo chmod -R 777 /var/lib/jenkins
```

### **2.3 Install Docker Plugins in Jenkins**
1. Access the Jenkins UI at `http://<YOUR_VM_IP>:8080`.
2. Install the following Docker plugins:
   - **Docker**
   - **Docker Pipeline**
   - **Kubernetes Plugin**

---

## **Step 3: Install and Configure Docker**

### **3.1 Install Docker**
```bash
sudo apt install docker.io -y
docker --version
```

### **3.2 Add Docker Permissions**
1. Add your user and Jenkins to the Docker group (replace `sambit/ubuntu` with your username):
```bash
sudo gpasswd -a docker sambit
sudo gpasswd -a sambit docker
sudo gpasswd -a jenkins docker
```
2. Restart your system:
```bash
sudo reboot
```

---

## **Step 4: Install and Configure Kubernetes (Minikube)**

### **4.1 Install kubectl**
1. Download the `kubectl` binary:
```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
```
2. Verify the binary:
```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
```
3. Install `kubectl`:
```bash
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```
4. Verify installation:
```bash
kubectl version --client
```

### **4.2 Install Minikube**
1. Download and install Minikube:
```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
rm minikube-linux-amd64
```
2. Start Minikube:
```bash
minikube start
```
3. Verify Minikube:
```bash
kubectl get nodes
```

---

## **Step 5: Install Kubeshark (Optional)**

### **Install Kubeshark for Kubernetes Traffic Monitoring**
```bash
sh <(curl -Ls https://kubeshark.co/install)
```
### **Start Kubeshark**
```bash
kubeshark tap
```

---

## **Final Notes**
1. Ensure all tools are properly installed and configured.
2. Use Jenkins to build, package (Maven), and deploy the Spring Boot application to Docker.
3. Integrate Kubernetes (Minikube) with Jenkins for container orchestration.

---

**Happy Coding! 🚀**
