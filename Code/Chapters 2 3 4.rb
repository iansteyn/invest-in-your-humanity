# CHAPTERS 2 (Gathering Momentum), 3 (Epic Story Bro) & 4 (Tension Held in the Jaw Muscles)
# ATTENTIOn: you will need to change absolute path to whatever folder you have finalSamples in
absolutePath = "C:/Users/ianst/OneDrive/Documents/UBCO/Classes/W2022_Term2/VISA 108 - Intro to Digital Media II/Project 2 - Music and Sound with Sonic Pi/"
samples = absolutePath + "finalSamples/"

#set up sample paths
coins = samples + "coins/", "coins"
compKeyboard = samples + "mySamples/andrew_keyboard_clicking.wav"
kick = samples + "kicklinn/", 1
stomp = samples + "stomp/", "6"
msg = samples + "msg/" #collection of small popping/tick-y sounds
jungbass = samples + "jungbass/" #collection
moog = samples + "moog/" #collection
glitch = samples + "glitch/", "006"
snare1 = samples + "dr2/", "SNR"
snare2 = samples + "dr/", "039"

#set bpm (metronome should be set to 60.00bpm in Sonic Pi)
use_bpm 90

#START

live_loop :Kick_Msg do
  4.times do
    sample kick
    sample stomp
    4.times do
      sleep 0.25
      sample msg, (ring 6, 7, 8, 6).tick, amp: 1
    end
  end
end

#=begin
live_loop :Coins do
  sync :Kick_Msg
  sleep 0.5
  3.times do
    sample coins, amp: 0.6, rate: 1, sustain: 1
    sleep 1
  end
end
#=end

#=begin
live_loop :Keyboard do
  sync :Kick_Msg
  
  sample compKeyboard, start: 0.4, attack: 0, sustain: 0.2, amp: 1
  sleep 1
  sample compKeyboard, start: 0.4, attack: 0, sustain: 0.2, amp: 1
  sleep 1
  sample compKeyboard, start: 0.4, attack: 0, sustain: 0.35, amp: 1
  sleep 2
end
#=end


#this runs for chapter 4 only - increasing keyboard volume
live_loop :Keyboard2 do
  sync :chapter4_start
  sync :Kick_Msg
  keyboard_volume = 0
  
  48.times do
    sample compKeyboard, start: 0.4, attack: 0, sustain: 0.2, amp: keyboard_volume
    sleep 1
    sample compKeyboard, start: 0.4, attack: 0, sustain: 0.2, amp: keyboard_volume
    sleep 1
    sample compKeyboard, start: 0.4, attack: 0, sustain: 0.35, amp: keyboard_volume
    sleep 2
    keyboard_volume += 0.8
  end
end

#=end

#=begin
live_loop :Bass do
  sync :Kick_Msg
  8.times do
    sleep 0.5
    sample jungbass, (ring 18, 12).tick, amp: 1
  end
end
#=end

#=begin
live_loop :Moogs do
  sync :Kick_Msg
  with_fx :reverb, room: 1 do
    sample moog, (ring "C2", "G1", "G2", "G3", "C3", "G4").tick, amp: 0.8
  end
  sleep 8
end
#=end

#=begin
live_loop :Glitch do
  sync :Kick_Msg
  
  sleep 1.5
  
  #comment out the sample lines after first 2 or 3 epic drums rounds
  2.times do
    sleep 1
    sample glitch, amp: 0.3, attack: 0, sustain: 0.3, release: 0.01
    sleep 1
    sample glitch, amp: 0.3, attack: 0, sustain: 0.3, release: 0.01
  end
end
#=end

#this runs for the end of chapter 3 and all of 4 only
#=begin
live_loop :Glitch2 do
  sync :Kick_Msg
  sleep 96.5
  
  #(3 * 8 =) 24 beats
  24.times do
    sleep 1
    sample glitch, amp: 0.3, attack: 0, sustain: 0.3, release: 0.01
  end
  
  #(2 * 8) = 16 beats
  16.times do
    sleep 0.5
    sample glitch, amp: 0.3, attack: 0, sustain: 0.3, release: 0.01
    sleep 0.5
    sample glitch, amp: 0.3, attack: 0, sustain: 0.3, release: 0.01
  end
  
  #(1 * 8) = 8 beats
  16.times do
    sleep 0.25
    sample glitch, amp: 0.3, attack: 0, sustain: 0.3, release: 0.01
    sleep 0.25
    sample glitch, amp: 0.3, attack: 0, sustain: 0.3, release: 0.01
  end
end
#=end

#this runs for chapter 3 only
#=begin
live_loop :epic_drums do
  sync :Kick_Msg
  sleep 72
  
  6.times do
    
    #1
    4.times do
      sample snare1, amp: 0.5
      sleep 0.0625
    end
    1.times do
      sample snare1
      sleep 0.25
    end
    
    sleep 0.5
    
    #2
    2.times do
      sample snare1
      sleep 0.25
    end
    
    sleep 0.5
    
    #3
    4.times do
      sample snare1
      sleep 0.25
    end
    
    #4
    sleep 0.25
    sample snare2
    sleep 0.5
    sample snare2
    sleep 0.25
  end
  
  sleep 0.25
  snare2_volume = 1.0
  16.times do
    sample snare1
    sleep 0.25
    sample snare2, amp: snare2_volume
    snare2_volume -= 0.0625
    sleep 0.25
  end
  
  cue :chapter4_start
end
#=end


















