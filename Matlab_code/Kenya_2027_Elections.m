clc
clear
close all

%% 1: Import datasets
users = readtable('users.csv');
edges = readtable('network_edges.csv');
messages = readtable('messages.csv');

% View datasets
head(users)
head(edges)
head(messages)

%% 2: Build and Visualize the Social Network
% Create the graph
[~, s] = ismember(edges.SourceUser, users.UserID);
[~, t] = ismember(edges.TargetUser, users.UserID);

G = digraph(s, t, [], height(users));

% Verify node mapping
disp(users.UserID(1:5))
disp(edges.SourceUser(1:5))
disp(s(1:5))

% Verify the graph was created
numnodes(G)
numedges(G)

% Visualize the network
figure(1)
p = plot(G,'Layout','force');

p.NodeColor = 'magenta';
p.EdgeColor = [1 0.2 0.6];

title('Initial Kenya 2027 Election Social Network')

% Calculate influence scores
degreeScores = outdegree(G);

% Displays the first 10 values in the degreeScores vector
degreeScores(1:10)

%% 3: Define Agent Attributes
% Add a column to track whether a user has seen the campaign message
% 0 = Not exposed
% 1 = Exposed
users.Exposed = zeros(height(users),1);

% Add a column to track whether a user has shared the campaign message
% 0 = Not shared
% 1 = Shared
users.Shared = zeros(height(users),1);

% Display the first few rows of the updated users table
head(users)

% Display information about the table structure
summary(users)


%% 4: Select Initial Campaign Message

% Select the message with the highest virality score
[~, maxIdx] = max(messages.Virality);

message = messages(maxIdx,:);

% Display the Highest Virality message
disp('Highest Virality Message Selected:')
disp(message)

% Display key message characteristics
disp('Message Details:')
disp(['Topic: ', char(message.Topic)])
disp(['Candidate: ', char(message.Candidate)])
disp(['Virality: ', num2str(message.Virality)])

% Verification
% Check that the data loaded correctly.
head(messages)

% Verify the exact column names 
messages.Properties.VariableNames

% Understand the distribution of messages among candidates.
tabulate(categorical(messages.Candidate))

%% 5: Choose Seed Users
% Calculate the degree (number of connections)
% for each user in the social network
degreeScores = outdegree(G);

% Identify the 10 most connected users
% These users will act as the starting points
% for information diffusion
[~, idx] = maxk(degreeScores, 10);

% Mark the selected users as exposed
% to the campaign message
users.Exposed(idx) = 1;

% Mark the selected users as having
% already shared the campaign message
users.Shared(idx) = 1;

% Display the selected seed users
disp('Top 10 Seed Users:')
disp(idx)

% Display their degree scores
disp('Degree Scores of Seed Users:')
disp(degreeScores(idx))

% Verify initialization
disp('Number of Exposed Users:')
disp(sum(users.Exposed))

disp('Number of Shared Users:')
disp(sum(users.Shared))

% Visualize the social network
% with seed users highlighted
figure(2)

p = plot(G,'Layout','force');

% Set a pink theme for the network
p.NodeColor = [1 0.75 0.85];
p.EdgeColor = [1 0.85 0.90];

% Highlight seed users in magenta
highlight(p, idx, ...
    'NodeColor', 'm', ...
    'MarkerSize', 8)

title('Seed Users for Information Diffusion')

%% 6: Information Diffusion Simulation
% Number of simulation time steps
numSteps = 50;

% Create arrays to store results
results.TimeStep = zeros(numSteps,1);
results.ExposedUsers = zeros(numSteps,1);
results.SharedUsers = zeros(numSteps,1);

% Run the diffusion simulation
for t = 1:numSteps

    % Find users who have already shared the message
    currentSharers = find(users.Shared == 1);

    % Loop through each sharing user
    for i = 1:length(currentSharers)

        % Current user
        userID = currentSharers(i);

        % Find connected users
        neighborList = successors(G,userID);

        % Check each connected user
        for j = 1:length(neighborList)

            target = neighborList(j);

            % Skip users who have already been exposed
            if users.Exposed(target) == 0

                % User receives/sees the message
                users.Exposed(target) = 1;

                % Calculate probability of sharing
                shareChance = ...
                    users.TrustLevel(target) * ...
                    users.SharingProbability(target) * ...
                    message.Virality;

                % Determine whether the exposed user decides to share
                if rand < shareChance

                    users.Shared(target) = 1;

                end  

            end

        end

    end

    % Store results for this time step
    results.TimeStep(t) = t;
    results.ExposedUsers(t) = sum(users.Exposed);
    results.SharedUsers(t) = sum(users.Shared);

end

% Display first 10 results
table(results.TimeStep(1:10), ...
    results.ExposedUsers(1:10), ...
    results.SharedUsers(1:10), ...
    'VariableNames', ...
    {'TimeStep','ExposedUsers','SharedUsers'})

