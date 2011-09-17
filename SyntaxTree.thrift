/*
 * Copyright 2011 Kai-Feng Chout - mapleellpam at gmail dot com
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

namespace java tw.maple.generated
namespace cpp tw.maple.generated

const string  PROTO_VERSION  = "0.0.1"   // human readable version
const i64     PROTO_COUNTER  = 018   // pls add this counter when every time you release/push, and reset this counter when you add PROTO_VERsION

enum IdentifierType
{
    TYPE_IDENTIFIER,
    ATTR_IDENTIFIER,
    IDENTIFIER, 
}
enum ObjectType
{
    TYPE_CLASS,
    TYPE_INTERFACE,
}
enum FunctionType
{
	TF_NORMAL,
	TF_GETTER,
	TF_SETTER,
}
enum IncrementType
{
    TYPE_POSTFIX,
    TYPE_PREFIX,
}

struct Identifier
{
    1: IdentifierType type,
    2: string name,
    3: string qualifier,
}

struct Literal
{
    2: string value,
}

struct CallExpression
{
    1: bool is_new = 0,
    2: string mode,
	3: list<string> callee,
}

struct ClassDefinition
{
    1: string name,
    2: bool has_attr,
    3: bool has_baseclass,
    4: bool has_interface,
    5: bool has_stmt,
    6: list<string>       inherits,
    7: list<string>       interfaces,
    8: ObjectType  object_type;
    9: list<string>   attributes,
}
struct MetaData
{
    1: string id,
    2: map<string/*key*/,string/*value*/>   keyvalues,
    3: list<string>                         values,
}
        
struct VariableDeclare
{
	1: string		name, 
	2: list<string> type, 
	3: list<string> attributes,
	4: bool			has_initialize;
}

struct BinaryExpression 
{
    1: string op = "";
}
struct UnaryExpression 
{
    1: string op = "";
}

service AstDumper
{
    oneway void startProgram( 1: string version = PROTO_VERSION, 2: i64 counter = PROTO_COUNTER),
    oneway void endProgram( ),

    oneway void startPackage( 1: list<string> id ),
    oneway void endPackage( 1: list<string> IDs ),

    oneway void executeImport( 1: list<string> id ),

    oneway void startFunctionDefinition( 1: bool isAbstract),
        oneway void functionAttribute( 1: list<string> attrs ),

        oneway void functionName( 1: string name, 2: FunctionType func_type),

        oneway void startFunctionCommon( ),
        oneway void startFunctionSignature(  1: string type ),
            oneway void startFunctionSignatureParameters( ),
                oneway void functionParameter( 
                    1: string name, 2: list<string> type, 3: bool has_init, 4: string init = "" ),
                oneway void functionParameterRest( 1: string name ),
            oneway void endFunctionSignatureParameters( ),
        oneway void endFunctionSignature( ),

        oneway void endFunctionCommon( ),
    oneway void endFunctionDefinition( ),

    oneway void startReturnStatement( ),
    oneway void endReturnStatement( ),

    oneway void startIfStatement( ),
    oneway void endIfStatement( ),

    oneway void startConditionExpression( ),
    oneway void endConditionExpression( ),

    oneway void startStmtExpression( ),
    oneway void endStmtExpression( ),

    oneway void startExpressionList( ),
        oneway void startCallExpression( 1: CallExpression call ),
            oneway void startArgumentList(),
                oneway void startOneArgument(),
                oneway void endOneArgument(),
            oneway void endArgumentList(),
        oneway void endCallExpression(),

        oneway void startBinaryExpression( 1: BinaryExpression op ),
        oneway void endBinaryExpression( ),

        oneway void startIncrementExpression( 1: IncrementType type, 2: string token ),
        oneway void endIncrementExpression( ),

        oneway void startInstanceOfExpression( ),
        oneway void endInstanceOfExpression( ),

        oneway void startIsOperator( ),
        oneway void endIsOperator( ),

        oneway void startAsOperator( ),
        oneway void endAsOperator( ),

        oneway void startUnaryExpression( 1: UnaryExpression op ),
        oneway void endUnaryExpression( ),

        oneway void startVariableDeclare(  1: VariableDeclare var_decl  ),
        oneway void endVariableDeclare( ),

        oneway void startSetExpression( 1: string mode ),
        oneway void endSetExpression(),

        oneway void startGetExpression( 1: string mode ),
        oneway void endGetExpression(),

        oneway void superExpression( ),
        oneway void startSuperInit( ),
        oneway void endSuperInit( ),
        oneway void identifierExpression( 1: Identifier id ),
        oneway void attributeIdentifierExpression( 1: Identifier id ),
        oneway void literalStringExpression( 1: Literal str ),
        oneway void literalNumberExpression( 1: Literal str ),
        oneway void literalBooleanExpression( 1: Literal str ),
        oneway void literalNull( ),

        oneway void thisExpression( ),
    oneway void endExpressionList( ),

    oneway void addImport( 1: list<string> packages ),   // Do we need this? using namespace? or what ever suck?

    oneway void startStmtList(),
    oneway void endStmtList(),
    oneway void startScope(),
    oneway void endScope(),

    oneway void startClassDefinition( 1: ClassDefinition class_define ),

        oneway void startClassStmt(),
        oneway void endClassStmt(),
    oneway void endClassDefinition(),

    oneway void startMemberExpression(),
    oneway void endMemberExpression(),

    oneway void startForStatement( ),
    	oneway void startForInit( ),
    	oneway void endForInit( ),
    	oneway void startForStep( ),
    	oneway void endForStep( ),
    oneway void endForStatement( ),

    oneway void startDoStatement( ),
    oneway void endDoStatement( ),
    oneway void startWhileStatement( ),
    oneway void endWhileStatement( ),

    oneway void startTypeExpression( ),
    oneway void endTypeExpression( ),

    oneway void defineMetaData( 1: MetaData metadata ),

	oneway void startTryStatement(  ),
	oneway void endTryStatement(),

	oneway void startThrowStatement(  ),
	oneway void endThrowStatement(),

	oneway void startCatchClauseStatement(  ),
	oneway void endCatchClauseStatement(),

	oneway void startFinallyClauseStatement(  ),
	oneway void endFinallyClauseStatement(),

    oneway void empty( ),
}
