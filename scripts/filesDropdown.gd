extends ItemList

var fileRefrence
var xyPos
var mouseOnThis

func setToNewFile(fileRefrence, xyPos):
	show()
	mouseOnThis = true
	self.fileRefrence = fileRefrence
	self.xyPos = xyPos
	print(xyPos)
	set_position(xyPos)



# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	add_item("Rename")
	add_item("Open")
	add_item("Open with...")
	add_item("Bookmark")
	add_item("Open In Explorer")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(!mouseOnThis):
		hide()
	pass


func _on_mouse_exited():
	mouseOnThis = false
	deselect_all()
	pass # Replace with function body.


func _on_mouse_entered():
	mouseOnThis = true
	pass # Replace with function body.


func _on_item_clicked(index, at_position, mouse_button_index):
	match(index):
		# Rename
		0:
			print("Rename")
		
		1:
			# Does not work with directories yet
			print(fileRefrence.type)
			if(fileRefrence.type != 1):
				OS.execute("CMD.exe", ["/C", "cd C:/ && START " + fileRefrence.dir])
			else:
				print("GO TO THIS NEXT DIR")
			#OS.create_process(fileRefrence.dir, [])
			print("Open")
		_:
			print("")
	pass # Replace with function body.
