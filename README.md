FOR FULL PAPER WITH FIGURES, GO TO /documents/_FinalProject.pdf

Analysis Of Spotify Audio Features For Classification of Song Genre

Philip Franco
Multivariate Statistics
7/4/22

Introduction
	Music is becoming a popular platform do perform data analytics on and because of this, Spotify has an API that people can use for free. This API allows users to get valuable song data to look at different metrics for various machine learning tasks. This project will do it’s best to use a data set created from scraping music from Spotify to classify songs into their proper genre.

Dataset
The data set was generated using SpotiPy, which is Spotify’s Python API. The data sets consist of 250 of the most popular songs from the following genres: Rock, Country, Classical, Rap, and EDM. 50 songs from each genre was selected and scraped along with all the audio features provided. Spotify gives the following audio features that were later used to attempt to differentiate each song genre from each other.

1.	Acousticness – Measures how acoustic a song is from a scale of 0-1.
2.	Danceability – Takes tempo, rhythm stability, and beat strength into account to determine how suitable a track is for dancing. The scale is 0-1.
3.	Duration_ms – The length of the song in milliseconds.
4.	Energy – Songs that are high in energy have a fast tempo, are loud, and have good dynamic range. The scale is 0-1.
5.	Instrumentalness – Predicts if there are no vocals in a song. Scale is 0-1, where values above 0.5 are intended to represent instrumental tracks.
6.	Key – The key the track is in, and the scale maps to the pitch being used from -1-11. If no key was detected, -1 was used.
7.	Liveness – Predicts if the track was played in front of an audience in the recording. Scale is 0-1 where 0.8 describes a high likelihood that there was an audience.
8.	Loudness – This is measured in decibels. 
9.	Mode – Indicates modality of the track, or whether is in major, 1, or minor, 0.
10.	Speechiness – Detects if there are spoken words in a song, where the higher values would be a speech only recording such as a podcast. Most songs with music and speech will fall between 0.3 and 0.6, and songs with no lyrics will fall below 0.3.
11.	Tempo – This is an estimate of beats per minute of a song.
12.	Valence -  Predicts the sentiment of the song.
