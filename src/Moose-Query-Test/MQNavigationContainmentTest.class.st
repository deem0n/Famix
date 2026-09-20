Class {
	#name : 'MQNavigationContainmentTest',
	#superclass : 'TestCase',
	#category : 'Moose-Query-Test',
	#package : 'Moose-Query-Test'
}
{ #category : 'tests' }
MQNavigationContainmentTest >> testScalarAndNilChildren [
	| root leaf query |
	root := MQNavigationTraversalNode new.
	leaf := MQNavigationTraversalNode new dependency: true; yourself.
	root child: leaf.
	query := MQNavigationTraversalProbe new receiver: root; yourself.
	query executeQueryForQueryResult: MooseOutgoingQueryResult.
	self assert: query collected asArray equals: { root. leaf }.
	self assert: query executeHasQuery
]
{ #category : 'tests' }
MQNavigationContainmentTest >> testCollectionsSharedChildrenAndCycles [
	| root left leaf query |
	root := MQNavigationTraversalNode new.
	left := MQNavigationTraversalNode new.
	leaf := MQNavigationTraversalNode new.
	root child: { left. leaf }.
	left child: leaf.
	leaf child: root.
	query := MQNavigationTraversalProbe new receiver: root; yourself.
	query executeQueryForQueryResult: MooseOutgoingQueryResult.
	self assert: query collected asArray equals: { root. left. leaf }.
	self deny: query executeHasQuery.
	leaf dependency: true.
	self assert: query executeHasQuery
]
{ #category : 'tests' }
MQNavigationContainmentTest >> testLocalQueryDoesNotVisitChildren [
	| root leaf query |
	leaf := MQNavigationTraversalNode new dependency: true; yourself.
	root := MQNavigationTraversalNode new child: leaf; yourself.
	query := MQNavigationTraversalProbe new receiver: root; local; yourself.
	query executeQueryForQueryResult: MooseOutgoingQueryResult.
	self assert: query collected asArray equals: { root }.
	self deny: query executeHasQuery
]
