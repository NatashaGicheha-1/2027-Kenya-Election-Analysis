# 🚀 Social Media Influence Analysis for Kenya's 2027 Election Campaign
- 📢 Can a single viral campaign message influence an entire election network?
- This project uses **Agent-Based Modeling (ABM)** and **Social Network Analysis** in MATLAB to simulate how political campaign messages spread across social media during Kenya's 2027 election. 🇰🇪📱

---

# 🎯 Project Overview
- Social media has become one of the most influential channels for political communication.
- During election campaigns, messages can spread rapidly through networks of connected users, shaping awareness, opinions, and engagement.

- This project models information diffusion within a directed social network and evaluates how:

  - 🤝 Trust.
  - 🚀 Virality.
  - 🌐 Network Structure.
  - 👑 Influential Users

affect campaign message reach and impact.

---

# 📌 Project Objectives

1. Model social media users as autonomous agents.
2. Construct a directed social network.
3. Simulate campaign message diffusion.
4. Analyze the effect of trust on diffusion.
5. Analyze the effect of message virality.
6. Compare information spread across network structures.
7. Visualize and interpret information diffusion outcomes.

---

# 📂 Dataset Description

## 👥 Users Dataset

The users dataset contains demographic and behavioral information about social media users.

### Attributes

- UserID
- County
- AgeGroup
- PrimaryPlatform
- PoliticalInterest
- TopIssue
- TrustLevel
- SharingProbability
- CandidatePreference
- IsInfluencer
- Followers
- Following

### Statistics

| Metric | Value |
|----------|----------|
| 👥 Total Users | 2,000 |
| 🤝 Mean Trust Level | 0.4972 |
| 📈 Mean Sharing Probability | 0.3026 |
| ⭐ Influencer Percentage | 2% |

---

## 🌐 Network Dataset

The network dataset represents social connections among users.

### Attributes

- SourceUser
- TargetUser
- EdgeType
- TrustWeight
- SameCounty

### Network Statistics

| Metric | Value |
|----------|----------|
| 🕸️ Nodes | 2,000 |
| 🔗 Directed Connections | 12,681 |

The network is modeled as a directed graph where information flows from a source user to a target user.

---

## 📢 Messages Dataset

The messages dataset contains election-related campaign content.

### Candidate Distribution

| Candidate | Percentage |
|------------|------------|
| 🟦 Candidate A | 37% |
| 🟥 Candidate B | 31% |
| 🟨 Candidate C | 14% |
| ⚪ Civic/Neutral | 18% |

---

# 🧠 Methodology

## 🌐 Social Network Construction
<img width="1200" height="600" alt="image" src="https://github.com/user-attachments/assets/83c1858f-a7d9-49e7-9464-8d0c5e979f30" />

A directed graph was created using:

```matlab
[~, s] = ismember(edges.SourceUser, users.UserID);
[~, t] = ismember(edges.TargetUser, users.UserID);

G = digraph(s,t,[],height(users));
```

This ensured correct mapping between users and network nodes.

---

## 🤖 Agent-Based Modeling

Each user was modeled as an autonomous agent with:

| Attribute | Description |
|------------|------------|
| 🤝 TrustLevel | Confidence in information |
| 🔄 SharingProbability | Likelihood of sharing |
| 👀 Exposed | Has seen the message |
| 📤 Shared | Has shared the message |

Exposure and sharing were modeled separately, allowing users to see content without necessarily sharing it.

---

# 🚀 Highest-Virality Campaign Message

Rather than selecting the first available message, the simulation automatically selected the message with the highest virality score.

| Attribute | Value |
|------------|------------|
| 🆔 Message ID | M034 |
| 🏛️ Candidate | Candidate C |
| 🏥 Topic | Healthcare |
| 🎵 Platform | TikTok |
| 🎥 Format | Short Video |
| ⚔️ Tone | Attack |
| 🌍 Language | Kiswahili |
| 🚀 Virality Score | 0.789 |

