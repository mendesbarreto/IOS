//
//  main.m
//  ImageFetch
//
//  Created by Douglas Barreto on 12/28/15.
//  Copyright © 2015 Douglas Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SaveAndLoadImage.h"



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        SaveAndLoadImage *imageLoader = [[SaveAndLoadImage alloc] init];
        [imageLoader loadFileFromPath:@"/Users/douglas/Documents/background.jpg"];
        [imageLoader getAndSaveImageFromUrl:@"http://www.psdgraphics.com/file/colorful-triangles-background.jpg" AndSave:@"/Users/douglas/Documents/background2.jpg"];
    }
    return 0;
}
