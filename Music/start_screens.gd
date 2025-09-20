extends AudioStreamPlayer

const start_music = preload("res://Music/Start Screen.wav")
const town_music = preload("res://Music/Town Song.wav")

func _play_music(music: AudioStream, volume = 0.0):
	if stream == music:
		return
	
	stream = music
	volume_db = volume
	play()

func play_music_start():
	_play_music(start_music)

func play_music_town():
	_play_music(town_music)
