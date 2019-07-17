class_name SpellController extends Node2D

var spell_count = 0
var spell_scene = load("res://Scenes/SpellController/Spell/Spell.tscn")

func _ready():
	GlobalNodes.spell_controller = self

func spawn_spell(origin : Vector2, dir : Vector2):
	var spell = spell_scene.instance()
	spell.position = origin
	spell.direction = dir
	call_deferred("add_child", spell)
	#spell_count += 1
	#spell.set_name('spell_' + (spell_count as String))
	#add_child(spell)
