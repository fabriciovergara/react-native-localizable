//
//  RNLocalizable.m
//  RNLocalizable
//
//  Created by Fabricio Vergal on 08/01/18.
//  Copyright © 2018 Fabriciovergal. All rights reserved.
//

#import "RNLocalizable.h"

@implementation RNLocalizable

@synthesize fallbackLanguage;

RCT_EXPORT_MODULE()

- (NSDictionary *)constantsToExport
{
    NSDictionary *fallbackDictionary = [self findLocalizableForProj: fallbackLanguage];
    NSDictionary *base1Dictionary = [self findLocalizableForProj: @"base"];
    NSDictionary *base2Dictionary = [self findLocalizableForProj: @"Base"];
    NSDictionary *preferedDictionary = [self findLocalizablePrefered];
    
    NSMutableSet *keys = [[NSMutableSet alloc] init];
    
    [self addAllDictionaryKey:keys dictionary:base1Dictionary];
    [self addAllDictionaryKey:keys dictionary:base2Dictionary];
    [self addAllDictionaryKey:keys dictionary:fallbackDictionary];
    [self addAllDictionaryKey:keys dictionary:preferedDictionary];
    
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    
    for (NSString* key in keys) {
        NSString *value = [preferedDictionary objectForKey:key];
        
        if(value == nil){
            value = [fallbackDictionary objectForKey:key];
        }
        
        if(value == nil){
            value = [base1Dictionary objectForKey:key];
        }
        
        if(value == nil){
            value = [base2Dictionary objectForKey:key];
        }
        
        if(value != nil){
            [dictionary setObject:value forKey:key];
        }
    }
    
    return dictionary;
}

- (void) addAllDictionaryKey:(NSMutableSet *)mutableSet dictionary:(NSDictionary *)dictionary
{
    if(dictionary != nil) {
        for (NSString* key in dictionary) {
            [mutableSet addObject: key];
        }
    }
}

- (NSDictionary *) findLocalizablePrefered
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSDictionary *dictionary = [self findLocalizableForNSBundle: bundle];
    return dictionary;
}

- (NSDictionary *) findLocalizableForProj:(NSString *)lproj
{
    NSBundle *bundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:lproj ofType:@"lproj"]];
    NSDictionary *dictionary = [self findLocalizableForNSBundle: bundle];
    return dictionary;
}

- (NSDictionary *) findLocalizableForNSBundle:(NSBundle *)bundle
{
    NSString *path = [bundle pathForResource:@"Localizable" ofType:@"strings"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:path];
    return dictionary;
}

@end
