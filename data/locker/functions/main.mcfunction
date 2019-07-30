function locker:trigger

execute as @e[tag=lock_memory] at @s unless block ^ ^ ^ minecraft:chest run kill @s
execute as @a at @s positioned ~ ~1.67 ~ if entity @e[tag=lock_memory,distance=..5] run function locker:protection
execute as @a at @s positioned ~ ~1.67 ~ unless entity @e[tag=lock_memory,distance=..5] run effect clear @a mining_fatigue