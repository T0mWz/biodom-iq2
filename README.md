# Biodom IQ2 Controller running statistics

Monitoring your Biodom IQ2 Controller via MQTT

The Biodom IQ2 Controller software contains MQTT integration.
This option is by default disabled, but can be actived via the config file in the `modules\MqttConfig.xml` in the folder of `LucifireTabletUI`.
Here I describe the steps to be taken.

## Steps

Step 1 - Setup an MQTT message broker. For example Mosquito
```
version: '3.2'

services:
  mqtt:
    container_name: mqtt
    build: ./mosquitto/
    environment:
      - MOSQUITTO_PASSWORDFILE='/mosquitto/config/passwordfile'
    ports:
      - 1883:1883
      - 9001:9001
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - ./conf:/mosquitto/config
      - ./data:/mosquitto/data
      - ./log:/mosquitto/log
    environment:
     - TZ=Europe/Amsterdam
    restart: always
```

Step 2 - Configure MQTT within the Biodom controller;  
Edit the `C:\LucifireTabletUI\modules\MqttConfig.xml` with texteditor for example  
Replace `192.168.123.123` with the IP of your mosquitto mqtt message broker  
```
<?xml version="1.0"?>
<MqttXmlSettings xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <Id Postfix="">{serial}</Id>
  <Type>1</Type>
  <BrokerHost>192.168.123.123</BrokerHost>
  <BrokerPort>1883</BrokerPort>
  <User>mosquitto</User>
  <Password>mosquitto</Password>
  <CACert></CACert>
  <TLSProtocol></TLSProtocol>
</MqttXmlSettings>
```

Step 3 - Check of you get any messages in your mqtt broker, for example with http://mqtt-explorer.com/  
<img width="307" alt="Screenshot 2023-05-11 at 22 56 26" src="https://github.com/T0mWz/biodom-iq2/assets/2477797/6bd097fe-04a7-479a-a7d6-bf8c96989338">

Step 4 - Read the Biodom IQ2 controller mqtt values in your Home Automation system. For example https://www.home-assistant.io/
