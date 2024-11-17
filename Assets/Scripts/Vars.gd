extends Node
var started : bool = false
var year : int = 0
var timeLeft : int = 60
var timeStart : bool = true
var phase = 0
const allYears = [0,1900,1950,2000,2050]
var inventory = []
const times = [28,40,45,55,10,10,10,10]

var attacksDone : int = 0

var girlHit : int = 0

var timePassed : int = 0
var corporatesKilled : int = 0
var minersKilled : int = 0
var warriorsKilled : int = 0

var endingDied : bool = false
var ending : bool = false

var totalKillSceneFour : int = 0

const sceneOne = "res://Assets/Scènes/Worlds/Year0.tscn"
const sceneTwo = "res://Assets/Scènes/Worlds/Year1.tscn"
const sceneThree = "res://Assets/Scènes/Worlds/Year2.tscn"
const sceneFourNEK = "res://Assets/Scènes/Worlds/Year3NotEverybodyKilled.tscn"
const sceneFourEK = "res://Assets/Scènes/Worlds/Year3EverybodyKilled.tscn"
const badEnding = "res://Assets/Scènes/Worlds/bad_ending.tscn"
const goodEnding = "res://Assets/Scènes/Worlds/GoodEnding.tscn"
const end = "res://Assets/Scènes/Worlds/finish.tscn"
const credits = ""
