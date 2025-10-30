#PROLOGUE
#ATTENTION: You will need to change absolute path to wherever you have finalSamples
absolutePath = "C:/Users/ianst/OneDrive/Documents/UBCO/Classes/W2022_Term2/VISA 108 - Intro to Digital Media II/Project 2 - Music and Sound with Sonic Pi/"
samples = absolutePath + "finalSamples/"

#set up samples
machine = samples + "feelfx", "machine"
compKeyboard = samples + "mySamples/andrew_keyboard_clicking.wav"
bleep = samples + "bleep/"

#set bpm (metronome should be set to 60.00bpm in Sonic Pi)
use_bpm 90

# START

live_loop :Keyboard do
  keyboard_volume = 0.5
  
  5.times do
    sample compKeyboard, attack: 3, sustain: 2, release: 0.3, amp: keyboard_volume
    sleep 2
    keyboard_volume += 0.25
  end
  sleep 20
end

live_loop :Bleeps do
  
  bleep_volume = 0.2
  
  sleep 4
  12.times do
    #choose between a random beep or the machine sound
    if one_in(2)
      sample bleep, choose(["pc_beep", "simpletone", "vidgame-bleep1", "watch_beep"]), amp: bleep_volume
    else
      sample machine, amp: bleep_volume
    end
    sleep rrand(0.5, 1)
    bleep_volume += 0.08
  end
  
  12.times do
    #choose between a random beep or the machine sound
    if one_in(2)
      sample bleep, choose(["pc_beep", "simpletone", "tinynote", "vidgame-bleep1", "vidgame-bleep2", "watch_beep"]), amp: bleep_volume
    else
      sample machine, amp: bleep_volume
    end
    
    sleep rrand(0.2, 0.4)
    bleep_volume += 0.08
  end
  sleep 20
end






