class_name SpellController extends Node2D

var spell_count = 0

func _ready():
	GlobalNodes.spell_controller = self
	spawn_spell()

func spawn_spell():
	var spell = Spell.new()
	spell_count += 1
	spell.set_name('spell_' + (spell_count as String))
	add_child(spell)
