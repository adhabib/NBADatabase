-- Adeel Habib

-- Describe purpose of database

rem **************
rem The TEAM Table
rem **************

CREATE TABLE TEAM (
	TeamID		NUMBER NOT NULL,
	ConfSeed	NUMBER,
	Team		VARCHAR(30),
	Wins 		NUMBER,
	Losses		NUMBER,
	HomeWins	NUMBER,
	HomeLosses	NUMBER,
	AwayWins	NUMBER,
	AwayLosses	NUMBER,
	Conference	VARCHAR(25),
	CWins		NUMBER,
	CLosses		NUMBER,
	Division	VARCHAR(20),
	DWins		NUMBER,
	DLosses		NUMBER,
	Coach		VARCHAR(50),
	-- Constraint, there are 32 teams and the ID should be from 1 to 32.
	-- Would be expanded if expansion teams come into the league.
	CONSTRAINT CHK_TeamID_Range CHECK (TeamID BETWEEN 1 AND 32),
	-- Define Primary Key
	PRIMARY KEY (TeamID)
);

INSERT INTO TEAM VALUES (1, 1, 'BOSTON CELTICS', 
	45, 12, 26, 3, 19, 9, 'EAST', 32, 6, 'ATLANTIC',
	14, 1, 'JOE MAZZULLA');
INSERT INTO TEAM VALUES (2, 1, 'MINNESOTA TIMBERWOLVES', 
	40, 17, 20, 6, 20, 11, 'WEST', 27, 8, 'NORTHWEST',
	8, 2, 'CHRIS FINCH');
INSERT INTO TEAM VALUES (3, 4, 'LOS ANGELES CLIPPERS', 
	37, 19, 20, 7, 17, 12, 'WEST', 23, 15, 'PACIFIC',
	8, 4, 'TYRONN LUE');
INSERT INTO TEAM VALUES (4, 6, 'NEW ORLEANS PELICANS', 
	34, 24, 17, 12, 17, 12, 'WEST', 24, 18, 'SOUTHWEST',
	9, 6, 'WILLIE GREEN');
INSERT INTO TEAM VALUES (5, 6, 'INDIANA PACERS', 
	33, 25, 19, 11, 14, 14, 'EAST', 25, 14, 'CENTRAL',
	10, 2, 'RICK CARLISLE');
INSERT INTO TEAM VALUES (6, 7, 'MIAMI HEAT', 
	31, 25, 15, 13, 16, 12, 'EAST', 22, 16, 'SOUTHEAST',
	11, 2, 'ERIK SPOELSTRA');
	
-- Create a table from another table	

rem ***************************************************
rem The EASTER_CONFERENCE and WESTERN_CONFERENCE Tables
rem ***************************************************

CREATE TABLE EASTERN_CONFERENCE
	AS (SELECT TeamID, ConfSeed, Team, Wins, Losses, Homewins, Homelosses, AwayWins, 
		AwayLosses, CWins, CLosses, Division, DWins, DLosses, Coach
		FROM TEAM
		WHERE Conference = 'EAST');

ALTER TABLE EASTERN_CONFERENCE
	ADD CONSTRAINT fk_team_east
		FOREIGN KEY (TeamID)
		REFERENCES TEAM(TeamID);

CREATE TABLE WESTERN_CONFERENCE
	AS (SELECT TeamID, ConfSeed, Team, Wins, Losses, Homewins, Homelosses, AwayWins, 
		AwayLosses, CWins, CLosses, Division, DWins, DLosses, Coach
		FROM TEAM
		WHERE Conference = 'WEST');

ALTER TABLE WESTERN_CONFERENCE
	ADD CONSTRAINT fk_team_west
		FOREIGN KEY (TeamID)
		REFERENCES TEAM(TeamID);

rem *******************
rem The Division Tables
rem *******************

CREATE TABLE SOUTHEAST
	AS (SELECT TeamID, ConfSeed, Team, Wins, Losses, Homewins, Homelosses, AwayWins, 
		AwayLosses, CWins, CLosses, DWins, DLosses, Coach
		FROM TEAM
		WHERE Division = 'SOUTHEAST');

ALTER TABLE SOUTHEAST
	ADD CONSTRAINT fk_team_se
		FOREIGN KEY (TeamID)
		REFERENCES TEAM(TeamID);
		
CREATE TABLE CENTRAL
	AS (SELECT TeamID, ConfSeed, Team, Wins, Losses, Homewins, Homelosses, AwayWins, 
		AwayLosses, CWins, CLosses, DWins, DLosses, Coach
		FROM TEAM
		WHERE Division = 'CENTRAL');

ALTER TABLE CENTRAL
	ADD CONSTRAINT fk_team_c
		FOREIGN KEY (TeamID)
		REFERENCES TEAM(TeamID);

CREATE TABLE ATLANTIC
	AS (SELECT TeamID, ConfSeed, Team, Wins, Losses, Homewins, Homelosses, AwayWins, 
		AwayLosses, CWins, CLosses, DWins, DLosses, Coach
		FROM TEAM
		WHERE Division = 'ATLANTIC');

ALTER TABLE ATLANTIC
	ADD CONSTRAINT fk_team_a
		FOREIGN KEY (TeamID)
		REFERENCES TEAM(TeamID);
		