### Headline

> Candidate C: commitment to fix SHA rollout and hospital stocks

This message served as the starting point for the information diffusion process.

---

# 🌟 Seed User Selection
<img width="1200" height="600" alt="image" src="https://github.com/user-attachments/assets/79ae4c43-f1b8-44be-9310-2a01cbb3da44" />

Influential users were identified using outdegree centrality.

```matlab
degreeScores = outdegree(G);
[~, idx] = maxk(degreeScores,10);
```

The top ten users with the highest outgoing influence became seed users.

---

# 📡 Information Diffusion Rule
<img width="1200" height="600" alt="image" src="https://github.com/user-attachments/assets/5b2bf6be-6f6f-4433-9f06-709fb3ce151e" />

The probability of sharing was computed as:

```text
Share Chance =
Trust Level × Sharing Probability × Virality
```

Simulation Process:

1. 📤 Shared users influence connected users.
2. 👀 Connected users become exposed.
3. 🤔 Exposed users decide whether to share.
4. 🔄 Shared users continue spreading information.
5. 🛑 Diffusion stops when the network saturates.

Simulation duration:

```text
50 Time Steps
```

---

# 📊 Results

## 🚀 Information Diffusion

### Early Diffusion Progress

| Time Step | Exposed Users | Shared Users |
|----------|----------:|----------:|
| 1 | 1,147 | 140 |
| 2 | 1,366 | 169 |
| 3 | 1,403 | 176 |
| 4 | 1,410 | 177 |
| 5 | 1,417 | 178 |

The diffusion process stabilized after approximately Time Step 5.

---

## 📈 Final Diffusion Metrics

| Metric | Value |
|----------|----------|
| 👥 Total Users | 2,000 |
| 👀 Final Exposed Users | 1,417 |
| 📤 Final Shared Users | 178 |
| 📊 Saturation Rate | 70.85% |
| 🌍 Exposure Rate | 70.85% |
| 🔁 Sharing Rate Among Exposed Users | 12.56% |

---

## 🔎 Interpretation

The campaign message successfully reached:

```text
1,417 out of 2,000 users
```

representing:

```text
70.85% network saturation
```

Only:

```text
178 users
```

actively shared the content.

This means:

> 👀 Exposure does not necessarily lead to 📤 sharing.

Most users consumed information without redistributing it, reflecting realistic social media behavior.

---

# 🤝 Trust Analysis
<img width="1200" height="600" alt="image" src="https://github.com/user-attachments/assets/8d69cc11-fd4c-46cb-817a-43247f013456" />

Two trust scenarios were evaluated.

## 📈 High Trust Scenario

Trust values were increased while preserving natural user differences.

## 📉 Low Trust Scenario

Trust values were reduced while preserving natural user differences.

### Findings

- Increased trust accelerated diffusion.
- More users became exposed.
- More users participated in sharing.

### Conclusion

🤝 Trust is one of the strongest drivers of information diffusion.

---

# 🚀 Virality Analysis
<img width="1200" height="600" alt="image" src="https://github.com/user-attachments/assets/1bb72150-51b0-4404-a193-6a5a1a91a481" />

Two virality scenarios were compared.

| Scenario | Virality |
|-----------|-----------|
| 🔥 High Virality | 0.9 |
| 💤 Low Virality | 0.3 |

### Findings

- Highly viral messages spread faster.
- More users became exposed.
- Saturation occurred earlier.

### Conclusion

🚀 Message virality significantly increases campaign reach.

---

# 🌐 Network Structure Analysis
<img width="1200" height="600" alt="image" src="https://github.com/user-attachments/assets/f915e2e7-e5fc-4a12-b8fa-49013444abaf" />

The original election network was compared with a randomly generated directed network.

## Results

