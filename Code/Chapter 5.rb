# CHAPTER 5 (Abnegation)
# ATTENTION: you will need to change absolute path to whatever folder you have finalSamples in
absolutePath = "C:/Users/ianst/OneDrive/Documents/UBCO/Classes/W2022_Term2/VISA 108 - Intro to Digital Media II/Project 2 - Music and Sound with Sonic Pi/"
samples = absolutePath + "finalSamples/"

#setup sample paths
coins = samples + "coins/", "coins"
compKeyboard = samples + "mySamples/andrew_keyboard_clicking.wav"

#set bpm (metronome should be set to 60.00bpm in Sonic Pi)
use_bpm 90

# START

live_loop :Keyboard_and_Coins do
  sample compKeyboard, start: 0.4, attack: 0, sustain: 0.2, amp: 1
  sleep 1
  sample compKeyboard, start: 0.4, attack: 0, sustain: 0.2, amp: 1
  sleep 1
  sample compKeyboard, start: 0.4, attack: 0, sustain: 0.35, amp: 1
  sleep 1
  sample coins, amp: 0.6, rate: 1, sustain: 1
  sleep 1
end