CREATE TABLE SOUTHWEST
	AS (SELECT TeamID, ConfSeed, Team, Wins, Losses, Homewins, Homelosses, AwayWins, 
		AwayLosses, CWins, CLosses, DWins, DLosses, Coach
		FROM TEAM
		WHERE Division = 'SOUTHWEST');

ALTER TABLE SOUTHWEST
	ADD CONSTRAINT fk_team_sw
		FOREIGN KEY (TeamID)
		REFERENCES TEAM(TeamID);
		
CREATE TABLE NORTHWEST
	AS (SELECT TeamID, ConfSeed, Team, Wins, Losses, Homewins, Homelosses, AwayWins, 
		AwayLosses, CWins, CLosses, DWins, DLosses, Coach
		FROM TEAM
		WHERE Division = 'NORTHWEST');

ALTER TABLE NORTHWEST
	ADD CONSTRAINT fk_team_nw
		FOREIGN KEY (TeamID)
		REFERENCES TEAM(TeamID);
		
CREATE TABLE PACIFIC
	AS (SELECT TeamID, ConfSeed, Team, Wins, Losses, Homewins, Homelosses, AwayWins, 
		AwayLosses, CWins, CLosses, DWins, DLosses, Coach
		FROM TEAM
		WHERE Division = 'PACIFIC');

ALTER TABLE PACIFIC
	ADD CONSTRAINT fk_team_p
		FOREIGN KEY (TeamID)
		REFERENCES TEAM(TeamID);

-- Player Table
rem ****************
rem The Player Table
rem ****************
		
CREATE TABLE PLAYER (
	PlayerID		NUMBER NOT NULL,
	FirstName		VARCHAR(25),
	LastName		VARCHAR(25),
	PlayerNumber	NUMBER,
	Team			VARCHAR(25),
	TeamID			NUMBER NOT NULL,
	-- Define Primary Key
	PRIMARY KEY (PlayerID),
	-- Define Foreign Key
	CONSTRAINT fk_team_player
		FOREIGN KEY (TeamID)
		REFERENCES TEAM(TeamID)
);

INSERT INTO PLAYER VALUES (1, 'JAYSON', 'TATUM', 0,
	'BOSTON CELTICS', 1);
INSERT INTO PLAYER VALUES (2, 'JAYLEN', 'BROWN', 7,
	'BOSTON CELTICS', 1);
INSERT INTO PLAYER VALUES (3, 'ANTHONY', 'EDWARDS', 1,
	'MINNESOTA TIMBERWOLVES', 2);
INSERT INTO PLAYER VALUES (4, 'KARL-ANTHONY', 'TOWNS', 32,
	'MINNESOTA TIMBERWOLVES', 2);
INSERT INTO PLAYER VALUES (5, 'KAWHI', 'LEONARD', 2,
	'LOS ANGELES CLIPPERS', 3);
INSERT INTO PLAYER VALUES (6, 'PAUL', 'GEORGE', 13,
	'LOS ANGELES CLIPPERS', 3);
INSERT INTO PLAYER VALUES (7, 'ZION', 'WILLIAMSON', 1,
	'NEW ORLEANS PELICANS', 4);
INSERT INTO PLAYER VALUES (8, 'BRANDON', 'INGRAM', 14,
	'NEW ORLEANS PELICANS', 4);
INSERT INTO PLAYER VALUES (9, 'TYRESE', 'HALIBURTON', 0,
	'INDIANA PACERS', 5);
INSERT INTO PLAYER VALUES (10, 'PASCAL', 'SIAKAM', 43,
	'INDIANA PACERS', 5);
INSERT INTO PLAYER VALUES (11, 'JIMMY', 'BUTLER', 22,
	'MIAMI HEAT', 6);
INSERT INTO PLAYER VALUES (12, 'BAM', 'ADEBAYO', 13,
	'MIAMI HEAT', 6);

-- Coach Table
rem ****************
rem The Coach Table
rem ****************

CREATE TABLE COACH (
	CoachID		NUMBER NOT NULL,
	FirstName	VARCHAR(25),
	LastName	VARCHAR(25),
	Team		VARCHAR(25),
	TeamID		NUMBER NOT NULL,
	-- Define Primary Key
	PRIMARY KEY (CoachID),
	-- Define Foreign Key
	CONSTRAINT fk_coach
		FOREIGN KEY (TeamID)
		REFERENCES TEAM(TeamID)
);

INSERT INTO COACH VALUES (1, 'JOE', 'MAZZULLA',
	'BOSTON CELTICS', 1);
INSERT INTO COACH VALUES (2, 'CHRIS', 'FINCH',
	'MINNESOTA TIMBERWOLVES', 2);
INSERT INTO COACH VALUES (3, 'TYRONN', 'LUE',
	'LOS ANGELES CLIPPERS', 3);
INSERT INTO COACH VALUES (4, 'WILLIE', 'GREEN',
	'NEW ORLEANS PELICANS', 4);
INSERT INTO COACH VALUES (5, 'RICK', 'CARLISLE',
	'INDIANA PACERS', 5);
INSERT INTO COACH VALUES (6, 'ERIK', 'SPOELSTRA',
	'MIAMI HEAT', 6);

