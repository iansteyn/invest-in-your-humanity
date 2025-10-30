# EPILOGUE and other sounds
# ATTENTION: you will need to change absolute path to whatever folder you have finalSamples in
absolutePath = "C:/Users/ianst/OneDrive/Documents/UBCO/Classes/W2022_Term2/VISA 108 - Intro to Digital Media II/Project 2 - Music and Sound with Sonic Pi/"
samples = absolutePath + "finalSamples/"

#setup samples
machine = samples + "feelfx", "machine"
compKeyboard = samples + "mySamples/andrew_keyboard_clicking.wav"
msg1 = samples + "msg/", "msg1"

#set bpm (metronome in Sonic Pi should be 60.00bpm)
use_bpm 90

#woosh sound used at end of song
#sample :ambi_swoosh

#keyboard backwards - used at end of chapter 1 and epilogue
#sample compKeyboard, rate: -1
