import { system, world, Scoreboard, Dimension, Player, Entity, ItemStack, EntityDamageCause, Effect } from '@minecraft/server'
import { ActionFormData, MessageFormData } from '@minecraft/server-ui'

// General Functions
function addScore(target, objective, score) {
    try {
        world.scoreboard.getObjective(objective).addScore(target, score)
    } catch (e) {
        target.runCommandAsync(`scoreboard players add "${target.name}" ${objective} ${score}`)
    }
}

function setScore(target, objective, score) {
    try {
        world.scoreboard.getObjective(objective).setScore(target, score)
    } catch (e) {
        target.runCommandAsync(`scoreboard players set "${target.name}" ${objective} ${score}`)
    }
}

function getScore(target, objective) {
    try {
        return world.scoreboard.getObjective(objective).getScore(target)
    } catch (error) {
        return 0;
    }
}

// Detects entity being hurt, or you hit an entity
world.afterEvents.entityHurt.subscribe((hurtEvent) => {
    const source = hurtEvent.damageSource.damagingEntity;
    const damagedEntity = hurtEvent.hurtEntity;

    if (!source) return;

    if (source.hasTag('healer') && getScore(source, 'atk_cooldown') == 0) {
        const health = source.getComponent("health");
        const currentHealth = health.currentValue;
        health.setCurrentValue(currentHealth + 1)
        source.runCommandAsync(`playsound random.orb ${source.name}`)
        setScore(source, 'atk_cooldown', 2)
    }

    if (source.hasTag('initiator')){
        if (source.hasTag('initiator') && getScore(source, 'atk_cooldown') == 0){
            const initiateDmg = {
                cause: "entity_attack",
                damagingEntity: source,
                damagingProjectile: source
            }
            damagedEntity.applyDamage(10, initiateDmg)
            source.addEffect('strength', 100)
            damagedEntity.dimension.spawnParticle('minecraft:critical_hit_emitter', damagedEntity.location)
            source.runCommandAsync('playsound mob.zombie.woodbreak @p[r=12]')
        }
        setScore(source, 'atk_cooldown', 15)
    }

    if (source.hasTag('penetrator') && getScore(source, 'atk_cooldown') == 0){
        const breachDmg = {
            cause: "freezing",
            damagingEntity: source,
            damagingProjectile: source
        }
        damagedEntity.applyDamage(2, breachDmg)
        damagedEntity.applyKnockback(source.getViewDirection().x, source.getViewDirection().z, 3, 1)
        setScore(source, 'atk_cooldown', 5)
    }
})

