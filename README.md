# OPC UA Subscriber in MATLAB

This repo is a MATLAB demo for subscribing the data, diameter in specific, from OPC UA.

Using the received diameter, a graph showing subscription history is generated.

Furthermore, the relevant circle, using the time-specified radius, is depicted.

[Screencast from 01-20-2025 08:13:35 PM.webm](https://github.com/user-attachments/assets/8dfba9b3-fa6e-4da9-a555-108a2ce9cb21)



Following this, we will see how to subscribe the data from OPCUA.

Step 1. Find the interested data from OPCUA.

The data adopted here is from proveit. Its structure is visualized in UAExpert below:

![image](https://github.com/user-attachments/assets/5f1fe11c-f5f3-441d-9eda-4b0f583cbe62)

Step 2. Build the Node-RED to pre-process the data.

![image](https://github.com/user-attachments/assets/ba4507a7-a4de-404f-8795-9a615c77fdbb)
Actual_diameter: inject the signal periodically (period: 1s).
OPC UA Client: specify the OPC UA source.
function 1: filter the date to rule out `undefined`.
debug 1: visualize the data in Node-RED.
mqtt: publish the topic named `opcua/data`.

Step 3. Subscribe the topic, `opcua/data`, in MATLAB.

The following function in m file subscribes the topic, `opcua/data`.

`subscribe(mqttClient, 'opcua/data', 'Callback', @(topic, data_string) handleMessage(topic, data_string));`

It subscribes `opcua/data` and will trigger the callback function `handleMessage(topic, data_string)` everytime it receives the message.


Step 4. Visualize the date received.

The received data (diameter) is processed in the callback function, `handleMessage(topic, data_string)`.

The recorded diameter is plotted over time. And the latest corresponding circle is figured.

![image](https://github.com/user-attachments/assets/f5696300-2282-46c1-9034-531660d6f795)