| Network Type | Final Exposed Users | Saturation Rate |
|--------------|-------------------:|----------------:|
| 🕸️ Original Network | 1,417 | 70.85% |
| 🎲 Random Network | 315 | 15.75% |

### Interpretation

Exposure Difference:

```text
1417 − 315 = 1102 users
```

The original network reached approximately:

```text
4.5× more users
```

than the random network.

### Conclusion

🌐 Network structure strongly influences information diffusion.

Well-connected networks spread information far more effectively than randomly connected ones.

---
# Final Social Network
<img width="1200" height="600" alt="image" src="https://github.com/user-attachments/assets/b3c1350b-0bdd-4998-910b-1be34af4c7ed" />

### Explanation

The final social network visualization represents the completed state of the information diffusion process after the campaign message had spread through the network. The network consists of **2,000 users** connected through **12,681 directed relationships**, reflecting a large-scale social media environment.

In the visualization, highlighted nodes represent the **seed users**, who were identified as the most influential users in the network based on their outgoing connections. These users acted as the initial source of campaign message dissemination and played a crucial role in accelerating information spread throughout the network.

The simulation used the campaign message **M034**, a healthcare-focused TikTok short video associated with **Candidate C**, with the highest virality score in the dataset (**0.789**). Due to its high virality and the strategic placement of influential seed users, the message was able to reach a substantial portion of the network.

### Interpretation

The visualization demonstrates the importance of influential users in political communication networks. Although only a small group of seed users initiated the diffusion process, their strategic network positions enabled the campaign message to propagate across a large proportion of the social network.

The results also show that exposure and sharing are different behaviors. While **1,417 users were exposed to the campaign message**, only **178 users chose to share it**, indicating that many users consume political content without actively redistributing it.

The high saturation rate suggests that the original network possessed efficient communication pathways that facilitated rapid information transfer. Highly connected users acted as hubs, allowing information to travel quickly across multiple communities within the network.

### Conclusion

The final network visualization confirms that network structure, user influence, trust, and message virality collectively determine the success of information diffusion. The campaign message achieved widespread exposure across the network, demonstrating how a highly viral message distributed through influential users can significantly amplify political communication on social media.

---
# 🎓 Detailed Conclusion for the Project

This project successfully demonstrated how **Agent-Based Modeling (ABM)** and **Social Network Analysis** can be used to examine the spread of political campaign information through social media networks during Kenya's 2027 election campaign.

Using a dataset of **2,000 users**, **12,681 directed social connections**, and election-related campaign content, the simulation revealed that information diffusion is strongly influenced by **trust, message virality, user influence, and network structure**. By selecting the highest-virality campaign message (**M034**) and introducing it through strategically positioned seed users, the model achieved substantial network penetration.

The simulation showed that the campaign message reached **1,417 users**, representing a **70.85% saturation rate**, while only **178 users actively shared the content**. This finding highlights an important characteristic of social media behavior: exposure does not necessarily lead to engagement. Many users consume information without redistributing it, while a relatively small group of active users can significantly amplify message reach.

The trust analysis demonstrated that higher trust levels increase the likelihood of information sharing and accelerate network diffusion. Similarly, the virality analysis confirmed that highly engaging content spreads more rapidly and reaches larger audiences. These findings emphasize the importance of message design and audience credibility in digital political communication.

The network structure analysis further revealed that network topology plays a critical role in information spread. The original election network exposed **1,417 users**, whereas a randomly generated network exposed only **315 users**. This substantial difference demonstrates that well-connected networks containing influential users are significantly more effective at disseminating information than randomly connected structures.

Overall, the study confirms that successful political communication on social media depends not only on the content itself but also on the relationships between users and the structure of the network through which information travels. The results show that **trustworthy, highly viral messages distributed through influential users within a strongly connected network can achieve widespread reach and influence**, making social media a powerful tool for modern election campaigns.

> 🚀 **Final Insight:** Even though only **178 users shared the campaign message, those users enabled the content to reach 1,417 people across the network, demonstrating the extraordinary amplification power of social media and the importance of influential users in information diffusion.**

