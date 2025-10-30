# CHAPTER 1 (Introduction to Investment)
# ATTENTION: you will need to change absolutePath to whatever folder you have finalSamples in
absolutePath = "C:/Users/ianst/OneDrive/Documents/UBCO/Classes/W2022_Term2/VISA 108 - Intro to Digital Media II/Project 2 - Music and Sound with Sonic Pi/"
samples = absolutePath + "finalSamples/"

#set up sample paths
coins = samples + "coins/", "coins"
compKeyboard = samples + "mySamples/andrew_keyboard_clicking.wav"
kick = samples + "kicklinn/", 1
stomp = samples + "stomp/", "6"
msg = samples + "msg/" #collection of small popping/tick-y sounds

# set bpm (metronome should be set to 60.00bpm) in Sonic Pi
use_bpm 90

#START

#comment out samples after a few loops
live_loop :randomCoins do
  sample coins, amp: rrand(0.2, 0.6), rate: 1, sustain: 1
  sleep rrand(0.1, 1)
  sample coins, amp: rrand(0.2, 0.6), rate: 1, sustain: 1
  sleep rrand(0.1, 1)
  sample coins, amp: rrand(0.2, 0.6), rate: 1, sustain: 1
  sleep rrand(0.1, 1)
end

#comment out =begin and =end after a few loops
=begin
live_loop :Coins do
  
  sleep 0.5
  3.times do
    sample coins, amp: 0.6, rate: 1, sustain: 1
    sleep 1
  end
  sleep 0.5
  
end

live_loop :Keyboard do
  sync :Coins
  
  5.times do
    sample compKeyboard, start: 0.4, attack: 0, sustain: 0.2, amp: 1
    sleep 1
    sample compKeyboard, start: 0.4, attack: 0, sustain: 0.2, amp: 1
    sleep 1
    sample compKeyboard, start: 0.4, attack: 0, sustain: 0.35, amp: 1
    sleep 2
  end
end

live_loop :Kick do
  sync :Coins
  sleep 8
  
  8.times do
    sample kick
    sample stomp
    sleep 1
  end
end

live_loop :Msg do
  sync :Coins
  sleep 8
  
  msg_volume = 0
  
  24.times do
    sleep 0.25
    sample msg, (ring 6, 7, 8, 6).tick, amp: msg_volume
    msg_volume += 0.0416
  end
end
=end