// Detects an Item Use
world.afterEvents.itemUse.subscribe((starting) => {
    const player = starting.source

    if(starting.itemStack.typeId === 'minecraft:feather' && getScore(player, 'dash_cooldown') == 0){
        player.applyKnockback(player.getViewDirection().x, player.getViewDirection().z, 3, 0.4);
        player.runCommandAsync(`playsound mob.enderdragon.flap ${player.name}`);
        player.runCommandAsync(`particle fec:dash_fx ~~~`);
        return addScore(player, 'dash_cooldown', 14);
    }

    if(starting.itemStack.typeId === 'fec:wind_essence' && getScore(player, 'wind_essence') == 0){
        if(player.isSneaking == true){
            const IframeOptions = {
                amplifier: 255,
                showParticles: false
            }
            player.applyKnockback(player.getViewDirection().x, player.getViewDirection().z, 0.4, 1.1);
            player.runCommandAsync(`playsound mob.enderdragon.flap ${player.name}`);
            player.runCommandAsync(`particle fec:dash_fx ~~~`);
            player.runCommandAsync(`particle fec:dash_fx ~~1~`);
            player.runCommandAsync(`particle fec:dash_fx ~~2~`);
            player.runCommandAsync(`particle fec:dash_fx ~~3~`);
            player.addEffect('resistance', 45, IframeOptions);
            addScore(player, 'wind_essence', 10);
        } else {
            player.applyKnockback(player.getViewDirection().x, player.getViewDirection().z, 3.1, 0.4);
            player.runCommandAsync(`playsound mob.enderdragon.flap ${player.name}`);
            player.runCommandAsync(`particle fec:windblade_claymore_attack_3 ~~~`);
            addScore(player, 'wind_essence', 20);
        }
    }

    if(!player.hasTag('class_selected') && starting.itemStack.typeId === 'minecraft:compass') classForm(player);

    function classForm(){
        let classForms = new ActionFormData;
        classForms.title("Select Your Class");
        classForms.body(`${player.nameTag}, Select your class here to start your journey, every class have different perks to differentiate starting gear`);
        classForms.button("The Speed Ranger", "textures/items/medals/winterbloom_medal");
        classForms.button("The Healer Mage", "textures/items/medals/loving_sakura_medal");
        classForms.button("The Melee Initiator", "textures/items/medals/lightning_phoenix_medal");
        classForms.button("The Heavy Penetrator", "textures/items/medals/land_of_peace_medal");
    
        classForms.show(player).then(r => {
            if (r.canceled || r.selection === undefined ){
                player.sendMessage(`${player.nameTag}, you can choose class next time, think it first before you choose`)
            }
            if (r.selection == 0) speedRanger(player);
            if (r.selection == 1) healerMage(player);
            if (r.selection == 2) meleeInitiator(player);
            if (r.selection == 3) heavyPenetrator(player);
        })
    }
    
    function speedRanger(){
        let speedRanger = new MessageFormData;
        speedRanger.title("Confirmation");
        speedRanger.body("Are you sure you want to select Speed Ranger? You cannot change until you use Nether Star\n This Class have :\n\n Perks : Improved Speed (Dashes with Feather)\n You will receive :\n  1 Bow\n  32 Arrow\n  32 Steak\n  1 Exclusive Medalion (Winterbloom)");
        speedRanger.button1("No, Let me think again");
        speedRanger.button2("Yes, Sure");
    
        speedRanger.show(player).then(r => {
            if (r.canceled || r.selection === undefined || r.selection === 0 ) classForm(player);
            if (r.selection === 1) {
                player.sendMessage(`Class Selected, You cannot change change class again until you have a Nether Star`);
                player.runCommandAsync(`give ${player.name} fec:winterbloom_medal`);
                player.runCommandAsync(`give ${player.name} bow`);
                player.runCommandAsync(`give ${player.name} arrow 32`);
                player.runCommandAsync(`give ${player.name} cooked_beef 32`);
                player.addTag('class_selected');
                player.addTag('speed_ranger');
                player.runCommandAsync(`clear ${player.name} compass`);
            }
        })
    }
    
    function healerMage(){
        let HealerMage = new MessageFormData;
        HealerMage.title("Confirmation");
        HealerMage.body("Are you sure you want to select Speed Ranger?\nThis class have :\n Perks : Improved Healing (+1 HP Every hit)\n\n This Class have :\n  1 Wooden Sword\n  1 Leather Armor Set\n  32 Bread\n  1 Exclusive Medalion (Loving Sakura)");
        HealerMage.button1("No, Let me think again");
        HealerMage.button2("Yes, Sure");
    
        HealerMage.show(player).then(r => {
            if (r.canceled || r.selection === undefined || r.selection === 0 ) classForm(player);
            if (r.selection === 1) {
                player.sendMessage(`Class Selected, You cannot change change class again until you have a Nether Star`);
                player.runCommandAsync(`give ${player.name} fec:loving_sakura_medal`);
                player.runCommandAsync(`give ${player.name} wooden_sword`);
                player.runCommandAsync(`give ${player.name} bread 32`);
                player.runCommandAsync(`give ${player.name} leather_helmet 1`);
                player.runCommandAsync(`give ${player.name} leather_chestplate 1`);
                player.runCommandAsync(`give ${player.name} leather_leggings 1`);
                player.runCommandAsync(`give ${player.name} leather_boots 1`);
                player.addTag('class_selected');
                player.addTag('healer');
                player.runCommandAsync(`clear ${player.name} compass`);
            }
        })
    }
    
    function meleeInitiator(){
        let meleeInitiator = new MessageFormData;
        meleeInitiator.title("Confirmation");
        meleeInitiator.body("Are you sure you want to select Speed Ranger?\nThis class have :\n Perks : Initiator Strike (x3 Damage when enters combat)\n\n This Class have :\n  1 Stone Sword\n  1 Chainmail with Leather Armor Set\n  16 Steak\n  1 Exclusive Medalion (Lightning Tajador)");
        meleeInitiator.button1("No, Let me think again");
        meleeInitiator.button2("Yes, Sure");
        meleeInitiator.show(player).then(r => {
            if (r.canceled || r.selection === undefined || r.selection === 0 ) classForm(player);
            if (r.selection === 1) {
                player.sendMessage(`Class Selected, You cannot change change class again until you have a Nether Star`);
                player.runCommandAsync(`give ${player.name} fec:murasama_medal`)
                player.runCommandAsync(`give ${player.name} wooden_sword`);
                player.runCommandAsync(`give ${player.name} bread 32`);
                player.runCommandAsync(`give ${player.name} leather_helmet 1`);
                player.runCommandAsync(`give ${player.name} leather_chestplate 1`);
                player.runCommandAsync(`give ${player.name} leather_leggings 1`);
                player.runCommandAsync(`give ${player.name} leather_boots 1`);
                player.addTag('class_selected');
                player.addTag('initiator');
                player.runCommandAsync(`clear ${player.name} compass`);
            }
        })
    }
    
    function heavyPenetrator(){
        let HeavyPenetrator = new MessageFormData;
        HeavyPenetrator.title("Confirmation");
        HeavyPenetrator.body("Are you sure you want to select Speed Ranger?\nThis class have :\n Perks : Brute Windforce (Massive knockbacks with fists only, and improves fist attack)]\n\n This Class have :\n  1 Wooden Sword\n 1 Chainmail Armor Set\n  16 Steak\n  1 Exclusive Medalion (Land of Peace)");
        HeavyPenetrator.button1("No, Let me think again");
        HeavyPenetrator.button2("Yes, Sure");
        HeavyPenetrator.show(player).then(r => {
            if (r.canceled || r.selection === undefined || r.selection === 0 ) classForm(player);
            if (r.selection === 1) {
                player.sendMessage(`Class Selected, You cannot change change class again until you have a Nether Star`);
                player.runCommandAsync(`give ${player.name} fec:land_of_peace_medal`)
                player.runCommandAsync(`give ${player.name} wooden_sword`);
                player.runCommandAsync(`give ${player.name} bread 16`);
                player.runCommandAsync(`give ${player.name} leather_helmet 1`);
                player.runCommandAsync(`give ${player.name} leather_chestplate 1`);
                player.runCommandAsync(`give ${player.name} leather_leggings 1`);
                player.runCommandAsync(`give ${player.name} leather_boots 1`);
                player.addTag('class_selected');
                player.addTag('penetrator');
                player.runCommandAsync(`clear ${player.name} compass`);
            }
        })
    }
});

