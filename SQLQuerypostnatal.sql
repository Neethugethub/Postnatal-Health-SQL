select * from SQLExploration.dbo.postnatal order by Age
--changing data formaat
Alter  table SQLExploration.dbo.postnatal alter  column Timestamp  date
select * from SQLExploration.dbo.postnatal order by Age


---  finding Struggles on  different age group
select Age,

sum(cast(Feeling_sad_or_Tearful As INT))as Sad,
sum(cast(Irritable_towards_baby_partner AS INT)) as Irritable,
sum(cast(Trouble_sleeping_at_night AS INT)) as SleepTroubles,
sum(cast(Problems_concentrating_or_making_decision AS INT)) as concentratingProblems,
sum(cast(Overeating_or_loss_of_appetite AS INT)) as Eatingproblems,
sum(cast(Feeling_anxious AS INT)) as Anxious,
sum(cast(Feeling_of_guilt AS INT)) as Guilt,
sum(cast(Problems_of_bonding_with_baby AS INT)) as Babybonding,
sum(cast(Suicide_attempt AS INT)) as Suicideattempt

from SQLExploration.dbo.postnatal group by Age order by Age


--DTE

 with StrugglesMax As
 (select Age,sum(cast(Feeling_sad_or_Tearful As INT))as Sad,
sum(cast(Irritable_towards_baby_partner AS INT)) as Irritable,
sum(cast(Trouble_sleeping_at_night AS INT)) as SleepTroubles,
sum(cast(Problems_concentrating_or_making_decision AS INT)) as concentratingProblems,
sum(cast(Overeating_or_loss_of_appetite AS INT)) as Eatingproblems,
sum(cast(Feeling_anxious AS INT)) as Anxious,
sum(cast(Feeling_of_guilt AS INT)) as Guilt,
sum(cast(Problems_of_bonding_with_baby AS INT)) as Babybonding,
sum(cast(Suicide_attempt AS INT)) as Suicideattempt
from SQLExploration.dbo.postnatal group by Age )


--showing all summary by age group using CTE

select * from StrugglesMax order by Age Desc


--showing the maximum struggle of women on age group

select Age,Sad from StrugglesMax where Sad=(select Sad=Max(sad) from StrugglesMax)

select * from StrugglesMax where Sad=(select Sad=Max(sad) from StrugglesMax)

select *from StrugglesMax where Sad=(select Sad=Max(sad) from StrugglesMax  where
Suicideattempt=(select Suicideattempt=Max(Suicideattempt) from StrugglesMax))

--Percentage of women struggling with "Feeling_sad_or_Tearful" ness in  differnt age groups order by the highest percentage

select  Age,
round(sum(cast(Feeling_sad_or_Tearful As float))/count(Feeling_sad_or_Tearful)*100,0) as Affected_Percent
from SQLExploration.dbo.postnatal group by Age order by Affected_Percent Desc






