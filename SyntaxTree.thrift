
namespace java tw.maple.generated
namespace cpp tw.maple.generated

enum ExpressionType
{
    IDENTIFIER,
    CALL
}

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
    9: string   attribute,
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
    oneway void startProgram( ),
    oneway void endProgram( ),

    oneway void startPackage( 1: list<string> id ),
    oneway void endPackage( 1: list<string> IDs ),

    oneway void startFunctionDefinition( 1: bool isAbstract),
        oneway void functionAttribute( 1: list<string> attrs ),

        oneway void functionName( 1: string name ),

        oneway void startFunctionCommon( ),
        oneway void startFunctionSignature(  1: string type ),
            oneway void startFunctionSignatureParameters( ),
                oneway void startFunctionSignatureParameterMember( 1: string name, 2: list<string> type ),
                oneway void endFunctionSignatureParameterMember( ),
            oneway void endFunctionSignatureParameters( ),
        oneway void endFunctionSignature( ),

        oneway void endFunctionCommon( ),
    oneway void endFunctionDefinition( ),

    oneway void startReturnStatement( ),
    oneway void endReturnStatement( ),

	oneway void startExprCondition( ),
	oneway void endExprCondition( ),

    oneway void startIfStatement( ),
    oneway void endIfStatement( ),

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

        oneway void startInstanceOfExpression( ),
        oneway void endInstanceOfExpression( ),

        oneway void startIsOperator( ),
        oneway void endIsOperator( ),

        oneway void startUnaryExpression( 1: UnaryExpression op ),
        oneway void endUnaryExpression( ),

        oneway void startVariableDeclare(  1: VariableDeclare var_decl  ),
        oneway void endVariableDeclare( ),

        oneway void startAssignment(),
        oneway void endAssignment(),

        oneway void identifierExpression( 1: Identifier id ),
        oneway void literalStringExpression( 1: Literal str ),
        oneway void literalNumberExpression( 1: Literal str ),
        oneway void literalBooleanExpression( 1: Literal str ),
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

    oneway void startAttributeList(),
    oneway void endAttributelist(),

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
}
