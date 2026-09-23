--Basic dataset overview
SELECT COUNT(*) AS total_jobs
FROM Global_AI_Agent_Workforce_Integration_2026_CLEANED;

--Part A — AI Workforce Integration Analysis

--1.)Which industries deploy the most AI agents?:
SELECT
    Industry,
    SUM(Autonomous_Agents_Deployed) AS total_ai_agents
FROM Global_AI_Agent_Workforce_Integration_2026_CLEANED
GROUP BY Industry
ORDER BY total_ai_agents DESC;

--2.)Average productivity gain by industry:
SELECT
    Industry,
    ROUND(AVG(Productivity_Gain_Percent), 2) AS avg_productivity_gain
FROM Global_AI_Agent_Workforce_Integration_2026_CLEANED
GROUP BY Industry
ORDER BY avg_productivity_gain DESC;

---3.) AI agents vs human roles replaced
SELECT
    Industry,
    SUM(Autonomous_Agents_Deployed) AS ai_agents,
    SUM(Human_Roles_Replaced) AS roles_replaced
FROM Global_AI_Agent_Workforce_Integration_2026_CLEANED
GROUP BY Industry
ORDER BY roles_replaced DESC;

--4.) AI augmentation vs replacement
SELECT
    Industry,
    SUM(Human_Roles_Replaced) AS roles_replaced,
    SUM(Human_Roles_Augmented) AS roles_augmented
FROM Global_AI_Agent_Workforce_Integration_2026_CLEANED
GROUP BY Industry
ORDER BY roles_augmented DESC;

--5.)Augmentation-to-replacement ratio
SELECT
    Industry,
    SUM(Human_Roles_Augmented) AS augmented,
    SUM(Human_Roles_Replaced) AS replaced,

    ROUND(
        SUM(Human_Roles_Augmented) /
        NULLIF(SUM(Human_Roles_Replaced), 0),
        2
    ) AS augmentation_replacement_ratio

FROM Global_AI_Agent_Workforce_Integration_2026_CLEANED
GROUP BY Industry
ORDER BY augmentation_replacement_ratio DESC;

--6.)Does strict AI governance affect cybersecurity incidents?
SELECT
    Has_Strict_AI_Governance,
    ROUND(AVG(Cybersecurity_Incidents_YTD), 2)
        AS avg_cybersecurity_incidents
FROM Global_AI_Agent_Workforce_Integration_2026_CLEANED
GROUP BY Has_Strict_AI_Governance;

--7.) Governance and employee sentiment?
SELECT
    Has_Strict_AI_Governance,
    ROUND(
        AVG(Employee_Sentiment_Score_1_to_10),
        2
    ) AS avg_employee_sentiment
FROM Global_AI_Agent_Workforce_Integration_2026_CLEANED
GROUP BY Has_Strict_AI_Governance;

--8.)Which AI roles generate the highest productivity gains?
SELECT
    Primary_AI_Agent_Role,
    COUNT(*) AS companies,
    ROUND(AVG(Productivity_Gain_Percent), 2)
        AS avg_productivity_gain
FROM Global_AI_Agent_Workforce_Integration_2026_CLEANED
GROUP BY Primary_AI_Agent_Role
ORDER BY avg_productivity_gain DESC;