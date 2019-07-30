# Counts up raycast to move the look location forward
	scoreboard players add @s lock_raycast 1


# Attempts to find block and place spawner at block location

	execute positioned ^ ^ ^ if block ^ ^ ^ #locker:container unless data block ^ ^ ^ Lock run title @s actionbar {"text":"This container has been locked!","color":"white"}
	execute positioned ^ ^ ^ if block ^ ^ ^ #locker:container unless data block ^ ^ ^ Lock run playsound minecraft:item.flintandsteel.use master @s
	
	execute positioned ^ ^ ^ if block ^ ^ ^ #locker:container if data block ^ ^ ^ Lock run title @s actionbar {"text":"This container already has a lock!","color":"yellow"}
	execute positioned ^ ^ ^ if block ^ ^ ^ #locker:container if data block ^ ^ ^ Lock run playsound minecraft:item.flintandsteel.use master @s

	execute positioned ^ ^ ^ if block ^ ^ ^ #locker:container unless data block ^ ^ ^ Lock run summon minecraft:area_effect_cloud ^ ^ ^ {Duration:32767,Tags:["lock_memory","just_spawned"]}
	execute positioned ^ ^ ^ if block ^ ^ ^ #locker:container unless data block ^ ^ ^ Lock run data modify entity @e[tag=just_spawned,limit=1,sort=nearest] Tags append from entity @s SelectedItem.tag.pages[0]
	tag @e[tag=just_spawned] remove just_spawned
	
	execute store success score @s lock_success positioned ^ ^ ^ if block ^ ^ ^ #locker:container run data modify block ^ ^ ^ Lock set from entity @s SelectedItem.tag.pages[0]

	execute positioned ^ ^ ^ if block ^ ^ ^ #locker:container if score @s lock_success matches 0 run data remove block ^ ^ ^ Lock
	execute positioned ^ ^ ^ if block ^ ^ ^ #locker:container if score @s lock_success matches 0 run kill @e[tag=lock_memory,limit=1,sort=nearest]
	execute positioned ^ ^ ^ if block ^ ^ ^ #locker:container if score @s lock_success matches 0 run title @s actionbar {"text":"The lock has been removed!","color":"white"}
	execute positioned ^ ^ ^ if block ^ ^ ^ #locker:container if score @s lock_success matches 0 run playsound minecraft:item.flintandsteel.use master @s
	execute positioned ^ ^ ^ if block ^ ^ ^ #locker:container if score @s lock_success matches 1 run data modify block ^ ^ ^ Lock set from entity @e[tag=lock_memory,limit=1,sort=nearest] Tags[0]


	execute if block ^ ^ ^ air positioned ^ ^ ^0.1 if score @s lock_raycast matches 1..50 run function locker:use

	# Resets scores after raycast
		scoreboard players set @s lock_raycast 0
		scoreboard players set @s lock_success -1