-- Stats Table
rem ***************
rem The Stats Table
rem ***************

CREATE TABLE STATS (
	TeamID		NUMBER NOT NULL,
	Team		VARCHAR(30),
	GamesPlayed	NUMBER,
	PPG			FLOAT,
	OffRTG		FLOAT,
	FGM			NUMBER,
	FGA			NUMBER,
	FGpct		FLOAT,
	ThreeMade	NUMBER,
	ThreeAttmpt NUMBER,
	Threepct	FLOAT,
	FTpct		FLOAT,
	Assists		NUMBER,
	OffRebounds	NUMBER,
	Rebounds	NUMBER,
	Turnovers	NUMBER,
	OpponentPPG	FLOAT,
	DefRTG		FLOAT,
	Steals		NUMBER,
	Blocks		NUMBER,
	OpponentFGpct	FLOAT,
	Opponent3Ppct	FLOAT,
	-- Define Foreign Key
	CONSTRAINT fk_stats
		FOREIGN KEY (TeamID)
		REFERENCES TEAM(TeamID)
);

INSERT INTO STATS VALUES (1, 'BOSTON CELTICS', 57, 120.7,
	122.2, 2482, 5131, .484, 931, 2429, .383, .807, 1496, 603, 2674,
	711, 110.4, 111.7, 368, 372, .449, .350);

-- Attendance Table
rem ********************
rem The Attendance Table
rem ********************

CREATE TABLE ATTENDANCE (
	TeamID			NUMBER NOT NULL,
	Team			VARCHAR(30),
	Arena			VARCHAR(50),
	Attendance		NUMBER,
	AttendancePG	NUMBER,
	-- Define Foreign Key
	CONSTRAINT fk_attendance
		FOREIGN KEY (TeamID)
		REFERENCES TEAM(TeamID)
);

INSERT INTO ATTENDANCE VALUES (1, 'BOSTON CELTICS', 
	'TD GARDEN', 555274, 18940);

-- Trades Table
rem ****************
rem The Trades Table
rem ****************

CREATE TABLE TRADE (
	TradeID			NUMBER NOT NULL,
	Team1ID			NUMBER NOT NULL,
	Team1			VARCHAR(30),
	Team1Receives	VARCHAR(256),
	Team2ID			NUMBER NOT NULL,
	Team2			VARCHAR(30),
	Team2Receives	VARCHAR(256),
	-- Define Foreign Key
	CONSTRAINT fk_trade1
		FOREIGN KEY (Team1ID)
		REFERENCES TEAM(TeamID),
    CONSTRAINT fk_trade2
	    FOREIGN KEY (Team2ID)
		REFERENCES TEAM(TeamID)  
);

INSERT INTO TRADE VALUES (1, 6, 'INDIANA PACERS', 
	'KIRA LEWIS JR., 2ND ROUND PICK', 4, 'NEW ORLEANS PELICANS',
	'CASH');

-- Free Agency Table, TO_DATE function
rem *********************
rem The Free Agency Table
rem *********************

CREATE TABLE FREE_AGENCY (
	TransactionID	NUMBER NOT NULL,
	TransactionDate	DATE,
	TeamID			NUMBER NOT NULL,
	Team			VARCHAR(30),
	TransactionType	VARCHAR(15),
	PlayerID		NUMBER NOT NULL,
	Player			VARCHAR(50),
	ContractLength	NUMBER,
	Pay				NUMBER,
	-- Define Foreign Key
	CONSTRAINT fk_free_agent_team
		FOREIGN KEY (TeamID)
		REFERENCES TEAM(TeamID),
	CONSTRAINT fk_free_agent
		FOREIGN KEY (PlayerID)
		REFERENCES PLAYER(PlayerID)
);

INSERT INTO FREE_AGENCY VALUES (1, TO_DATE('January 10 2024','Month DD YyyY'),
	 3, 'LOS ANGELES CLIPPERS','EXTENSION', 5, 
	 'KAWHI LEONARD', 3, 152400000);

-- Mock Draft Table
rem ********************
rem The Mock Draft Table
rem ********************

CREATE TABLE MOCK_DRAFT (
	PickID		NUMBER NOT NULL,
	TeamID		NUMBER NOT NULL,
	Team		VARCHAR(50),
	DrafteeID	NUMBER NOT NULL,
	Draftee		VARCHAR(50),
	Age			NUMBER,
	College		VARCHAR(50)
);

INSERT INTO MOCK_DRAFT VALUES (1, 32, 'WASHINGTON WIZARDS', 1,
	'ZACCHARIE RISACHER', 18, 'FRANCE');
INSERT INTO MOCK_DRAFT VALUES (2, 31, 'SAN ANTONIO SPURS', 2,
	'NIKOLA TOPIC', 18, 'SERBIA');

-- VIEWS

-- Create View for Offense Stats
create or replace view vw_offense_stats as
select TeamID, Team, GamesPlayed, PPG, OffRTG, FGM, FGA, FGpct, ThreeMade, ThreeAttmpt, Threepct, Assists, Rebounds, Turnovers
from STATS;

-- Create View for Defense Stats
create or replace view vw_defense_stats as
select TeamID, Team, GamesPlayed, Rebounds, DefRTG, Steals, Blocks, OpponentFGpct, Opponent3Ppct
from STATS;

