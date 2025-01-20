clear
close all

global data num_receive;
data = [];
num_receive = 0;

% connect to MQTT Broker
mqttClient = mqttclient('tcp://127.0.0.1');

subscribe(mqttClient, 'opcua/data', 'Callback', @(topic, data_string) handleMessage(topic, data_string));

function handleMessage(~, data_string)
    global data num_receive;
    data = [data str2double(data_string)];
    num_receive = num_receive + 1;
    
    % plot the diameter
    
    subplot(2, 1, 1);
    
    plot(1:num_receive, data, 'Color', '#A2142F', 'LineWidth', 2);
    title('Diameter Received', 'FontSize', 14, 'FontWeight', 'bold');
    xlabel('Receiving Times', 'FontSize', 12);
    ylabel('Diameter [m]', 'FontSize', 12);
    grid on;


    % plot the circle
    subplot(2, 1, 2);

    diameter = data(end);
    radius = diameter / 2;
    theta = linspace(0, 2*pi, 100);
    x = radius * cos(theta);
    y = radius * sin(theta);

    customColor2 = [0.4660 0.6740 0.1880];
    fill(x, y, customColor2, 'EdgeColor', customColor2, 'LineWidth', 1);
    axis equal;
    grid on;

    xlabel('X [m]', 'FontSize', 12);
    ylabel('Y [m]', 'FontSize', 12);

end

% clear mqttClient;