# OPC UA Subscriber in MATLAB

&emsp;&emsp;This repo is a MATLAB demo for subscribing the data, diameter in specific, from **OPC UA**.


&emsp;&emsp;Using the received diameter, a graph showing subscription history is generated. Furthermore, the relevant circle, using the time-specified radius, is depicted (see the video below).

[Screencast from 01-20-2025 08:13:35 PM.webm](https://github.com/user-attachments/assets/8dfba9b3-fa6e-4da9-a555-108a2ce9cb21)  

<br><br>

***Following this step-by-step document, we will see how to subscribe the data from OPC UA.***
  
<br>


## Step 1. Find the interested data from OPCUA.

<br>

&emsp;&emsp;The data adopted here is from proveit. Its structure is visualized in UAExpert below. The name of the data is `Actual_diameter`.

<br>

![image](https://github.com/user-attachments/assets/5f1fe11c-f5f3-441d-9eda-4b0f583cbe62)

<br>

## Step 2. Pre-process the data.

&emsp;&emsp;Build the Node-RED to pre-process the data.

<br>

![image](https://github.com/user-attachments/assets/ba4507a7-a4de-404f-8795-9a615c77fdbb)  
&emsp;&emsp;`Actual_diameter`: inject the signal periodically (period: 1s).  
&emsp;&emsp;`OPC UA Client`: specify the OPC UA source.  
&emsp;&emsp;`function 1`: filter the date to rule out `undefined`.  
&emsp;&emsp;`debug 1`: visualize the data in Node-RED.  
&emsp;&emsp;`mqtt`: publish the topic named `opcua/data`.  

<br>

## Step 3. Subscribe the topic, `opcua/data`, in MATLAB.

&emsp;&emsp;The following function in m file subscribes the topic, `opcua/data`.

&emsp;&emsp;&emsp;&emsp;`subscribe(mqttClient, 'opcua/data', 'Callback', @(topic, data_string) handleMessage(topic, data_string));`

&emsp;&emsp;It subscribes `opcua/data` and will trigger the callback function `handleMessage(topic, data_string)` everytime it receives the message.

<br>

## Step 4. Visualize the date received.

&emsp;&emsp;The received data (diameter) is processed in the callback function, `handleMessage(topic, data_string)`.  
&emsp;&emsp;The recorded diameter is plotted over time. And the latest corresponding circle is updated.

<br>

![image](https://github.com/user-attachments/assets/f5696300-2282-46c1-9034-531660d6f795)