-- Create View for Top Home Teams. Decode function, two string functions
create or replace view vw_home_records as
select TeamID, DECODE(INSTR(Team, ' ', -1),
           0, Team,
           SUBSTR(Team, INSTR(Team, ' ', -1) + 1)
          ) AS Team, HomeWins, HomeLosses, Coach
from TEAM
order by HomeWins DESC;

-- Create View for Top Away Teams. Decode function, two string functions
create or replace view vw_away_records as
select TeamID, DECODE(INSTR(Team, ' ', -1),
           0, Team,
           SUBSTR(Team, INSTR(Team, ' ', -1) + 1)
          ) AS Team, AwayWins, AwayLosses, Coach
from TEAM
order by AwayWins DESC;

-- View for how many days between trade deadline and current day
-- Second date function and one math function
create or replace view vw_deadline_btwn as
select ROUND(TO_DATE('02-08-2024','MM-DD-YYYY') - CURRENT_DATE) as DeadlineInterval
from dual;

-- View for teams that have won more than 35 games
-- Subquery
create or replace view vw_35_threshold as
select * from TEAM
where Wins > 35;

-- Erronously inputted an entry into the wrong table, let's say a WNBA team
insert into vw_35_threshold
values (32, 1, 'BOGEY TEAM', 
	45, 12, 26, 3, 19, 9, 'EAST', 32, 6, 'ATLANTIC',
	14, 1, 'JOE MAZA');

-- Delete wrong team entry
delete from vw_35_threshold
where TeamID = 32;

-- Create view for advanced stats
-- Number functions, change the way percent is displayed. So 0.525 is 52.5, like 52.5%
create or replace view vw_advanced_stats as
select TeamID, Team, TRUNC((((ThreeMade * 0.5) + FGM)/FGA), 3) * POWER(10, 2) as eFGpct
from STATS;

-- Create View for Offense Stats
create or replace view vw_offense_stats as
select TeamID, Team, GamesPlayed, PPG, OffRTG, FGM, FGA, FGpct, ThreeMade, ThreeAttmpt, Threepct, Assists, Rebounds, Turnovers
from STATS;

-- Create View for Defense Stats
create or replace view vw_defense_stats as
select TeamID, Team, GamesPlayed, Rebounds, DefRTG, Steals, Blocks, OpponentFGpct, Opponent3Ppct
from STATS;

-- Create View for Top Home Teams. Decode function, two string functions
create or replace view vw_home_records as
select TeamID, DECODE(INSTR(Team, ' ', -1),
           0, Team,
           SUBSTR(Team, INSTR(Team, ' ', -1) + 1)
          ) AS Team, Coach, HomeWins, HomeLosses
from TEAM
order by HomeWins DESC;

-- Create View for Top Away Teams. Decode function, two string functions
create or replace view vw_away_records as
select TeamID, DECODE(INSTR(Team, ' ', -1),
           0, Team,
           SUBSTR(Team, INSTR(Team, ' ', -1) + 1)
          ) AS Team, Coach, AwayWins, AwayLosses
from TEAM
order by AwayWins DESC;

-- Displays how many days between trade deadline and current day
-- Second date function and one math function
create or replace view vw_deadline_btwn as
select ROUND(TO_DATE('02-08-2024','MM-DD-YYYY') - CURRENT_DATE) as DeadlineInterval
from dual;

-- View for teams that have won more than 35 games
create or replace view vw_35_threshold as
select * from TEAM
where Wins > 35;

-- Erronously inputted an entry into the wrong table, let's say a WNBA team
insert into vw_35_threshold
values (32, 1, 'BOGEY TEAM', 
	45, 12, 26, 3, 19, 9, 'EAST', 32, 6, 'ATLANTIC',
	14, 1, 'JOE MAZA');

-- Delete wrong team entry
delete from vw_35_threshold
where TeamID = 32;

-- Create view for advanced stats
-- Number functions, change the way percent is displayed. So 0.525 is 52.5, like 52.5%
create or replace view vw_advanced_stats as
select TeamID, Team, TRUNC((((ThreeMade * 0.5) + FGM)/FGA), 3) * POWER(10, 2) as eFGpct
from STATS;

-- Create View to count up record by conference, only including top six teams of each conference
-- Include Group By
CREATE OR REPLACE VIEW vw_conference_wins AS
SELECT Conference, SUM(Wins) AS Wins, SUM(Losses) AS Losses
FROM (
    SELECT * 
    FROM TEAM 
    WHERE ConfSeed < 7
) TEAM
GROUP BY Conference
HAVING MAX(ConfSeed) < 7;

-- SAVE POINTS

UPDATE PLAYER
	SET PlayerNumber = 0
	WHERE PlayerID = 1;
SAVEPOINT tatum;

-- Errenous player number change, savepoint
UPDATE PLAYER
	SET PlayerNumber = 99
	WHERE PlayerID = 2;

ROLLBACK TO SAVEPOINT tatum;

COMMIT;

-- INDEX

-- Index to filter players by team
create index player_team_i on PLAYER (Team);

select /*+ INDEX(PLAYER Team) */ * from PLAYER
where Team = 'BOSTON CELTICS';

