//
//  FISampleBufferConstructor.m
//  Bazingo
//
//  Created by Jacob Agar on 2013-07-05.
//  Copyright (c) 2013 Uken Games, Inc. All rights reserved.
//

#import "FISampleBufferConstructor.h"
#import "FISound.h"
#import "FISoundEngine.h"

@implementation FISampleBufferConstructor

- (id)initWithSoundNamed:(NSString*)aSoundName withSoundPath:(NSString *)aSoundPath maxPolyphony:(NSUInteger)numVoices withCacheDuration:(float)aCacheDuration andShouldPlay:(bool)play  andShouldLoop:(bool)loop {
    
    if (self = [super init]) {
        soundName = aSoundName;
        soundPath = aSoundPath;
        voices = numVoices;
        cacheDuration = aCacheDuration;
        shouldPlay = play;
        shouldLoop = loop;
    }
    return self;
}

- (void)main {
    NSError* error;
    
    NSString *fullpath;
    if ( [[NSFileManager defaultManager] fileExistsAtPath:soundPath] ) {
        fullpath = soundPath;
    } else {
        fullpath = [((FISoundEngine *)[FISoundEngine sharedEngine]).soundBundle pathForResource:soundPath ofType:nil];
    }
    
    FISound *sound = [[FISound alloc]
                      initWithPath:fullpath andName:soundName
                      maxPolyphony:voices error:&error];
    [sound setLoop:shouldLoop];
    sound.cacheDuration = cacheDuration;
    sound.lastPlayTime = [[NSDate date ] timeIntervalSince1970];
    
    @synchronized( [FISoundEngine class] ) {
        if (sound) {
            [((FISoundEngine *)[FISoundEngine sharedEngine]).sounds setObject:sound forKey:soundName];
            //do error handling here:
            if (shouldPlay) {
                //finally play the sound
                [sound play];
            }
        }
    }
}

@end