// Detects a chat, then turn it into commands
world.beforeEvents.chatSend.subscribe((commandData) => {
    const players = commandData.sender;
    switch (commandData.message) {
        case '.help':
            commandData.cancel = true;
            players.sendMessage(`.help - For command list`);
            players.sendMessage(`.recipe (Under Development) - For showing recipes from The Fates Intertwined from the other tables, like Legendary Fabricator`);
            players.sendMessage(`.reset_bug - For fixing bugs caused by Legendary Weapons`);
            players.sendMessage(`.statistic check - Used to check the statistics like Blocks traveled, Attacks with Legendary Weapons, etc`);
            players.sendMessage(`.reset_leaderboard (Needs Admin Permission) - For Reset the Leaderboards, useful for server`);
            break;
        case '.recipe':
            commandData.cancel = true;
            players.sendMessage(`Usage :`);
            players.sendMessage(`.recipe <item-name>, Current Item Name : winterbloom_sword, rage_of_sakura, murasama_calamity, spear_of_heart, legionnaire_medalion, zenith, stars_and_crescent`);
            break;
        case '.recipe winterbloom_sword':
            commandData.cancel = true;
            players.sendMessage(`Crafted with Legendary Fabricators`);
            players.sendMessage(`Crafting Types : Shapeless`);
            players.sendMessage(`Ingredients : 1x Winterbloom Medalion, 1x Netherite Sword, 1x Pink Petals`);
            break;
        case '.recipe rage_of_sakura':
            commandData.cancel = true;
            players.sendMessage(`Crafted with Legendary Fabricators`);
            players.sendMessage(`Crafting Types : Shapeless`);
            players.sendMessage(`Ingredients : 1x Loving Sakura Medalion, 1x Netherite Sword, 1x Redstone Dust`);
            break;
        case '.recipe murasama_calamity':
            commandData.cancel = true;
            players.sendMessage(`Crafted with Legendary Fabricators`);
            players.sendMessage(`Crafting Types : Shapeless`);
            players.sendMessage(`Ingredients : 1x Lightning Tajador Medalion, 1x Netherite Sword, 1x Redstone Dust`);
            break;
        case '.recipe spear_of_heart':
            commandData.cancel = true;
            players.sendMessage(`Crafted with Legendary Fabricators`);
            players.sendMessage(`Crafting Types : Shapeless`);
            players.sendMessage(`Ingredients : 1x Winterbloom Medalion, 1x Netherite Sword, 1x Pink Petals`);
            break;
        case '.recipe legionnaire_medalion': 
            commandData.cancel = true;
            players.sendMessage(`Crafted with Legendary Fabricators`);
            players.sendMessage(`Crafting Types : Shaped`);
            players.sendMessage(`Patterns :`);
            players.sendMessage(` W `);
            players.sendMessage(`LNF`);
            players.sendMessage(` E `);
            players.sendMessage(`Keys : W: Wind Essence, L: Lightning Essence, N: Nether Star, F: Fire Essence, E: Earth Essence`);
            break;
        case '.recipe zenith': 
            commandData.cancel = true;
            players.sendMessage(`Crafted with Zenith Fabricator`);
            players.sendMessage(`Crafting Types : Item Interact Order (Custom)`);
            players.sendMessage(`Orders : Winterbloom Sword, Murasama Calamity, Windblade Claymore, Blade of The End, Nether Star`);
            break;
        case '.reset_bug':
            commandData.cancel = true;
            players.runCommandAsync('function reset_bug');
            players.sendMessage(`Bugs caused by Legendary Weapons is fixed`)
            break;
        case '.statistic check':
            commandData.cancel = true;
            players.runCommandAsync('function statistics/check');
            break;
        case '.reset_leaderboard':
            commandData.cancel = true;
            if (!players.hasTag('fatesadmin')) players.sendMessage(`You do not have the permission for this command, Add tag "fatesadmin" first before you using the command`);
            else {
                players.runCommandAsync('function reset_leaderboard');
                players.sendMessage(`The Leaderboards has beed reseted`);
            }
        default: break;
    }
})