--drop index player_team_i;
/*
DROP TABLE ATLANTIC;
DROP TABLE ATTENDANCE;
DROP TABLE CENTRAL;
DROP TABLE COACH;
DROP TABLE EASTERN_CONFERENCE;
DROP TABLE FREE_AGENCY;
DROP TABLE MOCK_DRAFT;
DROP TABLE NORTHWEST;
DROP TABLE PACIFIC;
DROP TABLE PLAYER;
DROP TABLE PLAYER_ADV_STATS;
DROP TABLE SOUTHEAST;
DROP TABLE SOUTHWEST;
DROP TABLE STATS;
DROP TABLE TEAM;
DROP TABLE TRADE;
DROP TABLE WESTERN_CONFERENCE;
DROP VIEW VW_35_THRESHOLD;
DROP VIEW VW_ADVANCED_STATS;
DROP VIEW VW_AWAY_RECORDS;
DROP VIEW VW_CONFERENCE_WINS;
DROP VIEW VW_DEADLINE_BTWN;
DROP VIEW VW_DEFENSE_STATS;
DROP VIEW VW_HOME_RECORDS;
DROP VIEW VW_OFFENSE_STATS;
*/


-- PART 2, FINAL PROJECT

SAVEPOINT save_final_project;

-- Update Player table to include stats
ALTER TABLE PLAYER
ADD (Ppg Float,
	G NUMBER,
	GS NUMBER,
	MP Float,
	FGPct Float,
	ThreePct Float,
	FTPct Float,
	ReboundPG Float,
	AssistPG Float,
	StealPG Float,
	BlockPG Float,
	TovPG Float,
	PTS NUMBER,
	FGA NUMBER,
	FTA NUMBER);
	
	UPDATE PLAYER
	SET G = 74,
	    GS = 74,
	    MP = 35.7,
	    FGPct = 0.471,
	    ThreePct = 0.376,
	    FTPct = 0.833,
	    ReboundPG = 8.1,
	    AssistPG = 4.9,
	    StealPG = 1,
	    BlockPG = 0.6,
	    TovPG = 2.5,
	    PTS = 1426,
	    FGA = 497,
	    FTA = 1987
	WHERE PLAYERID = 1;

	UPDATE PLAYER
	SET G = 68,
	    GS = 68,
	    MP = 34.3,
	    FGPct = 0.525,
	    ThreePct = 0.417,
	    FTPct = 0.885,
	    ReboundPG = 6.1,
	    AssistPG = 3.6,
	    StealPG = 1.6,
	    BlockPG = 0.9,
	    TovPG = 1.8,
	    PTS = 1162,
	    FGA = 286,
	    FTA = 1613
	WHERE PLAYERID = 5;

	UPDATE PLAYER
	SET G = 69,
	    GS = 68,
	    MP = 32.2,
	    FGPct = 0.477,
	    ThreePct = 0.364,
	    FTPct = 0.855,
	    ReboundPG = 3.9,
	    AssistPG = 10.9,
	    StealPG = 1.2,
	    BlockPG = 0.7,
	    TovPG = 2.3,
	    PTS = 1048,
	    FGA = 227,
	    FTA = 1389
	WHERE PLAYERID = 9;

SAVEPOINT save_one;

-- #1 code blocks with variables and loops to create true shooting percentage stat
-- NBA relies on a lot of advanced stats and being able to compute them with many
-- players is important
-- #2 and #4 Exception handling, make sure player data is valid
CREATE TABLE PLAYER_ADV_STATS AS
SELECT
    PLAYERID,
    PTS,
    FGA,
    FTA,
    CAST(NULL AS FLOAT) AS TSPct
FROM
    PLAYER
WHERE PLAYERID IN (1, 5, 9);

ALTER TABLE PLAYER_ADV_STATS
	ADD CONSTRAINT fk_player_adv
		FOREIGN KEY (PLAYERID)
		REFERENCES PLAYER(PLAYERID);

DECLARE
    v_playerid NUMBER;
    v_pts NUMBER;
    v_fga NUMBER;
    v_fta NUMBER;
    v_ts_pct FLOAT;
	
	invalid_player_data EXCEPTION;
	PRAGMA EXCEPTION_INIT(invalid_player_data, -20001);
BEGIN
    FOR player_rec IN (SELECT PLAYERID FROM PLAYER_ADV_STATS) LOOP
		v_playerid := player_rec.PLAYERID;

        SELECT PTS, FGA, FTA
        INTO v_pts, v_fga, v_fta
        FROM PLAYER
        WHERE PLAYERID = v_playerid;

		-- User defined exception handling
        IF v_fga <= 0 OR v_fta <= 0 THEN
            RAISE_APPLICATION_ERROR(-20001, 'Invalid player data: FGA and FTA must be greater than zero.');
        END IF;

		-- Formula for calculating true shooting percentage stat
        IF (v_fga + (0.44 * v_fta)) <> 0 THEN
            v_ts_pct := v_pts / (2 * (v_fga + (0.44 * v_fta))) * 100;
        ELSE
            v_ts_pct := 0; -- Handle division by zero scenario
        END IF;

        UPDATE PLAYER_ADV_STATS
        SET TSPct = ROUND(v_ts_pct / 100, 3)
        WHERE PLAYERID = v_playerid;

        COMMIT;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('True shooting percentages updated successfully.');

