import os
import sys

validExts = (".mp4", ".mkv", ".srt")

def fix_episode_names(basePath='.'):
    for(rootDir, dirNames, filenames) in os.walk(basePath):
        for filename in filenames:
            ext = filename[filename.rfind("."):].lower()
            print(rootDir, filename)
            if ext.endswith(validExts):
                tokens = filename.split('.')
                episode_season = tokens[1]
                episode = ''
                season = ''
                print(filename, episode)
                if(len(episode_season)) == 3:
                   episode = episode_season[0]
                   season =  episode_season[1:]
                elif(len(episode_season)) == 4:
                   episode = episode_season[0:2]
                   season =  episode_season[2:]
                else:
                   sys.exit(1)

                correctedEpisodeSeason = 's' + episode + 'e' + season

                print(filename, correctedEpisodeSeason)
                tokens[1] = correctedEpisodeSeason
                newFilename = '.'.join(tokens)
                print filename, newFilename
                oldFilePath = os.path.join(rootDir, filename)
                newFilePath = os.path.join(rootDir, newFilename)
                print("[INFO] renaming: {} to: {}".format(oldFilePath, newFilePath))
                os.rename(oldFilePath, newFilePath)


if __name__ == "__main__":
    fix_episode_names()
