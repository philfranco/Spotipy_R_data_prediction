'''
Used to obtain data from spotify by song genre. Obtained the top 50 songs at the time.
The Spotify API rate limited obtaining songs so this is what was used.
'''

import sys
import spotipy
import pandas as pd

from spotipy.oauth2 import SpotifyClientCredentials
spotify = spotipy.Spotify(auth_manager=SpotifyClientCredentials())

dataArt = {"artist":[],
           "song":[],
           "ids":[],
           "genre":[],
           "acousticness":[],
           "danceability":[],
           "duration_ms":[],
           "energy":[],
           "instrumentalness":[],
           "key":[],
           "liveness":[],
           "loudness":[],
           "speechiness":[],
           "tempo":[],
           "mode":[],
           "valence":[]}

missing = 0
i = 0

tracksRock = spotify.search(q = 'genre:' + "Rock", type='track',market='GB',limit=50, offset=0)
for i in range(50):
    dataArt['artist'].append(tracksRock['tracks']["items"][i]["artists"][0]['name'])
    dataArt['song'].append(tracksRock['tracks']["items"][i]['name'])
    dataArt['ids'].append(tracksRock['tracks']["items"][i]['id'])
    dataArt['genre'].append("Rock")
    #print(tracksRock['tracks']["items"][i]["artists"][0]['name'] + ': ' + tracksRock['tracks']["items"][i]['name'])

tracksRap = spotify.search(q = 'genre:' + "Rap", type='track',market='GB',limit=50, offset=0)
for i in range(50):
    dataArt['artist'].append(tracksRap['tracks']["items"][i]["artists"][0]['name'])
    dataArt['song'].append(tracksRap['tracks']["items"][i]['name'])
    dataArt['ids'].append(tracksRap['tracks']["items"][i]['id'])
    dataArt['genre'].append("Rap")
    #print(tracksRap['tracks']["items"][i]["artists"][0]['name'] + ': ' + tracksRap['tracks']["items"][i]['name'])

tracksCountry = spotify.search(q = 'genre:' + "Country", type='track',market='GB',limit=50, offset=0)
for i in range(50):
    dataArt['artist'].append(tracksCountry['tracks']["items"][i]["artists"][0]['name'])
    dataArt['song'].append(tracksCountry['tracks']["items"][i]['name'])
    dataArt['ids'].append(tracksCountry['tracks']["items"][i]['id'])
    dataArt['genre'].append("Country")
    #print(tracksCountry['tracks']["items"][i]["artists"][0]['name'] + ': ' + tracksCountry['tracks']["items"][i]['name'])

tracksClassical = spotify.search(q = 'genre:' + "Classical", type='track',market='GB',limit=50, offset=0)
for i in range(50):
    dataArt['artist'].append(tracksClassical['tracks']["items"][i]["artists"][0]['name'])
    dataArt['song'].append(tracksClassical['tracks']["items"][i]['name'])
    dataArt['ids'].append(tracksClassical['tracks']["items"][i]['id'])
    dataArt['genre'].append("Classical")
    #print(tracksClassical['tracks']["items"][i]["artists"][0]['name'] + ': ' + tracksClassical['tracks']["items"][i]['name'])

tracksElectronic = spotify.search(q = 'genre:' + "EDM", type='track',market='GB',limit=50, offset=0)
for i in range(50):
    dataArt['artist'].append(tracksElectronic['tracks']["items"][i]["artists"][0]['name'])
    dataArt['song'].append(tracksElectronic['tracks']["items"][i]['name'])
    dataArt['ids'].append(tracksElectronic['tracks']["items"][i]['id'])
    dataArt['genre'].append("EDM")
    #print(tracksElectronic['tracks']["items"][i]["artists"][0]['name'] + ': ' + tracksElectronic['tracks']["items"][i]['name'])

for i in range(250):
    track = spotify.audio_features(dataArt['ids'][i])
    dataArt['acousticness'].append(track[0]['acousticness'])
    dataArt['danceability'].append(track[0]['danceability'])
    dataArt['duration_ms'].append(track[0]['duration_ms'])
    dataArt['energy'].append(track[0]['energy'])
    dataArt['instrumentalness'].append(track[0]['instrumentalness'])
    dataArt['key'].append(track[0]['key'])
    dataArt['liveness'].append(track[0]['liveness'])
    dataArt['loudness'].append(track[0]['loudness'])
    dataArt['speechiness'].append(track[0]['speechiness'])
    dataArt['tempo'].append(track[0]['tempo'])
    dataArt['mode'].append(track[0]['mode'])
    dataArt['valence'].append(track[0]['valence'])

dfArt = pd.DataFrame(dataArt)
dfArt.to_csv('spotipyMusicGenres.csv', index=False)
