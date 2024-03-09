import Foundation

/*
    It is a parameter for creating custom queues.

    let customQueue = DispatchQueue(
        label: ,
        qos: ,
        attributes: ,
        autoreleaseFrequency: ,
        target:
    )
 
    AutoReleaseFrequency
        Constants indicating the frequency with which a dispatch queue autoreleases objects (related to ARC)
 
    There are three values
 
    .inherit
        The queue inherits its autorelease frequency from its target queue.
 
    .workItem
        The queue configures an autorelease pool before the execution of a block, and releases the objects in that pool after the block
        finishes executing.
 
    .never
        The queue does not set up an autorelease pool around executed blocks.
*/
