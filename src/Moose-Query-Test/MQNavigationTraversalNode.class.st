Class {
	#name : 'MQNavigationTraversalNode',
	#superclass : 'Object',
	#traits : 'TEntityMetaLevelDependency',
	#classTraits : 'TEntityMetaLevelDependency classTrait',
	#instVars : [ 'child', 'dependency' ],
	#category : 'Moose-Query-Test',
	#package : 'Moose-Query-Test'
}
{ #category : 'accessing' }
MQNavigationTraversalNode >> child [ ^ child ]
{ #category : 'accessing' }
MQNavigationTraversalNode >> child: anObject [ child := anObject ]
{ #category : 'accessing' }
MQNavigationTraversalNode >> dependency [ ^ dependency ifNil: [ false ] ]
{ #category : 'accessing' }
MQNavigationTraversalNode >> dependency: aBoolean [ dependency := aBoolean ]
{ #category : 'querying' }
MQNavigationTraversalNode >> containedEntitySelectors [ ^ #(child) ]