-- System defined exception handling
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Player data not found for player_id: ' || v_playerid);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating true shooting percentages: ' || SQLERRM);
END;
/

SAVEPOINT save_two;

-- #2 Code blocks to process data using if/else. In the basketball, a double-double is
-- a player achieves a quantity of 10 in two stat categories, such as 10 points 
-- and 10 rebounds. A triple double is the same thing but with three stat categories.
-- Process these stats using if/else. More robust implementation of #2
ALTER TABLE PLAYER
ADD (DoubleDouble NUMBER DEFAULT 0,
    TripleDouble NUMBER DEFAULT 0);

CREATE TABLE GAMELOG (
	PlayerID		NUMBER NOT NULL,
	FirstName		VARCHAR2(25),
	LastName		VARCHAR2(25),
	PlayerNumber	NUMBER,
	Team			VARCHAR2(25),
	TeamID			NUMBER NOT NULL,
	Points 			NUMBER,
	Assists			NUMBER,
	Rebounds		NUMBER,
	-- note: negative stats such as fouls and turnovers do not count towards double-double
	-- or triple double
	Turnovers		NUMBER,
	Blocks			NUMBER,
	Steals			NUMBER,
	CONSTRAINT fk_gamelog_player
		FOREIGN KEY (PLAYERID)
		REFERENCES PLAYER(PLAYERID),
	CONSTRAINT fk_gamelog_team
		FOREIGN KEY (TeaMID)
		REFERENCES TEAM(TeamID)
);

INSERT INTO GAMELOG (PlayerID, 
					FirstName, 
					LastName, 
					PlayerNumber, 
					Team, 
					TeamID, 
					Points, 
					Assists, 
					Rebounds, 
					Turnovers, 
					Blocks, 
					Steals)
VALUES (11, 
		'Jimmy', 
		'Butler', 
		22, 
		'Miami Heat', 
		6, 
		28, 
		10, 
		7, 
		4, 
		1, 
		2);
		
INSERT INTO GAMELOG (PlayerID, 
					FirstName, 
					LastName, 
					PlayerNumber, 
					Team, 
					TeamID, 
					Points, 
					Assists, 
					Rebounds, 
					Turnovers, 
					Blocks, 
					Steals)
VALUES (5, 
		'Kawhi', 
		'Leonard', 
		2, 
		'LA Clippers', 
		3, 
		20, 
		12, 
		10, 
		3, 
		1, 
		3);
--
DECLARE
	v_player_id 		NUMBER;
	-- tracks if double or triple threshold reached
	v_double_triple 	NUMBER := 0;
BEGIN
	FOR box_score IN (SELECT * FROM GAMELOG) LOOP
        v_player_id := box_score.PlayerID;
		v_double_triple := 0;
		
		v_double_triple :=
			CASE WHEN box_score.Points >= 10 THEN 1 ELSE 0 END +
			CASE WHEN box_score.Assists >= 10 THEN 1 ELSE 0 END +
			CASE WHEN box_score.Rebounds >= 10 THEN 1 ELSE 0 END +
			CASE WHEN box_score.Steals >= 10 THEN 1 ELSE 0 END;
			
		IF v_double_triple >= 2 THEN
			UPDATE PLAYER
			SET DoubleDouble = DoubleDouble + 1
			WHERE PLAYERID = v_player_id;
		END IF;
	
		IF v_double_triple >= 3 THEN
			UPDATE PLAYER
			SET TripleDouble = TripleDouble + 1
			WHERE PLAYERID = v_player_id;
		END IF;
	END LOOP;
EXCEPTION
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('Error updating double-double and triple-double records: ' || SQLERRM);
END;
/

SAVEPOINT save_three;

-- #6 Functions. One function is to calculate a player's assist to turnover ratio, another
-- is to ensure jersey number on a team is available
ALTER TABLE PLAYER_ADV_STATS
ADD (AssistTurnover Float);

CREATE OR REPLACE FUNCTION AST_TOV_RATIO(
	assists NUMBER, 
	turnovers NUMBER
)
RETURN Float
IS 
	ast_tov_ratio Float;
BEGIN
	-- Handle cases of 0 turnovers
	IF turnovers <= 0 THEN
		ast_tov_ratio := 0.0;
	ELSE
		ast_tov_ratio := assists/turnovers;
	END IF;
	
	RETURN ast_tov_ratio;
EXCEPTION
    WHEN OTHERS THEN
        RETURN NULL;
END;
/

CREATE OR REPLACE FUNCTION JERSEY_TAKEN(
	p_TEAMID	NUMBER,
	p_PlayerNumber	NUMBER
)
RETURN BOOLEAN
IS
	v_taken NUMBER;
BEGIN
	SELECT COUNT(*)
	INTO v_taken
	FROM PLAYER
	WHERE TEAMID = p_TEAMID AND PlayerNumber = p_PlayerNumber;
	RETURN (v_taken = 0);
	
-- If jersey number taken
EXCEPTION
	WHEN OTHERS THEN
		RETURN FALSE;
END;
/

SAVEPOINT save_four;

