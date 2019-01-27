extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var gameModel;

# Called when the node enters the scene tree for the first time.
func _ready():
	gameModel = get_node("game_model");
	get_node("dialogue_screen").gameModel = gameModel;
	
	enter_to_home();
	
	pass # Replace with function body.

func enter_to_map():
	get_node("dialogue_screen").visible = false;
	gameModel.begin_round();
	diversificate_math_model();
	get_node("map").visible = true;
	
func enter_to_home():
	get_node("dialogue_screen").visible = true;
	get_node("dialogue_screen").update_scene();
	get_node("map").visible = false;

func diversificate_math_model():
	
	#start quest
	if gameModel.roundCounter == 0:
		gameModel.mapRegion = 'quest';
		gameModel.regionDecks.quest = [];