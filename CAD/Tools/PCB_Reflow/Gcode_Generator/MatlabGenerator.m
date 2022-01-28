%% Reflow Heater Gcode Profile Generator!

% Settings
%   rules: for any replacable values, use string formatters (%d, %f, etc)
%   Each profile has one printable value, taken from the second column

% Profiles to follow
% folder header
CSV_folder = 'ChipQuik-TS391SNL';

% List of profile CSVs
%   a cell array of file names ({'Fan0'};%
profileCSVs = {'Hotend0','Fan0'};

%Wait Command
%   Command to wait for next setting
wait_cmd = 'G04 P%.2f\nM400\n\n'; 

% Frequency of updates
update_period = 1; %[seconds]

% remaining time updates
%   percent remaining, minutes remaining, seconds remaining, seconds tot
remaining_cmd = 'M73 P%.2f R%.3f; %.2f/%.0f seconds\n';

% Gcode Header
%   includes folder name (solder), and date compiled
gcode_header = [';IITC PCB Reflow\n'...
    ';Gcode to reflow SMD with a 3D printer controller\n'...
    ';  For Paste:   %s \n'...
    ';  Compiled on: %s\n\n\n'];

% Gcode Footer
%   stuff to end file
gcode_footer = ['M30\n'];

%% Read in Data

close all;
fig = figure('Position',[10 100 800 600]);
hold on;

commands = cell(size(profileCSVs));
for indCSVs = 1:numel(profileCSVs)
    
    filename = ['./' CSV_folder '/' profileCSVs{indCSVs} '.csv'];
    datar = readtable(filename, 'NumHeaderLines',2);
    datar.Properties.VariableNames = {'Time','Value'};
    
    fid = fopen(filename);
    stringCmd = fgetl(fid);
    cmdbuf = strsplit(stringCmd,',');
    stringFormats{indCSVs} = cmdbuf{2};
    fclose(fid);
    
    
    set(gca,'ColorOrderIndex',indCSVs)
    plot(datar.Time, datar.Value,'DisplayName',profileCSVs{indCSVs})
    
    %handle the auto plotting
    commandBuffer = []; %init blank
    for indTime = 1:size(datar,1)-1 %number of rows
        if (datar.Value(indTime) == datar.Value(indTime+1))
            %constant value
            timeBuf = datar.Time(indTime);
            valBuf = datar.Value(indTime);
%             commandBuffer = [commandBuffer;...
%                 [datar.Time(indTime) datar.Value(indTime)]];
        else %need to linearly interpolte
            timeBuf = [datar.Time(indTime):update_period:...
                (datar.Time(indTime+1)-update_period)]';
            slope = (datar.Value(indTime+1)-datar.Value(indTime))/...
                (datar.Time(indTime+1) - datar.Time(indTime));
            valBuf = datar.Value(indTime) + ...
                slope.*(timeBuf - datar.Time(indTime));
            
        end
        commandBuffer = [commandBuffer; [timeBuf valBuf]];
    end
     %always include last value
    commandBuffer = [commandBuffer; [datar.Time(end) datar.Value(end)]];
    set(gca,'ColorOrderIndex',indCSVs)
    plot(commandBuffer(:,1),commandBuffer(:,2),'o','DisplayName',...
        [profileCSVs{indCSVs} ' interp'],'MarkerSize',5,'LineWidth',1);
    
    commands{indCSVs} = commandBuffer; %save for later
end

legend('Location','northwest');
xlabel('Time [s]');
ylabel('Value [C, Fan Power]');
title([CSV_folder ' Reflow Profile']);

%% Create Gcode File

fileToWrite = ['./' CSV_folder '/' CSV_folder '-ReflowProfile.gcode'];
fid = fopen(fileToWrite,'w');

DOUBLE_TOL = 0.01;

%get sense of ALL times
allTimes = []; %init blank
for indTget = 1:numel(profileCSVs)
    allTimes = [allTimes; commands{indTget}(:,1)];
end
allTimes = unique(allTimes);
endSeconds = max(allTimes); %when do we end?

%gcode header
fprintf(fid, gcode_header, CSV_folder, datestr(datetime()));

%create file by going through EACH set
for indTime = 1:numel(allTimes)
    currTime = allTimes(indTime); 
    for indCSVs = 1:numel(profileCSVs)
        timLocations = abs(currTime - commands{indCSVs}(:,1)) < DOUBLE_TOL;
        if (any(timLocations)) %we will write
            fprintf(fid, stringFormats{indCSVs}, ...
                commands{indCSVs}(timLocations,2));
            fprintf(fid, '\n'); %always add a new line
        end
    end
    if (indTime ~= numel(allTimes)) %not on last loop
        fprintf(fid, remaining_cmd, currTime/endSeconds,...
            (endSeconds-currTime)/60, currTime, endSeconds);
        timetoWait = allTimes(indTime+1) - allTimes(indTime);
        fprintf(fid, wait_cmd, timetoWait);
    end
    
end
%gcode footer
fprintf(fid,gcode_footer);

%close gcode file
fclose(fid);