-- #7 Procedures. Player stats will have to be updated regularly, and having a method
-- of transferring a player record to another team in the case of a player transaction
-- is needed
CREATE OR REPLACE PROCEDURE update_player_stats(
	p_player_id 		NUMBER,
	p_number_of_games 	NUMBER,
	p_points 			NUMBER,
	p_rebounds 			NUMBER,
	p_assists 			NUMBER,
	p_steals 			NUMBER,
	p_blocks 			NUMBER,
	p_turnovers 		NUMBER
)
IS
	v_total_points		NUMBER;
	v_ppg				FLOAT;
	v_total_rebounds	NUMBER;
	v_rebpg				FLOAT;
	v_total_assists		NUMBER;
	v_astpg				FLOAT;
	v_total_steals		NUMBER;
	v_stlpg				FLOAT;
	v_total_blocks		NUMBER;
	v_blkpg				FLOAT;
	v_total_turnovers	NUMBER;
	v_tovpg				FLOAT;
BEGIN
	SELECT PPG, ReboundPG, AssistPG, StealPG, BlockPG, TovPG
	INTO v_ppg, v_rebpg, v_astpg, v_stlpg, v_blkpg, v_tovpg 
	FROM PLAYER
	WHERE PLAYERID = p_player_id;
	
	-- Calculate total points
	v_total_points := v_ppg * (p_number_of_games - 1);
	v_total_points := v_total_points + p_points;
	
	-- Calculate total rebounds
	v_total_rebounds := v_rebpg * (p_number_of_games - 1);
	v_total_rebounds := v_total_rebounds + p_rebounds;
	
	-- Calculate total assists
	v_total_assists := v_astpg * (p_number_of_games - 1);
	v_total_assists := v_total_assists + p_assists;
	
	-- Calculate total steals
	v_total_steals := v_stlpg * (p_number_of_games - 1);
	v_total_steals := v_total_steals + p_steals;
	
	-- Calculate total blocks
	v_total_blocks := v_blkpg * (p_number_of_games - 1);
	v_total_blocks := v_total_blocks + p_blocks;
	
	-- Calculate total turnovers
	v_total_turnovers := v_tovpg * (p_number_of_games - 1);
	v_total_turnovers := v_total_turnovers + p_turnovers;
	
	IF p_number_of_games > 0 THEN 
		v_ppg := v_total_points / p_number_of_games;
		
	    v_rebpg := v_total_rebounds / p_number_of_games;

	    v_astpg := v_total_assists / p_number_of_games;

	    v_stlpg := v_total_steals / p_number_of_games;

	    v_blkpg := v_total_blocks / p_number_of_games;

	    v_tovpg := v_total_turnovers / p_number_of_games;
	ELSE
	    -- Handle division by zero scenario
	    v_ppg := 0.0;
	    v_rebpg := 0.0;
	    v_astpg := 0.0;
	    v_stlpg := 0.0;
	    v_blkpg := 0.0;
	    v_tovpg := 0.0;
	END IF;
	
	-- Update player stats
	UPDATE PLAYER
	SET PPG = v_ppg,
		ReboundPG = v_rebpg,
		AssistPG = v_astpg,
		StealPG = v_stlpg,
		BlockPG = v_blkpg,
		TovPG = v_tovpg,
		G = p_number_of_games,
		GS = p_number_of_games
	WHERE PLAYERID = p_player_id;
END;
/

SAVEPOINT save_five;

CREATE OR REPLACE PROCEDURE move_player(
	p_player_id	NUMBER,
	p_team_id	NUMBER
)
IS
	v_new_team VARCHAR2(50);
