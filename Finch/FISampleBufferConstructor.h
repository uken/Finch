//
//  FISampleBufferConstructor.h
//  Bazingo
//
//  Created by Jacob Agar on 2013-07-05.
//  Copyright (c) 2013 Uken Games, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISampleBufferConstructor : NSOperation {
    NSString * soundName;
    NSString * soundPath;
    NSUInteger voices;
    float cacheDuration;
    bool shouldPlay;
    bool shouldLoop;
}
- (id)initWithSoundNamed:(NSString*)aSoundName withSoundPath:(NSString *)aSoundPath maxPolyphony:(NSUInteger)numVoices withCacheDuration:(float)aCacheDuration andShouldPlay:(bool)play  andShouldLoop:(bool)loop;
@end