% Visualize the Diffusion Process
figure(3)

plot(results.TimeStep,...
    results.ExposedUsers,...
    'm','LineWidth',2)

title('Information Diffusion Over Time')
xlabel('Time Step')
ylabel('Number of Exposed Users')

grid on

%% 7: Collect Results
% Convert simulation results into a table
resultsTable = table( ...
    results.TimeStep, ...
    results.ExposedUsers, ...
    results.SharedUsers, ...
    'VariableNames', ...
    {'TimeStep','ExposedUsers','SharedUsers'});

% Calculate network saturation rate (% of users exposed)
resultsTable.SaturationRate = ...
    (resultsTable.ExposedUsers / height(users)) * 100;

% Display the first few rows
disp('Simulation Results:')
head(resultsTable)

% Save results to a CSV file
writetable(resultsTable,'diffusion_results.csv');

% Confirm file creation
disp('Results saved as diffusion_results.csv')

%% 8: Trust Analysis

% Create copies of the users table
highTrustUsers = users;
lowTrustUsers = users;

% Reset simulation state
highTrustUsers.Exposed(:) = 0;
highTrustUsers.Shared(:) = 0;

lowTrustUsers.Exposed(:) = 0;
lowTrustUsers.Shared(:) = 0;

% Reinitialize seed users
highTrustUsers.Exposed(idx) = 1;
highTrustUsers.Shared(idx) = 1;

lowTrustUsers.Exposed(idx) = 1;
lowTrustUsers.Shared(idx) = 1;

% Increase trust levels while preserving differences between users
highTrustUsers.TrustLevel = ...
    min(users.TrustLevel * 1.5, 1);

% Decrease trust levels while preserving differences between users
lowTrustUsers.TrustLevel = ...
    users.TrustLevel * 0.5;

% Store results
highTrustSpread = zeros(numSteps,1);
lowTrustSpread = zeros(numSteps,1);

% High Trust Scenario
for t = 1:numSteps

    currentSharers = find(highTrustUsers.Shared == 1);

    for i = 1:length(currentSharers)

        userID = currentSharers(i);
        neighborList = successors(G,userID);

        for j = 1:length(neighborList)

            target = neighborList(j);
            if highTrustUsers.Exposed(target) == 0

                % User sees the message
                highTrustUsers.Exposed(target) = 1;

                shareChance = ...
                    highTrustUsers.TrustLevel(target) * ...
                    highTrustUsers.SharingProbability(target) * ...
                    message.Virality;

                % User decides whether to share
                if rand < shareChance

                    highTrustUsers.Shared(target) = 1;

                end
            end
        end
    end

    highTrustSpread(t) = sum(highTrustUsers.Exposed);

end

% Low Trust Scenario
for t = 1:numSteps

    currentSharers = find(lowTrustUsers.Shared == 1);

    for i = 1:length(currentSharers)

        userID = currentSharers(i);
        neighborList = successors(G,userID);

        for j = 1:length(neighborList)

            target = neighborList(j);
            if lowTrustUsers.Exposed(target) == 0

                % User sees the message
                lowTrustUsers.Exposed(target) = 1;

                shareChance = ...
                    lowTrustUsers.TrustLevel(target) * ...
                    lowTrustUsers.SharingProbability(target) * ...
                    message.Virality;

                % User decides whether to share
                if rand < shareChance

                    lowTrustUsers.Shared(target) = 1;

                end
            end
            
        end
    end

    lowTrustSpread(t) = sum(lowTrustUsers.Exposed);

end

% Compare Results
figure(4)
clf

plot(1:numSteps, highTrustSpread, ...
    'm','LineWidth',2)

hold on

plot(1:numSteps, lowTrustSpread, ...
    '--','Color',[1 0.6 0.8], ...
    'LineWidth',2)

title('Trust Level Comparison')
xlabel('Time Step')
ylabel('Number of Exposed Users')
legend('High Trust','Low Trust')
grid on
hold off

%% 9: Virality Analysis

% Create copies of the users table
highViralityUsers = users;
lowViralityUsers = users;

% Reset simulation state
highViralityUsers.Exposed(:) = 0;
highViralityUsers.Shared(:) = 0;

lowViralityUsers.Exposed(:) = 0;
lowViralityUsers.Shared(:) = 0;

% Reinitialize seed users
highViralityUsers.Exposed(idx) = 1;
highViralityUsers.Shared(idx) = 1;

lowViralityUsers.Exposed(idx) = 1;
lowViralityUsers.Shared(idx) = 1;

% Define virality levels
highVirality = 0.9;
lowVirality = 0.3;

% Store results
highViralitySpread = zeros(numSteps,1);
lowViralitySpread = zeros(numSteps,1);

