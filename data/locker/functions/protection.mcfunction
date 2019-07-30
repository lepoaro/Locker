effect clear @s mining_fatigue
scoreboard players add @s lock_protection 1

execute positioned ^ ^ ^ if block ^ ^ ^ #locker:container if data block ^ ^ ^ Lock run effect give @s minecraft:mining_fatigue 1 255 true
execute if block ^ ^ ^ air positioned ^ ^ ^0.1 if score @s lock_protection matches 1..50 run function locker:protection

scoreboard players set @s lock_protection 0