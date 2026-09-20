Class {
	#name : 'MooseGroupNameCloudTest',
	#superclass : 'TestCase',
	#category : 'Moose-Core-Tests',
	#package : 'Moose-Core-Tests'
}

{ #category : 'tests' }
MooseGroupNameCloudTest >> testCamelCaseAndSQLNames [
	| cloud entity |
	cloud := MooseGroupNameCloud basicNew.
	#('CustomerOrder' 'customer_order' 'customer-order') do: [ :name |
		entity := FamixTest1Class new name: name; yourself.
		self assert: ((cloud entityAndItsKeywords: entity) collect: #key) asSet
			equals: #('customer' 'order') asSet.
		self assert: entity name equals: name ]
]

{ #category : 'tests' }
MooseGroupNameCloudTest >> testStopWordsAndRepeatedTokens [
	| entity keywords |
	entity := FamixTest1Class new name: 'the_customer_customer'; yourself.
	keywords := MooseGroupNameCloud basicNew entityAndItsKeywords: entity.
	self assert: keywords size equals: 1.
	self assert: keywords anyOne key equals: 'customer'.
	self assert: keywords anyOne value identicalTo: entity
]

{ #category : 'tests' }
MooseGroupNameCloudTest >> testEmptyName [
	self assertEmpty: (MooseGroupNameCloud basicNew entityAndItsKeywords:
		(FamixTest1Class new name: ''; yourself))
]

{ #category : 'tests' }
MooseGroupNameCloudTest >> testCanvasBuildWhenRoassalIsInstalled [
	| cloud |
	(Smalltalk globals includesKey: #RSCanvas) ifFalse: [ self skip: 'Roassal is optional in a core Famix image' ].
	cloud := MooseGroupNameCloud forMooseGroup:
		(MooseGroup with: (FamixTest1Class new name: 'customer_order'; yourself)).
	cloud build.
	self assert: cloud canvas nodes size equals: 2.
	cloud := MooseGroupNameCloud forMooseGroup: MooseGroup new.
	self shouldnt: [ cloud build ] raise: Error
]