% High-Virality Simulation
for t = 1:numSteps

    currentSharers = find(highViralityUsers.Shared == 1);

    for i = 1:length(currentSharers)

        userID = currentSharers(i);
        neighborList = successors(G,userID);

        for j = 1:length(neighborList)

            target = neighborList(j);
            if highViralityUsers.Exposed(target) == 0

                % User sees the message
                highViralityUsers.Exposed(target) = 1;

                shareChance = ...
                    highViralityUsers.TrustLevel(target) * ...
                    highViralityUsers.SharingProbability(target) * ...
                    highVirality;

                % User decides whether to share
                if rand < shareChance

                    highViralityUsers.Shared(target) = 1;

                end
            end
            
        end
    end

    highViralitySpread(t) = sum(highViralityUsers.Exposed);

end

% Low-Virality Simulation
for t = 1:numSteps

    currentSharers = find(lowViralityUsers.Shared == 1);

    for i = 1:length(currentSharers)

        userID = currentSharers(i);
        neighborList = successors(G,userID);

        for j = 1:length(neighborList)

            target = neighborList(j);
            if lowViralityUsers.Exposed(target) == 0

                % User sees the message
                lowViralityUsers.Exposed(target) = 1;

                shareChance = ...
                    lowViralityUsers.TrustLevel(target) * ...
                    lowViralityUsers.SharingProbability(target) * ...
                    lowVirality;

                % User decides whether to share
                if rand < shareChance

                    lowViralityUsers.Shared(target) = 1;

                end
            end
            
        end
    end

    lowViralitySpread(t) = sum(lowViralityUsers.Exposed);

end

% Compare Results
figure(5)

plot(1:numSteps,...
     highViralitySpread,...
     'm','LineWidth',2)

hold on

plot(1:numSteps,...
     lowViralitySpread,...
     '--','Color',[1 0.6 0.8],...
     'LineWidth',2)

title('Virality Comparison')
xlabel('Time Step')
ylabel('Number of Exposed Users')
legend('High Virality','Low Virality')
grid on

%% 10: Network Structure Analysis

% Final exposure in the original network
originalExposure = results.ExposedUsers(end);

% Create random directed network
numNodes = numnodes(G);
numEdges = numedges(G);

sourceNodes = randi(numNodes,numEdges,1);
targetNodes = randi(numNodes,numEdges,1);

G_random = digraph(sourceNodes,targetNodes);

% Reset user states
randomUsers = users;

randomUsers.Exposed(:) = 0;
randomUsers.Shared(:) = 0;

% Reinitialize seed users
randomUsers.Exposed(idx) = 1;
randomUsers.Shared(idx) = 1;

% Store random-network results
randomSpread = zeros(numSteps,1);

% Run diffusion on random network
for t = 1:numSteps

    currentSharers = find(randomUsers.Shared == 1);

    for i = 1:length(currentSharers)

        userID = currentSharers(i);

        neighborList = successors(G_random,userID);

        for j = 1:length(neighborList)

            target = neighborList(j);

            if randomUsers.Exposed(target) == 0

                % User sees the message
                randomUsers.Exposed(target) = 1;

                shareChance = ...
                    randomUsers.TrustLevel(target) * ...
                    randomUsers.SharingProbability(target) * ...
                    message.Virality;

                % User decides whether to share
                if rand < shareChance

                    randomUsers.Shared(target) = 1;

                end
            end
        end
    end

    randomSpread(t) = sum(randomUsers.Exposed);

end

% Final exposure in random network
randomExposure = randomSpread(end);

% Compare diffusion performance
figure(6)

bar([originalExposure randomExposure],...
    'FaceColor',[1 0.4 0.7])

title('Network Structure Comparison')
xlabel('Network Type')
ylabel('Final Exposed Users')

set(gca,'XTickLabel',...
    {'Original Network','Random Network'})

grid on

% Display results
disp('Network Structure Results')
disp(['Original Network Final Exposure: ', ...
    num2str(originalExposure)])

disp(['Random Network Final Exposure: ', ...
    num2str(randomExposure)])


%% 11: Final Social Network Visualization

% Create final network visualization
figure(7)

p = plot(G,'Layout','force');

% Apply pink theme
p.NodeColor = [1 0.75 0.85];
p.EdgeColor = [1 0.85 0.90];

% Highlight seed users
highlight(p, idx, ...
    'NodeColor', 'm', ...
    'MarkerSize', 8)

% Add title
title('Final Kenya 2027 Election Social Network')

% Improve appearance
p.LineWidth = 0.5;

grid off

%% Put figures in the fol
exportgraphics(figure(1),'figure1_initial_network.png','Resolution',300)
exportgraphics(figure(2),'figure2_seed_users.png','Resolution',300)
exportgraphics(figure(3),'figure3_diffusion.png','Resolution',300)
exportgraphics(figure(4),'figure4_trust.png','Resolution',300)
exportgraphics(figure(5),'figure5_virality.png','Resolution',300)
exportgraphics(figure(6),'figure6_network_structure.png','Resolution',300)
exportgraphics(figure(7),'figure7_final_network.png','Resolution',300)