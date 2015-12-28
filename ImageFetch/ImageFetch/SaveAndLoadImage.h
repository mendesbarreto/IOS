//
//  SaveAndLoadImage.h
//  ImageFetch
//
//  Created by Douglas Barreto on 12/28/15.
//  Copyright © 2015 Douglas Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SaveAndLoadImage : NSObject

- (void) getAndSaveImageFromUrl: (NSString *) urlStr AndSave:(NSString *) path;
- (NSData *) loadFileFromPath: (NSString * ) path;

@end
