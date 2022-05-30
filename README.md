#  CreditCheckerJava
### Deployement guide
1. Install java 
```
sudo apt-get update
sudo apt-get install openjdk-11-jdk
```

2. Upload the the java file using the scp command
   
```
scp  "keyname.pem" filename.jar username@ip:path
```

3. Start the application

List process to check if  the java application is running  

```
ps aux | grep java 
```

Kill the process using this command Kill (if req)

```
kill -9  <pid>
```

Start the the app 

```
nohup java -jar -Dserver.port=443 /home/ubuntu/app/<jar name> &

or 

nohup java -jar /home/ubuntu/app/<jar name> &
```
