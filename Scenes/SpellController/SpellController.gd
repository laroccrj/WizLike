class_name SpellController extends Node2D

var spell_count = 0
var spell_scene = load("res://Scenes/SpellController/Spell/Spell.tscn")

func _ready():
	GlobalNodes.spell_controller = self
	spawn_spell()

func spawn_spell():
	var spell = spell_scene.instance()
	spell.direction = Vector2(0, 1)
	call_deferred("add_child", spell)
	#spell_count += 1
	#spell.set_name('spell_' + (spell_count as String))
	#add_child(spell)
