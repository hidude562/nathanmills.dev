import math
import os
import random

import mido
import re

def getAImidFromSong(songName):
    class Note:
        def __init__(self, msgOn, msgOff):
            self.note = msgOn.note
            self.length = msgOff.time - msgOn.time
            self.start = msgOn.time
            self.velocity = msgOn.velocity
            self.channel = msgOn.channel

        def getChannelStrChar(self):
            match self.channel:
                case 0:
                    out_instrument = "%"
                case 1:
                    out_instrument = "^"
                case 2:
                    out_instrument = "&"
                case 3:
                    out_instrument = "*"
                case 9:
                    out_instrument = ")"
                case _:
                    out_instrument = "("
            return out_instrument

        def getDynamicsStrChar(self):
            dynamic = "$"
            if (self.velocity > 108):
                dynamic = "$"
            elif self.velocity > 74:
                dynamic = "#"
            elif self.velocity > 40:
                dynamic = "@"
            else:
                dynamic = "!"
            return dynamic

        def toString(self):
            return str(self.note) + " " + str(self.start)

    class Notes:
        def __init__(self):
            self.notes = []

        def add(self, note):
            self.notes.append(note)

        def toAIformat(self):
            aiStr = ""
            notes.sort_notes()

            previousNoteStart = 0
            for note in self.notes:
                noteStr = \
                    (
                            str(round(note.start - previousNoteStart)) +
                            str(note.getDynamicsStrChar()) +
                            str(round(note.length)) +
                            str(note.getChannelStrChar()) +
                            str(note.note)
                    )
                aiStr += noteStr + "|"
                previousNoteStart = note.start
            return aiStr

        def sort_notes(self):
            self.notes = sorted(self.notes, key=lambda note: note.start)

    mid = mido.MidiFile(songName)
    notesOnCount = 0
    tempo = 0
    ticksPerBeat = mid.ticks_per_beat
    tickMultiplier = 480 / ticksPerBeat
    absoluteTime = 0
    notesOn = []
    notes = Notes()

    for i, track in enumerate(mid.tracks):
        for msg in track:
            if str(type(msg)) == "<class 'mido.messages.messages.Message'>":
                if msg.type == "note_on":
                    msg.time = msg.time * tickMultiplier
                    absoluteTime += msg.time
                    msg.time = absoluteTime
                    notesOn.append(msg)

                    notesOnCount+=1
                elif msg.type == "note_off":
                    msg.time = msg.time * tickMultiplier
                    absoluteTime += msg.time
                    msg.time = absoluteTime

                    for noteOn in range(len(notesOn)):
                        if notesOn[noteOn].channel == msg.channel:
                            if notesOn[noteOn].note == msg.note:
                                note = Note(notesOn[noteOn], msg)
                                notes.add(note)
                                notesOn.pop(noteOn)
                                break
                    notesOnCount -= 1
                elif msg.type == "program_change":
                    absoluteTime += msg.time * tickMultiplier
                else:
                    try:
                        absoluteTime += msg.time * tickMultiplier
                    except:
                        pass
            else:
                if msg.type == "track_name":
                    absoluteTime = msg.time
                elif msg.type == "end_of_track":
                    absoluteTime = 0
                else:
                    try:
                        absoluteTime += msg.time * tickMultiplier
                    except:
                        pass

    if notesOnCount != 0:
        raise Exception("Faulty midi (not enough note_offs)")
    formatted = notes.toAIformat()
    return formatted



midi_dir     = "/home/nathan/Desktop/NNData/Midi stuff/cleaned jazz/" #@param {type:"string"}

midi_files = []
for root, dirs, files in os.walk(midi_dir):
    for file in files:
        if file.endswith(('.mid', '.MID')):
            midi_files.append(os.path.join(root, file))


import json

baseSongPath = "/home/nathan/Desktop/NNData/Midi stuff/cleaned jazz/"


def split_string(s):
    # Split the string every 2500 characters or at the next "|"
    splits = re.findall('.{1,7500}(?:\||$)', s, re.DOTALL)
    return splits


allData = ""
fileIndex=0
# Open the JSONL file
for songPath in midi_files:
    if os.path.basename(songPath)[0] != ".":
        try:
            songData = getAImidFromSong(songPath)
            splitSongData = split_string(songData)
            for part in splitSongData:
                allData += "|" + part + "\n"
            print(songPath)
        except Exception as e:
            print(e)
        fileIndex += 1
        if (fileIndex % 1000 == 0):
            with open("datanoLabel.txt", "w") as dataFile:
                print("WRITING")
                dataFile.write(allData)



with open("data.txt", "w") as dataFile:
    print("WRITING")
    dataFile.write(allData)

print(len(midi_files))