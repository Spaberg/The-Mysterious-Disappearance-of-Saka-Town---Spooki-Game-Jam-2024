extends Control

var text_speed : float = 0.0
var text : String = "There’s a video that has been circulating around lately.
Of an abandoned town up in the mountains called Saka.
No one has any recollection of it ever existing.
Yet, it’s right there in the video.
I just know it’s real.
I haven’t been able to stop thinking about it ever since I saw that video.
Something draws me to it.
My search has led me to the mountains of Gunma prefecture.
Surely it can’t be that far now.
"

@onready var text_paragraphs = make_text_array(text)
var text_index : int = 0
@onready var max_index = text_paragraphs.size()
var character_write_time : float = 0.01

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_on_fade_out_timer_timeout()

func make_text_array(text : String):
	var array = []
	var string : String = ""
	for s in text:
		if(s == "\n"):
			array.append(string)
			string = ""
		else:
			string += s
	for st in array:
		print(st)
	return array

func _on_fade_timer_timeout() -> void:
	$Fade.play("text_fade")
	$FadeOutTimer.start()
	text_index += 1

func _on_fade_out_timer_timeout() -> void:
	if(text_index <= max_index):
		$RichTextLabel.text = "[center]" + text_paragraphs[text_index] + "[/center]"
		print($RichTextLabel.text)
		$Fade.play_backwards("text_fade")
		$FadeTimer.start()
		text_index += 1
