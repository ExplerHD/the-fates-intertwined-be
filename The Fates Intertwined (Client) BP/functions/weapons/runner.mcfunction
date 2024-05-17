scoreboard objectives add atkp_delay dummy
scoreboard objectives add blade_of_the_end dummy
scoreboard objectives add winterbloom_sword dummy
scoreboard objectives add rage_of_sakura dummy
scoreboard objectives add murasama_calamity dummy
scoreboard objectives add windblade_claymore dummy
scoreboard objectives add spear_of_heart dummy
scoreboard objectives add zenith dummy
scoreboard objectives add eidolon_4_staff dummy
scoreboard objectives add stars_and_crescent dummy
scoreboard players add @e[scores={atkp_delay=1..}] atkp_delay 1
scoreboard players add @a blade_of_the_end 0
scoreboard players add @a winterbloom_sword 0
scoreboard players add @a rage_of_sakura 0
scoreboard players add @a murasama_calamity 0
scoreboard players add @a windblade_claymore 0
scoreboard players add @a spear_of_heart 0
scoreboard players add @a zenith 0
scoreboard players add @a eidolon_4_staff 0
scoreboard players add @a stars_and_crescent 0
scoreboard objectives add voltra_charge dummy
scoreboard players add @a voltra_charge 0
scoreboard players set @a[scores={voltra_charge=100..}] voltra_charge 100
scoreboard players add @a[tag=voltra_charging] voltra_charge 1
effect @a[tag=zenith] resistance 3 1 true
execute if score tick stat_tick matches 1801 run playanimation @a[tag=zenith] animation.zenith.skill_1
execute if score tick stat_tick matches 1201 run playanimation @a[tag=zenith] animation.zenith.skill_1
execute if score tick stat_tick matches 601 run playanimation @a[tag=zenith] animation.zenith.skill_1
execute if score tick stat_tick matches 1 run playanimation @a[tag=zenith] animation.zenith.skill_1
effect @e[tag=stars_and_crescent] speed 3 3 true
execute at @e[tag=stars_and_crescent] run particle fec:light_idle ~~~