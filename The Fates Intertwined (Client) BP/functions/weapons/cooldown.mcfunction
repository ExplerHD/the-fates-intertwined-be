## Cooldown Score Data
scoreboard objectives add cdtick dummy
scoreboard objectives add blade_of_the_end_c1 dummy
scoreboard objectives add blade_of_the_end_c2 dummy
scoreboard objectives add blade_of_the_end_c3 dummy
scoreboard objectives add blade_of_the_end_c4 dummy
scoreboard objectives add winterbloom_sword_c1 dummy
scoreboard objectives add winterbloom_sword_c2 dummy
scoreboard objectives add winterbloom_sword_c3 dummy
scoreboard objectives add rage_of_sakura_c1 dummy
scoreboard objectives add rage_of_sakura_c2 dummy
scoreboard objectives add rage_of_sakura_c3 dummy
scoreboard objectives add murasama_calamity_c1 dummy
scoreboard objectives add murasama_calamity_c2 dummy
scoreboard objectives add murasama_calamity_c3 dummy
scoreboard objectives add murasama_calamity_c4 dummy
scoreboard objectives add windblade_claymore_c1 dummy
scoreboard objectives add windblade_claymore_c2 dummy
scoreboard objectives add windblade_claymore_c3 dummy
scoreboard objectives add spear_of_heart_c1 dummy
scoreboard objectives add spear_of_heart_c2 dummy
scoreboard objectives add spear_of_heart_c3 dummy
scoreboard objectives add zenith_c1 dummy
scoreboard objectives add zenith_c2 dummy
scoreboard objectives add zenith_c3 dummy
scoreboard objectives add zenith_c4 dummy
scoreboard objectives add zenith_c5 dummy
scoreboard objectives add eidolon_4_staff_c1 dummy
scoreboard objectives add eidolon_4_staff_c2 dummy
scoreboard objectives add eidolon_4_staff_c3 dummy
scoreboard objectives add stars_and_crescent_c1 dummy
scoreboard objectives add stars_and_crescent_c2 dummy
scoreboard objectives add stars_and_crescent_c3 dummy