### 🇨🇳 Project Takeaway (Chinese)

**星星之火，可以燎原**  
**Xīngxīng zhī huǒ, kěyǐ liáoyuán**

> *"A single spark can start a prairie fire."* 🔥

Just as a small spark can spread across a vast field, this project demonstrates how a single message shared by a few influential users can rapidly spread throughout an entire social network.

-------

# 📈 Visual Outputs

The project generates:

1. 🌐 Initial Kenya 2027 Election Social Network
2. 👑 Seed Users for Information Diffusion
3. 📊 Information Diffusion Over Time
4. 🤝 Trust Level Comparison
5. 🚀 Virality Comparison
6. 🌐 Network Structure Comparison
7. 🎯 Final Kenya 2027 Election Social Network

---

# 🔥 Key Findings

1. 🚀 The highest-virality message (M034) produced the greatest diffusion potential.
2. 👀 The message reached 1,417 users.
3. 📤 Only 178 users actively shared the content.
4. 🤝 Trust significantly influenced diffusion.
5. 🚀 Higher virality accelerated information spread.
6. 👑 Influential users played a critical role in campaign reach.
7. 🌐 The original network exposed 1,102 more users than a random network.
8. 📈 Network structure strongly affects campaign effectiveness.

---

# ⚠️ Limitations

The following attributes were available but not incorporated into the diffusion model:

- County
- AgeGroup
- PoliticalInterest
- PrimaryPlatform
- CandidatePreference

Future research may incorporate these variables to create more realistic user behavior simulations.

---

# 🔮 Future Improvements

Potential enhancements include:

- 📱 Platform-specific diffusion rules
- 🗳️ Candidate preference influence
- 👥 Demographic-based sharing behavior
- 📢 Multi-message campaign simulations
- 🕵️ Fact-checking and misinformation agents
- 🤖 Dynamic trust adaptation

---

# Fun Chinese Corner

| Chinese | Pinyin | Meaning | Project Relevance |
|----------|----------|----------|----------|
| 信息传播 | Xìnxī chuánbō | Information Diffusion | 📡 How messages spread through the network |
| 社交网络 | Shèjiāo wǎngluò | Social Network | 🌐 The election communication network |
| 信任 | Xìnrèn | Trust | 🤝 Trust Analysis |
| 影响力 | Yǐngxiǎnglì | Influence | 👑 Role of seed users |
| 选举 | Xuǎnjǔ | Election | 🗳️ Kenya 2027 Election |
| 病毒式传播 | Bìngdú shì chuánbō | Viral Spread | 🚀 Virality Analysis |

## 🎉 Trending Chinese Internet Slang

| Slang | Pinyin | Meaning | Project Example |
|--------|---------|----------|----------------|
| YYDS | Yǒngyuǎn de shén | The GOAT 🐐 | M034 was the **YYDS** of all campaign messages 🚀 |
| 666 | Liù liù liù | Awesome! | Reaching 1,417 users? **666!** 😎 |
| 牛啊 | Niú a | Impressive! | Original network exposing 1,417 users? **牛啊!** 🔥 |
| 起飞 | Qǐfēi | Take off | Once seed users started sharing, the message **起飞** 🚀 |

---

# 💡 Project Motto

### 小分享，大影响

**Xiǎo fēnxiǎng, dà yǐngxiǎng**

> 📲 Small share, big influence. 🌍

---

# 🛠 Technologies Used

- MATLAB 💻
- Agent-Based Modeling 🤖
- Directed Graph Analysis ➡️
- Social Network Analysis 🌐
- Data Visualization 📊

---

# ⭐ Final Takeaway

A highly viral healthcare campaign message reached **70.85% of the network**, demonstrating that **trust, virality, influential users, and network structure** are powerful drivers of political information diffusion in social media environments. 🚀📢🇰🇪
