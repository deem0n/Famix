Class {
	#name : 'MQNavigationTraversalProbe',
	#superclass : 'MQNavigationQuery',
	#instVars : [ 'collected' ],
	#category : 'Moose-Query-Test',
	#package : 'Moose-Query-Test'
}
{ #category : 'initialization' }
MQNavigationTraversalProbe >> initialize [ super initialize. collected := OrderedCollection new ]
{ #category : 'accessing' }
MQNavigationTraversalProbe >> collected [ ^ collected ]
{ #category : 'execution' }
MQNavigationTraversalProbe >> queryLocalFor: anEntity [ collected add: anEntity ]
{ #category : 'execution' }
MQNavigationTraversalProbe >> hasLocalFor: anEntity [ ^ anEntity dependency ]