BEGIN
	SELECT Team
	INTO v_new_team
	FROM TEAM
	WHERE TEAMID = p_team_id;
	
	-- Start transaction and set savepoint
	SAVEPOINT save_move_player;
	
	UPDATE PLAYER
	SET TEAMID = p_team_id,
		Team = v_new_team
	WHERE PLAYERID = p_player_id;
	
	COMMIT;

    DBMS_OUTPUT.PUT_LINE('Player ' || p_player_id || ' moved to Team ' || v_new_team || ' successfully.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- Rollback to savepoint and handle exception
        ROLLBACK TO SAVEPOINT save_move_player;
        DBMS_OUTPUT.PUT_LINE('Player ID ' || p_player_id || ' not found.');
     WHEN OTHERS THEN
        -- Rollback to savepoint and handle exception
        ROLLBACK TO SAVEPOINT save_move_player;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

-- #8 Packages. The procedure for moving a player to a different team is related to 
-- the function to validate jersey numbers, so package them together

CREATE OR REPLACE PACKAGE PKG_Transfer_Player AS
	-- Jersey validation function
	FUNCTION JERSEY_TAKEN(p_TEAMID NUMBER, p_PlayerNumber NUMBER) RETURN BOOLEAN;
	
	-- Move player procedure
	PROCEDURE move_player(p_player_id NUMBER, p_team_id NUMBER);
END PKG_Transfer_Player;
/

CREATE OR REPLACE PACKAGE BODY PKG_Transfer_Player AS
FUNCTION JERSEY_TAKEN(
        p_TEAMID         NUMBER,
        p_PlayerNumber   NUMBER
) 
RETURN BOOLEAN
IS
	v_taken NUMBER;
BEGIN
    -- Count the number of players with the specified jersey number on the given team
    SELECT COUNT(*)
    INTO v_taken
    FROM PLAYER
    WHERE TEAMID = p_TEAMID AND PlayerNumber = p_PlayerNumber;

    -- Return TRUE if no player has the specified jersey number on the team (v_taken = 0)
    RETURN (v_taken = 0);

EXCEPTION
    WHEN OTHERS THEN
    	-- Handle any exceptions by returning FALSE
        RETURN FALSE;
    END JERSEY_TAKEN;
	PROCEDURE move_player(p_player_id NUMBER, p_team_id NUMBER) IS
	BEGIN
		move_player(p_player_id, p_team_id);
	END move_player;
	
END PKG_Transfer_Player;
/
	

-- #5 Triggers, #3 Cursors. Make a trigger that tracks player team changes and puts them 
-- in a log. Another trigger will track 50 point games and log them.

SAVEPOINT save_six;

CREATE TABLE TRANSFER_LOG (
    Transfer_id NUMBER PRIMARY KEY,
    Player_id NUMBER,
    Old_team_id NUMBER,
    New_team_id NUMBER,
    TransferDate DATE
);

CREATE SEQUENCE transfer_log_seq
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

CREATE OR REPLACE TRIGGER trigger_player_transfers
AFTER UPDATE OF TEAM ON PLAYER
FOR EACH ROW
DECLARE
    v_old_team_id    NUMBER;
    v_old_team_name  VARCHAR2(50);
    v_new_team_id    NUMBER;
    v_new_team_name  VARCHAR2(50);

    -- Cursor declaration to fetch team information
    CURSOR c_team (team_id NUMBER) IS
        SELECT TEAMID, Team
        FROM TEAM
        WHERE TEAMID = team_id;
BEGIN
    -- Retrieve old team information if not NULL
    IF :OLD.TEAMID IS NOT NULL THEN
        OPEN c_team(:OLD.TEAMID);
        FETCH c_team INTO v_old_team_id, v_old_team_name;
        CLOSE c_team;
    END IF;

    -- Retrieve new team information if not NULL
    IF :NEW.TEAMID IS NOT NULL THEN
        OPEN c_team(:NEW.TEAMID);
        FETCH c_team INTO v_new_team_id, v_new_team_name;
        CLOSE c_team;
    END IF;

    -- Check if team has changed and insert into TRANSFER_LOG
    IF :OLD.TEAMID IS NOT NULL AND :NEW.TEAMID <> :OLD.TEAMID THEN
        INSERT INTO TRANSFER_LOG (Transfer_id, Player_id, Old_team_id, New_team_id, TransferDate)
        VALUES (transfer_log_seq.NEXTVAL, :OLD.PlayerID, v_old_team_id, :NEW.TEAMID, SYSDATE);
    END IF;
END;
/

-- Table for 50 point games
CREATE TABLE HIGH_SCORING_GAMES (
    Game_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Player_name VARCHAR2(50) NOT NULL,
    Team_name VARCHAR2(50) NOT NULL,
    Points_scored NUMBER NOT NULL,
    Game_date DATE NOT NULL
);

CREATE OR REPLACE TRIGGER trigger_high_scoring_games
AFTER UPDATE OF Points ON GAMELOG
FOR EACH ROW
DECLARE
    v_player_name VARCHAR2(50);
    v_team_name VARCHAR2(50);
BEGIN
    -- Retrieve player name and team name based on the updated player
    SELECT FirstName || ' ' || LastName, Team
    INTO v_player_name, v_team_name
    FROM PLAYER
    WHERE PLAYERID = :NEW.PLAYERID;

    -- Check if the updated points meet or exceed 50
    IF :NEW.Points >= 50 THEN
        -- Insert record into high scoring games log table
        INSERT INTO HIGH_SCORING_GAMES (Player_name, Team_name, Points_scored, Game_date)
        VALUES (v_player_name, v_team_name, :NEW.Points, SYSDATE);
    END IF;
END;
/

-- #9 Creating object type, create a stadium object type that holds attributes about
-- a stadium object

SAVEPOINT save_seven;

CREATE OR REPLACE TYPE STADIUM AS OBJECT (
    STADIUMID NUMBER,
    Name VARCHAR2(100),
    Location VARCHAR2(100),
    Capacity NUMBER,
    HomeTeam VARCHAR2(50)
);
/

CREATE TABLE TEAMSTADIUMS (
    TeamName VARCHAR2(50) PRIMARY KEY,
    stadium Stadium
);


INSERT INTO TeamStadiums (TeamName, stadium)
VALUES (
    'Boston Celtics',
    Stadium(1, 'TD Garden', 'Boston, MA', 18624, 'Boston Celtics')
);


INSERT INTO TeamStadiums (TeamName, stadium)
VALUES (
    'LA Clippers',
    Stadium(2, 'Crypto.com Arena', 'Los Angeles, CA', 19068, 'LA Clippers')
);


INSERT INTO TeamStadiums (TeamName, stadium)
VALUES (
    'Indiana Pacers',
    Stadium(3, 'Gainbridge Fieldhouse', 'Indianapolis, IN', 17923, 'Indiana Pacers')
);
