scoreboard objectives add deathCounter dummy
scoreboard objectives add deathCounterDisp dummy "Most Deaths"
scoreboard objectives add jumpCounter dummy
scoreboard objectives add jumpCounterDisp dummy "Most Jumps"
scoreboard objectives add moveCounter dummy
scoreboard objectives add moveCounterDisp dummy "Most Blocks Traveled"
scoreboard objectives add legendCounter dummy
scoreboard objectives add legendCounterDisp dummy "Most Attacks with Legendary Weapon"
execute as @a at @s run scoreboard players operation @s deathCounterDisp = @s deathCounter
execute as @a at @s run scoreboard players operation @s jumpCounterDisp = @s jumpCounter
execute as @a at @s run scoreboard players operation @s moveCounterDisp = @s moveCounter
execute as @a at @s run scoreboard players operation @s legendCounterDisp = @s legendCounter