extends Node

signal process_turn

func emit(signame : String):
	emit_signal(signame)