## Cooldown Runtime
scoreboard players add @a cdtick 1
scoreboard players set @a[scores={cdtick=21..}] cdtick 0
scoreboard players remove @a[scores={cdtick=20}] winterbloom_sword_c1 1
scoreboard players remove @a[scores={cdtick=20}] winterbloom_sword_c2 1
scoreboard players remove @a[scores={cdtick=20}] winterbloom_sword_c3 1
scoreboard players remove @a[scores={cdtick=20}] rage_of_sakura_c1 1
scoreboard players remove @a[scores={cdtick=20}] rage_of_sakura_c2 1
scoreboard players remove @a[scores={cdtick=20}] rage_of_sakura_c3 1
scoreboard players remove @a[scores={cdtick=20}] murasama_calamity_c1 1
scoreboard players remove @a[scores={cdtick=20}] murasama_calamity_c2 1
scoreboard players remove @a[scores={cdtick=20}] murasama_calamity_c3 1
scoreboard players remove @a[scores={cdtick=20}] blade_of_the_end_c1 1
scoreboard players remove @a[scores={cdtick=20}] blade_of_the_end_c2 1
scoreboard players remove @a[scores={cdtick=20}] blade_of_the_end_c3 1
scoreboard players remove @a[scores={cdtick=20}] blade_of_the_end_c4 1
scoreboard players remove @a[scores={cdtick=20}] windblade_claymore_c1 1
scoreboard players remove @a[scores={cdtick=20}] windblade_claymore_c2 1
scoreboard players remove @a[scores={cdtick=20}] windblade_claymore_c3 1
scoreboard players remove @a[scores={cdtick=20}] spear_of_heart_c1 1
scoreboard players remove @a[scores={cdtick=20}] spear_of_heart_c2 1
scoreboard players remove @a[scores={cdtick=20}] spear_of_heart_c3 1
scoreboard players remove @a[scores={cdtick=20}] zenith_c1 1
scoreboard players remove @a[scores={cdtick=20}] zenith_c2 1
scoreboard players remove @a[scores={cdtick=20}] zenith_c3 1
scoreboard players remove @a[scores={cdtick=20}] zenith_c4 1
scoreboard players remove @a[scores={cdtick=20}] zenith_c5 1
scoreboard players remove @a[scores={cdtick=20}] eidolon_4_staff_c1 1
scoreboard players remove @a[scores={cdtick=20}] eidolon_4_staff_c2 1
scoreboard players remove @a[scores={cdtick=20}] eidolon_4_staff_c3 1
scoreboard players remove @a stars_and_crescent_c1 1
scoreboard players remove @a[scores={cdtick=20}] stars_and_crescent_c2 1
scoreboard players remove @a[scores={cdtick=20}] stars_and_crescent_c3 1
scoreboard players set @a[scores={winterbloom_sword_c1=..0}] winterbloom_sword_c1 0
scoreboard players set @a[scores={winterbloom_sword_c2=..0}] winterbloom_sword_c2 0
scoreboard players set @a[scores={winterbloom_sword_c3=..0}] winterbloom_sword_c3 0
scoreboard players set @a[scores={rage_of_sakura_c1=..0}] rage_of_sakura_c1 0
scoreboard players set @a[scores={rage_of_sakura_c2=..0}] rage_of_sakura_c2 0
scoreboard players set @a[scores={rage_of_sakura_c3=..0}] rage_of_sakura_c3 0
scoreboard players set @a[scores={murasama_calamity_c1=..0}] murasama_calamity_c1 0
scoreboard players set @a[scores={murasama_calamity_c2=..0}] murasama_calamity_c2 0
scoreboard players set @a[scores={murasama_calamity_c3=..0}] murasama_calamity_c3 0
scoreboard players set @a[scores={blade_of_the_end_c1=..0}] blade_of_the_end_c1 0
scoreboard players set @a[scores={blade_of_the_end_c2=..0}] blade_of_the_end_c2 0
scoreboard players set @a[scores={blade_of_the_end_c3=..0}] blade_of_the_end_c3 0
scoreboard players set @a[scores={blade_of_the_end_c4=..0}] blade_of_the_end_c4 0
scoreboard players set @a[scores={windblade_claymore_c1=..0}] windblade_claymore_c1 0
scoreboard players set @a[scores={windblade_claymore_c2=..0}] windblade_claymore_c2 0
scoreboard players set @a[scores={windblade_claymore_c3=..0}] windblade_claymore_c3 0
scoreboard players set @a[scores={spear_of_heart_c1=..0}] spear_of_heart_c1 0
scoreboard players set @a[scores={spear_of_heart_c2=..0}] spear_of_heart_c2 0
scoreboard players set @a[scores={spear_of_heart_c3=..0}] spear_of_heart_c3 0
scoreboard players set @a[scores={zenith_c1=..0}] zenith_c1 0
scoreboard players set @a[scores={zenith_c2=..0}] zenith_c2 0
scoreboard players set @a[scores={zenith_c3=..0}] zenith_c3 0
scoreboard players set @a[scores={zenith_c4=..0}] zenith_c4 0
scoreboard players set @a[scores={zenith_c5=..0}] zenith_c5 0
scoreboard players set @a[scores={eidolon_4_staff_c1=..0}] eidolon_4_staff_c1 0
scoreboard players set @a[scores={eidolon_4_staff_c2=..0}] eidolon_4_staff_c2 0
scoreboard players set @a[scores={eidolon_4_staff_c3=..0}] eidolon_4_staff_c3 0
scoreboard players set @a[scores={stars_and_crescent_c1=..0}] stars_and_crescent_c1 0
scoreboard players set @a[scores={stars_and_crescent_c2=..0}] stars_and_crescent_c2 0
scoreboard players set @a[scores={stars_and_crescent_c3=..0}] stars_and_crescent_c3 0

