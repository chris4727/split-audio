# Split Audio

Utilities to take a single audio file, and split it into multiple tracks based on a tracklist using Wikipedia '"Track" - MM:SS' format.

# Tasks

- [ ] Create R script to parse text file containing Wikipedia style track runtime information into `HH:MM:SS Trackname` format.
  - [ ] Read in the tracklist
  - [ ] Parse the time into `HH:MM:SS` format
  - [ ] Reorder from `"Track" - MM:SS` to `HH:MM:SS Trackname`
  - [ ] Save to new file (just in case the times are off and need to be adjusted)
- [ ] Create bash script to take the audio file, read in the track list, and split the audio into multiple tracks
  - [ ] Takes two arguments, `audio-file` and `tracklist` (alternatively, name audio-file and tracklist the same, so the script can read the audio file name and pull in the tracklist automatically.
  - [ ] Uses the `audio-file` as the Artist/Album name in the format `Artist - Album.ext`
  - [ ] Should the Bash script calls the R script to parse the tracklist?
  - [ ] Store all tracks in a directory with [Jellyfin naming convention](https://jellyfin.org/docs/general/server/media/music/)
  - [ ] Keep the original file in case there was an issue with the time.
