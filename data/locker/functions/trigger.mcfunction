# Vanilla Lockette using Datapacks

	# TRIGGER
	
	execute as @a[scores={lock_wrotePswd=1}] at @s positioned ~ ~1.67 ~ run function locker:use
	scoreboard players set @a lock_wrotePswd 0