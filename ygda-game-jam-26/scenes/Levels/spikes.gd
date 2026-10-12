extends TileMapLayer

func _on_spikes_tree_entered():
	get_tree().reload_current_scene()
