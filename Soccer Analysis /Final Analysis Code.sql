-------------------------------------------------------------------------
--- Soccer Analysis ---
---1. View the first 100 rows of the dataset to understand its structure. 
SELECT TOP (100) *
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
---2. Count the total number of players in the dataset.
SELECT COUNT(*) AS Total_Players
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
---3. List all unique teams in the league. 
SELECT DISTINCT team
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
---4. Count how many players are in each team. 
SELECT DISTINCT team,
	   COUNT(*) AS Total_Players
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY team
---5. Identify the top 10 players with the most goals. 
SELECT TOP (10) player_name,
				goals
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
ORDER BY goals DESC
---6. Find the average salary for players in each team. 
SELECT  team,
	   average_salary_zar
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
---7. Retrieve the top 10 players with the highest market value. 
SELECT TOP (10) player_name,
				market_value_zar
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
ORDER BY market_value_zar DESC
---8. Calculate the average passing accuracy for each position.
SELECT position,
       AVG(CAST(passing_accuracy AS FLOAT)) AS average_passing_accuracy
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY position;
---9. Compare shot accuracy with goals to find correlations. 
SELECT shot_accuracy,
	   goals
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
---10. Compute total goals and assists for each team. 
SELECT team,
	   goals,
	   assists
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
---11. Count players by their marital status. 
---10. Compute total goals and assists for each team. 
SELECT marital_status,
	   COUNT(*) AS marital_status_count
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY marital_status
---12. Count players by nationality.
SELECT nationality,
	   COUNT(*) AS nationality_count
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY nationality
---13. Find average market value grouped by nationality. 
SELECT nationality,
	   AVG(CAST(market_value_zar AS FLOAT)) AS average_market_value
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY nationality
---14. Determine how many player contracts end in each year.
SELECT contract_end_year,
	  COUNT(contract_end_year) AS Contract_Endings
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY contract_end_year
---15. Identify players whose contracts end next year. 
SELECT player_name
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
WHERE contract_end_year = 2026
---16. Summarize the number of players by injury status. 
SELECT DISTINCT injury_status,
	   COUNT(*) AS injury_status_count
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY injury_status
---17. Calculate goals per match ratio for each player. 
SELECT TOP 10 
    player_name, 
    team, 
    goals, 
    matches_played,
    CAST(TRY_CAST(goals AS FLOAT) / NULLIF(TRY_CAST(matches_played AS FLOAT), 0) AS DECIMAL(5,2)) AS goals_per_match
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
ORDER BY goals_per_match DESC;
---18. Count how many players are managed by each agent. 
SELECT agent,
	   COUNT(*) AS agent_count
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY agent
---19. Calculate average height and weight by player position. 
SELECT position,
	   AVG(CAST(height_cm AS FLOAT)) AS average_player_height,
	   AVG(CAST(weight_kg AS FLOAT)) AS average_player_height
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY position
---20. Identify players with the highest combined goals and assists. 
SELECT player_name,
	   (goals + assists) AS highest_goals_and_assist
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
ORDER BY highest_goals_and_assist DESC

--------------------------------------------------------------------------------
