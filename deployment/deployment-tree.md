# 

```
smartwork
   ├── README.txt
   │
   ├── jars
   │   ├── data-management-0.1-SNAPSHOT.jar
   │   ├── discovery-server-0.1-SNAPSHOT.jar
   │   ├── elastic-interface-0.1-SNAPSHOT.jar
   │   ├── infopad-interface-0.1-SNAPSHOT.jar
   │   ├── limesurvey-0.1-SNAPSHOT.jar
   │   ├── user-management-0.1-SNAPSHOT.jar
   │   ├── user-management-0.1-SNAPSHOT.jar
   │
   ├── mycbr-projects
   │   └── supportprim_cbr_latest.prj
   │
   ├── resources
   │   └── infopad_to_ism_transformer.xslt
   │
   ├── application-dev.yml
   ├── start-backend.sh
   └── stop-backend.sh
```
Linux commands to prepare a directory
```shell
cd /opt
mkdir smartwork
cd smartwork
cp -R <this smartwork folder>/* ./

cd /opt
#download 7.6.2 versions of elasticsearch and kibana
#https://www.elastic.co/downloads/past-releases/elasticsearch-7-6-2
#https://www.elastic.co/downloads/past-releases/kibana-7-6-2
tar -xf elasticsearch-7.6.2-linux-x86_64.tar.gz
tar -xf kibana-7.6.2-linux-x86_64.tar.gz
```
Copy all the jars to the their location as shown above.

Create application-dev.yml with the database connection credentials and LimeSurvey id:
```yaml
spring:
    datasource:
        password: <thepassword>
        url: jdbc:mysql://mysql.idi.ntnu.no/smartwork_usermgmt_dev?serverTimezone=Europe/Oslo
        username: <theusername>
limesurvey:
    survey_id: <id>
```
This overrides some properties from *limesurvey/src/main/resources/application.yml*. 
There you can find help on limesurvey properties.
If needed other properties can be overridden also.

```shell
chown -R <your-user>:www-data /opt/smartwork
```

Start services
```shell
sh start-backend.sh
```
