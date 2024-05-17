# Additional Projectile Trails
execute at @e[type=fec:dragon_fireball_gravitational] run particle minecraft:dragon_breath_trail ~~~
execute at @e[type=arrow] run particle minecraft:balloon_gas_particle ~~~
execute at @e[type=fireball] run particle minecraft:mobflame_single ~~~
execute at @e[type=small_fireball] run particle minecraft:mobflame_single ~~~

# Ender Dragon Phase 2 Tick
scoreboard objectives add ender_dragon_p2 dummy
scoreboard players add @e[tag=ender_dragon_p2] ender_dragon_p2 1
scoreboard players set @e[tag=ender_dragon_p2,scores={ender_dragon_p2=1801..}] ender_dragon_p2 0

# Class Cooldown Tick
scoreboard objectives add atk_cooldown dummy
scoreboard objectives add dash_cooldown dummy
scoreboard objectives add wind_essence dummy
scoreboard players remove @a[scores={cdtick=20..}] atk_cooldown 1
scoreboard players remove @a[scores={cdtick=20..}] dash_cooldown 1
scoreboard players remove @a wind_essence 1
scoreboard players set @a[scores={atk_cooldown=..0}] atk_cooldown 0
scoreboard players set @a[scores={dash_cooldown=..0}] dash_cooldown 0
scoreboard players set @a[scores={wind_essence=..0}] wind_essence 0

# Entity Runtime
execute as @e[type=fec:eidolon_4_pillar] at @s run tp @s ^^^1
execute as @e[type=fec:eidolon_4_pillar] at @s run damage @e[type=!fec:eidolon_4_pillar,r=3,tag=!eidolon_iframe] 20 entity_attack entity @s
execute at @e[type=fec:eidolon_4_pillar] run particle fec:eidolon_4_pillar ~~~
execute as @e[type=fec:crescent_pillar] at @s run tp @s ^^^1 ~5 0
execute as @e[type=fec:crescent_pillar] at @s run damage @e[type=!fec:crescent_pillar,r=3] 15 entity_attack entity @s
execute at @e[type=fec:crescent_pillar] run particle fec:crescent_pillar ~~~
execute as @e[type=fec:zenith_base] at @s run tp @s ^^^ ~5 0
execute as @e[type=fec:shadow_slash] at @s run particle fec:shadow_slash ~~~
execute as @e[type=fec:shadow_slash] at @s run tp @s ^^^1
execute as @e[type=fec:shadow_slash] at @s run damage @e[type=!fec:shadow_slash,r=6] 12 entity_attack entity @s
execute at @e[type=fec:shadow_slash] run particle fec:blade_of_the_end_skill_1 ^^1.5^1

# Auto enchant Mending
enchant @a[hasitem={item=fec:stardust_armor_helmet,location=slot.weapon.mainhand}] mending
enchant @a[hasitem={item=fec:stardust_armor_boots,location=slot.weapon.mainhand}] mending
enchant @a[hasitem={item=fec:stardust_armor_chestplate,location=slot.weapon.mainhand}] mending
enchant @a[hasitem={item=fec:stardust_armor_leggings,location=slot.weapon.mainhand}] mending
enchant @a[hasitem={item=fec:stardust_clear_helmet,location=slot.weapon.mainhand}] mending
enchant @a[hasitem={item=fec:stardust_clear_boots,location=slot.weapon.mainhand}] mending
enchant @a[hasitem={item=fec:stardust_clear_chestplate,location=slot.weapon.mainhand}] mending
enchant @a[hasitem={item=fec:stardust_clear_leggings,location=slot.weapon.mainhand}] mending

# Gamemode switcher
execute as @e[type=fec:elemental_legionnaire] at @s run gamemode 2 @a[m=d,r=80]
execute as @e[type=fec:water_eidolon] at @s run gamemode 2 @a[m=d,r=64]
execute as @e[type=fec:shadowplague_guardian] at @s run gamemode 2 @a[m=d,r=80]
execute as @e[type=fec:elemental_legionnaire] at @s unless entity @a[r=80,m=2] run event entity @s despawn
execute as @e[type=fec:water_eidolon] at @s unless entity @a[r=64,m=2] run event entity @s despawn
execute as @e[type=fec:shadowplague_guardian] at @s unless entity @a[r=80,m=2] run event entity @s despawn

# Join Starter Pack
give @a[tag=!joined] compass
tellraw @a[tag=!joined] {"rawtext":[{"translate": "text.the_fates.welcome"}]}
tag @a[tag=!joined] add joined