## Weapon Cooldown Display
titleraw @a[hasitem={item=fec:winterbloom_sword,location=slot.weapon.mainhand}] actionbar {"rawtext":[{"text":"§bC1 : §e"},{"score":{"name":"*","objective":"winterbloom_sword_c1"}},{"text":"s, §bC2 : §e"},{"score":{"name":"*","objective":"winterbloom_sword_c2"}},{"text":"s, §bC3 : §e"},{"score":{"name":"*","objective":"winterbloom_sword_c3"}},{"text":"s"}]}
titleraw @a[hasitem={item=fec:rage_of_sakura,location=slot.weapon.mainhand}] actionbar {"rawtext":[{"text":"§bC1 : §e"},{"score":{"name":"*","objective":"rage_of_sakura_c1"}},{"text":"s, §bC2 : §e"},{"score":{"name":"*","objective":"rage_of_sakura_c2"}},{"text":"s, §bC3 : §e"},{"score":{"name":"*","objective":"rage_of_sakura_c3"}},{"text":"s"}]}
titleraw @a[hasitem={item=fec:murasama_calamity,location=slot.weapon.mainhand},scores={murasama_calamity_c4=..0}] actionbar {"rawtext":[{"text":"§bC1 : §e"},{"score":{"name":"*","objective":"murasama_calamity_c1"}},{"text":"s, §bC2 : §e"},{"score":{"name":"*","objective":"murasama_calamity_c2"}},{"text":"s, §bC3 : §e"},{"score":{"name":"*","objective":"murasama_calamity_c3"}},{"text":"s, §bC4 : §e"},{"score":{"name":"*","objective":"murasama_calamity_c4"}},{"text":"/2 Charge §cVoltra Charge §f"},{"score":{"name":"*","objective":"voltra_charge"}},{"text":"/100"}]}
titleraw @a[hasitem={item=fec:murasama_calamity,location=slot.weapon.mainhand},scores={murasama_calamity_c4=2..}] actionbar {"rawtext":[{"text":"§bC1 : §e"},{"score":{"name":"*","objective":"murasama_calamity_c1"}},{"text":"s, §bC2 : §e"},{"score":{"name":"*","objective":"murasama_calamity_c2"}},{"text":"s, §bC3 : §e"},{"score":{"name":"*","objective":"murasama_calamity_c3"}},{"text":"s, §bC4 : §eREADY! §cVoltra Charge §f"},{"score":{"name":"*","objective":"voltra_charge"}},{"text":"/100"}]}
titleraw @a[hasitem={item=fec:windblade_claymore,location=slot.weapon.mainhand}] actionbar {"rawtext":[{"text":"§bC1 : §e"},{"score":{"name":"*","objective":"windblade_claymore_c1"}},{"text":"s, §bC2 : §e"},{"score":{"name":"*","objective":"windblade_claymore_c2"}},{"text":"s, §bC3 : §e"},{"score":{"name":"*","objective":"windblade_claymore_c3"}},{"text":"s"}]}
titleraw @a[hasitem={item=fec:blade_of_the_end,location=slot.weapon.mainhand}] actionbar {"rawtext":[{"text":"§bC1 : §e"},{"score":{"name":"*","objective":"blade_of_the_end_c1"}},{"text":"s, §bC2 : §e"},{"score":{"name":"*","objective":"blade_of_the_end_c2"}},{"text":"s, §bC3 : §e"},{"score":{"name":"*","objective":"blade_of_the_end_c3"}},{"text":"s, §bC4 : §e"},{"score":{"name":"*","objective":"blade_of_the_end_c4"}},{"text":"s"}]}
titleraw @a[hasitem={item=fec:spear_of_heart,location=slot.weapon.mainhand}] actionbar {"rawtext":[{"text":"§bC1 : §e"},{"score":{"name":"*","objective":"spear_of_heart_c1"}},{"text":"s, §bC2 : §e"},{"score":{"name":"*","objective":"spear_of_heart_c2"}},{"text":"s, §bC3 : §e"},{"score":{"name":"*","objective":"spear_of_heart_c3"}},{"text":"s"}]}
titleraw @a[hasitem={item=fec:zenith,location=slot.weapon.mainhand}] actionbar {"rawtext":[{"text":"§bC1 : §e"},{"score":{"name":"*","objective":"zenith_c1"}},{"text":"s, §bC2 : §e"},{"score":{"name":"*","objective":"zenith_c2"}},{"text":"s, §bC3 : §e"},{"score":{"name":"*","objective":"zenith_c3"}},{"text":"s, §bC4 : §e"},{"score":{"name":"*","objective":"zenith_c4"}},{"text":"s, §bC5 : §e"},{"score":{"name":"*","objective":"zenith_c5"}},{"text":"s"}]}
titleraw @a[hasitem={item=fec:eidolon_4_staff,location=slot.weapon.mainhand}] actionbar {"rawtext":[{"text":"§bC1 : §e"},{"score":{"name":"*","objective":"eidolon_4_staff_c1"}},{"text":"s, §bC2 : §e"},{"score":{"name":"*","objective":"eidolon_4_staff_c2"}},{"text":"s, §bC3 : §e"},{"score":{"name":"*","objective":"eidolon_4_staff_c3"}},{"text":"s"}]}
titleraw @a[hasitem={item=fec:stars_and_crescent,location=slot.weapon.mainhand}] actionbar {"rawtext":[{"text":"§bC1 : §e"},{"score":{"name":"*","objective":"stars_and_crescent_c1"}},{"text":"ticks, §bC2 : §e"},{"score":{"name":"*","objective":"stars_and_crescent_c2"}},{"text":"s, §bC3 : §e"},{"score":{"name":"*","objective":"stars_and_crescent_c3"}},{"text":"s"}]}